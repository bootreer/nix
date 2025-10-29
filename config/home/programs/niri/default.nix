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
}
