-- TODO is there a lua native way to do this?
vim.cmd('colorscheme ' .. O.colorscheme)

-- background transparency
if O.transparent_bg then
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
  vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
end
