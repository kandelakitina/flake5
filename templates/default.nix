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
  node-mongo = {
    path = ./node-mongo;
    description = "NodeJS devShell with precompiled MongoDB binary";
  };
  node-podman-mongo = {
    path = ./node-podman-mongo;
    description = "NodeJS devShell with podman and MongoDB";
  };
  deno = {
    path = ./deno;
    description = "Minimal deno env with just";
  };
}
