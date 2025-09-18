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
echo "Initializing flake template"
if [ -n "$NH_FLAKE" ]; then
  nix flake init -t "$NH_FLAKE#rails"
else
  nix flake init -t github:kandelakitina/flake5#rails
fi

# Installing gems
DEFAULT_GEMS=("colorize" "rspec-rails" "pry-byebug" "factory_bot_rails" "faker" "annotate" 
"bullet" "dotenv-rails" "rack-mini-profiler" "rails-erd")
EXTRA_GEMS=$(gum choose --no-limit "${DEFAULT_GEMS[@]}" --header "Select additional gems:")
EXTRA_GEMS=$(echo "$EXTRA_GEMS" | xargs)  # Flatten multiline to space-separated

echo "Installing Rails"
nix develop --command bash -c "
  bundle init
  bundle add rails --skip-install
  bundle-lock
  bundix
"

echo "Populating rails default folders"
nix develop --command bash -c "
  rails new . -d sqlite3 --skip-bundle --skip-git --force
  bundle-lock
  bundix
"

echo "Installing ruby formatter, ruby-lsp, solargraph and extra gems"
# rubocop and rubocop-rails are optional, currently disabled
nix develop --command bash -c "
  bundle add $EXTRA_GEMS \
    erb-formatter \
    herb \
    rufo \
    ruby-lsp \
    solargraph \
    solargraph-rails \
    --group development \
    --skip-install

  bundle lock
  bundix
"

# Git repo
echo "Initializing git"
git init -q
git add .
git commit -m 'Initial Rails + Nix scaffold' -q

# Done message
gum format --theme dracula <<EOF
# ✅ Rails Project Created

Project \`$PROJECT_NAME\` includes:

- Database: sqlite3
- Default installed gems: rails, rufo, ruby-lsp, solargraph
- Extra gems: $EXTRA_GEMS
- Git repo initialized

To get started:

\`\`\`bash
cd $PROJECT_NAME
nix develop
bin/rails server
\`\`\`
EOF
