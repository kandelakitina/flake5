{ inputs, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;

    gnupg = {
      home = "~/.gnupg";
      # sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      sshKeyPaths = [ ];
    };

    # age.keyFile = "/persist/var/lib/sops-nix/key.txt";

    # secrets = {
    # "private-keys/boticelli" = { path = "/home/boticelli/.ssh/id_rsa"; };
    # openAI = { path = "/home/boticelli/.config/openAI/key.txt"; };
    # };
  };
}
