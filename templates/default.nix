rec {
  default = basic;
  basic = {
    path = ./basic;
    description = "Minimal Flakelight flake.";
  };
  ruby = {
    path = ./ruby;
    description = "Ruby dev env with gemfile, bundler, bundlix, etc.";
  };
}
