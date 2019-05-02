#!/bin/bash

function help () {
	echo 'Usage: gnomescrlock.sh [lock | unlock | help]'
	echo 'lock   - lock session'
	echo 'unlock - remove lock (screen still will be turned off)'
	echo 'help   - shows this help screen'
	exit 1
}

COMMAND=$1
if [ -z $COMMAND ]
then
	echo 'No command provided. Showing help screen'
	help
elif [ $COMMAND == 'help' ]
then
	help
elif [ $COMMAND == 'lock' ]
then
	dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
elif [ $COMMAND == 'unlock' ]
then
	dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.SetActive boolean:false
else
	echo 'Something went wrong. Showing help screen'
	help
fi
