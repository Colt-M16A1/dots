hl.monitor({
    output = "DP-1",
    mode = "1920x1080@74.97",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@74.97",
    position = "-1920x-180",
    scale = 1,
})

local home = os.getenv("HOME")
if Laptop then
    hl.monitor({
        output = "LVDS-1",
        mode = "1600x900@59.98",
        position = "0x0",
        scale = 1,
        icc = home .. "/Documents/icc/t430.icc",
    })
end
