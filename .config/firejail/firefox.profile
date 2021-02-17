include /etc/firejail/firefox.profile
whitelist ${HOME}/.config/firefox/profiles

# Enable native notification
dbus-user.talk org.freedesktop.Notifications

env GTK_THEME=""
env MOZ_ENABLE_WAYLAND=1
