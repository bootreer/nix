{
  programs.git = {
    enable = true;
    settings = {
      branch = {
        autosetuprebase = "always";
        sort = "authordate";
      };
      init = {
        defaultBranch = "main";
      };
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
    };
  };
  programs.delta = {
    enable = true;
    options = {
      theme = "Catppuccin Macchiato";
      line-numbers = true;
      dark = true;
      side-by-side = true;
    };
  };
}
