{
  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = {
        packages = pkgs: with pkgs; [ ruby bundlix bundler pry-byebug ];
        shellHook = ''
          echo -e "\e[1;35m💎 Welcome to the Ruby Dev Shell 💎\e[0m"
        '';
      };
    };
}
