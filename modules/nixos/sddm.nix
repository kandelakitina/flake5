{ config, pkgs, inputs, ... }: {
  imports = [ inputs.silentSDDM.nixosModules.default ];

  programs.silentSDDM = {
    enable = true;
    theme = "catppuccin-mocha";
  };

  services.displayManager = {
    generic.preStart = ''
      echo "Sleeping to wait for session registration..."
      sleep 1
    '';
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };
  };
}
