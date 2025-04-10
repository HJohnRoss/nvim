return {
	{ "folke/lazy.nvim", version = false },
	{ "LazyVim/LazyVim", version = false },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function() 
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c_sharp", "c" }, -- Fix: Remove extra curly braces
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},

	{
		"hrsh7th/nvim-cmp", 
		dependencies = { "saadparwaiz1/cmp_luasnip", },
		config = require("plugins.overrides.autocompletions").cmpsetup,
	},
	{ "hrsh7th/cmp-buffer",  },
	{ "hrsh7th/cmp-path",  },
	{ "hrsh7th/cmp-cmdline",  },
	{ "hrsh7th/cmp-nvim-lua", },
	{
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
    end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "omnisharp" } -- Ensure Omnisharp is installed
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			
			lspconfig.omnisharp.setup({
				cmd = { "C:/Users/rossj/omnisharp-win-x64/OmniSharp.exe" },
				enable_roslyn_analyzers = true,
				organize_imports_on_format = true,
				enable_import_completion = true,
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").handler,
				},
			})

			-- Global LSP keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},

	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		lazy = false,
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("dap").adapters.netcoredbg = {
				type = "executable",
				command = "netcoredbg",
				args = { "--interpreter=vscode" },
			}
		end
	},
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"Issafalcon/neotest-dotnet",
		dependencies = { "nvim-neotest/neotest" },
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-dotnet")({
						dap = { justMyCode = false },
					}),
				},
			})
		end,
	},

	{"jlcrochet/vim-razor"},
	{ "Hoffs/omnisharp-extended-lsp.nvim", lazy = true},
	{
	  "Issafalcon/neotest-dotnet",
	}
}
