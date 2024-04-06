{
  pkgs,
  inputs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {

  # Decrypt boticelli-password to /run/secrets-for-users/ so it can be used to create the user
  sops.secrets.boticelli-password.neededForUsers = true;
  users.mutableUsers = false; # Required for password to be set via sops during system activation!

  users.users.boticelli = {
    # initialPassword = "qwerty";
    hashedPasswordFile = config.sops.secrets.boticelli-password.path;
    isNormalUser = true;
    shell = pkgs.fish; # default shell
    ignoreShellProgramCheck = true;

    extraGroups =
      [
        "wheel"
        "audio"
        "video"
      ]
      ++ ifTheyExist [
        "docker"
        "git"
        "mysql"
        "network"
      ];

    openssh.authorizedKeys.keyFiles = [
      ../../../keys/boticelli_ed25519.pub
    ];

    packages = [pkgs.home-manager];
  };

  # FIXME This should probably be host specific. Also need to confirm that this is the correct place to do this.
  # security.sudo.extraConfig = ''
  #   Defaults timestamp_timeout=120 # only ask for password every 120 minutes
  # '';

  # Import this user's personal/home configurations
  # home-manager.users.ta = import ../../home/ta/${config.networking.hostName}.nix;
}
