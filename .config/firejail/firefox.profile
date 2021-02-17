include /etc/firejail/firefox.profile
whitelist ${HOME}/.config/firefox/profiles

# Enable native notification
dbus-user.talk org.freedesktop.Notifications

# To make screensharing work
whitelist ${RUNUSER}/pipewire-0
dbus-user.talk org.freedesktop.portal.*

env GTK_THEME=""
env MOZ_ENABLE_WAYLAND=1
