{ inputs, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;

    gnupg = {
      home = "~/.gnupg";
      # sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      sshKeyPaths = [ ];
    };

    # age.keyFile = "/home/boticelli/.config/sops/age/keys.txt";
    # age.keyFile = "/persist/var/lib/sops-nix/key.txt";

    # secrets = {
    # "private-keys/boticelli" = { path = "/home/boticelli/.ssh/id_rsa"; };
    # openAI = { path = "/home/boticelli/.config/openAI/key.txt"; };
    # };
  };

  # # programs.fish = {
  # #   enable = true;
  #   # shellInit = ''
  #   #   set -x OPENAI_API_KEY (cat /home/boticelli/.config/openAI/key.txt)
  #   # '';
  # };

  # home = {
  #   persistence = {
  #     "/persist/home/boticelli" = {
  #       directories = [ ];
  #       files = [ "~/.config/openAI/key.txt" ];
  #     };
  #   };
  # };

}
