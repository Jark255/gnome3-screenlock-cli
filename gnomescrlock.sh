#!/bin/bash

# Copyright (C) 2019  Jark255
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <https://www.gnu.org/licenses/>.

function help () {
	echo 'gnomescrlock - Simple control script for gnome3 screensaver'
	echo ''
	echo '<program>  Copyright (C) 2019  Jark255'
    echo 'This program comes with ABSOLUTELY NO WARRANTY; for details type `show w`.'
    echo 'This is free software, and you are welcome to redistribute it'
    echo 'under certain conditions; type `show c` for details.'
	echo ''
	echo 'Usage: ./gnomescrlock.sh [lock | unlock | help]'
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
