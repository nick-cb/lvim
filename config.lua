-- @General
lvim.builtin.lualine.options = {
	theme = "github_dark_default",
}
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "github_dark_default"
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.update_in_insert = false
lvim.lsp.automatic_servers_installation = false

-- @Formatter
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettierd",
	},
})

-- @Lsp
-- lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")
require("lvim.lsp.manager").setup("tailwindcss", {
	filetypes = { "typescriptreact", "typescript", "html", "css", "scss" },
	root_dir = require("lspconfig").util.root_pattern("tailwind.config.js"),
})
require("lvim.lsp.manager").setup("angularls", {
	root_dir = require("lspconfig").util.root_pattern("angular.json"),
})
require("lvim.lsp.manager").setup("dartls", {
	root_dir = require("lspconfig").util.root_pattern("pubspec.yaml"),
})
require("lvim.lsp.manager").setup("emmet_ls", {
	root_dir = require("lspconfig").util.root_pattern(".git"),
})
-- disable tsserver formatting
lvim.lsp.on_attach_callback = function(client, _)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

-- @Keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
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
-- lvim.builtin.which_key.mappings["t"] = {
-- 	name = "+Latex",
-- 	c = { "<cmd>lua CompileLatex()<cr>", "compile" },
-- 	s = { "<cmd>lua StartCompileOnSave()<cr>", "compile on save" },
-- 	S = { "<cmd>lua StopCompileOnSave()<cr>", "stop compile on save" },
-- }
lvim.builtin.which_key.mappings.t = { "<cmd>NvimTreeRefresh<cr>", "refresh tree" }
lvim.builtin.which_key.mappings["w"] = {
	name = "+Worktree",
	c = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "change worktree" },
	n = { "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "create worktree" },
}
lvim.builtin.which_key.mappings.d = { "<cmd>DBUIToggle<cr>", "open dadui" }
lvim.builtin.which_key.mappings.b.d = { "<cmd>bdelete!<cr>", "delte buffer" }

-- @Builtin
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.size = 15
lvim.builtin.terminal.direction = "horizontal"

-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
-- lvim.builtin.nvimtree.setup.renderer.icons.glyphs.default = ""
lvim.builtin.nvimtree.show_icons.git = 1
lvim.use_icons = true

lvim.builtin.bufferline.active = true

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag = { enable = true }
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
	"html",
	"scss",
}

require("telescope").load_extension("git_worktree")
lvim.builtin.telescope.defaults.file_ignore_patterns = {
	"vendor/*",
	"%.lock",
	"__pycache__/*",
	"%.sqlite3",
	"%.ipynb",
	"node_modules/*",
	"%.jpg",
	"%.jpeg",
	"%.png",
	"%.svg",
	"%.otf",
	"%.ttf",
	".git/",
	"%.webp",
	".dart_tool/",
	".github/",
	".gradle/",
	".idea/",
	".settings/",
	".vscode/",
	"__pycache__/",
	"build/",
	"env/",
	"gradle/",
	"node_modules/",
	"target/",
	"%.pdb",
	"%.dll",
	"%.class",
	"%.exe",
	"%.cache",
	"%.ico",
	"%.pdf",
	"%.dylib",
	"%.jar",
	"%.docx",
	"%.met",
	"smalljre_*/*",
	".vale/",
	"%.burp",
	"%.mp4",
	"%.mkv",
	"%.rar",
	"%.zip",
	"%.7z",
	"%.tar",
	"%.bz2",
	"%.epub",
	"%.flac",
	"%.tar.gz",
}

-- @Additional Plugins
lvim.plugins = {
	-- {
	-- 	"akinsho/nvim-bufferline.lua",
	-- 	config = function()
	-- 		require("user.bufferline").config()
	-- 	end,
	-- },
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
	{
		"Nash0x7E2/awesome-flutter-snippets",
		ft = { "dart" },
	},
	{ "iamcco/markdown-preview.nvim", run = { "cd app && yarn install" }, ft = { "markdown" } },
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				theme_style = "dark_default",
				function_style = "bold",
			})
		end,
	},
	{ "romainl/vim-cool" },
	{ "ThePrimeagen/git-worktree.nvim" },
	{
		"j-hui/fidget.nvim",
		config = function()
			require("user.fidget_spinner").config()
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
	},
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
}

require("options")
require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		"/home/nick/.local/share/lunarvim/site/pack/packer/opt/vscode-es7-javascript-react-snippets/",
	},
})
require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		"/home/nick/.local/share/lunarvim/site/pack/packer/opt/awesome-flutter-snippets/",
	},
})

require("user.worktrees")
require("user.dwm")
