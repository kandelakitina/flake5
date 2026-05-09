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
          listen_port = 10808;
        }
      ];
      outbounds = [
        {
          type = "vless";
          tag = "vless-out";
          server = "82.23.173.213";
          server_port = 443;
          uuid = "6e01fdfa-a7d3-4894-a543-5168014dc2c4";
          flow = "xtls-rprx-vision";
          tls = {
            enabled = true;
            server_name = "www.yahoo.com";
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
