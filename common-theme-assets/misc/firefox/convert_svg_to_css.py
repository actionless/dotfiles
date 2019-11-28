#!/usr/bin/env python3

import sys
import urllib.parse


def convert_svg_to_css(filepath):
    with open(filepath) as svg_file:
        svg_text = svg_file.read().replace(
            '<?xml version="1.0" encoding="UTF-8"?>', ""
        )
        encoded_svg = urllib.parse.quote(svg_text)
        return 'background-image: url("data:image/svg+xml,{}");'.format(
            encoded_svg
        )


if __name__ == "__main__":
    print(convert_svg_to_css(sys.argv[1]))
