#!/bin/bash

# Additional ALSA devices
#alsa_out -j "Modi Playback" -d hw:2,1 &
#alsa_in -j "Onboard In" -d hw:2,0 &
#alsa_in -j "Audigy In" -d hw:0,0 &

sleep 2s
# PulseAudio sinks
pactl load-module module-jack-sink sink_name=jack_sink1 client_name="Pulse\ Sink1" connect=no channels=2
pactl load-module module-jack-sink sink_name=jack_sink2 client_name="Pulse\ Sink2" connect=no channels=2

# PulseAudio sources
pactl load-module module-jack-source source_name=jack_source1 client_name="Pulse\ Source1" connect=no channels=2

# Set default PulseAudio I/O
pacmd set-default-sink jack_sink1
pacmd set-default-source jack_source1

# MIDI setup
a2jmidid -e &

# Ladish setup
#ladish_control sload default

# Load default patch snapshot
aj-snapshot -r .jack/snapshots/default
