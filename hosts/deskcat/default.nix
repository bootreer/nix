{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../config/nixos

    ../../config/nixos/hm.nix
    ../../config/nixos/hardware/audio.nix
    ../../config/nixos/gui
  ];

  home-manager.users.tuomas.imports = [
    ../../config/home/programs
    ../../config/home/programs/niri
    inputs.noctalia.homeModules.default
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    waypaper
    inputs.noctalia.packages.${system}.default
  ];

  services.gnome.gnome-keyring.enable = true;

  networking.hostName = "deskcat";

  services.interception-tools = {
    enable = true;
    plugins = [ pkgs.interception-tools-plugins.caps2esc ];
    udevmonConfig = ''
      - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.caps2esc}/bin/caps2esc -m 1 | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };
}
