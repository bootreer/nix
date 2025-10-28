{
  inputs,
  withSystem,
  ...
}:
{
  flake = {
    # TODO: Darwin configuration
    nixosConfigurations =
      let
        mkNixosHost =
          hostName: arch:
          (withSystem arch (
            { pkgs, ... }:
            inputs.nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit inputs;
                inherit (pkgs) lib;
              };
              modules = [
                ../hosts/${hostName}
                {
                  nixpkgs = {
                    hostPlatform = arch;
                    inherit (pkgs) config;
                    overlays = pkgs.overlays ++ [ inputs.nur.overlays.default ];
                  };
                }
              ];
            }
          ));
      in
      {
        # Desktop
        deskcat = mkNixosHost "deskcat" "x86_64-linux";
      };
  };
}
