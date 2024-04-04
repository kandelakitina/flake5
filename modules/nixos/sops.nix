{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  # secrets will be output to /run/secrets
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
      # this is where the age key derived from the above SSH will live
      keyFile = "/home/boticelli/.config/sops/age/keys.txt";
      # generate a new key if the key specified above does not exist
      generateKey = true;
    };
  };

  environment.systemPackages = with pkgs; [
    sops
    age
  ];

}
