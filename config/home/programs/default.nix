{ pkgs, ...}:
{
  imports = [
    ./firefox
    ./terminal.nix
  ];

  services.syncthing.enable = true;
  home.packages = [ pkgs.pavucontrol ];
  programs.vesktop.enable = true;
}
