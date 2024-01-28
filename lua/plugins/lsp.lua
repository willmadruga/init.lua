-- See for configs
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },

  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "tsserver" },
    })

    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    lspconfig.tsserver.setup({})

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local wk = require("which-key")
        wk.register({
          ["<leader>g"] = { name = "+goto" },
          ["<leader>c"] = { name = "+code" },
          ["<leader>w"] = { name = "+workspace" },
        })

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Go to Declaration' })
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'Go to References' })
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'Go to Implementation' })
        vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'Go to Type' })

        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
        vim.keymap.set('n', '<leader>ck', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Signature' })
        vim.keymap.set('n', '<leader>cK', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Signature Help' })
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code Action' })
        vim.keymap.set('n', '<leader>cf', function()
          vim.lsp.buf.format { async = true }
        end, { buffer = ev.buf, desc = 'Format' })

        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
          { buffer = ev.buf, desc = 'Add Workspace Folder' })
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
          { buffer = ev.buf, desc = 'Remove Workspace Folder' })
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = 'List Workspace Folders' })
      end,
    })
  end
}
