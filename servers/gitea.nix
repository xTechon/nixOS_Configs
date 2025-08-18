# https://ayats.org/blog/gitea-drone
# https://mcwhirter.com.au/craige/blog/2019/Deploying_Gitea_on_NixOS/
{ config, DOMAIN, ... }:
{
  services.nginx.virtualHosts."git.${DOMAIN}" = {
    enableACME = false;
    forceSSL = false;
    locations."/" = {
      proxyPass = "http://localhost:3001/";
    };
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ config.services.gitea.user ];
    ensureUsers = [
      {
        name = "${config.services.gitea.database.user}";
        ensureDBOwnership = true; # user and database have same name by default
        #ensurePermissions = {
        #  "DATABASE ${config.services.gitea.database.name}" = "ALL PRIVILEGES";
        #};
      }
    ];
  };

  sops.secrets."postgres/gitea_dbpass" = {
    sopsFile = ../secrets/secrets.yaml; # bring your own password file
    owner = config.services.gitea.user;
  };

  services.gitea = {
    enable = true;
    appName = "My awesome Gitea server"; # Give the site a name
    database = {
      type = "postgres";
      #passwordFile = config.sops.secrets."postgres/gitea_dbpass".path;
      password = "12345";
    };
    settings.server = {
      DOMAIN = "git.${DOMAIN}";
      ROOT_URL = "https://git.my-domain.tld/";
      HTTP_PORT = 3001;
    };
  };
}

  
  
  

  
  
