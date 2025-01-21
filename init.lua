require("config.lazy");
require("config.settings")


-- lsp setup
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").rust_analyzer.setup {}
