{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    polyphone
    lmms
    reaper
  ];
}
