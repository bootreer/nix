{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ../common/hm.nix
  ];
  users.users = {
    tuomas = {
      description = "Tuomas Pirhonen";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      home = "/home/tuomas";
      shell = pkgs.fish;
    };
  };
}
