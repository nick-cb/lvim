-- @Keymappings

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
local which_key = lvim.builtin.which_key
which_key.mappings["w"] = {
	name = "+Worktree",
	c = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "change worktree" },
	n = { "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "create worktree" },
}
which_key.mappings.d = { "<cmd>DBUIToggle<cr>", "open dadui" }
which_key.mappings.b.d = { "<cmd>bdelete!<cr>", "delte buffer" }
which_key.mappings["t"] = {
	name = "+Terminal",
	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
	t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
}

which_key.mappings.s.s = {
	"<cmd>Telescope current_buffer_fuzzy_find fuzzy=false<cr>",
	"Search text curren buffer",
}

which_key.on_config_done = function(_which_key)
	_which_key.register({
		b = {
			h = { ":BufferLineCloseLeft<cr>", "Close all to the left" },
			l = {
				":BufferLineCloseRight<cr>",
				"Close all to the right",
			},
		},
	}, {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = false,
		noremap = true,
		nowait = true,
	})
end

lvim.builtin.which_key.mappings["<TAB>"] = { "<cmd>lua require('telescope-tabs').list_tabs()<cr>", "list tabs" }
lvim.builtin.which_key.mappings.g.d = { "<cmd>lua require('user.telescope').compare_revision()<cr>", "git diff" }
