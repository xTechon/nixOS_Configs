# had problems connecting an xbox one controller, so used this reddit post:
# https://www.reddit.com/r/NixOS/comments/1hdsfz0/what_do_i_have_to_do_to_make_my_xbox_controller/
{ config, pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      experimental = true; # show battery

      # https://www.reddit.com/r/NixOS/comments/1ch5d2p/comment/lkbabax/
      # for pairing bluetooth controller
      Privacy = "device";
      JustWorksRepairing = "always";
      Class = "0x000100";
      FastConnectable = true;
    };
  };

  services.blueman.enable = true;

  hardware.xpadneo.enable = true; # Enable the xpadneo driver for Xbox One wireless controllers
  
   boot = {
    extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
    extraModprobeConfig = ''
      options bluetooth disable_ertm=Y
    '';
    # connect xbox controller
  };
}
