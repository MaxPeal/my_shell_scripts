#!/bin/bash

help_exit() {
    echo -en "\a\n\tUso:\n"
    echo -en "\t\t$(basename "$0") -u user -p password -o arquivo.sql\n"
    echo -en "\t\t$(basename "$0") -h|--help\n\n"
    exit "$1"
}

if [ -z "$1" -o "$1" == "-h" -o "$1" == "--help" ]; then
    help_exit 0
fi

if [ -z "$6" -o -n "$7" -o "$1" != "-u" -o "$3" != "-p" -o "$5" != "-o" ]; then
    help_exit 1
fi

# Definindo o diretorio temporario para armazenar os dados em json
TEMPDIR="$(mktemp -d ~/tmp/sistec.XXXXXX)"

# Definindo o ID (usuario) e a PW (senha) a partir dos parametros informados
ID="$2"
PW="$4"

# Codificando o ID e a PW com urlencode.py
ID_URL="$(urlencode.py "$ID")"
PW_URL="$(urlencode.py "$PW")"

# Codificando o ID e a PW com base64
IDENTIFIER="$(echo -n "$ID" | base64)"
PASSWORD="$(echo -n "$PW" | base64)"

# Codificando o IDENTIFIER e a PASSWORD com urlencode.py
IDENTIFIER_URL="$(urlencode.py "$IDENTIFIER")"
PASSWORD_URL="$(urlencode.py "$PASSWORD")"

# Definindo os cookies
#COOKIE_SISTEC_NOTICIAS="sistecNoticias=0"

# Definindo os HOSTs
HOST_SISTEC="sistec.mec.gov.br"
HOST_SSD="ssd.mec.gov.br"

# Definindo as URLs
URL_LOGIN="http://sistec.mec.gov.br/login/login"
URL_SERVLET="http://sistec.mec.gov.br/login/servlet"
URL_AUTH="https://ssd.mec.gov.br/ssd-server/servlet/AuthenticationById"

# Definindo as opções comuns do CURL
CURL_OPTS=" \
    -H \"User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0\" \
    -H \"Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\" \
    -H \"Accept-Language: pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3\" \
    --compressed \
    -H \"DNT: 1\" \
    -H \"Connection: keep-alive\" \
"

# Obtendo informações do cabeçalho do servlet
HEADERS_SERVLET="$( \
    curl \
        -D - \
        "$URL_SERVLET" \
        $CURL_OPTS \
        -H "Host: $HOST_SISTEC" \
        -H "Referer: $URL_LOGIN" \
    2>/dev/null | \
    dos2unix \
)"
COOKIE_ZDE_DEBUGGER_PRESENT="$( \
    echo "$HEADERS_SERVLET" | \
    egrep '^Set-Cookie: ZDEDebuggerPresent' | \
    sed 's/^Set-Cookie: \([^;]\+\);.*$/\1/' | \
    sed 's/\n//' \
)"
COOKIE_PHPSESSID="$( \
    echo "$HEADERS_SERVLET" | \
    egrep '^Set-Cookie: PHPSESSID' | \
    sed 's/^Set-Cookie: \([^;]\+\);.*$/\1/' | \
    sed 's/\n//' \
)"
LOCATION_SERVLET="$( \
    echo "$HEADERS_SERVLET" | \
    egrep '^Location: ' | \
    sed 's/^Location: //' | \
    sed 's/\n//' \
)"

echo "$COOKIE_ZDE_DEBUGGER_PRESENT"
echo "$COOKIE_PHPSESSID"
echo "$LOCATION_SERVLET"

# Obtendo informações do cabeçalho da autenticação
HEADERS_AUTH="$( \
    curl \
        -D - \
        "$LOCATION_SERVLET" \
        $CURL_OPTS \
        -H "Host: $HOST_SSD" \
        -H "Referer: $URL_LOGIN" \
    2>/dev/null | \
    dos2unix \
)"
COOKIE_JSESSIONID="$( \
    echo "$HEADERS_AUTH" | \
    egrep '^Set-Cookie: JSESSIONID' | \
    sed 's/^Set-Cookie: \([^;]\+\);.*$/\1/' | \
    sed 's/\n//' \
)"

echo "$COOKIE_JSESSIONID"

HEADERS_AUTH_POST="$( \
    curl \
        -D - \
        "$URL_AUTH" \
        $CURL_OPTS \
        -H "Host: $HOST_SSD" \
        -H "Referer: $LOCATION_SERVLET" \
        -b "$COOKIE_JSESSIONID" \
        --data "id=$ID_URL&identifier=$IDENTIFIER_URL&pw=$PW_URL&password=$PASSWORD_URL" \
    2>/dev/null \
    | dos2unix \
)"
LOCATION_AUTH_POST="$( \
    echo "$HEADERS_AUTH_POST" | \
    egrep '^Location: ' | \
    sed 's/^Location: //' | \
    sed 's/\n//' \
)"

echo "LOCATION_AUTH_POST=$LOCATION_AUTH_POST"


curl \
    -o "$TEMPDIR/instituicoes.html" \
    -L "$LOCATION_AUTH_POST" \
    $CURL_OPTS \
    -H "Host: $HOST_SISTEC" \
    -b "$COOKIE_PHPSESSID; $COOKIE_ZDE_DEBUGGER_PRESENT" \
    2>/dev/null

dos2unix "$TEMPDIR/instituicoes.html"
sed -ne '/^[[:blank:]]*<select.*>$/,/^[[:blank:]]*<\/select>$/p' "$TEMPDIR/instituicoes.html"

# Download dos campus disponiveis
#curl "http://sistec.mec.gov.br/index/selecionarinstituicao/" \
#    -H "Host: sistec.mec.gov.br" \
#    -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0" \
#    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
#    -H "Accept-Language: pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3" \
#    --compressed \
#    -H "DNT: 1" \
#    -H "Cookie: ZDEDebuggerPresent=php,phtml,php3; PHPSESSID=$2" \
#    -H "Connection: keep-alive" \
#    -H "Cache-Control: max-age=0" \
#    -o "$TEMPDIR/selecionar_instituicao.html"

# Download dos ciclos de matricula do campus de Anapolis
#curl "http://sistec.mec.gov.br/gridciclo/turmas" \
#    -H "Host: sistec.mec.gov.br" \
#    -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0" \
#    -H "Accept: application/json" \
#    -H "Accept-Language: pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3" \
#    --compressed \
#    -H "DNT: 1" \
#    -H "Referer: http://sistec.mec.gov.br/index/index" \
#    -H "X-Requested-With: XMLHttpRequest" -H "X-Request: JSON" \
#    -H "Content-Type: application/x-www-form-urlencoded; charset=utf-8" \
#    -H "Content-Length: 0" \
#    -H "Cookie: ZDEDebuggerPresent=php,phtml,php3; perfil_cookie=ASSESSOR+DA+UNIDADE+DE+ENSINO; co_usuario=1494081; sistecNoticias=0; PHPSESSID=$2" \
#    -H "Connection: keep-alive" \
#    -H "Pragma: no-cache" \
#    -H "Cache-Control: no-cache" \
#    -o "$TEMPDIR/anapolis-000.json"
