{ pkgs, config, ... }:
{
  programs.plasma.panels = [
    {
      # taskbar panel
      location = "bottom";
      alignment = "left";
      hiding = "dodgewindows";
      floating = true;
      lengthMode = "fit";
      screen = "all";
      widgets = [
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General = {
              icon = "nix-snowflake-white";
              alphaSort = true;
              favoritesDisplayMode = "grid";
            };
          };
        }
        "org.kde.plasma.pager"
        {
          iconTasks = {
            launchers = [
              "applications:systemsettings.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:org.kde.konsole.desktop"
              "applications:firefox.desktop"
              "applications:codium.desktop"
            ];
          };
        }
      ];
    }
    {
      location = "top";
      height = 26;
      screen = "all";
      widgets = [
        {
          applicationTitleBar = {
            behavior = {
              activeTaskSource = "activeTask";
            };
            layout = {
              elements = [
                "windowIcon"
                "windowTitle"
              ];
              horizontalAlignment = "left";
              showDisabledElements = "deactivated";
              verticalAlignment = "center";
            };
            overrideForMaximized.enable = false;
            windowTitle = {
              font = {
                bold = false;
                fit = "fixedSize";
                size = 12;
              };
              hideEmptyTitle = true;
              margins = {
                bottom = 0;
                left = 10;
                right = 5;
                top = 0;
              };
              source = "appName";
            };
          };
        }
        "org.kde.plasma.appmenu"
        "org.kde.plasma.panelspacer"
        {
          systemTray = {
            items = {
              shown = [
                "org.kde.plasma.addons.katesessions"
                "org.kde.plasma.volume"
                "org.kde.brighness"
                "org.kde.plasma.networkmanagement"
              ];
              hidden = [
                "org.kde.plasma.clipboard"
                "org.kde.plasma.devicenotifier"
              ];
            };
            icons.spacing = "small";
          };
        }
        {
          digitalClock = {
            calendar.firstDayOfWeek = "sunday";
            time.format = "12h";
            date.position = "besideTime";
          };
        }
        "org.kde.plasma.shutdownorswitch" # https://github.com/Davide-sd/shutdown_or_switch
      ];
    }
  ];
}
