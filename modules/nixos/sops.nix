{inputs, ...}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    # gnupg = {
    #   home = "~/.gnupg";
    #   sshKeyPaths = [];
    # };

    age = {
      # automatically import host SSH keys as age keys
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      # this will use an age key that is expected to already be in the filesystem
      keyFile = "/var/lib/sops-nix/key.txt";
      # generate a new key if the key specified above does not exist
      generateKey = true;
    };
  };
}
