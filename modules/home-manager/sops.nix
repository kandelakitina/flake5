{inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;

    age.keyFile = "/home/boticelli/.config/sops/age/keys.txt";

    secrets = {
      "private-keys/boticelli" = {
        path = "/home/boticelli/.ssh/boticelli_ed25519_key";
      };
      copilot = {
        path = "/home/boticelli/.local/copilot/apikey.txt";
      };
    };
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      set -x COPILOT_API_KEY (cat /home/boticelli/.local/copilot/apikey.txt)
    '';
  };
}
