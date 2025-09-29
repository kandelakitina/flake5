{ config, pkgs, inputs, ... }: {
  # imports = [ inputs.sddm-sugar-candy-nix.nixosModules.default ];
  services = {
    displayManager = {
      preStart = ''
        echo "Sleeping to wait for session registration..."
        sleep 1
      '';
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "where_is_my_sddm_theme";
        # sugarCandyNix = {
        #   enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
        #   settings = {
        #     # Set your configuration options here.
        #     Background = lib.cleanSource ../../images/magentaAbstract.jpg;
        #     ScreenWidth = 1920;
        #     ScreenHeight = 1080;
        #     # FormPosition = "left";
        #     HaveFormBackground = true;
        #     FullBlur = true;
        #     PartialBlur = true;
        #     ForceLastUser = true;
        #     HeaderText = "";
        #     MainColor = "#47a0f3";
        #     AccentColor = "#7b5cb0";
        #     BackgroundColor = "#101421";
        #   };
        # };
        # theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili/";
        # theme = "catppuccin-mocha-mauve";
      };
    };
  };

  environment.systemPackages = [

    # https://github.com/stepanzubkov/where-is-my-sddm-theme

    (pkgs.where-is-my-sddm-theme.override {
      themeConfig.General = {
        hideCursor = false;
        # showUsersByDefault = true;
        # showUserRealNameByDefault = true;
        # usersFontSize = 48;

        background = "${../../images/magentaAbstract.jpg}";
        blurRadius = 20;
        # backgroundFill = "#101421"; # deep blue

        basicTextColor = "#f6c744"; # yellow
        # basicTextColor = "#e5e9f0"; # white
        passwordCursorColor = "#a47de9"; # magenta
        passwordTextColor = "#f6c744"; # yellow
        passwordCharacter = "•";
        passwordInputWidth = "1";
        passwordFontSize = 62;
      };
    })
  ];
  # environment.systemPackages = with pkgs;
  #   [
  #     libsForQt5.qt5.qtgraphicaleffects
  #     # catppuccin-sddm-corners
  #     # sddm-chili-theme
  #   ];
}
