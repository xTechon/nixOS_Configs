{pkgs, ...}:
{
/*
  services.nginx.virtualHosts."recipies.my-domain.tld" = {
    enableACME = false;
    forceSSL = false;
    locations."/" = {
      proxyPass = "http://localhost:4001/";
    };
  };
*/
  services.tandoor-recipes.enable = true;
  services.tandoor-recipes.address = "localhost";
  services.tandoor-recipes.port = 4001;
  
  services.tandoor-recipes.extraConfig = {
    ALLOWED_HOSTS="recipes.my-domain.tld,localhost,127.0.0.1";
    SECRET_KEY="TIHBU87twOgdHAPLTwErpJptSz5FdfLWPRfOjOa6KZGgOPQ4RD";
    POSTGRES_PASSWORD="12345";
  };
}