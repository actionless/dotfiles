#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from urllib.parse import unquote

if len(sys.argv) < 2:
    print(f"Usage: {sys.argv[0]} 'moz-extension://01234urlblahblah'")
    sys.exit(1)

print(
    unquote(
        sys.argv[1].split('url=')[1].split('&favicon')[0]
    )
)
