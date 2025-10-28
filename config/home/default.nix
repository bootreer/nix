{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./tmux.nix
    ./fonts.nix
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
}
