hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "float-qpwgraph",
    match = { class = "^(qpwgraph)$" },
    float = true,
})

hl.window_rule({
    name = "float-misc",
    match = {
        class = "^(jack_mixer|Peek|vlc|mplayer|feh|Onboard|Gladish|net-minecraft-bootstrap-Bootstrap)$",
    },
    float = true,
})
