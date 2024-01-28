return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>g"] = { name = "+goto" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>w"] = { name = "+workspace" },
        ["<leader>x"] = { name = "+trouble" },
      })
    end
  },
}
