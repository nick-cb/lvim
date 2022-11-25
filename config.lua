lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "darkplus"
lvim.builtin.breadcrumbs.active = false
lvim.builtin.nvimtree.active = true
lvim.builtin.lir.active = false
lvim.builtin.alpha.active = false
lvim.builtin.indentlines.options.show_current_context = false
lvim.builtin.bufferline.options.close_command = "bdelete! %d"

require("user.options")
require("user.lsp")
require("user.keymaps")
require("user.nvimtree")
require("user.terminal")
require("user.bufferline")
require("user.treesitter")
require("user.telescope").setup()
require("user.snippet")
require("user.lualine")
require("user.worktrees")
require("user.alpha")
require("user.autocmds")
require("user.web-devicon")

lvim.plugins = {
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
			"sh",
			"config",
			"python",
      "php"
		},
		config = function()
			require("user.colorizer").config()
		end,
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
	{
		"iamcco/markdown-preview.nvim",
		run = { "cd app && yarn install" },
		ft = { "markdown" },
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return
			end
			telescope.load_extension("git_worktree")
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("user.fidget_spinner").config()
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("user.dress").config()
		end,
		event = "BufWinEnter",
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			require("user.substitue")
		end,
	},
	{ "tpope/vim-repeat" },
	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	config = function()
	-- 		require("user.refactoring").config()
	-- 	end,
	-- },
	{
		"nick-cb/symbols-outline.nvim",
		config = function()
			require("user.symbol-outline").config()
		end,
		cmd = "SymbolOutlineToggle",
	},
	{ "nvim-treesitter/playground" },
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppress_dirs = { "~/", "~/Projects" },
			})
		end,
	},
	{ "nick-cb/darkplus.nvim" },
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	},
	{
		"nick-cb/telescope-tabs",
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("user.telescope-tabs").config()
		end,
	},
	{ "tpope/vim-fugitive" },
	{ "rickhowe/diffchar.vim" },
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({})
		end,
		branch = "no-lspconfig",
		ft = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
	},
	{
		"lervag/vimtex",
		config = function()
			require("user.vimtex").setup()
		end,
		ft = { "tex" },
	},
	{ "markonm/traces.vim" },
}
