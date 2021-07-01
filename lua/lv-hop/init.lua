local M = {}

M.config = function()
    require('hop').setup({})
    vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_words()<cr>",
                            {silent = true})
    vim.api.nvim_set_keymap('v', 's', "<cmd>lua require'hop'.hint_words()<cr>",
                            {silent = true})
end

return M
