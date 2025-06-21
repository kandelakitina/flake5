{ pkgs, config, ... }:
let
  ai = pkgs.writeShellScriptBin "ai" # bash
    ''
      #!/bin/sh
      aichat "$@"
    '';

in {
  home.packages = with pkgs; [ ai aichat ];
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
}
