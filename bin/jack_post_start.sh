#!/bin/bash

alsa_out -j "Modi Playback" -d iec958:CARD=PCH,DEV=0
alsa_out -j "Rocksmith" -d hw:4,0

pactl load-module module-jack-sink channels=2 client_name=Voice_Sink connect=no

ladish_control sload standard

