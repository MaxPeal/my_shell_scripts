#!/bin/bash
#
# prey startup script
#

# Function to find the real directory a program resides in.
# Feb. 17, 2000 - Sam Lantinga, Loki Entertainment Software
FindPath()
{
    fullpath="`echo $1 | grep /`"
    if [ "$fullpath" = "" ]; then
        oIFS="$IFS"
        IFS=:
        for path in $PATH
        do if [ -x "$path/$1" ]; then
               if [ "$path" = "" ]; then
                   path="."
               fi
               fullpath="$path/$1"
               break
           fi
        done
        IFS="$oIFS"
    fi
    if [ "$fullpath" = "" ]; then
        fullpath="$1"
    fi

    # Is the sed/ls magic portable?
    if [ -L "$fullpath" ]; then
        #fullpath="`ls -l "$fullpath" | awk '{print $11}'`"
        fullpath=`ls -l "$fullpath" |sed -e 's/.* -> //' |sed -e 's/\*//'`
    fi
    dirname $fullpath
}

# Set the home if not already set.
if [ "${PREY_DATA_PATH}" = "" ]; then
    PREY_DATA_PATH="`FindPath $0`"
fi

if [ "${LD_LIBRARY_PATH-TOTALLYUNSET}" != "TOTALLYUNSET" ]; then
    export ORIG_LD_LIBRARY_PATH=${LD_LIBRARY_PATH}
fi

LD_LIBRARY_PATH=.:${PREY_DATA_PATH}:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

# Let's boogie!
if [ -x "${PREY_DATA_PATH}/prey.x86" ]
then
	cd "${PREY_DATA_PATH}/"
	exec "./prey.x86" "$@"
fi
echo "Couldn't run prey (prey.x86). Is PREY_DATA_PATH set?"
exit 1

# end of prey ...

