Pacha's dotfiles
===================

##Information
*   WM - i3
*   Term emulator - urxvt
*   Font - DejaVu Sans Mono

##TODO
*   Document things within the dotfiles themselves
*   Improve the deploy scripts to back up existing files and be 'nice'

##Dependencies
The programs used here are located in the depends.txt file. You could install them all at once with something like:
```
for i in $(cat depends.txt); do <your package manager install command here> $i; done
```
This is independent per target directory. This list has only been tested with Arch Linux and there are a number of packages that live in the AUR. Also, there are configuration files for programs that are not in the depends.txt with the idea that you only need to install what's used.

##Management
These files are managed with GNU [stow](http://www.gnu.org/software/stow/manual/stow.html), which should be available via your package manager of choice. Stow is a symlink-farm management program. It allows for mass symlinking out of a 'master' directory (Here you can see I use the users home directory and the base('/') directory. The deploy scripts in these directories run stow with a target parent directory indicated by name. If you are reading this you are probably interested in only the dotfiles for your home directory.
