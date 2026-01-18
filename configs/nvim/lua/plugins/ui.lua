return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "powerline",
        options = {
          multilines = {
            enabled = true,
            always_show = true,
          },
          break_line = {
            enabled = false,
            after = 20,
          },
          overflow = {
            mode = "wrap",
            padding = 8,
          },
          show_all_diags_on_cursorline = true,
          enable_on_insert = false,
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      progress = {
        suppress_on_insert = true,
      },
      notification = {
        override_vim_notify = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      win = {
        border = "single", -- Options: "single", "double", "solid", "rounded", "none"
      },
    },
  },
}
