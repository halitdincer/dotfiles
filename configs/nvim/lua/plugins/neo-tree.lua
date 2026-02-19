return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
    { "<leader>o", "<cmd>Neotree focus<CR>", desc = "Focus file tree" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = { width = 30 },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = { enabled = true },
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
    })
  end,
}
