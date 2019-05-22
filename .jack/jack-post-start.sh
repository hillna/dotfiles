#!/bin/bash

pacmd set-default-sink jack_out
pacmd set-default-source jack_in

alsa_out -j "Modi Playback" -d hw:1,1 &
#alsa_in -j "Onboard In" -d hw:2,0 &

#a2jmidid -e &
