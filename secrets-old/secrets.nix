{ config, pkgs, ... }:
{
  environment.systemPackages =
    with pkgs; [
      sops
    ];

  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/daniel/.config/sops/age/keys.txt";

}
