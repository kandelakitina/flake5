{ config, pkgs, ... }:
{
  services.sing-box = {
    enable = true;
    package = pkgs.sing-box;
    settings = {
      log = {
        level = "info";
      };
      inbounds = [
        {
          type = "socks";
          tag = "socks-in";
          listen = "127.0.0.1";
          listen_port = 1080;
        }
      ];
      outbounds = [
        {
          type = "vless";
          tag = "vless-out";
          server = "82.23.173.213";
          server_port = 443;
          uuid = "5642a2ba-4baa-4401-93c7-ae7e84e8e37e";
          flow = "xtls-rprx-vision";
          tls = {
            enabled = true;
            server_name = "www.annamiller.cam";
            utls = {
              enabled = true;
              fingerprint = "chrome";
            };
            reality = {
              enabled = true;
              public_key = "0pFsZxAMbI8VD_2zmK9fnMyWZ6lrRTNeRAT77HnxvjU";
              short_id = "4f56dd85";
            };
          };
        }
        {
          type = "direct";
          tag = "direct";
        }
      ];
      route = {
        final = "vless-out";
      };
    };
  };
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };
}
