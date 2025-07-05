{ pkgs, ... }: {

  home.packages = with pkgs; [ goose-cli ];

  # Force goose to be ran via proxy
  # home.shellAliases = { goose = "proxychains4 -q goose"; };

  xdg.configFile."goose/config.yaml".text = # yaml
    ''
      OPENAI_BASE_PATH: v1/chat/completions
      GOOSE_MODEL: gpt-4.1-nano
      # GOOSE_MODEL: codestral-latest
      extensions:
        developer:
          bundled: true
          display_name: Developer
          enabled: true
          name: developer
          timeout: 300
          type: builtin
      GOOSE_PROVIDER: openai
      OPENAI_HOST: https://api.openai.com
      # OPENAI_HOST: https://codestral.mistral.ai	
    '';
}
