if require("lv-utils").check_lsp_client_active "jsonls" then
  return
end

vim.cmd "let proj = FindRootDirectory()"
print(vim.api.nvim_get_var "proj")
local root_dir = vim.api.nvim_get_var "proj"
local Prettier = {
  -- vim.cmd "let root_dir "
  -- prettier
  function()
    return {
      exe = root_dir .. "/node_modules/.bin/prettier",
      --  TODO: append to this for args don't overwrite
      args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      stdin = true,
    }
  end,
}

O.formatters.filetype["json"] = Prettier

require("formatter.config").set_defaults {
  logging = false,
  filetype = O.formatters.filetype,
}
-- npm install -g vscode-json-languageserver
require("lspconfig").jsonls.setup {
  cmd = {
    "node",
    DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio",
  },
  on_attach = require("lsp").common_on_attach,

  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
      end,
    },
  },
}
