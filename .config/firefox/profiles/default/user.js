// ====================================================
//                      Ergonomy
// ====================================================

// Force load userChrome.css as legacy user profile customization
// Since Firefox 69.0
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Avoid quiting the browser accidentally with CTRL-Q by always asking
user_pref("browser.sessionstore.warnOnQuit", true);
user_pref("browser.warnOnQuit", true);

// Force new window to tab:
user_pref("browser.link.open_newwindow", 3);
user_pref("browser.link.open_newwindow.restriction", 0);
user_pref("browser.link.open_newwindow.override.external", -1);

// Browser dark theme:
user_pref("lightweightThemes.persisted.footerURL", false);
user_pref("lightweightThemes.persisted.headerURL", false);
user_pref("lightweightThemes.selectedThemeID", "firefox-compact-dark@mozilla.org");
user_pref("lightweightThemes.usedThemes", "[]");

// Always open the Add-on Manager on the extension tab:
user_pref("extensions.ui.lastCategory", "addons://list/extension");

// Tab size:
user_pref("browser.tabs.tabMinWidth", 100);

// New tab blank page:
user_pref("browser.newtabpage.activity-stream.aboutHome.enabled", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.localization", false);
user_pref("browser.newtabpage.activity-stream.feeds.migration", false);
user_pref("browser.newtabpage.activity-stream.feeds.newtabinit", false);
user_pref("browser.newtabpage.activity-stream.feeds.places", false);
user_pref("browser.newtabpage.activity-stream.feeds.prefs", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories.options", "");
user_pref("browser.newtabpage.activity-stream.feeds.sections", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.systemtick", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.filterAdult", false);
user_pref("browser.newtabpage.activity-stream.prerender", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showTopSites", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");
user_pref("browser.newtabpage.activity-stream.topSitesCount", 0);
user_pref("browser.newtabpage.columns", 0);
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.directory.source", "");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtabpage.introShown", false);

// ====================================================
//                    Speed & Perf
// ====================================================
// (default network values from Tor Browser 4.5.3)
// = Further reading
// == Performance
// http://www.ghacks.net/2015/08/18/a-comprehensive-list-of-firefox-privacy-and-security-settings/
// http://thesimplecomputer.info/tscs-firefox-tweak-guide
// http://blog.joshnotes.com/customize-firefox-about-config/
// https://github.com/pyllyukko/user.js (Contains possibly deprecated preference settings)
// == Cache
// https://bugzilla.mozilla.org/show_bug.cgi?id=913807
user_pref("network.http.max-connections", 256);
user_pref("network.http.max-persistent-connections-per-proxy", 256);
user_pref("network.http.max-persistent-connections-per-server", 6);
user_pref("network.http.pipelining", true);
user_pref("network.http.pipelining.abtest", false);
user_pref("network.http.pipelining.aggressive", true);
user_pref("network.http.pipelining.max-optimistic-requests", 3);
user_pref("network.http.pipelining.maxrequests", 12);
user_pref("network.http.pipelining.maxsize", 300000);
user_pref("network.http.pipelining.read-timeout", 60000);
user_pref("network.http.pipelining.reschedule-on-timeout", true);
user_pref("network.http.pipelining.reschedule-timeout", 15000);
user_pref("network.http.pipelining.ssl", true);
user_pref("network.http.proxy.pipelining", true);
user_pref("network.http.redirection-limit", 20);
user_pref("browser.cache.use_new_backend", 1);

// ====================================================
//                Privacy & Security
// ====================================================

// Disable WebRTC:
// = Further reading
// == WebRTC leak test (among other things)
// https://ipleak.net/
// == WebRTC work in progress
// https://hacks.mozilla.org/2012/11/progress-update-on-webrtc-for-firefox-on-desktop/
// https://mozilla.github.io/webrtc-landing/
// https://wiki.mozilla.org/Media/getUserMedia
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.use_document_iceservers", false);
user_pref("media.navigator.enabled", false);
user_pref("media.getusermedia.screensharing.enabled", false);
user_pref("media.getusermedia.screensharing.allowed_domains", "");

// Disable IPv6:
// = Further reading
// == Why IPv6 is no good for privacy ?
// https://www.defcon.org/images/defcon-15/dc15-presentations/Lindqvist/Whitepaper/dc-15-lindqvist-WP.pdf
// https://iapp.org/news/a/2011-09-09-facing-the-privacy-implications-of-ipv6
// https://www.christopher-parsons.com/ipv6-and-the-future-of-privacy/
// http://www.zdnet.com/article/security-versus-privacy-with-ipv6-deployment/
// http://knowipv6.digitalelement.com/?p=66
user_pref("network.dns.disableIPv6", true);
user_pref("network.http.fast-fallback-to-IPv4", true);

// Disable sending HTML5 pings:
// = Further reading
// http://kb.mozillazine.org/Browser.send_pings
// http://kb.mozillazine.org/Browser.send_pings.require_same_host
user_pref("browser.send_pings", false);
user_pref("browser.send_pings.require_same_host", true);

// Disable DNS proxy bypass:
// = Further reading
// https://superuser.com/questions/103593/how-to-do-dns-through-a-proxy-in-firefox
// https://bugzilla.mozilla.org/show_bug.cgi?id=134105
user_pref("network.proxy.socks_remote_dns", true); // http://kb.mozillazine.org/Network.proxy.socks_remote_dns

// Disable DNS prefetching:
// = Further reading
// http://www.ghacks.net/2013/04/27/firefox-prefetching-what-you-need-to-know/
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Controlling_DNS_prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Disable link prefetching:
// = Further reading
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Link_prefetching_FAQ
user_pref("network.prefetch-next", false);

// Don't connect to remote links on hover:
// = Further reading
// http://news.slashdot.org/story/15/08/14/2321202/how-to-quash-firefoxs-silent-requests
// https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections#w_speculative-pre-connections
user_pref("network.http.speculative-parallel-limit", 0);

// Enable tracking protection:
// "Shady advertisers won't honor these settings, so make sure you use
//  Privacy Badger, Disconnect, or similar addons."
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.donottrackheader.value", 1);
user_pref("privacy.trackingprotection.enabled", true);

// Show Punycode for international domainnames, prevent some phishing attempts:
user_pref("network.IDN_show_punycode", true);
// = Further reading
// http://kb.mozillazine.org/Network.IDN_show_punycode

// Prevent sites from sniffing clipboard content:
// = Further reading
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference/dom.event.clipboardevents.enabled
user_pref("dom.event.clipboardevents.enabled", false);

// Disable geolocation:
// Don't do this on mobile browsers if you want Google Maps or similar to know your location.
user_pref("geo.enabled", false);
user_pref("geo.wifi.uri", "");

// Disable geotargeting:
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoSpecificDefaults.url", "");
user_pref("browser.search.geoip.url", "");

// Disable crash reporting:
user_pref("breakpad.reportURL", ""); // http://kb.mozillazine.org/Breakpad.reportURL

// Disable telemetry:
// = Further reading
// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.enabled", false); // This alone does *not* disable telemetry
user_pref("toolkit.telemetry.previousBuildID", "");
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.unified", false); // This turns off telemetry completely, in combination with the above

// Disable health report:
// = Further reading
// https://gecko.readthedocs.org/en/latest/services/healthreport/healthreport/index.html#legal-and-privacy-concerns
user_pref("datareporting.healthreport.about.reportUrl", "");
user_pref("datareporting.healthreport.about.reportUrlUnified", "");
user_pref("datareporting.healthreport.documentServerURI", "");
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.healthreport.logging.consoleEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled.v2", false);

// Disable "Heartbeat":
// = Further reading
// https://wiki.mozilla.org/Advocacy/heartbeat
user_pref("browser.selfsupport.url", "");

// Disable "safe browsing" (aka. Google tracking/logging/phone-home):
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.provider.google.appRepURL", "");
user_pref("browser.safebrowsing.provider.google.gethashURL", "");
user_pref("browser.safebrowsing.provider.google.lists", "");
user_pref("browser.safebrowsing.provider.google.reportURL", "");
user_pref("browser.safebrowsing.provider.google.updateURL", "");
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
user_pref("browser.safebrowsing.reportMalwareMistakeURL", "");
user_pref("browser.safebrowsing.reportPhishMistakeURL", "");
user_pref("browser.safebrowsing.reportPhishURL", "");

// Disable WebGL:
// = Further reading
// http://www.contextis.com/resources/blog/webgl-new-dimension-browser-exploitation/
// https://security.stackexchange.com/questions/13799/is-webgl-a-security-concern
// However, this appears to breaks some sites, such as Tweetdeck/Twitter
user_pref("webgl.disabled", true);
user_pref("webgl.disable-extensions", true);

// Disable HTML5 video stats:
// = Further reading
// https://bugzilla.mozilla.org/show_bug.cgi?id=654550
user_pref("media.video_stats.enabled", false);

// Disable support for asm.js (http://asmjs.org/):
// = Further reading
// https://www.mozilla.org/en-US/security/advisories/mfsa2015-29/
// https://www.mozilla.org/en-US/security/advisories/mfsa2015-50/
// https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-2712
user_pref("javascript.options.asmjs", false);

// Disable rendering of SVG OpenType fonts:
// = Further reading
// https://wiki.mozilla.org/SVGOpenTypeFonts
// https://github.com/iSECPartners/publications/blob/master/presentations/SVG_Security-rdegraaf-bh_us_2014.pdf
user_pref("gfx.font_rendering.opentype_svg.enabled", false);

// ====================================================
//    THE WHOLE BROKEN CA,SSL,TLS,OCSP,CIPHER MESS
// ====================================================

// Browser test sites:
// = Further reading
// https://www.ssllabs.com/ssltest/viewMyClient.html
// https://www.howsmyssl.com/
// https://badssl.com/

// Block mixed content:
user_pref("security.mixed_content.block_active_content", true); // (eg. insecure CSS or JS on a HTTPS page - this is enabled by default)
// user_pref("security.mixed_content.block_display_content", true); // ("passive" content - eg. insecure images on a HTTPS page)

// Enforce public key pinning for CAs
// = Further reading
// https://wiki.mozilla.org/SecurityEngineering/Public_Key_Pinning
user_pref("security.cert_pinning.enforcement_level", 2);

// General SSL/TLS preferences:
user_pref("security.ssl.errorReporting.enabled", false); // https://gecko.readthedocs.org/en/latest/browser/base/sslerrorreport/preferences.html
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true); // https://wiki.mozilla.org/Security:Renegotiation#security.ssl.treat_unsafe_negotiation_as_broken
user_pref("security.tls.unrestricted_rc4_fallback", false); // No thanks, I'd rather fall back to ROT13...

// Cipher suites:
// = Further reading
// Copied from https://github.com/pyllyukko/user.js/blob/master/user.js - possibly outdated information.
// Cipher suites not present by default in FF43 are omitted. Apparently they aren't supported anyways, according to tests.
user_pref("security.ssl3.dhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.dhe_rsa_aes_256_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256", true);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha", true);
user_pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha", false); // About RC4 handling: https://developer.mozilla.org/en-US/Firefox/Releases/38#Security
user_pref("security.ssl3.ecdhe_rsa_aes_128_gcm_sha256", true);
user_pref("security.ssl3.ecdhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdhe_rsa_aes_256_sha", true);
user_pref("security.ssl3.ecdhe_rsa_rc4_128_sha", false);
user_pref("security.ssl3.rsa_aes_128_sha", true);
user_pref("security.ssl3.rsa_aes_256_sha", true);
user_pref("security.ssl3.rsa_des_ede3_sha", false);
user_pref("security.ssl3.rsa_rc4_128_md5", false);
user_pref("security.ssl3.rsa_rc4_128_sha", false);

// Reject SHA1 certs
// = Further reading
// https://bugzilla.mozilla.org/show_bug.cgi?id=942515#c32
// http://www.scmagazine.com/mozilla-pulls-back-on-rejecting-sha-1-certs-outright/article/463913/
user_pref("security.pki.sha1_enforcement_level", 1);

// ====================================================
//             APPEARANCE / UI / UX
// ====================================================

user_pref("browser.urlbar.suggest.bookmark", true);

// Show full URLs in the address bar (including "http://"):
user_pref("browser.urlbar.trimURLs", false);

// Get rid of the useless/redundant "Visit (site)" and "(keyword) - search with (engine)" dropdown in the URL bar (since FF43):
user_pref("browser.urlbar.unifiedcomplete", false);

// Load searches from right-click context menu in background tab:
// = Further reading
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference/browser.search.context.loadInBackground
user_pref("browser.search.context.loadInBackground", true);

// Remove "(site) is now fullscreen" nag message:
// If you fear this might "facilitate phishing", you might not want to be on the internet at all.
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

// Disable fullscreen URL bar animation:
user_pref("browser.fullscreen.animate", false);
// Show the URL bar in fullscreen mode:
user_pref("browser.fullscreen.autohide", false);

// Disable tab animation:
// = Further reading
// http://www.askvg.com/how-to-disable-animation-while-opening-new-tab-in-mozilla-firefox-4-0/
user_pref("browser.tabs.animate", false);

// Don't warn on closing tabs:
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);

// Don't warn on opening about:config:
user_pref("general.warnOnAboutConfig", false);

// Get rid of "Do you really want to leave this site?" popups:
// = Further reading
// https://support.mozilla.org/en-US/questions/1043508
user_pref("dom.disable_beforeunload", true);

// Prevent sites from disabling the default right-click menu:
// Edit: currently enable for Google drive and docs
user_pref("dom.event.contextmenu.enabled", true);

// Prevent sites/popups from messing with certain UI elements:
// = Further reading
// http://kb.mozillazine.org/Prevent_websites_from_disabling_new_window_features
user_pref("dom.disable_window_open_feature.location", true); // Always show the URL bar
user_pref("dom.disable_window_open_feature.resizable", true); // Allow to resize the window
user_pref("dom.disable_window_open_feature.status", true); // Always show the status bar

// De-crap new tab page, get rid of "directory tiles" ads:
// = Further reading
// http://thenextweb.com/apps/2014/08/28/mozilla-rolls-sponsored-tiles-firefox-nightlys-new-tab-page/
user_pref("browser.newtab.preload", false);
user_pref("browser.newtab.url", "about:blank");
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.directory.source", "");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtabpage.introShown", true);

// Disable (broken) auto-scrolling via middle-click:
user_pref("general.autoScroll", false);

// Start searching while typing:
user_pref("accessibility.typeaheadfind", true); // http://kb.mozillazine.org/Accessibility.typeaheadfind
user_pref("accessibility.typeaheadfind.flashBar", 0); // http://kb.mozillazine.org/Accessibility.typeaheadfind.flashBar

// FF49: Remove "recently bookmarked" list:
user_pref("browser.bookmarks.showRecentlyBookmarked", false);

// Better legible default fonts (for Windows, at least - might require ttf-mscorefonts on *nix):
// As an alternative, the free Ubuntu and Droid font families are pretty good as well.
// user_pref("font.name.monospace.x-unicode", "Lucida Console");
// user_pref("font.name.monospace.x-western", "Lucida Console");
// user_pref("font.name.sans-serif.x-unicode", "Segoe UI");
// user_pref("font.name.sans-serif.x-western", "Segoe UI");
// user_pref("font.name.serif.x-unicode", "Georgia");
// user_pref("font.name.serif.x-western", "Georgia");

// ====================================================
//                     DEV TOOLS
// ====================================================

// Enable eyedropper in dev tools:
user_pref("devtools.command-button-eyedropper.enabled", true);

// Dark theme for dev tools:
user_pref("devtools.theme", "dark");

// ====================================================
//                 ADDONS / PLUGINS
// ====================================================

// Install unsigned addons in Aurora/Dev-Edition/etc:
// Ironically, this was needed for security-enhancing addons like Privacy
// Badger, HTTPS Everywhere, etc.
// Don't be stupid and install just any random unsigned addon.
user_pref("xpinstall.signatures.required", false);

// Speed up security delay when installing add-ons:
user_pref("security.dialog_enable_delay", 400);

// If installed - ask to activate Flash. If not - don't nag about missing Flash plugin:
user_pref("plugin.state.flash", 1);
user_pref("plugins.notifyMissingFlash", false);

// Disable metadata check phone-home:
// = Further reading
// https://wiki.mozilla.org/Extension_Manager:Update_Checking
user_pref("extensions.getAddons.cache.enabled", false);

// ====================================================
//         BLOATWARE / UNWANTED "FEATURES"
// ====================================================

// Disable Web Push notifications:
// = Further reading
// https://support.mozilla.org/en-US/kb/push-notifications-firefox?as=u&utm_source=inproduct
// http://www.skipser.com/p/2/p/stop-firefox-push-notifications.html
user_pref("dom.webnotifications.enabled", false);
user_pref("dom.webnotifications.serviceworker.enabled", false);

// Disable EME, Adobe "Primetime Content Decryption Module" DRM malware:
// = Further reading
// http://techdows.com/2015/04/how-to-uninstall-or-remove-adobe-primetime-decryption-module-plugin-from-firefox-38.html
// Additionally, you might want to delete all traces of "gmp-eme" from your Firefox profile folder.
// Or simply use "EME-free" builds of Firefox (Windows only): https://ftp.mozilla.org/pub/firefox/releases/latest/win32-EME-free/en-US/
user_pref("media.gmp-eme-adobe.autoupdate", false);
user_pref("media.gmp-eme-adobe.enabled", false);
user_pref("media.eme.apiVisible", false);
user_pref("media.eme.enabled", false);
user_pref("browser.eme.ui.enabled", false);

// Disable "Firefox Hello" TokBox/Telefonica WebRTC PUP:
// = Further reading
// https://www.mozilla.org/en-US/privacy/firefox-hello/
// https://security.stackexchange.com/questions/94284/how-secure-is-firefox-hello
user_pref("loop.CSP", "");
user_pref("loop.enabled", false);
user_pref("loop.feedback.baseUrl", "");
user_pref("loop.oauth.google.scope", ""); // What's Google doing in there as well?
user_pref("loop.server", "");

// Disable "Pocket" bloatware:
// = Further reading
// http://venturebeat.com/2015/06/09/mozilla-responds-to-firefox-user-backlash-over-pocket-integration/
// https://www.gnu.gl/blog/Posts/multiple-vulnerabilities-in-pocket/
user_pref("browser.pocket.api", "");
user_pref("browser.pocket.enabled", false);
user_pref("browser.pocket.oAuthConsumerKey", "");
user_pref("browser.pocket.site", "");

// Disable "social" crap:
// = Further reading
// http://www.ghacks.net/2013/04/10/mozilla-adds-cliqz-msnnow-and-mixi-as-social-providers-to-firefox/
user_pref("social.directories", "");
user_pref("social.remote-install.enabled", false);
user_pref("social.share.activationPanelEnabled", false);
user_pref("social.shareDirectory", "");
user_pref("social.toast-notifications.enabled", false);
user_pref("social.whitelist", "");

// Disable "Reader Mode":
user_pref("reader.parse-on-load.enabled", false);
// user_pref("readinglist.server", "");

// Disable integrated PDF reader:
// = Further reading
// https://blog.mozilla.org/security/2015/08/06/firefox-exploit-found-in-the-wild/
// If you're going to use an external PDF reader, *don't* use Adobe PDF bloatware. Use a sane reader, such as SumatraPDF.
user_pref("pdfjs.disabled", true);

// If you're gonna stick with pdfjs, at least disable its WebGL attack surface:
user_pref("pdfjs.enableWebGL", false);

// Disable various useless and/or intrusive web APIs:
// = Further reading
// https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections
// https://developer.mozilla.org/en-US/docs/Web/API/navigator.sendBeacon
// https://wiki.mozilla.org/Sensor_API
// https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager
// https://wiki.mozilla.org/Security/Reviews/Firefox/NavigationTimingAPI
// https://developer.mozilla.org/en-US/docs/Web/API/Gamepad_API
// https://developer.mozilla.org/en-US/docs/Web/API/Network_Information_API
// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
// https://developer.mozilla.org/en-US/Firefox/Releases/36#Interfaces.2FAPIs.2FDOM
// https://developer.mozilla.org/en-US/docs/Web/API/notification
// https://wiki.mozilla.org/HTML5_Speech_API
// https://developer.mozilla.org/en-US/docs/Web/API/notification
user_pref("beacon.enabled", false);
user_pref("device.sensors.enabled", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.cellbroadcast.enabled", false);
user_pref("dom.enable_performance", false);
user_pref("dom.gamepad.enabled", false);
user_pref("dom.netinfo.enabled", false);
user_pref("dom.telephony.enabled", false);
user_pref("dom.vibrator.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.vr.oculus.enabled", false);
user_pref("dom.vr.oculus050.enabled", false);
//user_pref("dom.webnotifications.enabled", false);
//user_pref("dom.webnotifications.serviceworker.enabled", false);
user_pref("media.webspeech.recognition.enable", false);

// Remove default feed content handlers:
// = Further reading
// http://kb.mozillazine.org/Browser.contentHandlers.types.*.uri
// Yahoo RSS handler:
user_pref("browser.contentHandlers.types.0.title", "");
user_pref("browser.contentHandlers.types.0.type", "");
user_pref("browser.contentHandlers.types.0.uri", "");

// Remove default website protocol handlers:
// = Further reading
// http://kb.mozillazine.org/Gecko.handlerService.schemes.%28protocol%29.*.uriTemplate
user_pref("gecko.handlerService.schemes.irc.0.name", "");       // Mibbit
user_pref("gecko.handlerService.schemes.irc.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.ircs.0.name", "");
user_pref("gecko.handlerService.schemes.ircs.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.0.name", "");    // Yahoo
user_pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.1.name", "");    // Gmail
user_pref("gecko.handlerService.schemes.mailto.1.uriTemplate", "");
user_pref("gecko.handlerService.schemes.webcal.0.name", "");    // 30Boxes
user_pref("gecko.handlerService.schemes.webcal.0.uriTemplate", "");

// Disable "Snippets" (Mozilla content shown on about:home screen):
// = Further reading
// https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections#w_mozilla-content
user_pref("browser.aboutHomeSnippets.updateUrl", "");
