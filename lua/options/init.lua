-- vim.g.markdown_fenced_languages = { "python", "cpp", "lua", "javascript" }
local custom_options = function()
	local custom_options = {
		relativenumber = true,
		smartcase = true,
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
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
]])

-- function MyTabLine()
-- 	local tabnrs = vim.api.nvim_list_tabpages()
-- 	local current_tab = vim.api.nvim_get_current_tabpage()
-- 	local tabstring = " "
-- 	for tabidx, tabnr in ipairs(tabnrs) do
-- 		local windownrs = vim.api.nvim_tabpage_list_wins(tabnr)
-- 		local bufcount = 0
-- 		tabstring = tabstring .. "%" .. tabidx .. "T" .. " " .. "%#TabNum#" .. tabidx
-- 		if current_tab == tabnr then
-- 			tabstring = tabstring .. "%#TabLineSel#"  .. "["
-- 		else
-- 			tabstring = tabstring .. "%#TabLine#"  .. "["
-- 		end
--     local idx=0
-- 		for _, windowid in ipairs(windownrs) do
--       idx=idx+1
-- 			local bufnr = vim.api.nvim_win_get_buf(windowid)
-- 			local bufname = vim.api.nvim_buf_get_name(bufnr)
-- 			local sep = "/"
-- 			local strlist = {}
-- 			local i = 0
-- 			for str in string.gmatch(bufname, "([^" .. sep .. "]+)") do
-- 				table.insert(strlist, str)
-- 				i = i + 1
-- 			end
-- 			if strlist[i] ~= nil then
--         if bufcount >=1 then
--           if string.find(strlist[i],"scss") or string.find(strlist[i],"css") then
--             goto continue
--           end
--         end
--         bufcount = bufcount + 1
-- 				tabstring = tabstring .. " " .. strlist[i]
-- 			end
--       if next(windownrs,idx)~=nil then
--         tabstring=tabstring .. "|"
--       end
-- 			::continue::
-- 		end
--     tabstring=tabstring.."]"
-- 	end
-- 	tabstring = tabstring .. "%T%#TabLineFill#%="
-- 	if vim.fn.tabpagenr("$") > 1 then
-- 		tabstring = tabstring .. "%999XX"
-- 	else
-- 		tabstring = tabstring .. "X"
-- 	end
-- 	return tabstring
-- end

-- vim.opt.showtabline = 2
-- vim.opt.tabline = "%!v:lua.MyTabLine()"
