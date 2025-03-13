return {
  -- This is just a placeholder to organize terminal settings
  "nvim-lua/plenary.nvim", -- Use an existing dependency
  config = function()
    -- Terminal keymappings and settings
    local terminal_settings = function()
      -- Open terminal in a horizontal split at the bottom
      vim.keymap.set("n", "<leader>th", ":split | terminal<CR>", { desc = "Open terminal in horizontal split" })
      
      -- Open terminal in a vertical split
      vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })
      
      -- Open terminal in current directory
      vim.keymap.set("n", "<leader>tt", ":term<CR>", { desc = "Open terminal in nvim" })
      
      -- Escape from terminal mode to normal mode
      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
      
      -- Set terminal window height
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.cmd("setlocal winfixheight")
          vim.cmd("setlocal winfixwidth")
          -- Auto enter insert mode when entering a terminal buffer
          vim.cmd("startinsert")
        end
      })
    end

    terminal_settings()
  end
}