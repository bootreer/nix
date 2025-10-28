{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./tmux.nix
    ./fonts.nix
    ./terminal.nix
    ./ssh.nix
    ./firefox
  ];

  home.packages = with pkgs; [
    bat
    file
    jq
    ripgrep
  ];

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimdiffAlias = true;
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;
  services.syncthing.enable = true;
}
