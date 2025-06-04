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
      \e[31mWelcome to the Ruby development shell! \u{1F48E} \u{1F48E}\e[0m
    '';
  };
}
