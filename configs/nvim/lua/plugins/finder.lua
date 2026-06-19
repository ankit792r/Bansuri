return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        border  = "single",
        height  = 0.85,
        width   = 0.80,
        title   = false,
        preview = {
          title = false,
          border = "single",
          layout = "horizontal"
        }
      },

      keymap = {
        fzf = {
          ["ctrl-j"] = "down",
          ["ctrl-k"] = "up",
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", fzf.files, {
      desc = "Find files",
    })

    vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, {
      desc = "Live grep",
    })

    vim.keymap.set("n", "<leader>fb", fzf.buffers, {
      desc = "Buffers",
    })

    vim.keymap.set("n", "<leader>fh", fzf.help_tags, {
      desc = "Help tags",
    })

    vim.keymap.set("n", "<leader><leader>", fzf.oldfiles, {
      desc = "Find old files",
    })

    vim.keymap.set("n", "<leader>fv", function()
      fzf.blines()
    end, {
      desc = "Current buffer fuzzy find",
    })

    vim.keymap.set("n", "<leader>fr", function()
      fzf.resume()
    end, {
      desc = "Resume previous picker",
    })

    fzf.register_ui_select()
  end,
}
