local home = os.getenv("HOME") or ""
local mainMod = "SUPER"
local menu = "rofi -modi drun,run -show drun -show-icons"
local shotDir = home .. "/shots"
local grimWindow = [[$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')]]

-- --- session / launcher ---
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("alacritty -e tmux"))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("rofi -show window -show-icons"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind(mainMod .. " + ALT + CTRL + Escape", hl.dsp.exit())
hl.bind(mainMod .. " + CTRL + Tab", hl.dsp.exec_cmd(home .. "/bin/toggle-panel"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(home .. "/bin/toggle-laptop"))

-- Deskflow can leave Shift/Ctrl/Alt/Super held on this Wayland client.
-- ignore_mods so this still fires when a modifier is already stuck.
-- F13 is the Mac keyboard F13/Print key; Pause is the same key on some layouts.
hl.bind("F13", hl.dsp.exec_cmd(home .. "/bin/deskflow-unstick"), { ignore_mods = true })
hl.bind("Pause", hl.dsp.exec_cmd(home .. "/bin/deskflow-unstick"), { ignore_mods = true })

-- --- screensaver / lock (matches sxhkd xscreensaver binds) ---
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(home .. "/bin/lock-screen"))
hl.bind(mainMod .. " + CTRL + Escape", hl.dsp.exec_cmd(home .. "/bin/lock-screen --dpms"))

-- --- window management ---
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + W", hl.dsp.window.kill())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + B", hl.dsp.layout("equalize"))
hl.bind(mainMod .. " + G", hl.dsp.window.move({ monitor = 1 }))

hl.bind(mainMod .. " + comma", hl.dsp.layout("orientationleft"))
hl.bind(mainMod .. " + period", hl.dsp.layout("orientationright"))

-- --- focus / move (hjkl) ---
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- --- workspaces ---
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "e+1" }))

-- --- screenshots (grim + slurp; same modifiers as sxhkd) ---
hl.bind(
    mainMod .. " + SHIFT + F2",
    hl.dsp.exec_cmd('grim -g "' .. grimWindow .. '" ' .. shotDir .. "/$(date +%Y-%m-%d-%H%M%S)_grim.png")
)
hl.bind(
    mainMod .. " + SHIFT + CTRL + F2",
    hl.dsp.exec_cmd('grim -g "' .. grimWindow .. '" - | wl-copy')
)
hl.bind(
    mainMod .. " + SHIFT + F3",
    hl.dsp.exec_cmd("grim " .. shotDir .. "/$(date +%Y-%m-%d-%H%M%S)_grim.png")
)
hl.bind(mainMod .. " + SHIFT + CTRL + F3", hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind(
    mainMod .. " + SHIFT + F4",
    hl.dsp.exec_cmd('grim -g "$(slurp)" ' .. shotDir .. "/$(date +%Y-%m-%d-%H%M%S)_grim.png")
)
hl.bind(mainMod .. " + SHIFT + CTRL + F4", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- --- mouse ---
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- --- media keys ---
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("mpc -q prev"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("mpc -q next"), { locked = true })
