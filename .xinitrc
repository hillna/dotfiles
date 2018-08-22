[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
source $HOME/.xprofile

exec bspwm
#exec xterm
