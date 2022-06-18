-- remap to open the Telescope refactoring menu in visual mode
local M = {}
M.config = function()
	vim.api.nvim_set_keymap(
		"v",
		"<leader>rr",
		"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
		{ noremap = true }
	)
end

return M
