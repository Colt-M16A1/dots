hl.config({
    general = {
        allow_tearing = true,
        gaps_in = 4,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = Col_primary,
            inactive_border = Col_on_primary,
            nogroup_border = Col_secondary,
            nogroup_border_active = Col_on_secondary,
        },
    },
    group = {
        col = {
            border_active = Col_primary,
            border_inactive = Col_on_primary,
        },
        groupbar = {
            font_size = 15,
            height = 25,
            indicator_height = 3,
            gaps_in = 3,
            gaps_out = 3,
            text_color = Col_surface,
            col = {
                active = Col_primary,
                inactive = Col_on_primary,
            },
            gradients = true,
            gradient_round_only_edges = false,
            gradient_rounding = 5,
        },
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            popups = true,
            input_methods = true,
        },
        shadow = {
            enabled = true,
        },
    },
    cursor = {
        inactive_timeout = 5,
        default_monitor = "DP-1",
        zoom_disable_aa = true,
    },
    render = {
        --pc
        direct_scanout = 0,
        cm_enabled = false,
        --laptop
        --direct_scanout = 2,
        --new_render_scheduling = true,
    },
    misc = {
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_autoreload = true,
        middle_click_paste = false,
        enable_swallow = false,
        swallow_regex = Term,
        swallow_exception_regex = "^(.*)(Blender)(.*)",
        enable_anr_dialog = false,
        font_family = "BlexMono Nerd Font Mono",
        vrr = 2,
    },
    plugin = {
        split_monitor_workspaces = {
            count = 10,
            keep_focused = 1,
            enable_notifications = 0,
            enable_persistent_workspaces = 0,
            enable_wrapping = 0,
            link_monitors = 0,
            -- enable_hy3                = 1,
        },
    },
    debug = {
        --disable_logs = false,
        --overlay = true,
    },
})

local smw = hl.plugin.split_monitor_workspaces
smw.monitor_priority({ "DP-1", "HDMI-A-1" })

hl.curve("specialWorkSwitch", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })

hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "emphasizedAccel", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "standard" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "emphasizedAccel" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "standard" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard" })
hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 4,
    bezier = "specialWorkSwitch",
    style = "slidefadevert 15%",
})

hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 22")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 22")
end)
