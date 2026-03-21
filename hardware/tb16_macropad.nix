{pkgs, ...}:
{
# Vial used for keyboard and macropad configuration
# https://github.com/vial-kb/vial-qmk
# the macropad is the rev2:
# https://github.com/vial-kb/vial-qmk/tree/vial/keyboards/doio/kb16/rev2
environment.systemPackages = [
    pkgs.vial
  ];
}