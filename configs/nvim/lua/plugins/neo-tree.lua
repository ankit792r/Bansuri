return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,

      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        group_empty_dirs = true,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
    })
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left reveal<CR>", {})
    vim.keymap.set("n", "<leader>s", ":Neotree git_status toggle float<CR>", {})
    vim.keymap.set("n", "<leader>bb", ":Neotree buffers reveal float<CR>")
  end,
}
