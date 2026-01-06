return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })

      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    opts = function(_)
      local fzf = require("fzf-lua")
      local config = fzf.config

      config.defaults.keymap.fzf["alt-j"] = "down"
      config.defaults.keymap.fzf["alt-k"] = "up"
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = {
        enabled = true,
        only_scope = false,
        animate = {
          enabled = vim.fn.has("nvim-0.10") == 1,
          style = "out",
          easing = "linear",
        duration = {
            step = 20, -- ms per step
            total = 500, -- maximum duration
          },
        },
      },
      input = { enabled = false },
      picker = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },
}
