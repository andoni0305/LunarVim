-- vim.cmd('let g:nvcode_termcolors=256')

vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
-- vim.g.moonlight_italic_functions = true
-- vim.g.moonlight_italic_variables = true
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = true
vim.g.moonlight_disable_background = false

if O.colorscheme == 'moonlight' then
  require(O.colorscheme).set()
else
  vim.cmd('colorscheme ' .. O.colorscheme)
end
-- background transparency
if O.transparent_bg then
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
  vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
end
