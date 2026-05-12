local mod = "SUPER"

--local exec = hl.dsp.exec_cmd

--local function bindm(keys, dispatcher)
--    hl.bind(mod .. " + " .. keys, dispatcher)
--end

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + SHIFT + F2", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mod .. " + SHIFT + Q", hl.dsp.exit())

local smw = hl.plugin.split_monitor_workspaces

for i = 1, 9 do
    local key = tostring(i)
    hl.bind(mod .. " + " .. key, function()
        return smw.workspace(i)
    end)
    hl.bind(mod .. " + SHIFT + " .. key, function()
        return smw.move_to_workspace_silent(i)
    end)
end

--default amogus

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(Terminal2))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(Browser))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd(Browser2))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(Filemgr))
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd(Filemgr2))

hl.bind(mod .. " + Backspace", hl.dsp.exec_cmd("~/.config/hypr/scripts.d/powermenu.sh"))

hl.bind("Print", hl.dsp.exec_cmd("grimblast --freeze copy area"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast copy output"))

hl.bind("ALT + SPACE", hl.dsp.exec_cmd("rofi -modes combi -combi-modi drun,run -show combi"))
hl.bind(mod .. " + 0", hl.dsp.exec_cmd("rofi -terminal '$terminal' -modes window -show window"))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd("~/.config/hypr/scripts.d/rofi-dict.sh"))

hl.bind(mod .. " + X", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mod .. " + C", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("cliphist wipe"))

hl.bind("INSERT", hl.dsp.exec_cmd("flatpak run org.equicord.equibop --toggle-mic"))
hl.bind("SHIFT + INSERT", hl.dsp.exec_cmd("flatpak run org.equicord.equibop --toggle-deafen"))

--XF86
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd(Music))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("xbacklight -inc 5"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("xbacklight -dec 5"), { locked = true, repeating = true })
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind("XF86Calculator", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort"))
hl.bind("XF86WWW", hl.dsp.exec_cmd(Browser))
hl.bind("XF86HomePage", hl.dsp.exec_cmd("tor-browser"))
hl.bind("XF86Display", hl.dsp.exec_cmd("wdisplays"))

--music gaming (mpd)
hl.bind(mod .. " + N", hl.dsp.exec_cmd(Music))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("mpc --host 127.0.0.1 -q toggle"), { locked = true })
hl.bind(mod .. " + A", hl.dsp.exec_cmd("mpc --host 127.0.0.1 -q prev"), { locked = true })
hl.bind(mod .. " + S", hl.dsp.exec_cmd("mpc --host 127.0.0.1 -q next"), { locked = true })
hl.bind(
    mod .. " + SHIFT + A",
    hl.dsp.exec_cmd("mpc --host 127.0.0.1 -q volume -5"),
    { locked = true, repeating = true }
)
hl.bind(
    mod .. " + SHIFT + S",
    hl.dsp.exec_cmd("mpc --host 127.0.0.1 -q volume +5"),
    { locked = true, repeating = true }
)
hl.bind(
    mod .. " + ALT + A",
    hl.dsp.exec_cmd("mpc --host 127.0.0.1 seekthrough -5"),
    { locked = true, repeating = true }
)
hl.bind(
    mod .. " + ALT + S",
    hl.dsp.exec_cmd("mpc --host 127.0.0.1 seekthrough +5"),
    { locked = true, repeating = true }
)
hl.bind(mod .. " + E", hl.dsp.exec_cmd("~/.config/hypr/scripts.d/mpd-rofi.sh"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("~/.config/hypr/scripts.d/mpd-rofi.sh add"))
hl.bind(mod .. " + G", hl.dsp.exec_cmd("~/.config/hypr/scripts.d/translate.sh"))
hl.bind(mod .. " + SHIFT + G", hl.dsp.exec_cmd("~/.config/hypr/scripts.d/translate.sh en"))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + ALT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + V", hl.dsp.window.float())
hl.bind(mod .. " + M", hl.dsp.window.fullscreen("maximized"))
hl.bind(mod .. " + Z", hl.dsp.window.pin())
hl.bind(mod .. " + T", hl.dsp.group.toggle())

hl.bind(mod .. " + SHIFT + B", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mod .. " + B", hl.dsp.workspace.toggle_special())

hl.bind(mod .. " + P", hl.dsp.window.pseudo())

-- zoom
hl.bind(
    mod .. " + CTRL + mouse_down",
    hl.dsp.exec_cmd(
        "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.4')"
    ),
    { mouse = true }
)
hl.bind(
    mod .. " + CTRL + mouse_up",
    hl.dsp.exec_cmd(
        "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.7) | if . < 1 then 1 else . end')"
    ),
    { mouse = true }
)
hl.bind(mod .. " + CTRL + mouse:274", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1"), { mouse = true })
