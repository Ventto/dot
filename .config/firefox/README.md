Firefox
=======

## Backup Pinned Tab

* Edit `default/sessionstore-backups/recorvery.json` as you please

* To apply changes, convert `recorvery.json` to `recorvery.jsonlz4`

```
cd default/sessionstore-backups/
python ../../mozlz4a.py recorvery.json recorvery.jsonlz4
```
