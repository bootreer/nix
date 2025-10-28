{ inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.tuomas = {
      imports = [
        # Default config
        ../home
      ];
      home.username = "tuomas";
      home.stateVersion = "25.05";
    };
    backupFileExtension = "backup";
  };
}
