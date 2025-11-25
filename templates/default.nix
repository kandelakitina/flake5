rec {
  default = basic;
  basic = {
    path = ./basic;
    description = "Minimal Flakelight flake.";
  };
  ruby = {
    path = ./ruby;
    description = "Ruby dev env with gemfile, bundler, bundlix, etc.";
    welcomeText = ''
      Populating Ruby environment.
      Use `nix develop`
    '';
  };
  rails = {
    path = ./rails;
    description = "Rails dev env with gemfile, bundler, bundlix, etc.";
    # welcomeText = ''
    #   Populating Rails environment.
    #   Use `nix develop`
    # '';
  };
  node = {
    path = ./node;
    description = "Minimal nodeJS env with node2nix and just";
  };
  deno = {
    path = ./deno;
    description = "Minimal deno env with just";
  };
}
