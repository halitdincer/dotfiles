return {
  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
      })
    end,
  },

  -- Keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ win = { border = "rounded" } })
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>s", group = "split" },
        { "<leader>h", group = "hunk" },
        { "<leader>l", group = "lsp" },
      })
    end,
  },

  -- Easy commenting
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },

  -- Icons (used by neo-tree, lualine, etc.)
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
