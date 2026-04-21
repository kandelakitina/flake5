{ config, ... }:
{
  programs.opencode = {
    enable = true;
    settings = {
      theme = "system";
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
