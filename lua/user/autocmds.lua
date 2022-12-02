-- vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd("!alacritty msg config window.padding.y=15 window.padding.x=15")
-- 	end,
-- })

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

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.tsx", "*.ts", "*.js", "*.jsx" },
  callback = function()
    vim.api.nvim_create_user_command(
      "TypescriptAddMissingImports",
      "lua require('typescript').actions.addMissingImports()",
      {}
    )
    vim.api.nvim_create_user_command(
      "TypescriptOrganizeImports",
      "lua require('typescript').actions.organizeImports()",
      {}
    )
    vim.api.nvim_create_user_command(
      "TypescriptRemoveUnused",
      "lua require('typescript').actions.removeUnused()",
      {}
    )
    vim.api.nvim_create_user_command("TypescriptFixAll", "lua require('typescript').actions.fixAll()", {})
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  pattern = "*",
  callback = function()
    local saved_tab = vim.fn.tabpagenr()
    print(saved_tab)
    vim.cmd('tabdo wincmd=')
    vim.cmd('tabnext ' .. saved_tab)
  end
})
