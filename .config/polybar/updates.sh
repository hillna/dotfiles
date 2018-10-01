#!/bin/sh

if [ -f /usr/bin/checkupdates ]; then
  arch_updates="$(checkupdates | wc -l)"
  aur_updates="$(checkupdates-aur |wc -l)"

  if [ ${arch_updates} -gt 0 ] || [ ${aur_updates} -gt 0 ]; then
    echo -e " ${arch_updates}(${aur_updates})"
  else
    echo -e ""
  fi
fi

