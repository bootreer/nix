{ lib, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    baseIndex = 1;
    mouse = true;
    prefix = "C-Space";
    terminal = "tmux-256color";
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      set -g status on
      unbind w
      bind w choose-tree -Z -N

      unbind %
      unbind '"'

      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      set -g default-command fish
    '';
  };
}
