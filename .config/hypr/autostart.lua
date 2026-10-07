local home = os.getenv("HOME") or ""

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd(home .. "/bin/apply-dark-theme")
    hl.exec_cmd("swayidle")
    hl.exec_cmd("systemctl --user start hyprpaper.service hyprpaper-watch.path")
    hl.exec_cmd("systemctl --user start waybar-session.service")
    hl.exec_cmd("systemctl --user start streamcontroller.service")
    hl.exec_cmd("blueman-applet")

    -- Default: desktop nwg-displays profile. Laptop profile only when /tmp/laptop_mode is set.
    -- Deskflow is the Mac KVM client; start it with laptop mode, not on a normal desktop boot.
    hl.exec_cmd(
        "bash -c 'if [ -e /tmp/laptop_mode ]; then "
            .. home
            .. "/.config/hypr/apply-layout.sh laptop; "
            .. "systemctl --user start deskflow-client.service; "
            .. "else "
            .. home
            .. "/.config/hypr/apply-layout.sh desktop; fi'"
    )

    -- Desktop only: PipeWire XR18 routing (replaces JACK/qjackctl)
    hl.exec_cmd(
        "bash -c 'if [ ! -e /tmp/laptop_mode ] && [ ! -f /etc/xps13 ]; then "
            .. home
            .. "/bin/toggle-laptop audio-desktop; fi'"
    )
end)
