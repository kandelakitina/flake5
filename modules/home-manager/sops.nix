{ inputs, config, ... }: {
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

    # sops.secrets.sgptrc = { path = "/home/boticelli/.config/shell_gpt/.sgptrc"; };

    secrets.OPENAI = {
      # owner = "boticelli";
      # group = "boticelli";
    };

  };

  programs.fish.shellInit = ''
    set -x OPENAI_API_KEY (cat /run/secrets/OPENAI)
  '';
  # set -x OPENAI_API_KEY (cat ${config.sops.secrets.OPENAI.path})

}
