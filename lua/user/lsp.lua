lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.update_in_insert = false
lvim.lsp.automatic_servers_installation = false
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
-- @Lsp
-- lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- You are now capable!
capabilities.textDocument.colorProvider = true
local root_pattern = require("lspconfig").util.root_pattern
require("lvim.lsp.manager").setup("tailwindcss", {
	filetypes = { "typescriptreact", "typescript", "html", "css", "scss" },
	root_dir = require("lspconfig").util.root_pattern("tailwind.config.js"),
	-- on_attach = function(_, bufnr)
	-- 	require("document-color").buf_attach(bufnr)
	-- end,
})
require("lvim.lsp.manager").setup("angularls", {
	root_dir = require("lspconfig").util.root_pattern("angular.json"),
})
require("lvim.lsp.manager").setup("dartls", {
	root_dir = require("lspconfig").util.root_pattern("pubspec.yaml"),
})
-- require("lvim.lsp.manager").setup("emmet_ls", {
-- 	root_dir = require("lspconfig").util.root_pattern(".git"),
-- })
require("lvim.lsp.manager").setup("prismals", {
	-- filetypes = { "typescriptreact", "typescript" },
	root_dir = require("lspconfig").util.root_pattern(".git"),
})
-- require("lvim.lsp.manager").setup("tsserver", {
-- 	cmd = {
-- 		"NODE_OPTIONS=--max-old-space-size=512",
-- 		"typescript-language-server",
-- 		"--stdio",
-- 		"--abc",
-- 	},
-- 	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
-- 	init_options = {
-- 		hostInfo = "neovim",
-- 	},
-- 	root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
-- })
-- disable tsserver formatting
lvim.lsp.on_attach_callback = function(client, _)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
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

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
