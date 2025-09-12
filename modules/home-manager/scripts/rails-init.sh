#!/usr/bin/env bash
set -euo pipefail

# Ensure gum is installed
command -v gum >/dev/null || {
  echo "gum is required. Install it from https://github.com/charmbracelet/gum"
  exit 1
}

# Prompt for project name
PROJECT_NAME=$(gum input --placeholder "Enter your Rails project name" --value "my-rails-app")

# Create project folder
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Init flake
echo "Installing gems - rails, rubocop, solargraph"
nix flake init -t github:kandelakitina/rails-nix-template

# Installing gems
DEFAULT_GEMS=("colorize" "rspec" "pry-byebug" "activerecord" "nokogiri")
EXTRA_GEMS=$(gum choose --no-limit "${DEFAULT_GEMS[@]}" --header "Select additional gems:")
EXTRA_GEMS=$(echo "$EXTRA_GEMS" | xargs)  # Flatten multiline to space-separated

nix develop --command bash -c "
  bundle init
  bundle add $EXTRA_GEMS rails rubocop solargraph --group development --skip-install
  bundle-lock
  bundix
"

# Now run rails new with existing Gemfile (SQLite3, full app)
echo "Populating rails default folders"
nix develop --command bash -c "
  rails new . -d sqlite3 --skip-bundle --skip-git --force
  bundle-lock
  bundix
"

# Git repo
git init -q
git add .
git commit -m 'Initial Rails + Nix scaffold' -q

# Done message
gum format --theme dracula <<EOF
# ✅ Rails Project Created

Project \`$PROJECT_NAME\` includes:

- Database: sqlite3
- Full Rails app (not API-only)
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
