.headers on
.mode column
.width -5 -65 -5 -3 -7 -10
SELECT data.rowid, data.value, preferences.rowid, preferences.key, preferences.data_id, preferences.picture_id FROM data INNER JOIN preferences ON data.rowid = preferences.data_id;