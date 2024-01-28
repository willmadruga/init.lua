return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      local wk = require("which-key")

      wk.register({
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>s"] = { name = "+search" },
      })

      vim.keymap.set('n', '<leader><leader>', builtin.commands, { desc = 'Commands'})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files'})
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = 'Find Recent'})
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = 'Find Git files'})

      vim.keymap.set('n', '<leader>bb', builtin.buffers, {desc = 'List Buffers'})
      vim.keymap.set('n', '<leader>bt', builtin.current_buffer_tags, {desc = 'Buffer Tags'})

      vim.keymap.set('n', '<leader>sh', builtin.search_history, {desc = 'Search History'})
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, {desc = 'Search Word under cursor'})
      vim.keymap.set('n', '<leader>ss', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, {desc = 'Search String'})

      vim.keymap.set('n', '<leader>h', builtin.help_tags, {desc = 'Help Tags'})
    end
  },
}
