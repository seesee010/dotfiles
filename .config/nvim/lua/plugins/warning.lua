local conf = {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- war vorher leer "" -- das wäre auch ein Problem gewesen
    priority = 1000,
}
conf.config = function()
    require("tiny-inline-diagnostic").setup({
        options = {
            multilines = {
                enabled = true,
                always_show = true,
                severity = { vim.diagnostic.severity.ERROR },
            },
        },
    })
    vim.diagnostic.config({ virtual_text = false })
end
return conf
