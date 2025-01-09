{ ... }:
{

  programs.plasma.hotkeys.commands = {
    "launch-terminal" = {
      name = "Launch Terminal";
      key = "Ctrl+Alt+T";
      command = "konsole";
    };
    "lauch-firefox" = {
      name = "Launch Firefox";
      key = "Ctrl+Alt+F";
      command = "firefox";
    };
    "launch-discord" = {
      name = "Launch Discord";
      key = "Ctrl+Alt+D";
      command = "discord";
    };
  };
}