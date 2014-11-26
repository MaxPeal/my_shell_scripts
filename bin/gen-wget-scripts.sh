#!/bin/bash

function generate()
{

  [ ! -d "$SCRIPT_DIR" ] && mkdir -p $SCRIPT_DIR
  cd $SCRIPT_DIR

  apt-get update --print-uris --option Acquire::CompressionTypes::Order=$EXT > uris
  sed -e 's/%5f/_/' -i uris
  cut -d \' -f 2 uris > uris.www

  ###################
  ####  SCRIPT1  ####
  ###################

  [ "$VERBOSE" == "1" ] && echo -en "\n\tGenerating $SCRIPT_DIR/$SCRIPT1.sh ... "

  echo "#!/bin/bash" > $SCRIPT1.sh
  echo -e "\nmkdir lists" >> $SCRIPT1.sh
  echo -e "cd lists\n" >> $SCRIPT1.sh

  IFS=$'\n'

  for i in `cat uris`; do

    s="`echo $i | cut -d \' -f 2`"
    p="`echo $s | cut -d '/' -f 1`"

  	if [ "$p" != "ftp:" -a "$p" != "http:" ]; then
  		continue
  	fi

    t="`echo $i | cut -d ' ' -f 2`"

    if [ "`basename $s`" != "`basename $s .$EXT`" ]; then
      echo "wget -c $s -O $t.$EXT" >> $SCRIPT1.sh
    else
      echo "wget -c $s -O $t" >> $SCRIPT1.sh
    fi

  done

  IFS=$' \t\n'

  echo -e "\ncd .." >> $SCRIPT1.sh

  [ "$VERBOSE" == "1" ] && echo "OK"

  [ "$VERBOSE" == "1" ] && echo -en "\n\tGenerating $SCRIPT_DIR/$SCRIPT1.bat ... "

  $HOME/bin/sh-to-bat $SCRIPT1.sh

  [ "$VERBOSE" == "1" ] && echo "OK"

  ###################
  ####  SCRIPT2  ####
  ###################

  [ "$VERBOSE" == "1" ] && echo -en "\n\tGenerating $SCRIPT_DIR/$SCRIPT2.sh ... "

  echo "#!/bin/bash" > $SCRIPT2.sh
  echo -e "\nmkdir lists" >> $SCRIPT2.sh
  echo -e "cd lists\n" >> $SCRIPT2.sh

  for i in `cat uris.www`; do

    p="`echo $i | cut -d '/' -f 1`"
  	if [ "$p" != "ftp:" -a "$p" != "http:" ]; then
  		continue
  	fi

  	let d=0

  	for ((c=3; c<103;c++)); do

  		s="`echo $i | cut -d '/' -f $c-`"
  		t="`echo $s | cut -d '/' -f 1`"

  		b=0

  		for f in $FILES; do
  			if [ "$t" == "$f" ]; then
  				b=1
  				break
  			fi
  		done

  		if [ "$b" == "1" ]; then
  			echo -e "wget -c $i" >> $SCRIPT2.sh
  			for ((e=d;e>0;e--)); do
  				echo "cd .." >> $SCRIPT2.sh
  			done
  			echo -en "\n" >> $SCRIPT2.sh
  			break
  		else
  			echo "mkdir $t" >> $SCRIPT2.sh
  			echo "cd $t" >> $SCRIPT2.sh
  			let d++
  		fi

  	done # end for c

  done # end for i

  echo "cd .." >> $SCRIPT2.sh

  [ "$VERBOSE" == "1" ] && echo "OK"

  [ "$VERBOSE" == "1" ] && echo -en "\n\tGenerating $SCRIPT_DIR/$SCRIPT2.bat ... "

  $HOME/bin/sh-to-bat $SCRIPT2.sh

  [ "$VERBOSE" == "1" ] && echo "OK"

  ###################
  ####  SCRIPT3  ####
  ###################

  [ "$VERBOSE" == "1" ] && echo -en "\n\tGenerating $SCRIPT_DIR/$SCRIPT3.sh ... "

  echo "#!/bin/bash" > $SCRIPT3.sh
  echo -e "\nsave_pwd=\"\`pwd\`\"" >> $SCRIPT3.sh
  echo -e "\ncd /var/lib/apt/lists/\n" >> $SCRIPT3.sh
  echo "for ((c=1;c>0;c++)); do" >> $SCRIPT3.sh
  echo "  if [ ! -d \".bak-\$c\" ]; then" >> $SCRIPT3.sh
  echo "    sudo mkdir -p .bak-\$c" >> $SCRIPT3.sh
  echo "    break" >> $SCRIPT3.sh
  echo "  fi" >> $SCRIPT3.sh
  echo "done" >> $SCRIPT3.sh
  echo "sudo mv -f * .bak-\$c" >> $SCRIPT3.sh
  echo -e "\ncd \$save_pwd\n" >> $SCRIPT3.sh
  echo -e "cd lists\n" >> $SCRIPT3.sh
  grep wget $SCRIPT1.sh | awk '{ print "sudo cp " $5 " /var/lib/apt/lists/" }' >> $SCRIPT3.sh
  echo -e "\ncd /var/lib/apt/lists/\n" >> $SCRIPT3.sh
  echo "for i in *.$EXT; do" >> $SCRIPT3.sh
  echo "  sudo $UNCOMPRESS -f \$i" >> $SCRIPT3.sh
  echo "done" >> $SCRIPT3.sh
  echo "sudo chmod a-x *" >> $SCRIPT3.sh
  echo "sudo mkdir -p partial" >> $SCRIPT3.sh
  echo "sudo touch -f lock" >> $SCRIPT3.sh

  chmod +x $SCRIPT3.sh

  [ "$VERBOSE" == "1" ] && echo "OK"

  ###################
  ####  SCRIPT4  ####
  ###################

  [ "$VERBOSE" == "1" ] && echo -en "\n\tGenerating $SCRIPT_DIR/$SCRIPT4.sh ... "

  echo "#!/bin/bash" > $SCRIPT4.sh
  echo -e "\nsave_pwd=\"\`pwd\`\"" >> $SCRIPT4.sh
  echo -e "\ncd /var/lib/apt/lists/\n" >> $SCRIPT4.sh
  echo "for ((c=1;c>0;c++)); do" >> $SCRIPT4.sh
  echo "  if [ ! -d \".bak-\$c\" ]; then" >> $SCRIPT4.sh
  echo "    sudo mkdir -p .bak-\$c" >> $SCRIPT4.sh
  echo "    break" >> $SCRIPT4.sh
  echo "  fi" >> $SCRIPT4.sh
  echo "done" >> $SCRIPT4.sh
  echo "sudo mv -f * .bak-\$c" >> $SCRIPT4.sh
  echo -e "\ncd \$save_pwd\n" >> $SCRIPT4.sh
  echo -e "cd lists\n" >> $SCRIPT4.sh

  IFS=$'\n'

  for i in `cat uris`; do

    s="`echo $i | cut -d \' -f 2`"
    t="`echo $s | cut -d '/' -f 1`"

    if [ "$t" != "ftp:" -a "$t" != "http:" ]; then
      continue
    fi

    r="`echo $i | cut -d ' ' -f 2`"
    t="`echo $s | cut -d '/' -f 3-`"

    if [ "`basename $t`" != "`basename $t .$EXT`" ]; then
      echo "sudo cp $t /var/lib/apt/lists/$r.$EXT" >> $SCRIPT4.sh
    else
      echo "sudo cp $t /var/lib/apt/lists/$r" >> $SCRIPT4.sh
    fi

  done

  IFS=$' \t\n'

  echo -e "\ncd /var/lib/apt/lists/\n" >> $SCRIPT4.sh
  echo "for i in *.$EXT; do" >> $SCRIPT4.sh
  echo "  sudo $UNCOMPRESS -f \$i" >> $SCRIPT4.sh
  echo "done" >> $SCRIPT4.sh
  echo "sudo chmod a-x *" >> $SCRIPT4.sh
  echo "sudo mkdir -p partial" >> $SCRIPT4.sh
  echo "sudo touch -f lock" >> $SCRIPT4.sh

  chmod +x $SCRIPT4.sh

  [ "$VERBOSE" == "1" ] && echo -e "OK\n"

  ###################
  ####  THE END  ####
  ###################

  rm -f uris uris.www

}

function help()
{

  echo -e "\nUsage: $0 [<-h|-V|-v|-q> <-g|-b|-l> <-m i386|amd64> <SD> <S1> <S2> <S3> <S4>]\n"
  echo -e "  -h\tshow this message"
  echo -e "  -V\tshow version of the `basename $0`"
  echo -e "  -v\tshow verbose"
  echo -e "  -q\tshow quiet"
  echo -e "  -g\tchoose gzip  compression methode"
  echo -e "  -b\tchoose bzip2 compression methode"
  echo -e "  -l\tchoose lzma  compression methode"
  echo -e "  -m\tchoose architecture i386 or amd64"
  echo -e "  SD\tis a name of the SCRIPT_DIR"
  echo -e "  S1\tis a name of the SCRIPT1"
  echo -e "  S2\tis a name of the SCRIPT2"
  echo -e "  S3\tis a name of the SCRIPT3"
  echo -e "  S4\tis a name of the SCRIPT4\n"
  exit $1

}

function version()
{

  echo "`basename $0` version \"$VERSION\""
  echo "Licensed under GPL v.3 or later"
  echo "Author: Joao Manoel Leite Ribeiro Nogueira"

}

EXT="gz";
UNCOMPRESS="gunzip";
FILES="InRelease Release Release.gpg Index.gz Packages.gz Translation-en.gz Translation-pt.gz Translation-pt_BR.gz Sources.gz"
ARCH="i386"
SCRIPT_DIR="$HOME/linux/debian/scripts"
SCRIPT1="wget-lists"
SCRIPT2="wget-lists-dir"
SCRIPT3="cp-lists"
SCRIPT4="cp-lists-dir"
VERSION="0.3"
VERBOSE="1"

if [ -z "$1" ]; then
  generate
  exit 0
fi

if [ -n "$9" ]; then
  help -1
fi

case "$1" in
  "-h")
    if [ -n "$2" ]; then
      help -1
    else
      help 0
    fi
    ;;
  "-V")
    if [ -n "$2" ]; then
      help -1
    else
      version
    fi
    ;;
  "-v"|"-q")
    [ "$1" == "-q" ] && VERBOSE="0"
    if [ -n "$2" ]; then
      if [ "$2" != "-b" -a "$2" != "-g" -a "$2" != "-l" ]; then
        help -1
      fi
      if [ "$2" == "-b" ]; then
        EXT="bz2"
        UNCOMPRESS="bunzip2"
        FILES="InRelease Release Release.gpg Index.bz2 Packages.bz2 Translation-en.bz2 Translation-pt.bz2 Translation-pt_BR.bz2 Sources.bz2"
      elif [ "$2" == "-l" ]; then
        EXT="lzma";
        UNCOMPRESS="unlzma";
        FILES="InRelease Release Release.gpg Index.lzma Packages.lzma Translation-en.lzma Translation-pt.lzma Translation-pt_BR.lzma Sources.lzma"
      fi
    fi
    if [ -n "$3" ]; then
      if [ "$3" != "-m" ]; then
        help -1
      else
        if [ -z "$4" ]; then
          help -1
        fi
        if [ "$4" != "i386" -a "$4" != "amd64" ]; then
          help -1
        fi
        ARCH="$4"
      fi
    fi
    [ -n "$5" ] && SCRIPT_DIR="$5"
    [ -n "$6" ] && SCRIPT1="$6"
    [ -n "$7" ] && SCRIPT2="$7"
    [ -n "$8" ] && SCRIPT3="$8"
    [ -n "$9" ] && SCRIPT4="$9"
    generate
    ;;
  *)
    help -1
    ;;
esac


