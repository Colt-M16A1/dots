hl.on("hyprland.start", function()
    hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0")
    hl.exec_cmd("/usr/lib/hyprpolkitagent")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("nm-applet")

    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("~/.local/bin/mpdris2-rs --host 127.0.0.1:6600")
    hl.exec_cmd("swaync")

    hl.exec_cmd("syncthing --no-browser")
    hl.exec_cmd("wireproxy -c ./wgpc.conf")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    --hl.exec_cmd("wl-paste -p --watch wl-copy -pc")

    hl.exec_cmd("foot -s")

    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("awww restore")
    hl.exec_cmd("sleep 2 && waybar")
end)
