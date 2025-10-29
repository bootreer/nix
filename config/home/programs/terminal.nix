{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 11;
      theme = "Kanagawa Wave";
      background-opacity = 0.95;
      shell-integration-features = [
        "title"
        "ssh-env"
      ];
      window-padding-y = 0;
      window-decoration = false;
    };
  };
}
