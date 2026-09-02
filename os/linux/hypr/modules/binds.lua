local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. "+ Q", hl.dsp.window.close())
hl.bind(mainMod .. "+ V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("xdg-open vicinae://toggle"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind("ALT + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("CONTROL + ALT + right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("CONTROL + ALT + left", hl.dsp.focus({ workspace = "m-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("Print", hl.dsp.exec_cmd("~/.local/bin/grim-screenshot"))
hl.bind(mainMod .. " + code:51", hl.dsp.exec_cmd("~/.local/bin/grim-screenshot"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.local/bin/grim-screenshot screen"))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

hl.bind("mouse:275", hl.dsp.exec_cmd("wl-copy $(wl-paste -p)"))
hl.bind("mouse:276", hl.dsp.exec_cmd("wtype -M ctrl -M shift v -m ctrl -m shift"))

hl.bind("SUPER + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("L", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("Return", hl.dsp.submap("reset"))
end)

hl.bind("CONTROL + ALT + L", hl.dsp.exec_cmd("~/.local/bin/lock"))
hl.bind("SUPER + escape", hl.dsp.submap("logout"))

hl.on("keybinds.submap", function(name)
	if name == "logout" then
		hl.notification.create({
			text = "c - reload\ne - exit\nr - reboot\ns - suspend\nS - poweroff\nl - lock",
			duration = 4500,
			color = "rgb(34E2E2)",
			font_size = 18,
		})
	end
end)

hl.define_submap("logout", function()
	hl.bind("C", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
	end)
	hl.bind("E", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exit())
	end)
	hl.bind("S", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("~/.local/bin/suspend"))
	end)
	hl.bind("R", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl reboot"))
	end)
	hl.bind("SHIFT + S", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl poweroff -i"))
	end)
	hl.bind("L", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("~/.local/bin/lock"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("escape", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("Return", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end)

local function layout_bind(bind_table)
	return function()
		local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

		if not workspace then
			return
		end

		local layout = workspace.tiled_layout

		if bind_table[layout] then
			hl.dispatch(bind_table[layout])
		end
	end
end

hl.bind(
	mainMod .. "+ left",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol l"), -- Scrolling: swap column with left one
		dwindle = hl.dsp.layout("swapsplit"), -- Dwindle: swap window split
		monocle = hl.dsp.layout("cycleprev"), -- Monocle and master: cycle prev window
		master = hl.dsp.layout("cycleprev"),
	})
)

hl.bind(
	mainMod .. "+ right",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol r"), -- Scrolling: swap column with right one
		dwindle = hl.dsp.layout("togglesplit"), -- Dwindle: toggle window split
		monocle = hl.dsp.layout("cyclenext"), -- Monocle and master: cycle next window
		master = hl.dsp.layout("cyclenext"),
	})
)
