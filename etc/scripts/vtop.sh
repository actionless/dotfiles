#!/bin/sh

COLUMNS=512 top -o \%MEM -b -n 1 \
	| grep "$@" \
	| awk '
	{cputotal = cputotal + $9}
	{memtotal = memtotal + $10}
	{print $0}

	END{print "CPU: " cputotal "%    MEM: " memtotal "%  "}'
