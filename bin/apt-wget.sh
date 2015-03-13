#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: `basename "$0"` <search term>"
    exit -1
fi

GEN_FILE="`mktemp /tmp/gen-wget-pkgs-XXXXXXXXXX.sh`"
WGET_FILE="`mktemp /tmp/wget-pkgs-XXXXXXXXXX.sh`"

echo '#!/bin/bash' > $GEN_FILE
echo "echo '#!/bin/bash' > $WGET_FILE" >> $GEN_FILE
echo 'apt-get --print-uris download \' >> $GEN_FILE
aptitude search -F "%p" "$1" | sed "s/^\([^[:blank:]]\+\).*$/    \1 \\\/" >> $GEN_FILE
echo "    | sed \"s/^'\([^']*\)'.*$/wget -c \1/\" >> $WGET_FILE" >> $GEN_FILE
echo "echo 'exit 0' >> $WGET_FILE" >> $GEN_FILE

chmod a+x $GEN_FILE
chmod a+x $WGET_FILE

echo "Output generate file to:  $GEN_FILE"
echo "Output wget file to:      $WGET_FILE"

exit 0
