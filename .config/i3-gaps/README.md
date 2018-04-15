I3-gaps
=======

## Requirements

* i3-gaps - Window manager
* i3lock - An improved screenlocker based upon XCB and PAM
* conky >= 1.9 - A system monitor for X
* otf Awesome 5.0 - Iconic font used with Twitter Bootstrap
* ttf Hack - Terminal font

## Notifications

* dunst - Customizable and lightweight notification-daemon

## Transparency

1. mesa - Open-source implementation of the OpenGL specs
2. mesa-libgl - Mesa 3-D graphics library
3. glxinfo - Display info about a GLX extension and OpenGL renderer (AUR)
4. compton - Standalone composite manager (mainly for termite)

## Debug

* Help to debug i3bar:

```bash
i3 reload
killall i3bar
for c in $(i3-msg -t get_bar_config | python -c \
	'import json,sys;print("\n".join(json.load(sys.stdin)))'); do \
	(i3bar --bar_id=$c >"i3bar.$c.log" 2>&1) & \
done;
```

* Enable i3 log in `/dev/shm`:

```bash
i3-msg 'debuglog on; shmlog on; reload'
```

## Useful

* xev - Print contents of X events and helps to get keyboard's keyname
* xprop - Property displayer for X and helps to get win's classname

## Awesome Font

| Categories/Versions | Native | 4.1 | 4.5 | 4.7 |
|--|--|--|--|--|
| RAM |   |  |  |   |
| CPU |  |  |  |   |
| USB |  |  |  |   |
| Browser |  |  |  |  |
| Mail |   |  |  |   |
| Git |   |   |  |  |
| Bluetooth |  |  |  |    |
