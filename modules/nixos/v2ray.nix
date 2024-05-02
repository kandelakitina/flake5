{
  # v2rayA - Proxy server web front end
  services.v2raya.enable = true;
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [ "/var/v2raya" ];
  };
}
