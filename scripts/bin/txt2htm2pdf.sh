#!/bin/bash
TXT_FILE="$1"
OUTPUT_PDF_FILE="${2:-$(basename -s .txt "$TXT_FILE").pdf}"

HTML_FILE=$(mktemp --suffix .html)

echo '
<html>
	<head>
		<style type = "text/css">
			p {
				/*font-family: "Input Serif";*/
				font-family: "PT Astra Serif";
				font-weight: 200;
				font-size: 16pt;
			}
		</style>
	</head>
	<body>
' >> "$HTML_FILE"
while read -r LINE; do
	if [[ -n "$LINE" ]] ; then
		echo "<p>${LINE}</p>" >> "$HTML_FILE"
	fi
done < "$TXT_FILE"
echo '
	</body>
</html>
' >> "$HTML_FILE"

wkhtmltopdf "$HTML_FILE" "$OUTPUT_PDF_FILE"
#echo "$HTML_FILE"
rm "$HTML_FILE"

readlink -e "$OUTPUT_PDF_FILE"
