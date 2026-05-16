{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.silentSDDM.nixosModules.default ];

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    profileIcons = {
      boticelli = ../../misc/BillMurrey.png;
    };
    settings = {
      General = {
        scale = 1.5;
      };
    };
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
