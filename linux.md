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

- find file by name in zip archives
```
for f in *.zip; do unzip -l "$f" | grep TEXT && echo "Found in: $f"; done
```

###### GZIP:
- gunzip recursively
```
find . -name "*.gz" -type f -print0 | xargs -0 gunzip
```

- in gz files grep some text
```
find . -name \*.txt.gz -print0 | xargs -0 zgrep "TEXT"
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
find . \( -iname \*.pdf -o -iname \*.xml -o -iname \*.xlsx \) -exec sh -c "cp {} ./" \;
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

Replace phrase in files by mask
```
grep -Rl 'TEXT_TO_FIND' --include="*.htaccess" . | xargs sed -i 's#TEXT_TO_FIND#TEXT_TO_REPLACE#g'
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

- link port 9999 on localhost with targethost:22 through intermediate host (9999 -> 9998 -> 22)
```
ssh -L 9999:localhost:9998 -t user1@intermediatehost ssh -L 9998:localhost:22 user2@targethost
...
# now connect to localhost:
ssh -p 9999 user2@localhost
```

- sftp through intermediate host
```
sftp -J user@intermediatehost user@targethost
```
or
```
sftp -o "ProxyCommand=ssh -e none user@intermediatehost exec /usr/bin/nc %h %p 2>/dev/null" user@targethost
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

#### SCREEN
- run with log
```
screen -S TestNode_01 sh -c './script.sh 2>&1 | tee progress.txt'
```
or
```
screen -S TestNode_01 bash -c 'python3 script.py 2>&1 | tee progress.txt'
```
