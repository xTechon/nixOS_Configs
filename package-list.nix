# Export a list of packages to
# /etc/current-system-packages

{ config, pkgs, ... }:
{
    environment.etc."current-system-packages".text =
        let
            packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
            sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
            formatted = builtins.concatStringsSep "\n" sortedUnique;
        in
            formatted;

}
