# TODO install https://github.com/joshmedeski/sesh
{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    functions = {
      # make fff file manager cd on quit
      # f = ''
      #   fff $argv
      #   set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
      #   cd (cat $XDG_CACHE_HOME/fff/.fff_d)
      # '';

      # make nnn file manager cd on quit
      f = # fish
        ''
          if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
              echo "nnn is already running"
              return
          end

          if test -n "$XDG_CONFIG_HOME"
              set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
          else
              set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
          end

          command nnn -e $argv

          if test -e $NNN_TMPFILE
              source $NNN_TMPFILE
              rm -- $NNN_TMPFILE
          end
        '';
    };

    interactiveShellInit = # bash
      ''
        set fish_greeting (echo -e "\e[38;5;135m┏(-_-)┛\e[38;5;15m┗(-_-)┓\e[38;5;196m┗(-_-)┛\e[38;5;226m┏(-_-)┓\e[38;5;82m┏(-_-)┛\e[38;5;87m┗(-_-)┓\e[38;5;33m┗(-_-)┛\e[0m")
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

        # Carapace
        set -g CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
        # carapace --init fish | source
        carapace _carapace fish | source
      '';

    plugins = with pkgs.fishPlugins; [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      # {
      #   name = "grc";
      #   src = grc.src;
      # }
      {
        name = "tacklebox";
        src = pkgs.fetchFromGitHub {
          owner = "justinmayer";
          repo = "tacklebox";
          rev = "1c13cecd5748013be89373ab087dac94e861598d";
          sha256 = "BGFPnGdF/wmnJH8YJqyBi4Pb6DlPM509fj+GnTnWkQc=";
        };
      }
      {
        name = "fish-fastdir";
        src = pkgs.fetchFromGitHub {
          owner = "danhper";
          repo = "fish-fastdir";
          rev = "dddc6c13b4afe271dd91ec004fdd199d3bbb1602";
          sha256 = "iu7zNO7yKVK2bhIIlj4UKHHqDaGe4q2tIdNgifxPev4=";
        };
      }
      {
        name = "fish-abbreviation-tips";
        src = pkgs.fetchFromGitHub {
          owner = "gazorby";
          repo = "fish-abbreviation-tips";
          rev = "8ed76a62bb044ba4ad8e3e6832640178880df485";
          sha256 = "05b5qp7yly7mwsqykjlb79gl24bs6mbqzaj5b3xfn3v2b7apqnqp";
        };
      }
      {
        name = "bass";
        src = bass.src;
      }
      {
        name = "colored-man-pages";
        src = colored-man-pages.src;
      }
      {
        name = "fish-you-should-use";
        src = fish-you-should-use.src;
      }
      {
        name = "plugin-git";
        src = plugin-git.src;
      }
      {
        name = "plugin-sudope";
        src = plugin-sudope.src;
      }
      {
        name = "humantime-fish";
        src = humantime-fish.src;
      }
      # Use carapace instead
      # {
      #   name = "fifc";
      #   src = fifc.src;
      # }
      {
        name = "fzf-fish";
        src = fzf-fish.src;
      }
      {
        name = "done";
        src = done.src;
      }
      {
        name = "pisces";
        src = pisces.src;
      }
      {
        name = "autopair";
        src = autopair.src;
      }
      # TODO: Learn bindings on https://github.com/wfxr/forgit
      {
        name = "forgit";
        src = forgit.src;
      }
      {
        name = "zoxide.fish";
        src = pkgs.fetchFromGitHub {
          owner = "kidonng";
          repo = "zoxide.fish";
          rev = "bfd5947bcc7cd01beb23c6a40ca9807c174bba0e";
          sha256 = "sha256-Hq9UXB99kmbWKUVFDeJL790P8ek+xZR5LDvS+Qih+N4=";
        };
      }
      {
        name = "nix.fish";
        src = pkgs.fetchFromGitHub {
          owner = "kidonng";
          repo = "nix.fish";
          rev = "ad57d970841ae4a24521b5b1a68121cf385ba71e";
          sha256 = "sha256-GMV0GyORJ8Tt2S9wTCo2lkkLtetYv0rc19aA5KJbo48=";
        };
      }
    ];
  };

  home = {
    persistence = {
      "/persist/home/boticelli" = {
        files = [ ".local/share/fish/fish_history" ];
      };
    };
  };
}
