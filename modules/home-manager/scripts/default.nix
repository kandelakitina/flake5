{ pkgs, ... }:

# https://github.com/Frost-Phoenix/nixos-config/blob/2bba124946e7530cee136f554f4d5cd8834bdf20/modules/home/scripts/scripts.nix

let
  rubyInitFiles = pkgs.stdenv.mkDerivation {
    name = "ruby-init-files";
    src = ./ruby-init;
    installPhase = ''
      mkdir -p $out
      cp .rspec .rubocop.yml minimal_formatter.rb ruby-init.sh $out/
    '';
  };

  ruby-init = pkgs.writeShellScriptBin "ruby-init" ''
    export RUBY_INIT_DIR="${rubyInitFiles}"
    bash "$RUBY_INIT_DIR/ruby-init.sh"
  '';

  rails-init =
    pkgs.writeShellScriptBin "rails-init" (builtins.readFile ./rails-init.sh);

  mountUsb =
    pkgs.writeShellScriptBin "mountUsb" (builtins.readFile ./mountUsb.sh);
  mountEncryptedUsb = pkgs.writeShellScriptBin "mountEncryptedUsb"
    (builtins.readFile ./mountEncryptedUsb.sh);
  run-firefox =
    pkgs.writeShellScriptBin "run-firefox" (builtins.readFile ./run-firefox.sh);
  run-alacritty = pkgs.writeShellScriptBin "run-alacritty"
    (builtins.readFile ./run-alacritty.sh);
  waybar-yubikey = pkgs.writeShellScriptBin "waybar-yubikey"
    (builtins.readFile ./waybar-yubikey.sh);
  wall-change =
    pkgs.writeShellScriptBin "wall-change" (builtins.readFile ./wall-change.sh);
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker"
    (builtins.readFile ./wallpaper-picker.sh);
  pomodoro =
    pkgs.writeShellScriptBin "pomodoro" (builtins.readFile ./pomodoro.sh);
  # runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);
  # music = pkgs.writeShellScriptBin "music" (builtins.readFile ./scripts/music.sh);
  # lofi = pkgs.writeScriptBin "lofi" (builtins.readFile ./scripts/lofi.sh);

  # toggle_blur = pkgs.writeScriptBin "toggle_blur" (builtins.readFile ./scripts/toggle_blur.sh);
  # toggle_oppacity = pkgs.writeScriptBin "toggle_oppacity" (builtins.readFile ./scripts/toggle_oppacity.sh);

  # maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);

  # compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  # extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);

  shutdown-script = pkgs.writeScriptBin "shutdown-script"
    (builtins.readFile ./shutdown-script.sh);

  show-keybinds =
    pkgs.writeScriptBin "show-keybinds" (builtins.readFile ./keybinds.sh);

  # vm-start = pkgs.writeScriptBin "vm-start" (builtins.readFile ./scripts/vm-start.sh);

  # ascii = pkgs.writeScriptBin "ascii" (builtins.readFile ./scripts/ascii.sh);
in {
  home.packages = [
    pomodoro

    ruby-init
    rails-init

    waybar-yubikey
    wall-change
    wallpaper-picker

    run-firefox
    run-alacritty

    mountUsb
    mountEncryptedUsb

    # runbg
    # music
    # lofi

    # toggle_blur
    # toggle_oppacity

    # maxfetch

    # compress
    # extract

    shutdown-script

    show-keybinds

    # vm-start

    # ascii
  ];
}
