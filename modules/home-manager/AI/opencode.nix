{
  programs.opencode = {
    enable = true;
    settings = {
      theme = "system";
      # Get the models' names at https://models.dev
      model = "opencode/grok-code";
      small_model = "mistral/devstral-small-2507";
    };
  };
}
