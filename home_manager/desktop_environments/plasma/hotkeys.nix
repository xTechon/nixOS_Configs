{ ... }:
{

  programs.plasma.hotkeys.commands = {
    "launch-terminal" = {
      name = "Launch Terminal";
      key = "Meta+Alt+T";
      command = "konsole";
    };
    "lauch-firefox" = {
      name = "Launch Firefox";
      key = "Meta+Alt+F";
      command = "firefox";
    };
    "launch-discord" = {
      name = "Launch Discord";
      key = "Meta+Alt+D";
      command = "discord";
    };
  };
}