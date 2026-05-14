local tearing_list = {
    classes = {
        "^(steam_app)(.*)",
        "org.vinegarhq.Sober",
        "osu!",
        "uzdoom",
        "gamescope",
        "zandronum",
        "raze",
        "tf_linux64",
        "hl_linux",
        "hl*",
        "gmod",
        "svencoop_linux",
        "xr_3da",
        "armacoldwarassault.i386",
        "postal2-bin",
        "^(.*)(.exe)$",
        "xash3d",
    },
    titles = {
        "^(Minecraft)(.*)",
        "^(Better than Adventure!)(.*)",
        "^(.*)(quake)(.*)",
        "ironwail",
        "^(War Thunder)(.*)",
    },
}

hl.window_rule({
    match = { class = "steam" },
    workspace = "9 silent",
})

hl.window_rule({
    match = { xdg_tag = "proton-game" },
    workspace = "9 silent",
})

for _, pattern in ipairs(tearing_list.classes) do
    local rule = {
        match = { class = pattern },
        content = "game",
        immediate = true,
    }

    if pattern:find("steam_app") then
        rule.workspace = "9 silent"
    end

    hl.window_rule(rule)
end

for _, pattern in ipairs(tearing_list.titles) do
    hl.window_rule({
        match = { title = pattern },
        content = "game",
        immediate = true,
    })
end

hl.window_rule({
    match = { content = 3 },
    immediate = true,
})

local privacy_list = {
    titles = {
        "(.*)(\\) Inbox)(.*)",
        "(.*)Inbox(.*)",
        "(.*)(All mail)(.*)",
    },
    classes = {
        "^(org.keepassxc.KeePassXC)$",
    },
}

for _, pattern in ipairs(privacy_list.titles) do
    hl.window_rule({
        match = { title = pattern },
        no_screen_share = true,
    })
end

for _, pattern in ipairs(privacy_list.classes) do
    hl.window_rule({
        match = { class = pattern },
        no_screen_share = true,
    })
end

hl.window_rule({
    match = { xwayland = true },
    border_color = Col_error,
})

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
})
hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
})
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})
hl.layer_rule({
    match = { namespace = "swayosd" },
    blur = true,
    ignore_alpha = 0.5
})
hl.layer_rule({
    match = { namespace = "swaync-control-center" },
    blur = true,
    no_screen_share = true,
    ignore_alpha = 0.5,
})
hl.layer_rule({
    match = { namespace = "swaync-notification-window" },
    blur = true,
    no_screen_share = true,
    ignore_alpha = 0.5,
})
hl.layer_rule({
    match = { namespace = "vicinae" },
    blur = true,
    ignore_alpha = 0,
})
