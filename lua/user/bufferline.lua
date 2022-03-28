local M = {}

M.config = function()
	vim.cmd([[
    nnoremap <silent><S-l> :BufferLineCycleNext<CR>
    nnoremap <silent><S-h> :BufferLineCyclePrev<CR>
    nnoremap <silent><leader>bd :bdelete<CR>
    nnoremap <silent><leader>bc :BufferLinePickClose<CR>
  ]])
	require("bufferline").setup({
		options = {
      numbers = function (opts)
        return string.format('%s.%s.',opts.ordinal,opts.id)
      end,
			close_command = "bdelete!",
			-- diagnostics = "nvim_lsp",
			custom_filter = function(buf_number)
				if vim.bo[buf_number].filetype ~= "dap-repl" then
					return true
				end
			end,
		},
	})
end

return M
