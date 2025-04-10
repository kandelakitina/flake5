{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [ ./rgv.nix ];

  programs = {
    # fuzzy finder
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    # better ctrl-r history search (replaces fzf)
    # see also atuin
    # mcfly = {
    #   enable = true;
    #   enableFishIntegration = true;
    #   keyScheme = "vim";
    #   # interfaceView = "BOTTOM";
    #   # fzf.enable = true;
    # };

    bat.enable = true;
    btop.enable = true;

    # better trees navigating
    broot = {
      enable = true;
      enableFishIntegration = true;
    };

    eza = {
      enable = true;
      icons = "auto";
      git = true;
      extraOptions = [ "--group-directories-first" "--header" ];
    };

    jq.enable = true;
    ripgrep.enable = true;

    # thefuck = {
    #   enable = true;
    #   enableFishIntegration = true;
    # };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  home.packages = with pkgs; [
    fd # better find
    choose # a better cut / awk
    curlie # curl + httpie
    du-dust # see file trees ('dust')
    duf # better 'df' (disk usage)
    gdu # disk usage (folders)
    # dogdns             # a CLI dns client
    httpie # CLI HTTP client for APIs access
    ouch # better unzip
    procs # better ps
    sd # better sed
    silver-searcher # 'ag' (code search)
    scooter # find and replace
    tree
    xclip
    xh # sending HTTP requests in CLi
    xxh # bring your shell with you upon SSH
    unzip
  ];

  home.shellAliases = {
    du = "dust";
    df = "duf";
    ps = "procs";
    cd = "z";
    grep = "rg";
    dig = "dog";
    cat = "bat";
    curl = "curlie";
    sudo = "sudo -E -s";
  };
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".local/share/zoxide" ".cache/tealdeer" ];
      };
    };
  };
}
