#!/bin/bash
# Cleanup, version 3

LOG_DIR=/var/log
ROOT_UI=0
LINES=50
E_XCD=86
E_NOTROOT=87

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
	printf "Hello, %s!\n" "$USER"
	exit $E_NOTROOT
fi
