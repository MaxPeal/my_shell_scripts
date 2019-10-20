#!/bin/sh

if [ "$MSYSTEM" == "MSYS" ]; then
    export TESSDATA_PREFIX="/mingw64/share/tessdata/"
    export TESSERACT_BIN="/mingw64/bin/"
fi

echo -e "\n\tTESSERACT OCR IN FILES:\n"

IFS=$'\n'

for input in $@; do

    output="$(basename "${input}" ".tiff")"

    echo -en "\t\t\"${input}\" to \"${output}.txt\" ... "

    "${TESSERACT_BIN}tesseract.exe" "${input}" "${output}" -l por >/dev/null 2>&1

    if [ $? == 0 ]; then
        echo -e "OK\n"
    else
        echo -e "NOT OK\n"
    fi

done

echo ""

exit 0
