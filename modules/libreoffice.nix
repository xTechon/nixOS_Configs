{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice-qt6
    hunspell
    hunspellDicts.en_US
    hunspellDicts.es_PE
  ];
}
