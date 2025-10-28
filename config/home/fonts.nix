{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.fira-code
    pkgs.terminus_font
  ];
}
