vim.cmd('let g:nvcode_termcolors=256')

vim.cmd('colorscheme ' .. O.colorscheme)
-- background transparency
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
