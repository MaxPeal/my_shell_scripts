#!/bin/bash

function usage()
{
  echo -e "\n  USAGE: $0 wget-debs-\$n.sh\n"
  exit $1
}

[ -z "$1" -o -n "$2" ] && usage 0
[ "$1" == "-h" -o "$1" == "--help" ] && usage 0
[ ! -f "$1" ] && usage -1

n=`basename $1 .sh`
[ "$n" == "`basename $1`" ] && usage -2

c=`echo $n | awk -F 'wget-debs-' '{ print $2 }'`
[ -z "$c" ] && usage -3

REPOSITORY="$HOME/apt-wget/scripts/install/"
PACKAGES=""

IFS=$'\n'
for i in `awk -F '/' '{ print $9 }' $1`; do
  ii=`echo $i | awk -F '_' '{ print $1 }'`
  [ -n "`grep '.deb' $i`" ] && PACKAGES="$PACKAGES $ii"
done
for i in `awk -F '/' '{ print $10 }' $1`; do
  ii=`echo $i | awk -F '_' '{ print $1 }'`
  [ -n "`grep '.deb' $i`" ] && PACKAGES="$PACKAGES $ii"
done
IFS=$' \t\n'

echo -e "#!/bin/bash\n" > $REPOSITORY/apt-get-install-$c.sh
echo -e "apt install $PACKAGES\n" >> $REPOSITORY/apt-get-install-$c.sh

chmod +x $REPOSITORY/apt-get-install-$c.sh
