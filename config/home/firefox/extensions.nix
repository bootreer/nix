{ pkgs, ... }:
{
  force = true;
  packages = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    bitwarden
    unpaywall
    vimium
    reddit-enhancement-suite
  ];

  settings = {
    ublock-origin.settings = {
      "selectedFilterLists" = [
        "user-filters"
        "ublock-filters"
        "ublock-badware"
        "ublock-privacy"
        "ublock-quick-fixes"
        "ublock-unbreak"
        "easylist"
        "easyprivacy"
        "urlhaus-1"
        "plowe-0"
        "fanboy-cookiemonster"
        "ublock-cookies-easylist"
        # "fanboy-social" "easylist-chat" "easylist-newsletters" "easylist-notifications" "easylist-annoyances"
        "DEU-0"
      ];
    };
  };
}
