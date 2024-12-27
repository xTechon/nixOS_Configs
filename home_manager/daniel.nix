# run the following commands before module usage
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# sudo nix-channel --update
{ pkgs, ... }:
{
  
  imports = [ <home-manager/nixos> ];
  home-manager.useGlobalPkgs = true; # use the system level nixpkgs to avoid NIX_PATH usage
  home-manager.useUserPackages = true; # install packages to /etc/profiles instead, saves disk space on /home
  
  home-manager.users.daniel = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.11";
    
    # mime app defaults should be set here to prevent collisions
    # if defaults were defined at the app module level (../modules) subsequent additions would-
    # collide if multiple app configurations wanted to add to a specific type
    xdg.mime.enable = true;
    xdg.mimeApps = {
      enable = true;
      associations.added = {
        "inode/directory" = "codium.desktop";
      };
      defaultApplications = {
        "inode/directory" = ["org.kde.dolphin.desktop" "codium.desktop"];
      };
    };
  };
}