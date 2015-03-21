#urxvt daemon
#urxvtd &

#compositing
#compton &

#mpd
mpd ~/.config/mpd/mpd.conf &

#Add panel scripts:
#export PATH=$PATH:~/.config/bar

#check if existing socket exists and killl for bspwm(doesn't play nice with logging out and in)
#rm /tmp/$(ls /tmp | grep bspwm)

#xsetroot -cursor_name left_ptr &

#start bspwm and sxhkd
#sxhkd -f 100 -c /home/pch/.config/sxhkd/sxhkdrc &
#exec bspwm -c /home/pch/.config/bspwm/bspwmrc > .xinit.log
exec i3
#exec spectrwm
