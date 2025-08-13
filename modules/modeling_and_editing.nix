{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    freecad-wayland
    blender
    gimp3-with-plugins
    inkscape-with-extensions
    krita
  ];
}
