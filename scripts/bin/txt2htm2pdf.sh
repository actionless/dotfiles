#!/bin/bash
TXT_FILE="$1"
OUTPUT_PDF_FILE="${2:-$(basename -s .txt "$TXT_FILE").pdf}"

TEMPORARY_FILE=$(mktemp --suffix .txt)

HTML_FILE=$(mktemp --suffix .html)

#FONT_PATH="${FONT_PATH:-/usr/share/fonts/TTF/RobotoMono-Light.ttf}"
FONT_PATH="${FONT_PATH:-/usr/share/fonts/TTF/Roboto-Regular.ttf}"
#FONT_PATH="${FONT_PATH:-/usr/share/fonts/TTF/Roboto-Light.ttf}"

rm "$TEMPORARY_FILE"
deai_text "$TXT_FILE" "$TEMPORARY_FILE"


echo '
<html>
	<head>
		<style type = "text/css">
			@font-face {
			font-family: '"'"'MyCustomFont'"'"';
			src: url(data:font/truetype;charset=utf-8;base64,'"$(openssl base64 -in "$FONT_PATH" | tr -d '\n')"') format('"'"'truetype'"'"');
			}
body {
    background: white;
    color: black;
    margin: 3cm;
	max-width: 700px;
	text-align: left;
	hyphens: auto;
}

p {
    font-family: "MyCustomFont";
    /*font-weight: 200;*/
    /*font-weight: 300;*/
    font-size: 12pt;
    line-height: 1.5;
    margin-bottom: 1em;
}
		</style>
	</head>
	<body>
' >> "$HTML_FILE"
while read -r LINE; do
	if [[ -n "$LINE" ]] ; then
		echo "<p>${LINE}</p>" >> "$HTML_FILE"
	fi
done < "$TEMPORARY_FILE"
rm "$TEMPORARY_FILE"
echo '
	</body>
</html>
' >> "$HTML_FILE"

wkhtmltopdf --allow . "$HTML_FILE" "$OUTPUT_PDF_FILE"
#echo "$HTML_FILE"
rm "$HTML_FILE"

readlink -e "$OUTPUT_PDF_FILE"

exit 0
## </END> #####################################################################

################ scraps:

#echo '
#<html>
#    <head>
#        <style type = "text/css">
#            @font-face {
#            font-family: '"'"'MyCustomFont'"'"';
#            src: url(data:font/truetype;charset=utf-8;base64,'"$(openssl base64 -in "$FONT_PATH" | tr -d '\n')"') format('"'"'truetype'"'"');
#            }
#            body {
#                background: white;
#                color: black;
#            }
#            p {
#                font-family: "MyCustomFont";
#                font-weight: 200;
#                font-size: 15pt;
#            }
#        </style>
#    </head>
#    <body>
#' >> "$HTML_FILE"


				#background: ivory;
				#color: dark-brown;
#FONT="${FONT:-PT Astra Serif}"
#echo '
#<html>
#    <head>
#        <style type = "text/css">
#            body {
#                background: white;
#                color: black;
#            }
#            p {
#                /*font-family: "Input Serif";*/
#                /*font-family: "PT Astra Serif";*/
#                font-family: "'"$FONT"'";
#                font-weight: 200;
#                font-size: 16pt;
#            }
#        </style>
#    </head>
#    <body>
#' >> "$HTML_FILE"
