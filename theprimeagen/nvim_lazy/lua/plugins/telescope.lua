return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- or use branch = '0.1.x' depending on your preference
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end) -- Added the missing 'end' here
  end -- Added the missing 'end' here for the config function
} -- Added the missing closing bracket for the return table
