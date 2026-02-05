{ pkgs, ... }:
{
  programs.firefox = rec {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;
      search = {
        force = true;
        default = "ddg";
      };
      settings = {
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.unified" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.urlbar.eventTelemetry.enabled" = false;

        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "identity.fxaccounts.toolbar.enabled" = false;
        "identity.fxaccounts.pairing.enabled" = false;
        "identity.fxaccounts.commands.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        "general.autoScroll" = true;
        "general.smoothScroll" = true;

        "sidebar.revamp" = true;
        "sidebar.revamp.round-content-area" = true;
        "sidebar.verticalTabs" = true;

        "extensions.autoDisableScopes" = 0;
        "extensions.update.autoUpdateDefault" = false;
        "extensions.update.enabled" = false;

        "browser.profiles.enabled" = true;
      };
      extensions = import ./extensions.nix { inherit pkgs; };
    };
    profiles.yaxi = {
      id = 1;
      inherit (profiles.default) search settings;
      extensions = {
        inherit (profiles.default.extensions) settings force;
        packages = [
          pkgs.nur.repos.rycee.firefox-addons.onepassword-password-manager
        ]
        ++ profiles.default.extensions.packages;
      };
    };
  };
}
