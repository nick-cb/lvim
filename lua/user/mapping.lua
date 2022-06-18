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
lvim.builtin.which_key.mappings["w"] = {
	name = "+Worktree",
	c = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "change worktree" },
	n = { "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "create worktree" },
}
lvim.builtin.which_key.mappings.d = { "<cmd>DBUIToggle<cr>", "open dadui" }
lvim.builtin.which_key.mappings.b.d = { "<cmd>bdelete!<cr>", "delte buffer" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Terminal",
	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
	t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
}
-- lvim.builtin.which_key.mappings["m"] = {
-- 	name = "+Bookmarks",
-- 	a = { "<cmd>Telescope vim_bookmarks all<cr>", "Show all" },
-- 	c = { "<cmd>Telescope vim_bookmarks current_file<cr>", "Show current" },
-- }
vim.api.nvim_set_keymap("n", "mm", ":BookmarkToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mi", ":BookmarkAnnotate<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mn", ":BookmarkNext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mp", ":BookmarkPrev<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mc", ":BookmarkClear<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mx", ":BookmarkClearAll<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ma", ":Telescope vim_bookmarks all<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mc", ":Telescope vim_bookmarks current_file<cr>", { noremap = true, silent = true })
