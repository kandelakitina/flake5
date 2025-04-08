{ config, pkgs, lib, ... }:

let
  ipsecConf = pkgs.writeTextFile {
    name = "ipsec.conf";
    text = # conf
      ''
        config setup
          charondebug="ike 2, knl 2, cfg 2, net 2"

        conn ze
          auto=add
          keyexchange=ikev1
          authby=xauthpsk
          xauth_identity=vpnuser
          left=%defaultroute
          leftsourceip=%config
          right=93.183.124.156
          rightid=%any
          rightsubnet=0.0.0.0/0
          ike=aes256-sha1-modp1024
          esp=aes256-sha1
      '';
  };

  strongswanConf = pkgs.writeTextFile {
    name = "strongswan.conf";
    text = # conf
      ''
        charon {
          load_modular = yes
        }
      '';
  };

in {
  environment.systemPackages = with pkgs; [ strongswan ];

  # Write config files directly to the expected locations
  environment.etc."ipsec.conf".source = ipsecConf;
  environment.etc."strongswan.conf".source = strongswanConf;

  # Enable the StrongSwan service
  services.strongswan.enable = true;

  # Firewall rules
  networking.firewall.allowedUDPPorts = [ 500 4500 ];

  # The secrets are placed at /etc/ipsec.secrets via SOPS in sops.nix

}
