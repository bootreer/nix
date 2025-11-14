{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./tmux.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    bat
    eza
    file
    jq
    ripgrep
    zoxide
  ];

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.zoxide.enable = true;
  programs.eza.enable = true;
}
