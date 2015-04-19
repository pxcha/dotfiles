#! /bin/bash
#
# .xinitrc
#

# Load Xresouces
xrdb -load ~/.Xresources

# Begin
exec i3
