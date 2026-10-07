local home = os.getenv("HOME") or ""

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GTK_THEME", "Equilux-compact")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env(
    "PATH",
    home .. "/bin:" .. home .. "/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
)
