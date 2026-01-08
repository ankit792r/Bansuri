return {
  "saghen/blink.cmp",
  opts = {
    snippets = {
      preset = "default",
    },

    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },

      menu = {
        border = vim.o.winborder,
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
        show_with_menu = true,
      },
    },

    signature = { enabled = true },
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
    },
  },
}
