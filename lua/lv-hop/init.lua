local hop = require('hop')

hop.setup({})

vim.api.nvim_set_keymap('n', 's', ":HopWord<cr>", {noremap = true, silent = true})
