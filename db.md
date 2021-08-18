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
- lag usage
```
select USER_NAME,
       CREATION_DATE,
       DATE_OF_BIRTH,
       DATEDIFF(LAG(DATE_OF_BIRTH) OVER (PARTITION BY USER_NAME ORDER BY CREATION_DATE), DATE_OF_BIRTH) as DF1,
       DATEDIFF(LEAD(DATE_OF_BIRTH) OVER (PARTITION BY USER_NAME ORDER BY CREATION_DATE), DATE_OF_BIRTH) as DF2
from USERS T1
```

#### MYSQLDUMP
- each insert line in row
```
mysqldump --extended-insert=FALSE or --skip-extended-insert
```

- skip add/drop table
```
mysqldump --skip-add-drop-table
```

- skip everything
```
mysqldump --compact --no-create-info
```

- where clause
```
mysqldump --where="datetime LIKE '2014-09%'"
```
