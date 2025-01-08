{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    freecad-wayland
    blender
    #gimp-with-plugins
    inkscape-with-extensions
    krita
  ];
}
