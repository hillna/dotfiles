[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
source $HOME/.xprofile

# Screen config
if [ -f /etc/xps13 ]
then
#    autorandr --change
    $HOME/.screenlayout/xps13_single.sh
else
    $HOME/.screenlayout/triptic.sh
fi

exec bspwm
#exec xterm
