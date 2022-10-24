vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
	pattern = "*",
	callback = function()
		vim.cmd("!alacritty msg config window.padding.y=15 window.padding.x=15")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("set nofoldenable")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("set nofoldenable")
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd("highlight IndentBlanklineChar guifg=#373e47 gui=nocombine")
-- 	end,
-- })
