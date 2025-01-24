# run the following commands before module usage
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# sudo nix-channel --add https://github.com/nix-community/plasma-manager/archive/trunk.tar.gz plasma-manager
# sudo nix-channel --update
{ lib, pkgs, config, ... }:

with lib; 
let 
  cfg = config.services;
  gpgKey = pkgs.fetchurl {
    url = "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x827fa8540f6415e2";
    sha256 = "sha256-uqADL61CJMqkDE2wMkdKF9RYgCCF4bM9gUsRhBaXr2o=";
  };
in
{
  options.services.plasma-manager = {
    enable = mkEnableOption "Use Plasma-Manager";
  };

  options.services.gpgAgent = {
    enable = mkEnableOption "Mange GPG with Home Manager";
  };

  imports = [
    <home-manager/nixos>
  ];


  config.home-manager.sharedModules = [] ++ optionals (cfg.plasma-manager.enable) [
    <plasma-manager/modules>
    ./desktop_environments/plasma/plasma.nix
  ];

  config.home-manager.useGlobalPkgs = true; # use the system level nixpkgs to avoid NIX_PATH usage
  config.home-manager.useUserPackages = true; # install packages to /etc/profiles instead, saves disk space on /home

  config.home-manager.users.daniel = {
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
        "inode/directory" = [ "org.kde.dolphin.desktop" "codium.desktop" ];
      };
    };

    programs.git = {
      enable = true;
      userEmail = "danielhiromoto@outlook.com";
      userName = "W. Daniel Hiromoto";
      signing = {
        key = "827FA8540F6415E2"; #just the key ID, will have to upload key manually
        signByDefault = true;
      };
      extraConfig = {
        safe.directory = [ "/etc/nixos" ];
      };
    };
    programs.gpg = {
      enable = true;
      publicKeys = [
        {source = "${gpgKey}"; trust = 5;}
      ];
    };
    services = mkIf (cfg.gpgAgent.enable) {
      gpg-agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-tty;
      };
    };
  };
}
