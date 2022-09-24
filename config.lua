lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "darkplus"
lvim.builtin.notify.active = true
lvim.builtin.notify.opts = {
	timeout = 1500,
}

require("options")
require("user.lsp")
require("user.mapping")
require("user.nvimtree")
require("user.terminal")
require("user.bufferline")
require("user.treesitter")
require("user.telescope")
require("user.snippet")
require("user.web-devicon")
require("user.lualine")
-- require("user.bookmark")
require("user.worktrees")
require("user.alpha")

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
	-- {
	-- 	"Nash0x7E2/awesome-flutter-snippets",
	-- 	ft = { "dart" },
	-- },
	{
		"iamcco/markdown-preview.nvim",
		run = { "cd app && yarn install" },
		ft = { "markdown" },
	},
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		-- require("github-theme").setup({
	-- 		-- 	theme_style = "dark_default",
	-- 		-- 	function_style = "bold",
	-- 		-- })
	-- 	end,
	-- },
	{ "romainl/vim-cool" },
	{ "ThePrimeagen/git-worktree.nvim" },
	{
		"j-hui/fidget.nvim",
		config = function()
			require("user.fidget_spinner").config()
		end,
	},
	{ "kristijanhusak/vim-dadbod-completion" },
	{
		"kristijanhusak/vim-dadbod-ui",
		cmd = {
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUI",
			"DBUIFindBuffer",
			"DBUIRenameBuffer",
		},
		requires = {
			{
				"tpope/vim-dadbod",
				opt = true,
			},
		},
		opt = true,
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
	{ "markonm/traces.vim" },
	{ "dart-lang/dart-vim-plugin" },
	{
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("user.refactoring").config()
		end,
	},
	-- { "MattesGroeger/vim-bookmarks" },
	-- { "tom-anders/telescope-vim-bookmarks.nvim" },
	{
		"kevinhwang91/nvim-ufo",
		config = function()
			require("ufo").setup({
        require("user.ufo").config()
			})
		end,
		requires = "kevinhwang91/promise-async",
	},
	{
		"NguyenHungViCb/symbols-outline.nvim",
		-- "simrat39/symbols-outline.nvim",
		-- "mxsdev/symbols-outline.nvim"
		config = function()
			require("symbols-outline").setup({
				-- auto_preview = true,
				autofold_depth = 3,
				auto_unfold_hover = true,
			})
		end,
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
	{ "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" },
	-- { "hrsh7th/cmp-emoji" },
	{ "alaviss/nim.nvim", ft = "nim" },
	-- {
	-- 	"mrshmllow/document-color.nvim",
	-- 	config = function()
	-- 		require("document-color").setup({
	-- 			mode = "background",
	-- 		})
	-- 	end,
	-- },
}
