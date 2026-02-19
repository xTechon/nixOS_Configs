{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    polyphone
    #lmms # causing problems as of 11/7/25 see: https://discourse.nixos.org/t/cant-build-lmms/71529
    reaper
  ];
}
