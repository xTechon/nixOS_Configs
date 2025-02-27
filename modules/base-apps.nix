# for packages that should always be installed on every system
{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    htop
    git
    exfatprogs
    nil
    nix-search-cli
    nixpkgs-fmt
    openconnect
    niv
    npins
  ];
}