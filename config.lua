lvim.builtin.lualine.options = {
	theme = "github_dark_default",
}
-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "github_dark_default"
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.update_in_insert = false

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "stylua", filetypes = { "lua" } },
	{
		exe = "prettier",
		filetypes = { "typescript", "typescriptreact", "html", "css", "scss", "javascript", "javascriptreact" },
	},
})
require("lvim.lsp.manager").setup("tailwindcss", {
	filetypes = { "typescriptreact", "typescript", "html" },
	root_dir = require("lspconfig").util.root_pattern("tailwind.config.js"),
})
require("lvim.lsp.manager").setup("texlab")
require("lvim.lsp.manager").setup("angularls", {
	root_dir = require("lspconfig").util.root_pattern("angular.json"),
})
require("lvim.lsp.manager").setup("dartls", {
	root_dir = require("lspconfig").util.root_pattern("pubspec.yaml"),
})

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }
function CompileLatex()
	vim.cmd([[
    silent! !pdflatex '%:p'
  ]])
end

function StartCompileOnSave()
	vim.cmd([[
    augroup CompileLatex
      autocmd BufWritePost *.tex silent! !pdflatex '%:p'
    augroup END
]])
end

function StopCompileOnSave()
	vim.cmd([[
    autocmd! CompileLatex
  ]])
end

lvim.builtin.which_key.mappings["t"] = {
	name = "+Latex",
	c = { "<cmd>lua CompileLatex()<cr>", "compile" },
	s = { "<cmd>lua StartCompileOnSave()<cr>", "compile on save" },
	S = { "<cmd>lua StopCompileOnSave()<cr>", "stop compile on save" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.size = 15
lvim.builtin.terminal.direction = "horizontal"

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.bufferline.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag = { enable = true }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
	{
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("user.bufferline").config()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		after = "nvim-treesitter",
		ft = { "html", "javascript", "markdown", "javascriptreact", "typescript", "typescriptreact" },
	},
	{
		"tpope/vim-surround",
		event = "BufRead",
	},
	{
		"norcalli/nvim-colorizer.lua",
		-- event = "BufRead",
		ft = {
			"yaml",
			"css",
			"html",
			"lua",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"dosini",
		},
		config = function()
			require("user.colorizer").config()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.blank").config()
		end,
		ft = { "typescriptreact", "python", "lua", "dart" },
	},
	{
		"unblevable/quick-scope",
		config = function()
			require("user.quick-scope")
		end,
	},
	{
		"metakirby5/codi.vim",
		cmd = "Codi",
	},
	{ "mg979/vim-visual-multi", branch = "master" },
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = { "yarn install --frozen-lockfile && yarn compile" },
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	{ "iamcco/markdown-preview.nvim", run = { "cd app && yarn install" }, ft = { "markdown" } },
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				theme_style = "dark_default",
        function_style	= "bold"
			})
		end,
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

require("options")
require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		"/home/nick/.local/share/lunarvim/site/pack/packer/opt/vscode-es7-javascript-react-snippets/",
	},
})
