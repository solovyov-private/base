#### FIREBIRD
- BLOB to text
```
cast("field" as varchar(2048))
```

- replace text in BLOB
```
update "Table"
set "field" = replace(
                          "field",
                          cast('TEXT1' as VARCHAR(2048) character set octets),
                          cast('TEXT2' as VARCHAR(2048) character set octets)
                     )
```

- epoch "date" compare
```
"date" < DATEDIFF(SECOND, timestamp '1970-01-01 00:00:00', date '2020-01-01')
```

- epoch "date" in readable format
```
SELECT DATEADD(SECOND, "date", timestamp '1970-01-01 00:00:00')
```

- remove headings
```
SET HEADING OFF;
```

- random text output
```
select 'random text' from rdb$database;
```

- procedures
```
select * from rdb$procedures;
```

#### SQLITE
- separator
```
sqlite3 -separator ; {} ""
```

#### MYSQL
- identify latin1 / utf-8 records issues
```
SELECT CONVERT(CONVERT(FIELD USING BINARY) USING latin1) AS latin1,
       CONVERT(CONVERT(FIELD USING BINARY) USING utf8) AS utf8
FROM TABLE_NAME
WHERE CONVERT(FIELD USING BINARY) RLIKE CONCAT('[', UNHEX('80'), '-', UNHEX('FF'), ']')
```
- fix convert
```
UPDATE TABLE_NAME
SET FIELD = CONVERT(BINARY FIELD USING latin1/utf8)
```
