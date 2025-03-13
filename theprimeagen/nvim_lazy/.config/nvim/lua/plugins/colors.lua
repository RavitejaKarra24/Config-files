return{
  "rose-pine/neovim",
  name = "rose-pine", -- name should be outside the config function if it's intended as a key for the plugin spec
  config = function()
    local color = "rose-pine" -- Default color if not specified elsewhere
    -- Use vim.cmd() for commands in newer Neovim versions
    vim.cmd("colorscheme " .. color)

    -- Set background to transparent for Normal and NormalFloat
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
