hl.config({
    dwindle = {
        preserve_split = true,
    },
    misc = {
        col = {
            splash = CACHYLGREEN,
        },
        middle_click_paste = false,
        -- Window swallowing: cualquier GUI hija de una terminal se "traga" la terminal
        -- (la oculta y, al cerrarse, la reinstala en el workspace de la app).
        -- Con tu binario `crate-app` + la regla crate-app -> ws4, eso arrastraba la kitty al ws4.
        enable_swallow = false,
        swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
        vrr = 3,
    },
    xwayland = {
        force_zero_scaling = true
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})