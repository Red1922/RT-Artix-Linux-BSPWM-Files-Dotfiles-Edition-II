#!/bin/env bash

# Options for powermenu
#lock="......Lock"
logout=" Logout"
shutdown=" Shutdown"
reboot=" Reboot"
#sleep="....Sleep"

# Get answer from user via rofi
selected_option=$(echo "$logout
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/powermenu.rasi"\
                  -font "Serif 12"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

# Do something based on selected option
#if [ "$selected_option" == "$lock" ]
#then
#    /home/$USER/.config/bspwm/scripts/i3lock-fancy/i3lock-fancy.sh
if [ "$selected_option" == "$logout" ]
then
    bspc quit
elif [ "$selected_option" == "$shutdown" ]
then
    loginctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    loginctl reboot
#elif [ "$selected_option" == "$sleep" ]
#then
#    amixer set Master mute
#    suspend
else
    echo "No match"
fi
