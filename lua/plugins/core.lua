return {
	{ "folke/lazy.nvim", version = false },
	{ "LazyVim/LazyVim", version = false },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
		local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
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

	{ "williamboman/mason.nvim" },

	{
		"dundalek/lazy-lsp.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("lazy-lsp").setup {}
		end
	},


}
