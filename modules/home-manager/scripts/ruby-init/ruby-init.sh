#!/usr/bin/env bash
set -euo pipefail

# Ensure gum is installed
command -v gum >/dev/null || {
  echo "gum is required. Install it from https://github.com/charmbracelet/gum"
  exit 1
}

# Ensure RUBY_INIT_DIR is set
if [[ -z "${RUBY_INIT_DIR:-}" ]]; then
  echo "RUBY_INIT_DIR is not set. This script should be run via the Nix wrapper."
  exit 1
fi

# Prompt for project name
PROJECT_NAME=$(gum input --placeholder "Enter your project name" --value "my-ruby-app")
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Interactive selection of extra gems (excluding rspec, rubocop, solargraph which are always added)
DEFAULT_GEMS=("rake" "pry-byebug" "rails" "sinatra" "activerecord" "nokogiri")
EXTRA_GEMS=$(gum choose --no-limit "${DEFAULT_GEMS[@]}" --header "Select additional gems (rubocop, rspec & solargraph are added by default):")
EXTRA_GEMS=$(echo "$EXTRA_GEMS" | xargs)  # Flatten multiline to space-separated

# Initialize flake
echo "Scaffolding Ruby project with nix flake template..."
nix flake init -t github:inscapist/ruby-nix

# Use nix shell to bootstrap Ruby project
echo "Setting up Ruby environment and installing gems..."
nix develop --command bash -c "
  bundle init
  bundle add rubocop rspec solargraph $EXTRA_GEMS --skip-install
  bundle-lock
  bundix
"

# Copy config files from RUBY_INIT_DIR
cp "$RUBY_INIT_DIR/.rspec" .
cp "$RUBY_INIT_DIR/.rubocop.yml" .
mkdir -p spec
cp "$RUBY_INIT_DIR/minimal_formatter.rb" spec/minimal_formatter.rb

# Git repo setup
git init -q
git add .
git commit -m 'Initial Ruby + Nix scaffold' -q

# Done message
gum format --theme dracula <<EOF
# ✅ Ruby Project Created

Project \`$PROJECT_NAME\` includes:

- Nix flake template: \`inscapist/ruby-nix\`
- Gems installed:
  - Always: \`rubocop\`, \`rspec\`, \`solargraph\`
  - Selected: $EXTRA_GEMS
- Files:
  - Root: \`.rspec\`, \`.rubocop.yml\`, \`Gemfile\`, \`Gemfile.lock\`, \`gemset.nix\`
  - Specs: \`spec/minimal_formatter.rb\`
- Git repo initialized

To get started:

\`\`\`bash
cd $PROJECT_NAME
nix develop
\`\`\`
EOF
