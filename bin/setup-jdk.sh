if [[ -d "${1}" ]]
then
    export JAVA_HOME="${1}"
else
    export JAVA_HOME="/usr/lib/jvm/default"
fi
export PATH="$JAVA_HOME/bin:$PATH"
