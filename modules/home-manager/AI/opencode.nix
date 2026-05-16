{ config, ... }:
{
  programs.opencode = {
    enable = true;
    tui.theme = "system";
    settings = {
      model = "openrouter/qwen/qwen3.5-397b-a17b";
      provider = {
        openrouter = {
          options = {
            apiKey = "{env:OPENROUTER_API_KEY}";
          };
        };
      };
    };
  };
}
