-- Environmental variables (for reference https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/)
-- if you use UWSM, define your variables in ~/.config/uwsm/env
-- if you don't use UWSM, define your variables here (e.g. hl.env("QT_QPA_PLATFORM", "wayland"))

-- if you have an NVIDIA GPU uncomment the following lines:

hl.env("GDK_SCALE", "1.33") -- Scale factor for GDK applications
hl.env("QT_SCALE_FACTOR", "1.33") -- Scale factor for Qt applications
-- hl.env("GBM_BACKEND", "nvidia-drm") -- force GBM as a backend
hl.env("LIBVA_DRIVER_NAME", "nvidia") -- Hardware acceleration on NVIDIA GPUs
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia") -- force GBM as a backend
hl.env("NVD_BACKEND", "direct") -- Set NVD backend to direct
hl.env("GSK_RENDERER", "ngl") -- Set GSK renderer to ngl
-- hl.env("__GL_GSYNC_ALLOWED", "1") -- Controls if G-Sync capable monitors should use Variable Refresh Rate (VRR)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- auto selects Wayland if possible, X11 otherwise
-- firefox
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1") -- Disable RDD sandbox for Firefox
hl.env("EGL_PLATFORM", "wayland") -- Set EGL platform to Wayland

hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

-- # ######## Toolkit backends ########

hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland,x11,windows")
hl.env("CLUTTER_BACKEND", "wayland")

-- # ####### XDG specifications #######
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
