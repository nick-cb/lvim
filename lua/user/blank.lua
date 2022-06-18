local M = {}

M.config = function()
	local status_ok, blankline = pcall(require, "blankline")
	if not status_ok then
		return
	end

	blankline.setup({
		-- show_end_of_line = true,
		buftype_exclude = { "terminal" },
		filetype_exclude = { "dashboard", "packer" },
		show_current_context = true,
		show_trailing_blankline_indent = false,
		context_patterns = {
			"^class",
			"^function",
			"^method",
			"^if",
			"^dictionary",
			"^for",
			"^return",
			"^html_tag",
			"^table",
			"^jsx_fragment",
			"^jsx_element",
			"^element",
			"^lexical_declaration",
			"^jsx_expression",
			"^block",
			"^keyframe_block_list",
			"^jsx_self_closing_element",
			"^expression_statement",
			"^arrow_function",
			"^pair",
			"^object",
		},
		filetype = { "typescriptreact", "lua", "python", "dart" },
		use_treesitter = true,
		indent_level = 50,
	})
end

return M
