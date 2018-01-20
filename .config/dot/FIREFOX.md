Firefox
=======

## Backup Pinned Tab

* Edit `default/sessionstore-backups/recovery.json` as you please

* To apply changes, convert `recovery.json` to `recorvery.jsonlz4`

```
cd default/sessionstore-backups/
python ../../mozlz4a.py recovery.json recovery.jsonlz4
```
