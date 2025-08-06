#!/bin/bash
# Cleanup, version 3

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=86
E_NOTROOT=87

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
	printf "Hello, %s!\n" "$USER"
	printf "Congratulations!!! You are not root user!\n"
	printf "And go off, sucker! ;)))\n"
	exit $E_NOTROOT
fi

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
	lines=$1
else
	lines=$LINES # Default, if not specified on command-line.
fi

printf "Lines = %s\n" "$lines"

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]
then
	printf "Can't change to $LOG_DIR.\n"
	exit $E_XCD
fi

tail -n $lines messages > mesg.temp
mv mesg.temp messages

printf "messages cleaned up\n"

exit 0
