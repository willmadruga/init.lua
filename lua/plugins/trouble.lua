return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

      local wk = require("which-key")
      wk.register({
        ["<leader>x"] = { name = "+trouble" },
      })


    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = 'Toggle' })

    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
      { desc = 'Workspace Diagnostics' })

    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
      { desc = 'Document Diagnostics' })

    vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = 'Quick Fix' })
    vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = 'Loclist' })
    -- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = 'LSP References' })
  end
}
