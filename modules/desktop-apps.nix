# general packages to be installed independent of DE
{pkgs, ...}:
{
  environment.systemPackages = 
    with pkgs; [
  
      firefox
      discord
      spotube
      mpc-qt
      logseq

    ];
}