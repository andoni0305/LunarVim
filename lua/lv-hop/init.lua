local M = {}

M.config = function()
    require('hop').setup({})
    vim.api.nvim_set_keymap('n', 's', ":HopWord<cr>", {silent = true})
end

return M
