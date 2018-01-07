SMPlayer Contribution
=======

## Dependencies

* libqt4-dev-bin
* librsvg2-bin (rsvg-convert)
* findutils

## Processus

1. Convert .svg to .png
2. Create *theme.qrc* file
3. Add your own background (optionnaly)
4. Create *theme.rcc* file

## Compile Theme

### Aborescence 

```
- contrib/
*    Makefile
*    MyTheme/MyTheme/*.svg
*    README.md
```

SVG icons have to be in the `<ThemeName>/<ThemeName>/` directory.

### Installation

* Compile a given theme with its icons:

```
$ make THEME=MyTheme
```

* Compile with your own background:

```
$ make THEME=MyTheme BACKGROUND=<file>.png
```


