#!/usr/bin/env bash
set -euo pipefail

# Ensure gum is installed
if ! command -v gum &>/dev/null; then
  echo "gum is required. Install it from https://github.com/charmbracelet/gum"
  exit 1
fi

# 1. Prompt for project name
PROJECT_NAME=$(gum input --placeholder "Enter your project name" --value "my-ruby-app")
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# 2. Choose gems interactively
DEFAULT_GEMS=("rake" "rspec" "pry-byebug" "rails" "sinatra" "activerecord" "nokogiri")
SELECTED_GEMS=$(gum choose --no-limit "${DEFAULT_GEMS[@]}" --header "Select gems to include in your project")

# Turn multiline result into space-separated string
GEM_LIST=$(echo "$SELECTED_GEMS" | xargs)

# 3. Scaffold with flake template
echo "Scaffolding Ruby project with nix flake template..."
nix flake init -t github:inscapist/ruby-nix

# 4. Set up Ruby environment using nix develop
echo "Setting up Ruby environment and installing gems..."
nix develop --command bash -c "
  bundle init
  bundle add $GEM_LIST --skip-install
  bundle lock
  bundix
"

# 5. Git initialization
echo "Initializing Git repository..."
git init -q
git add .
git commit -m 'Initial Ruby + Nix scaffold' -q

# 6. Completion message
gum format --theme dracula <<EOF
# ✅ Project Scaffolding Complete

Project \`$PROJECT_NAME\` has been created with:

- Flake template from \`inscapist/ruby-nix\`
- Gems: $GEM_LIST
- \`Gemfile\`, \`Gemfile.lock\`, \`gemset.nix\`
- Git initialized

To get started, run the following inside the \`$PROJECT_NAME\` directory:

\`\`\`bash
nix develop
\`\`\`
EOF

cd "$PROJECT_NAME"
