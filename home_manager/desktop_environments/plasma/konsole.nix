{ ... }: {

  programs.konsole = {
    enable = true;
    customColorSchemes = {
    
    # based on: https://invent.kde.org/utilities/konsole/-/blob/master/data/color-schemes/GreenOnBlack.colorscheme?ref_type=heads
    custom1 = ./konsole_colorschemes/TranspGreenOnBlack.colorscheme;

    };
    
    profiles = {
      general = {
        name = "general";
        colorScheme = "custom1";
      };
    };
    defaultProfile = "general";
  };

}
