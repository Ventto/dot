Firefox
=======

## Backup Pinned Tab

```
$ cd default/sessionstore-backups
$ vim recovery.json
$ killall firefox
$ make clean && make
```

[How to edit](https://wiki.mozilla.org/Firefox/session_restore) the
`recovery.json` file.
