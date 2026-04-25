-- Snacks indent highlight color
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#141414", nocombine = true })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#444444", nocombine = true })

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      matcher = {
        frecency = true,
      },
      layout = "new_layout",
      layouts = {
        new_layout = {
          layout = {
            box = "horizontal",
            border = "none",
            width = 0.8,
            height = 0.8,
            {
              box = "vertical",
              border = "none",
              gap = 0,
              {
                win = "input",
                height = 1,
                border = "single",
              },
              { win = "list", border = "single" },
            },
            {
              win = "preview",
              border = "single",
              width = 0.55,
            },
          },
        },
      },
    },
    indent = {
      enabled = true,
      only_scope = true,
      only_current = false,
      animate = { enabled = false },
      scope = {
        enabled = true,
        underline = false,
        only_current = true,
      },
      chunk = {
        enabled = true,
        only_current = true,
      },
    },
    words = {
      enabled = true,
    },
  },
  sort_lastused = false,
  win = {
    input = {
      keys = {
        ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
        ["<Esc>"] = "close",
      },
    },
    list = {
      keys = {
        ["dd"] = "bufdelete",
        ["<Esc>"] = "close",
      },
    },
  },

  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "open file picker"
    },

    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find Files",
    },

    {
      "<leader>ff",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find Files",
    },

    {
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
    },

    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },

    {
      "<leader>sw",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },

    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },

    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },

    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
  },
}
