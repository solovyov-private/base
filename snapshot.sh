#/usr/bin/bash

# init current path
targ=$(date +%Y%m%d)-snapshot
path=~/$targ

# fetch from folder
cd /home/example
find . -name '*.cpp' -not -path "./dev/*" -not -name "test_*.cpp" | cpio -pdm $path/home/example

# archive
cd $path/..
echo "Archiving $path..."
tar -czvf $targ.tar.gz $targ/ > /dev/null
rm -rf $path

echo "Completed..."
