return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- STARTUP TIME --
		use("lewis6991/impatient.nvim")

		use({
			"nathom/filetype.nvim",
		})

		-- SYNTAX HIGHLIGHT --
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
			config = function()
				require("config.treesitter")
			end,
		})

		-- LSP --
		use({
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup()
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("config.lspconfig")
			end,
		})
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("config.lsp_signature")
			end,
		})

		-- COMPLETION --
		use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use({
			"hrsh7th/cmp-cmdline",
			config = function()
				require("config.cmdline")
			end,
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = { "onsails/lspkind.nvim" },
			config = function()
				require("config.cmp")
			end,
		})

		-- Autocompletion plugin
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })
			end,
		}) -- Snippets plugin
		use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
		use({
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		})

		-- FINDER --
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { { "nvim-lua/plenary.nvim" } },
			config = function()
				require("config.telescope")
			end,
		})

		-- FORMATTING --
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("config.null_ls")
			end,
		})

		-- STATUSLINE --
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("config.lualine")
			end,
		})

		-- EDITING
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- FILE EXPLORER --
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
		})

		-- KEYBINDINGS --
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})

		-- GIT
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- COLORSCHEME --
		use({
			"folke/tokyonight.nvim",
			config = function()
				require("config.tokyonight")
			end,
		})
	end,

	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
