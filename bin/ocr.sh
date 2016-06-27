#!/bin/sh

if [ "$MSYSTEM" == "MINGW64" ]; then
    export TESSDATA_PREFIX="/mingw64/share"
fi

echo -e "\n\tTESSERACT OCR IN FILES:\n"

IFS=$'\n'

for input in $@; do

    output="$(basename "${input}" ".tiff")"

    echo -en "\t\t\"${input}\" to \"${output}.txt\" ... "

    tesseract "${input}" "${output}" -l por >/dev/null 2>&1

    if [ $? == 0 ]; then
        echo -e "OK\n"
    else
        echo -e "NOT OK\n"
    fi

done

echo ""

exit 0
