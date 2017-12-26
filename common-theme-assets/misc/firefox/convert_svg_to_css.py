#!/usr/bin/env python3

import sys
import urllib.parse


with open(sys.argv[1]) as f:
    svg_text = f.read().replace('<?xml version="1.0" encoding="UTF-8"?>', "")
    encoded_svg = urllib.parse.quote(svg_text)
    result = 'background-image: url("data:image/svg+xml,{}");'.format(
        encoded_svg
    )
    print(result)
