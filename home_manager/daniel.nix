# make sure npins has dependency before usage
{ lib, pkgs, config, ... }:

with lib;
let
  cfg = config.services;
  gpgKey = pkgs.fetchurl {
    url = "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x827fa8540f6415e2";
    sha256 = "sha256-uqADL61CJMqkDE2wMkdKF9RYgCCF4bM9gUsRhBaXr2o=";
  };
  sources = import ../npins;
  home-manager = "${sources.home-manager}/nixos";
in
{
  options.services.plasma-manager = {
    # make default to true for Plasma-Manager
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to enable Plasma-Manager";
      example = true;
    };
  };

  # Make default to False for gpg Agent management
  options.services.gpgAgent = {
    enable = mkEnableOption "Mange GPG with Home Manager";
  };

  imports = [
    home-manager
  ];


  config.home-manager.sharedModules = [ ] ++ optionals (cfg.plasma-manager.enable) [
    "${sources.plasma-manager}/modules"
    ./desktop_environments/plasma/plasma.nix
  ];

  config.home-manager.useGlobalPkgs = true; # use the system level nixpkgs to avoid NIX_PATH usage
  config.home-manager.useUserPackages = true; # install packages to /etc/profiles instead, saves disk space on /home

  config.home-manager.users.daniel = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.11";

    programs.bash = mkIf (cfg.gpgAgent.enable)
      {
        enable = true;
        initExtra = ''
          export GPG_TTY=$(tty)
        '';
      };

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
      signing = {
        key = "827FA8540F6415E2"; #just the key ID, will have to upload key manually
        signByDefault = true;
      };
      settings = {
        user = {
          name = "W. Daniel Hiromoto";
          email = "danielhiromoto@outlook.com";
        };
        safe.directory = [
          "/etc/nixos"
          "/etc/nixos/secrets"
        ];
      };
    };

    programs.gpg = {
      enable = true;
      publicKeys = [
        { source = "${gpgKey}"; trust = 5; }
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
