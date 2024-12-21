{ pkgs, inputs, config, ... }: {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  # secrets will be output to /run/secrets
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    # validateSopsFiles = false;

    # gnupg = {
    #   home = "~/.gnupg";
    #   # sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    #   sshKeyPaths = [ ];
    # };

    age = {
      # automatically import host SSH keys as age keys
      sshKeyPaths = [
        "/persist/etc/ssh/ssh_host_ed25519_key"
        "/mnt/etc/ssh/ssh_host_ed25519_key"
        # "/etc/ssh/ssh_host_ed25519_key"
      ];
      # this is where the age key derived from the above SSH will live
      # keyFile = "/persist/var/lib/sops-nix/key.txt";
      keyFile = "/var/lib/sops-nix/key.txt";
      # generate a new key if the key specified above does not exist
      generateKey = false;
    };
  };

  sops.secrets.OPENAI = {
    mode = "0440";
    owner = config.users.users.boticelli.name;
    group = config.users.users.boticelli.group;
  };

  sops.secrets.CODESTRAL_API_KEY = {
    mode = "0440";
    owner = config.users.users.boticelli.name;
    group = config.users.users.boticelli.group;
  };

  environment = {
    variables = {
      OPENAI_API_KEY = "$(cat ${config.sops.secrets.OPENAI.path})";
      CODESTRAL_API_KEY =
        "$(cat ${config.sops.secrets.CODESTRAL_API_KEY.path})";
    };
    systemPackages = with pkgs; [ sops age ];
  };

}
