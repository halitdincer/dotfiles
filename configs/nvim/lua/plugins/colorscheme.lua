return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        neo_tree = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
        indent_blankline = { enabled = true },
        mason = true,
        lualine = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
