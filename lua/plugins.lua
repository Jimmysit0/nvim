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
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme tokyonight")
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
	}
}
