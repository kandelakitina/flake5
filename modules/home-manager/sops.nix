{ inputs, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;

    age.keyFile = "/home/boticelli/.config/sops/age/keys.txt";

    secrets = {
      "private-keys/boticelli" = {
        path = "/home/boticelli/.ssh/boticelli_ed25519_key";
      };
      openAI = { path = "/home/boticelli/.config/openAI/key.txt"; };
    };
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      set -x OPENAI_API_KEY (cat /home/boticelli/.config/openAI/key.txt)
    '';
  };

  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ];
        files = [ "~/.config/openAI/key.txt" ];
      };
    };
  };

}
