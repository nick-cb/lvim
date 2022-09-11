-- vim.g.markdown_fenced_languages = { "python", "cpp", "lua", "javascript" }
local custom_options = function()
	local custom_options = {
		relativenumber = true,
		smartcase = true,
		fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
		foldcolumn = "1",
    foldlevel = 99,
    foldenable = true,
    -- title = false
	}
	for k, v in pairs(custom_options) do
		vim.opt[k] = v
	end
end

custom_options()

vim.cmd([[
  autocmd BufWinEnter *     :set nofoldenable
  autocmd BufWinEnter *     :highlight IndentBlanklineContextChar guifg=#768390 gui=nocombine
  autocmd BufWinEnter *     :highlight IndentBlanklineChar guifg=#373e47 gui=nocombine
  noremap <TAB> :tabnext<cr>
  noremap <S-TAB> :tabprevious<cr>
  nnoremap vv V
  nnoremap V v$
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
  inoremap ; ;<c-g>u
  inoremap <space> <space><c-g>u
  nnoremap <C-j> <C-w><C-w>
  nnoremap <C-k> <C-w><S-w>
]])
