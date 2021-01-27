#### ARCHIVES
###### ZIP:
- extract all files in archives
```
unzip \*.zip
```

- recursively
```
find . -name "*.zip" -exec unzip {} \;
```

- to one text file
```
unzip -p {filename} > ...
```

###### GZIP:
- gunzip recursively
```
find . -name "*.gz" -type f -print0 | xargs -0 gunzip
```

- in gz files grep some text
```
find . -name \*.txt.gz -print0 | xargs -0 zgrep "Bank"
```

###### TAR.GZ:
- create
```
tar -czf --exclude='regex' archive.tar.gz file.txt
```

- unpack
```
tar -xzf archive.tar.gz
```

#### FETCH
- extract all files from folders to .
```
find . -type f -exec sh -c "cp {} ./" \;
```

- extract all xml files to .
```
find . -name "*.xml" -exec sh -c "cp {} ./" \;
```
or
```
find / -type f \( -iname "*.xml" \) -print0 | while IFS= read -r -d $'\0' line; do cp -p $line ./; done;
```

- count lines in files .cpp
```
find . -name '*.cpp' -type f -print0 | xargs -0 cat | wc -l
```

#### RENAME
- rename by mask:
```
rename -v ".PDF" ".pdf" *.PDF
```

#### CONVERT
- Convert numbers to binary
```
while read p; do echo "obase=2;$p" | bc; done < numbers.txt > numbers.bin
```

#### GREP
```
export GREP_OPTIONS='--color=always'
grep -v '^#' - exclude commented lines
grep --color=auto - paint
grep -E - regex
grep -P - Perl regex
grep -i - ignore case
grep -n - show line with coincidence
grep -r - recursive
grep -o - show only matching part
grep -c - count matches
grep -w - strict match
grep -l - list only filenames
grep -h - suppress filenames
```

GREP in files by mask:
```
grep -R "OK" --include *.txt
```

#### DEDUPE
```
cat file.txt | sort | uniq > dedup.out
```

#### TOUCH
```
touch -t 1906092005 filename
```

#### SSH/SFTP
- keep connection alive
```
sftp -oServerAliveInterval=300
```

- socks proxy to local port 9999
```
ssh -D localhost:9999 user@host
```

- ssh through intermediate host
```
ssh -t user@intermediatehost ssh user@targethost
```

- sftp through intermediate host
```
sftp -J user@intermediatehost user@targethost
```

#### VIM
- jump to 2000's symbol in line
```
2000|
```

- append a new line \r between tags:
```
:%s#\/><#/>\r<#g
```
