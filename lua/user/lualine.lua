-- Darkplus theme

if lvim.colorscheme == "darkplus" then
	local colors = {
		blue = "#569cd6",
		green = "#6a9955",
		purple = "#c586c0",
		red1 = "#d16969",
		yellow = "#dcdcaa",
		orange = "#ce9178",
		fg = "#d4d4d4",
		bg = "#007acc",
		alt_bg = "#252525",
		-- bg     = '#68217a',
		black = "#1e1e1e",
		gray1 = "#5c6370",
		gray2 = "#2c323d",
		gray3 = "#3e4452",
	}

	lvim.builtin.lualine.options.theme = {
		normal = {
			a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
			b = { fg = colors.fg, bg = colors.gray3 },
			c = { fg = colors.fg, bg = colors.alt_bg },
		},
		insert = { a = { fg = colors.black, bg = colors.green, gui = "bold" } },
		visual = { a = { fg = colors.black, bg = colors.yellow, gui = "bold" } },
		command = { a = { fg = colors.black, bg = colors.purple, gui = "bold" } },
		replace = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
		inactive = {
			a = { fg = colors.fg, bg = colors.bg },
			b = { fg = colors.fg, bg = colors.bg },
			c = { fg = colors.fg, bg = colors.bg },
		},
	}
end
