if not require("lv-utils").check_lsp_client_active "cssls" then
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

  O.formatters.filetype["less"] = Prettier

  require("formatter.config").set_defaults {
    logging = false,
    filetype = O.formatters.filetype,
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- npm install -g vscode-css-languageserver-bin
  require("lspconfig").cssls.setup {
    cmd = {
      "node",
      DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
      "--stdio",
    },
    on_attach = require("lsp").common_on_attach,
    capabilities = capabilities,
  }
end

vim.cmd "setl ts=2 sw=2"
