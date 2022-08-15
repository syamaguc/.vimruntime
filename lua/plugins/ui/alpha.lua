local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl_shortcut = "Macro"
	return b
end

-- dashboard.section.header.val = {
--   [[                               __                ]],
--   [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
--   [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
--   [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
--   [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
--   [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

local ascii = {
	[[                         .^!^                                           .!~:                        ]],
	[[                    ^!JPB&B!.                                            !&&BPJ!:                   ]],
	[[                ^?P#@@@@@G.                   :       :                   !@@@@@&BY!:               ]],
	[[             ^JB@@@@@@@@@7                   .#~     ?P                   .&@@@@@@@@&G?:            ]],
	[[          .7G@@@@@@@@@@@@#!                  ?@#^   ~@@^                 .5@@@@@@@@@@@@@G7.         ]],
	[[        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y&@@@@@@@@@@@@@@@@#?.       ]],
	[[       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  !@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@B!      ]],
	[[     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ]],
	[[    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ]],
	[[   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?   ]],
	[[   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGPP5PPPGBB#&#.  ]],
	[[   ^:..           .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ]],
	[[                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y.                      ]],
	[[                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ]],
	[[                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ]],
	[[                                         :?G@@@@@@@@@@@@P!.                                         ]],
	[[                                            ~5@@@@@@@@5^                                            ]],
	[[                                              ^P@@@@G^                                              ]],
	[[                                                !#@?                                                ]],
	[[                                                 :^ ",                                              ]],
}

dashboard.section.header.val = ascii
dashboard.section.buttons.val = {
	button("f", "  Find file", ":Telescope find_files <CR>"),
	button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	button("p", "  Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
	button("r", "  Recent files", ":Telescope oldfiles <CR>"),
	button("t", "  Find text", ":Telescope live_grep <CR>"),
	button("s", "  Find Session", ":SearchSession<CR>"),
	button("q", "  Quit", ":qa<CR>"),
}

local function footer()
	-- local plugins = #vim.tbl_keys(packer_plugins)
	local v = vim.version()
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local platform = vim.fn.has("win32") == 1 and "" or ""
	-- return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
	return string.format(" v%d.%d.%d %s  %s", v.major, v.minor, v.patch, platform, datetime)
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
