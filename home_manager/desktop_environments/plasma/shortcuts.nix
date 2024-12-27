{ ... }:
{

  programs.plasma.shortcuts = {

    "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
    "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";

    kmix = {
      "decrease_microphone_volume" = "Microphone Volume Down";
      "decrease_volume" = "Volume Down";
      "decrease_volume_small" = "Shift+Volume Down";
      "increase_microphone_volume" = "Microphone Volume Up";
      "increase_volume" = "Volume Up";
      "increase_volume_small" = "Shift+Volume Up";
      "mic_mute" = [ "Microphone Mute" "Meta+Volume Mute,Microphone Mute" "Meta+Volume Mute,Mute Microphone" ];
      "mute" = "Volume Mute";
    };

    ksmserver = {
      "Lock Session" = [ "Meta+L" "Screensaver,Meta+L" "Screensaver,Lock Session" ];
      "Log Out" = "Ctrl+Alt+Del";
    };

    kwin = {
      "Activate Window Demanding Attention" = "Meta+Ctrl+A";
      "Cube" = "Meta+C";
      "Edit Tiles" = "Meta+T";
      "Expose" = "Ctrl+F9";
      "ExposeAll" = [ "Ctrl+F10" "Launch (C),Ctrl+F10" "Launch (C),Toggle Present Windows (All desktops)" ];
      "ExposeClass" = "Ctrl+F7";
      "Grid View" = "Meta+Tab,Meta+G,Toggle Grid View";
      "Kill Window" = "Meta+Ctrl+Esc";
      "MoveMouseToCenter" = "Meta+F6";
      "MoveMouseToFocus" = "Meta+F5";
      "Overview" = "Meta+W";
      "Show Desktop" = "Meta+D";
      "Suspend Compositing" = "Alt+Shift+F12";
      "Switch One Desktop Down" = "Meta+Ctrl+Down";
      "Switch One Desktop Up" = "Meta+Ctrl+Up";
      "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      "Switch Window Down" = "Meta+Alt+Down";
      "Switch Window Left" = "Meta+Alt+Left";
      "Switch Window Right" = "Meta+Alt+Right";
      "Switch Window Up" = "Meta+Alt+Up";
      "Switch to Desktop 1" = "Ctrl+F1";
      "Switch to Desktop 2" = "Ctrl+F2";
      "Switch to Desktop 3" = "Ctrl+F3";
      "Switch to Desktop 4" = "Ctrl+F4";
      "Walk Through Windows" = "Alt+Tab";
      "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
      "Walk Through Windows of Current Application" = "Alt+`";
      "Walk Through Windows of Current Application (Reverse)" = "Alt+~";
      "Window Above Other Windows" = "none,,Keep Window Above Others";
      "Window Below Other Windows" = "none,,Keep Window Below Others";
      "Window Close" = "Alt+F4";
      "Window Fullscreen" = "none,,Make Window Fullscreen";
      "Window Maximize" = "Meta+PgUp";
      "Window Minimize" = "Meta+PgDown";
      "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      "Window Operations Menu" = "Alt+F3";
      "Window Quick Tile Bottom" = "Meta+Down";
      "Window Quick Tile Left" = "Meta+Left";
      "Window Quick Tile Right" = "Meta+Right";
      "Window Quick Tile Top" = "Meta+Up";
      "Window to Next Screen" = "Meta+Shift+Right";
      "Window to Previous Screen" = "Meta+Shift+Left";
      "view_actual_size" = "Meta+0";
      "view_zoom_in" = [ "Meta++" "Meta+=,Meta++" "Meta+=,Zoom In" ];
      "view_zoom_out" = "Meta+-";
    };

    mediacontrol = {
      "mediavolumedown" = "none,,Media volume down";
      "mediavolumeup" = "none,,Media volume up";
      "nextmedia" = "Media Next";
      "pausemedia" = "Media Pause";
      "playmedia" = "none,,Play media playback";
      "playpausemedia" = "Media Play";
      "previousmedia" = "Media Previous";
      "stopmedia" = "Media Stop";
    };

    org_kde_powerdevil = {
      "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      "Decrease Screen Brightness" = "Monitor Brightness Down";
      "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      "Hibernate" = "Hibernate";
      "Increase Keyboard Brightness" = "Keyboard Brightness Up";
      "Increase Screen Brightness" = "Monitor Brightness Up";
      "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      "PowerDown" = "Power Down";
      "PowerOff" = "Power Off";
      "Sleep" = "Sleep";
      "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      "Turn Off Screen" = [ ];
      "powerProfile" = [ "Battery" "Meta+B,Battery" "Meta+B,Switch Power Profile" ];
    };

    plasmashell = {
      "activate application launcher" = [ "Meta,Meta" "Alt+F1,Activate Application Launcher" ];
      "activate task manager entry 1" = "Meta+1";
      "activate task manager entry 10" = "none,Meta+0,Activate Task Manager Entry 10";
      "activate task manager entry 2" = "Meta+2";
      "activate task manager entry 3" = "Meta+3";
      "activate task manager entry 4" = "Meta+4";
      "activate task manager entry 5" = "Meta+5";
      "activate task manager entry 6" = "Meta+6";
      "activate task manager entry 7" = "Meta+7";
      "activate task manager entry 8" = "Meta+8";
      "activate task manager entry 9" = "Meta+9";
      "clear-history" = "none,,Clear Clipboard History";
      "clipboard_action" = "Meta+Ctrl+X";
      "cycle-panels" = "Meta+Alt+P";
      "cycleNextAction" = "none,,Next History Item";
      "cyclePrevAction" = "none,,Previous History Item";
      "manage activities" = "Meta+Q";
      "next activity" = "Meta+A,none,Walk through activities";
      "previous activity" = "Meta+Shift+A,none,Walk through activities (Reverse)";
      "repeat_action" = "none,Meta+Ctrl+R,Manually Invoke Action on Current Clipboard";
      "show dashboard" = "Ctrl+F12";
      "show-barcode" = "none,,Show Barcode…";
      "show-on-mouse-pos" = "Meta+V";
      "stop current activity" = "Meta+S";
      "toggle do not disturb" = "none,,Toggle do not disturb";
    };


    "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = [ "Meta+Shift+S" "Meta+Shift+Print" ];
    "services/org.kde.spectacle.desktop"."_launch" = "Print";
    "services/spotube.desktop"."_launch" = "Tools";
    "services/systemsettings.desktop"."_launch" = [ ];
  };
}
