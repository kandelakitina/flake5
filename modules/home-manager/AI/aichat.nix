{ pkgs, config, ... }:
let
  ai = pkgs.writeShellScriptBin "ai" # bash
    ''
      #!/bin/sh
      # proxychains4 -q aichat "$@"
      aichat "$@"
    '';

in {
  home.packages = with pkgs; [ ai aichat ];

  # OPENAI
  # ------
  xdg.configFile."aichat/config.yaml".text = # yaml
    ''
      model: openai:gpt-4o
      clients:
      - type: openai
        # api_key comes from $OPENAI_API_KEY env var
        # See: https://github.com/sigoden/aichat/wiki/Environment-Variables#client-related-envs
        api_key: null
      stream: true
      save: true
      keybindings: v
    '';

  # CODESTRAL
  # ---------
  # xdg.configFile."aichat/config.yaml".text = # yaml
  #   ''
  #     model: codestral:codestral-latest

  #     clients:
  #     - type: openai-compatible
  #       name: codestral
  #       api_base: https://codestral.mistral.ai/v1/
  #       api_key: null
  #       # set it in env var MISTRAL_API_KEY

  #     stream: true
  #     save: true
  #     keybindings: v
  #   '';

  # MISTRAL
  # ---------
  # xdg.configFile."aichat/config.yaml".text = # yaml
  #   ''
  #     model: mistral:mistral-medium-latest

  #     clients:
  #     - type: openai-compatible
  #       name: mistral
  #       api_base: https://api.mistral.ai/v1
  #       # api_key is defined in MISTRAL_API_KEY variable

  #     stream: true
  #     save: true
  #     keybindings: v
  #   '';
}
