{ pkgs, ... }:
{
  imports = [
    ../common
  ];

  environment.systemPackages = with pkgs; [
    vim
  ];

  programs.git.enable = true;
  services.openssh = {
    enable = true;
  };

  security.polkit.enable = true;

  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    options = "ctrl:swapcaps";
    layout = "eu";
  };

  console.useXkbConfig = true;

  time.timeZone = "Europe/Berlin";
  system.stateVersion = "25.05";
}
