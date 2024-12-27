# run the following commands before module usage
# sudo nix-channel --add https://github.com/nix-community/plasma-manager/archive/trunk.tar.gz plasma-manager
# sudo nix-channel --update plasma-manager
{ pkgs, config, ... }:
{
  imports = [
    ./shortcuts.nix
    ./panels.nix
    ./hotkeys.nix
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      enableMiddleClickPaste = false;
    };
    
    krunner.position = "center";

    kwin = {
      borderlessMaximizedWindows = true;
      effects = {
        wobblyWindows.enable = true;
        shakeCursor.enable = false;
      };
    };
  };

}
