#!/usr/bin/env bash
set -euo pipefail

# Ensure gum is installed
command -v gum >/dev/null || {
  echo "gum is required. Install it from https://github.com/charmbracelet/gum"
  exit 1
}

# Prompt for project name
PROJECT_NAME=$(gum input --placeholder "Enter your Rails project name" --value "my-rails-app")

# Choose DB + API-only mode
DB_CHOICE=$(gum choose sqlite3 postgresql mysql --header "Choose your database (default: sqlite3)") || DB_CHOICE="sqlite3"
API_MODE=$(gum confirm --default=no "Do you want API-only Rails app?" && echo "--api" || echo "")

# Create project folder
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Init flake
echo "Installing gems - rails, rubocop, solargraph"
nix flake init -t github:inscapist/ruby-nix

# Bootstrap Gemfile with rails + default gems
nix develop --command bash -c "
  bundle init
  bundle add rails rubocop solargraph --group development --skip-install
  bundle-lock
  bundix
"

# Now run rails new with existing Gemfile
echo "Populating rails default folders"
nix develop --command bash -c "
  rails new . -d $DB_CHOICE $API_MODE --skip-bundle --skip-git --force
  bundle-lock
  bundix
"

# Offer optional “cool” gems
DEFAULT_GEMS=("rspec" "pry-byebug" "activerecord" "nokogiri")
EXTRA_GEMS=$(gum choose --no-limit "${DEFAULT_GEMS[@]}" --header "Select additional gems:")
EXTRA_GEMS=$(echo "$EXTRA_GEMS" | xargs)  # Flatten multiline to space-separated

if [ -n "$EXTRA_GEMS" ]; then
  nix develop --command bash -c "
    bundle add $EXTRA_GEMS --group development,test --skip-install
    bundle-lock
    bundix
  "
fi

# Git repo
git init -q
git add .
git commit -m 'Initial Rails + Nix scaffold' -q

# Done message
gum format --theme dracula <<EOF
# ✅ Rails Project Created

Project \`$PROJECT_NAME\` includes:

- Database: \`$DB_CHOICE\`
- API-only: \`$API_MODE\`
- Default installed gems: rails, rubocop, solargraph
- Extra gems: $EXTRA_GEMS
- Git repo initialized

To get started:

\`\`\`bash
cd $PROJECT_NAME
nix develop
bin/rails server
\`\`\`
EOF
