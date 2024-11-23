{ pkgs, config, libs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    #dedicatedServer.openFirewall = true;

    extest.enable = true;
  };
}
