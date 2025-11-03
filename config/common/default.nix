{ pkgs, inputs, ... }:
{
  programs.fish = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fzf
    fishPlugins.grc
    grc
    fd
  ];
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
    registry.p.flake = inputs.nixpkgs;
    registry.t.flake = inputs.nix-templates;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
