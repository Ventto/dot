/*
 =============================
    Override Arkenfox Prefs
 =============================
*/

/* Do not ask me to remember credentials */
user_pref("signon.rememberSignons", false);

/* We dislike the margins */
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504

/**
 * Avoid wrong timezone on webmail client
 * TODO: Open webmail client on a dedicated browser window
 */
user_pref("privacy.resistFingerprinting", false); // 4501

/* Enable session restore */
user_pref("browser.startup.page", 3); // 0102
user_pref("privacy.clearOnShutdown.history", false); // 2811
user_pref("browser.download.useDownloadDir", false); // 2651

/* Preferences we personally want but already handled by Ar */
//user_pref("browser.download.alwaysOpenPanel", false); // 2652
//user_pref("browser.download.always_ask_before_handling_new_types", true); // 2654

/**
 * Max Protection:
 * Firefox will always use secure DNS. You’ll see a security risk warning before we use your system DNS.
 * Only use the provider you select
 * Always warn if secure DNS isn’t available
 * If secure DNS is not available sites will not load or function properly
 */
user_pref("network.trr.mode", 3); // 0710
user_pref("network.trr.default_provider_uri", "https://firefox.dns.nextdns.io");
user_pref("network.trr.custom_uri", "https://firefox.dns.nextdns.io");

/* Needed for my router web UI */
user_pref("webgl.disabled", false); // 4520

/*
 =============================
        Personal Prefs
 =============================
*/

user_pref("browser.bookmarks.showMobileBookmarks", true);
user_pref("browser.download.autohideButton", false);
user_pref("browser.download.folderList", 1);
user_pref("browser.download.dir", "/home/ventto/Downloads/Browser");
user_pref("browser.quitShortcut.disabled", true);
user_pref("browser.startup.homepage", "about:blank");
user_pref("mousewheel.with_control.action", 1);

/* We customize the browser's interface (see `chrome/userChrome.css`) */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

/* Remove some stuff in the toolbar */
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.inTitlebar", 0);
user_pref("browser.tabs.inTitlebar", 0);
user_pref("browser.tabs.searchclipboardfor.middleclick", false);
user_pref("extensions.pocket.enabled", false);
user_pref("identity.fxaccounts.toolbar.enabled", false);

/* Customize the toolbar */
user_pref("browser.uiCustomization.state", '{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","canvasblocker_kkapsner_de-browser-action","simple-translate_sienori-browser-action","skipredirect_sblask-browser-action","tab-session-manager_sienori-browser-action","_testpilot-containers-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","fxa-toolbar-menu-button","save-to-pocket-button","unified-extensions-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","addon_simplelogin-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","canvasblocker_kkapsner_de-browser-action","simple-translate_sienori-browser-action","addon_simplelogin-browser-action","skipredirect_sblask-browser-action","tab-session-manager_sienori-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","unified-extensions-area"],"currentVersion":19,"newElementCount":11}');

/* Enable native dark theme */
user_pref("browser.theme.content-theme", 2);
user_pref("browser.theme.toolbar-theme", 2);
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");

/* Sync */
user_pref("services.sync.declinedEngines", "creditcards,tabs,passwords,forms,history");
user_pref("services.sync.engine.history", false);
user_pref("services.sync.engine.passwords", false);
user_pref("services.sync.engine.prefs.modified", false);
user_pref("services.sync.engine.tabs", false);
