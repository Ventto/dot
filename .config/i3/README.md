My own i3 configuration
===================

## Requirements
### General
* i3-gaps - Window manager
* i3bar - [Conky](http://conky.sourceforge.net/variables.html) + [Awesome Font](http://fontawesome.io/cheatsheet/)
* i3lock - An improved screenlocker based upon XCB and PAM

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

## Debug

### In ~/contrib
* i3dbg-bar.sh - Debug i3bar problems by verbose in term
* i3log-enable.sh - Enable i3 log (in /dev/shm)

### Useful tool
* xev - Print contents of X events (to get keyboard's keyname)
