My own i3 configuration
===================

## Requirements
### General
* i3 - Window manager (+ i3status)
* i3lock - An improved screenlocker based upon XCB and PAM
* font awesome - An iconic font (for i3 bar)
* conky - Light-weight system monitor for X (for i3 bar)

### From Xorg
* setxkbmap - Setting keyboard layout
* xrandr - X11 RandR extension library (dual monitors)
* xprop - Property displayer for X (to get win's classname)

### For notifications
* dunst - Customizable and lightweight notification-daemon

### For fading and transparency
1. mesa - Open-source implementation of the OpenGL specs
2. mesa-libgl - Mesa 3-D graphics library
3. glxinfo - Display info about a GLX extension and OpenGL renderer (AUR)
4. compton - Standalone composite manager (mainly for termite)

## Config file

The i3 configuration file is devided into several parts in **config.d/**.<br>
To merge them in one file, just make (cf. ../install.sh):

``cat i3config.d/* > config``

## Debug

### In ~/debug
* i3dbg-bar.sh - Debug i3bar problems by verbose in term
* i3log-enable.sh - Enable i3 log (in /dev/shm)

### Useful tool
* xev - Print contents of X events (to get keyboard's keyname)

## Iconic font (for conky and dunst)

Copy and paste the icons directly from [this page]
-(http://fontawesome.io/cheatsheet/)
