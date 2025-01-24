# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # from https://github.com/nix-community/nixos-vscode-server
    (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ../../modules/base-apps.nix
    ../../modules/development.nix
    ../../users/daniel.nix
    ../../home_manager/daniel.nix
  ];

  # prevent home manager from using any plasma DE settings
  services.plasma-manager.enable = false;
  # make sure commit signing works
  services.gpgAgent.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.vscode-server.enable = true;
  wsl.enable = true;
  wsl.defaultUser = "daniel";
  wsl.nativeSystemd = true;
  wsl.startMenuLaunchers = true;

  #services.pcscd.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  pinentryPackage = pkgs.pinentry-tty;
  #};
  #environment.systemPackages = [ pkgs.pinentry-tty ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
