#!/usr/bin/env bash
perl -pe 's/([0-9]+)/($1+$1)/eg' $@
