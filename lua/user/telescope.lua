local M = {}

local mappings = function(actions)
	return {
		i = {
			["<C-j>"] = actions.move_selection_next,
			["<C-k>"] = actions.move_selection_previous,
			["<C-n>"] = actions.cycle_history_next,
			["<C-p>"] = actions.cycle_history_prev,
		},
		n = {
			["<C-j>"] = actions.move_selection_next,
			["<C-k>"] = actions.move_selection_previous,
		},
	}
end

M.setup = function()
	require("telescope").load_extension("git_worktree")
	-- require("telescope").load_extension("refactoring")
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
	lvim.builtin.telescope.defaults.mappings = mappings(require('telescope.actions'))
end

lvim.builtin.telescope.on_config_done = function()
	local ok_builtin, builtin = pcall(require, "telescope.builtin")
	local ok_actions, actions = pcall(require, "telescope.actions")
	local ok_state, actions_state = pcall(require, "telescope.actions.state")

	if ok_builtin and ok_actions and ok_state then
		M.compare_revision = function()
			builtin.git_bcommits({
				attach_mappings = function(prompt_bufnr, _)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = actions_state.get_selected_entry()
						print(vim.inspect(prompt_bufnr))
						vim.fn.execute("Gitsigns diffthis " .. selection.value)
					end)
					return true
				end,
			})
		end
	end
end

return M
