#!/bin/sh

if [ -f /usr/bin/checkupdates ]; then
  arch_updates="$(checkupdates | wc -l)"
fi
if [ -f /usr/bin/paru ]; then
#  aur_updates="$(checkupdates-aur |wc -l)"
#  aur_updates="$(minq-checkupdates-aur |wc -l)"
  aur_updates="$(paru -Qua |wc -l)"
fi

if [ ${arch_updates} -gt 0 ] || [ ${aur_updates} -gt 0 ]; then
  echo -e " ${arch_updates}(${aur_updates})"
else
  echo -e ""
fi

