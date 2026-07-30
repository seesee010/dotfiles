local theme_spec = {
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme moonfly")

    -- Transparent background (relies on terminal transparency/blur).
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  end,
}

return theme_spec
