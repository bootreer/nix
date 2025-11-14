{ pkgs, ... }:
{
  imports = [ ../common ];

  environment.systemPackages = with pkgs; [ vim ];

  programs.git.enable = true;
  services.openssh = {
    enable = true;
    settings.KexAlgorithms = [
      "sntrup761x25519-sha512"
      "sntrup761x25519-sha512@openssh.com"
      "mlkem768x25519-sha256"
    ];
  };

  security.polkit.enable = true;

  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "eu";

  console.useXkbConfig = true;

  time.timeZone = "Europe/Berlin";
  system.stateVersion = "25.05";
}
