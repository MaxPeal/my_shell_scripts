#!/bin/sh

arquivo="$(basename "$1" ".txt").html"

echo -en "\n\tTransformando o arquivo com a lei:\n\n\t\t\"$1\"\n\n\tde TXT para HTML:\n\n\t\t\"$arquivo\"\n\n\tFoi um ..."

sed \
    -e 's/>/\&gt;/g' \
    -e 's/</\&lt;/g' \
    -e '/^Art.[[:blank:]]*[1-9][0-9]*\./,/^$/ {
        /^Art.[[:blank:]]*[1-9][0-9]*\./ s/^Art.[[:blank:]]*\([1-9][0-9]*\)\./<p style="text-align: justify;">\n<b>Art\. \1\.<\/b>/
        /^$/ s/^/<\/p>/
    }' \
    -e '/^[Pp]arágrafo[[:blank:]]*[Úú]nico\./,/^$/ {
        /^[Pp]arágrafo[[:blank:]]*[Úú]nico\./ s/^[Pp]arágrafo[[:blank:]]*[Úú]nico\./<p style="text-align: justify;">\n<b>Par\&aacute;grafo \&uacute;nico.<\/b>/
        /^$/ s/^/<\/p>/
    }' \
    -e '/^§[1-9][0-9]*[º°]\./,/^$/ {
        /^§[1-9][0-9]*[º°]\./ s/^§\([1-9][0-9]*\)[º°]\./<p style="text-align: justify;">\n<b>\&sect;\1\&ordm;\.<\/b>/
        /^$/ s/^/<\/p>/
    }' \
    -e '/^CAPÍTULO/,/^$/ {
        /^CAPÍTULO/ s/^CAPÍTULO\(.*\)$/<p style="text-align: center\; font-weight: bold\;">CAP\&Iacute\;TULO\1<\/p>/
        /CAP\&Iacute\;TULO/ b
        /^.\+$/ s/^\(.\+\)$/<p style="text-align: center;">\1<\/p>/
    }' \
    -e '/^\(X\{1,3\}\|XL\|LX\{0,3\}\|XC\|\)\(I\{1,3\}\|IV\|VI\{0,3\}\|IX\)[[:blank:]]\+[-—][[:blank:]]\+/,/^$/ {
        /^I[[:blank:]]\+[-—][[:blank:]]\+/ s/^I[[:blank:]]\+[-—][[:blank:]]\+/<p style="text-align: justify;">\n  <ul style="list-style-type: none;">\n    <li style="margin-left: -20px; margin-top: 10px; margin-bottom: 10px;">\n      I \&mdash\; /
        /^    <li/ b
        /^\(X\{1,3\}\|XL\|LX\{0,3\}\|XC\|\)\(I\{1,3\}\|IV\|VI\{0,3\}\|IX\)[[:blank:]]\+[-—][[:blank:]]\+/ s/^\(X\{1,3\}\|XL\|LX\{0,3\}\|XC\|\)\(I\{1,3\}\|IV\|VI\{0,3\}\|IX\)[[:blank:]]\+[-—][[:blank:]]\+/    <li style="margin-left: -20px; margin-top: 10px; margin-bottom: 10px;">\n      \1\2 \&mdash\; /
        /^$/ s/^/    <\/li>/
    }' \
        -e '/^[a-zA-Z])[[:blank:]]*/,/^$/ {
        /^[aA])[[:blank:]]*/ s/^[aA])[[:blank:]]*/<p style="text-align: justify;">\n  <ul style="list-style-type: none;">\n    <li style="margin-left: -20px; margin-top: 10px; margin-bottom: 10px;">\n      a) /
        /^    <li/ b
        /^[a-zA-Z])[[:blank:]]*/ s/^\([a-zA-Z]\))[[:blank:]]*/    <li style="margin-left: -20px; margin-top: 10px; margin-bottom: 10px;">\n      \1) /
        /^$/ s/^/    <\/li>/
    }' \
    -e 's/caput/<i>caput<\/i>/g' \
    -e 's/—/-/g' \
    -e 's/À/\&Agrave;/g' \
    -e 's/à/\&agrave;/g' \
    -e 's/Á/\&Aacute;/g' \
    -e 's/á/\&aacute;/g' \
    -e 's/É/\&Eacute;/g' \
    -e 's/é/\&eacute;/g' \
    -e 's/Í/\&Iacute;/g' \
    -e 's/í/\&iacute;/g' \
    -e 's/Ó/\&Oacute;/g' \
    -e 's/ó/\&oacute;/g' \
    -e 's/Ú/\&Uacute;/g' \
    -e 's/ú/\&uacute;/g' \
    -e 's/Ã/\&Atilde;/g' \
    -e 's/ã/\&atilde;/g' \
    -e 's/Õ/\&Otilde;/g' \
    -e 's/õ/\&otilde;/g' \
    -e 's/Â/\&Acirc;/g' \
    -e 's/â/\&acirc;/g' \
    -e 's/Ê/\&Ecirc;/g' \
    -e 's/ê/\&ecirc;/g' \
    -e 's/Ô/\&Ocirc;/g' \
    -e 's/ô/\&ocirc;/g' \
    -e 's/Ü/\&Uuml;/g' \
    -e 's/ü/\&uuml;/g' \
    -e 's/ç/\&ccedil;/g' \
    -e 's/Ç/\&Ccedil;/g' \
"$1" >> "$arquivo"

sed1=$?

sed \
    -e '/^    <\/li>/,/^<p/ {
        /^<p/ s/^<p/  <\/ul>\n<\/p>\n<p/
    }' \
-i "$arquivo"

sed2=$?

#sed \
#    -e '/      [a-zA-Z]) / h ; s/^.*\(      [a-zA-Z]) \).*$/\1/ ; y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/ ; x ; s/      [a-zA-Z]) // ; H ; g ; s/\n// ;' \
#-i "$arquivo"

if [ $sed1 == 0 -a $sed2 == 0 ]; then
    echo -e "SUCESSO!\n"
else
    echo -e "FRACASSO!\n"
fi

#—
#&mdash;

exit 0
