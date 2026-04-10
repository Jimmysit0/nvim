return {
    -- === Essentials ===
    {"nvim-lua/plenary.nvim"},

    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    -- File tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    
    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
             require('lsp')
        end
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip"
        }
    },

    -- Theme
    {
        "wtfox/jellybeans.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme jellybeans")
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    
    -- Discord rich presence
	{
  		'vyfor/cord.nvim',
  		build = ':Cord update',
  		-- opts = {}
	},


	-- Rainbow parens	
	{
  		"hiphish/rainbow-delimiters.nvim",
	},

	-- Bar/Modeline	
	{
	  "nvim-lualine/lualine.nvim",
	  dependencies = { "nvim-tree/nvim-web-devicons" }
	},

	-- Icons
	{
	  "nvim-tree/nvim-web-devicons",
	  lazy = true
	}

}
