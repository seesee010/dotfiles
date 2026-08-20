-- All my remaps:
--
-- 'oe' -> '@', this is keyboard specific, i use a iso-de keyboard thats why
vim.keymap.set({'n', 'i', 'v'}, 'ö', '@')
vim.keymap.set({'n', 'v'}, '<Esc>', ':nohl<Esc>')

-- Because i use a iso-de keyboard:
vim.keymap.set({'o', 'x'}, 'iä', 'i{', { remap = true })
vim.keymap.set({'o', 'x'}, 'aä', 'a{', { remap = true })
vim.keymap.set({'o', 'x'}, 'iÄ', 'i}', { remap = true })
vim.keymap.set({'o', 'x'}, 'aÄ', 'a}', { remap = true })
vim.keymap.set({'i', 'n'}, 'ä', '{')
vim.keymap.set({'i', 'n'}, 'Ä', '}')
vim.keymap.set({'o', 'x'}, 'iü', 'i[', { remap = true })
vim.keymap.set({'o', 'x'}, 'aü', 'a[', { remap = true })
vim.keymap.set({'o', 'x'}, 'iÜ', 'i]', { remap = true })
vim.keymap.set({'o', 'x'}, 'aÜ', 'a]', { remap = true })
vim.keymap.set({'i', 'n'}, 'ü', '[')
vim.keymap.set({'i', 'n'}, 'Ü', ']')

vim.keymap.set({'n', 'i'}, '´', '~')

vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')

-- some minor changes, to center the following:
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- test
vim.keymap.set('n', '<leader>t', ':w\n')

-- more...
vim.keymap.set('n', 'gd', function ()
	vim.lsp.buf.definition()
end)

vim.keymap.set('n', 'gD', function ()
	vim.lsp.buf.declaration()
end)

-- vim.keymap.set('n', '<leader>rn', function () -- as this is already in nvim itself (grn) (v0.12+)
-- 	vim.lsp.buf.rename()
-- end)

-- diagnostic
vim.keymap.set('n', ']d', function ()
	vim.diagnostic.goto_prev()
end)

vim.keymap.set('n', '[d', function ()
	vim.diagnostic.goto_next()
end)

-- quickfix 
-- as this is already in nvim itself (grr) (v0.12+), if you would try 'gr' it would wait for you to press a further key, but this also means that on every 'gr' you have to wait a couple of seconds, so nvim register it as a seperate motion. so 'grr' would be faster.

-- vim.keymap.set('n', 'gr', function ()
--	vim.lsp.buf.references()
-- end)

vim.keymap.set('n', '<C-j>', ':cnext<CR>')
vim.keymap.set('n', '<C-k>', ':cprev<CR>')

-- You really don't have to do this, because it is not that important to see your references.
-- But if you want to see them, you can do this:
-- vim.keymap.set('n', '', ':copen<CR>')
vim.keymap.set('n', '<leader>q', ':cclose<CR>') -- you could also use ':q'
