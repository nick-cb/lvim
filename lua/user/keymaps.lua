require("user.which-key")

lvim.keys.normal_mode = {
	["<C-s>"] = ":SymbolsOutline<cr>",
	["<S-L>"] = ":BufferLineCycleNext<cr>",
	["<S-H>"] = ":BufferLineCyclePrev<cr>",
  ["<C-j>"] = "<C-w><C-w>",
  ["<C-k>"] = "<C-w><S-w>",
	["vv"] = "V",
	["V"] = "v$",
}

lvim.keys.insert_mode = {
	[","] = ",<c-g>u",
	["."] = ".<c-g>u",
	["!"] = "!<c-g>u",
	["?"] = "?<c-g>u",
	[";"] = ";<c-g>u",
	["<space>"] = "<space><c-g>u",
}
