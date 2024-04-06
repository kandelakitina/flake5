{inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;

    age.keyFile = "/home/boticelli/.config/sops/age/keys.txt";

    # this writes the secret (private SSH key) from secrets.yaml to a file
    secrets = {
      "private-keys/boticelli" = {
        path = "/home/boticelli/.ssh/boticelli_ed25519_key";
      };
    };
  };
}
