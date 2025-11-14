{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
    swaylock
    swayidle
    mako
    fuzzel
    xwayland-satellite
    swaybg
  ];
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.frappeLight;
    name = "catppuccin-frappe-light-cursors";
    size = 12;
    gtk.enable = true;
    x11.enable = true;
  };
  services.polkit-gnome.enable = true;

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "default";
        position = "top";
        showCapsule = false;
        monitors = [ ];
        widgets = {
          left = [
            {
              id = "SidePanelToggle";
              useDistroLogo = true;
            }
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            { id = "ActiveWindow"; }
          ];
          right = [
            { id = "MediaMini"; }
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            { id = "Volume"; }
            { id = "Clock"; }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Kanagawa";
      location = {
        monthBeforeDay = false;
        name = "Munich, Germany";
      };
      appLauncher = {
        enableClipboardHistory = true;
        terminalCommand = "ghostty";
      };
      dock.enabled = false;
    };
  };
}
