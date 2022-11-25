-- vim.g.markdown_fenced_languages = { "python", "cpp", "lua", "javascript" }
local custom_options = function()
	local custom_options = {
		syntax = "enable",
		relativenumber = true,
		smartcase = true,
		fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
		foldcolumn = "1",
		foldlevel = 99,
		foldenable = true,
		mousemodel = "extend",
		cmdheight = 1,
		timeoutlen = 100,
		-- title = false
	}
	for k, v in pairs(custom_options) do
		vim.opt[k] = v
	end
end

custom_options()

-- symbols-outline
vim.cmd(
	"hi FocusedSymbol term=italic,bold cterm=italic ctermbg=yellow ctermfg=darkblue gui=bold,italic guibg=#164449 guifg=#c9d1d9"
)
