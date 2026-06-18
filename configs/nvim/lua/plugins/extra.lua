return {
  -- Fidget
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

  -- Nvim Highlight colors
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup()
    end,
  },

  -- mini-pick
  -- {
  --   'nvim-mini/mini.pick',
  --   version = '*',
  --   config = function()
  --     local pick = require("mini.pick")
  --     pick.setup({
  --       mappings = {
  --         move_down = '<C-j>',
  --         move_up   = '<C-k>',
  --         preview   = '<C-p>',
  --       },
  --       -- Window related options
  --       window = {
  --         config = nil,
  --
  --         prompt_prefix = '# ',
  --       },
  --     })
  --
  --     vim.keymap.set("n", "<leader><leader>", function()
  --       pick.builtin.files()
  --     end, { desc = "Find Files" })
  --
  --     vim.keymap.set("n", "<leader>fg", function()
  --       pick.builtin.grep_live()
  --     end, { desc = "Live Grep" })
  --
  --     vim.keymap.set("n", "<leader>fb", function()
  --       pick.builtin.buffers()
  --     end, { desc = "Buffers" })
  --
  --     vim.keymap.set("n", "<leader>fh", function()
  --       pick.builtin.help()
  --     end, { desc = "Help Tags" })
  --
  --     vim.keymap.set("n", "<leader>fr", function()
  --       pick.builtin.resume()
  --     end, { desc = "Resume Picker" })
  --   end
  -- },
}
