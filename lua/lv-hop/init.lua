local M = {}

M.config = function()
    vim.api.nvim_set_keymap('n', 's', ":HopWord<cr>", {silent = true})
end

return M
