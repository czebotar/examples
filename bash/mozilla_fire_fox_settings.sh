#!/bin/bash

DOMAIN=yourdomain.com

# Set custom firefox settings

NUM="$(ps wax | grep firefox | wc -l)"
if [ "$NUM" -gt "1" ]
then
  echo Close Firefox first...
else
  echo 'user_pref("browser.newtab.url", "about:blank");' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.negotiate-auth.trusted-uris", "'$DOMAIN'");' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.negotiate-auth.delegation-uris", "'$DOMAIN'");' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("security.dialog_enable_delay", 0);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("view_source.editor.external", true);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.search.openintab", true);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.http.pipelining", true);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.http.proxy.pipelining", true);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.http.pipelining.ssl", true);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.urlbar.formatting.enabled", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.urlbar.trimURLs", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.chrome.toolbar_tips", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.urlbar.formatting.enabled", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("layout.spellcheckDefault", 2);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("ui.SpellCheckerUnderlineStyle", 4);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.download.animateNotifications", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.preferences.animateFadeIn", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.tabs.animate", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.panorama.animate_zoom", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.fullscreen.animateUp", 0);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.fullscreen.animate", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.sessionhistory.max_entries", 8);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.tabs.insertRelatedAfterCurrent", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.prefetch-next", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("network.http.max-persistent-connections-per-server", 8);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("reader.parse-on-load.enabled", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
  echo 'user_pref("browser.pocket.enabled", false);' >>  ~/.mozilla/firefox/*.default/prefs.js
fi
