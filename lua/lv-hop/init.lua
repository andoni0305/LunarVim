require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
vim.api.nvim_set_keymap('n', 's', ":HopWord<cr>", {noremap = true, silent = true})
