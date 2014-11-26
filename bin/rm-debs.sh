#!/bin/bash

[ -z "$1" -o -n "$2" ] && exit -1
[ ! -f "$1" ] && exit -1
[ "`file $1 | awk '{ print $2 }'`" = "empty" ] && exit 0

REPOSITORY="/home/joaomanoel/my-repository"

grep '.deb) is repeat;' $1 | awk -F '(' '{ print $2 }' > /tmp/debs-1
if [ "`file /tmp/debs-1 | awk '{ print $2 }'`" != "empty" ]; then
  awk -F ')' '{ print $1 }' /tmp/debs-1 > /tmp/debs-2
  echo -e "#!/bin/bash\nREPOSITORY=$REPOSITORY" > /tmp/rm-debs-1.sh
  awk '{ print "sudo rm -f $REPOSITORY/" $2 }' /tmp/debs-2 >> /tmp/rm-debs-1.sh
  chmod +x /tmp/rm-debs-1.sh
  /tmp/rm-debs-1.sh
fi

grep 'used that one and ignored data from' $1 | awk -F '!' '{ print $1 }' > /tmp/debs-3
if [ "`file /tmp/debs-3 | awk '{ print $2 }'`" != "empty" ]; then
  echo -e "#!/bin/bash\nREPOSITORY=$REPOSITORY" > /tmp/rm-debs-2.sh
  awk '{ print "sudo rm -f $REPOSITORY/" $10 }' /tmp/debs-3 >> /tmp/rm-debs-2.sh
  chmod +x /tmp/rm-debs-2.sh
  /tmp/rm-debs-2.sh
fi

rm -f /tmp/debs-[123] /tmp/rm-debs-[12].sh
