{ pkgs, config, libs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    #dedicatedServer.openFirewall = true;

    extest.enable = true;
  };
  
  # nintendo joycon support: https://github.com/DanielOgorchock/joycond
  services.joycond.enable = true;
  /*
  To combine two joy-cons into a virtual input device, 
  press a single trigger on both of them at the same time. 
  A new uinput device will be created called "Nintendo Switch Combined Joy-Cons".
  */
}
