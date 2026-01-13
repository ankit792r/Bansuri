return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "nvim-mini/mini.icons", enabled = false },
  { "trouble.nvim ", enabled = false },
  { "persistence.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
  { "lazygit", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.virtual_text = false
    end,
  },
}
