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
