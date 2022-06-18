lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.update_in_insert = false
lvim.lsp.automatic_servers_installation = false

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
require("lvim.lsp.manager").setup("prismals", {
	-- filetypes = { "typescriptreact", "typescript" },
	root_dir = require("lspconfig").util.root_pattern(".git"),
})
-- disable tsserver formatting
lvim.lsp.on_attach_callback = function(client, _)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

-- @Formatter
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettierd",
	},
})
