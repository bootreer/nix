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
    };
  };
  programs.delta = {
    enable = true;
    options = {
      line-numbers = true;
    };
  };
}
