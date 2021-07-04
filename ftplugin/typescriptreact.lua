-- npm install -g typescript typescript-language-server
-- require'snippets'.use_suggested_mappings()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true;
-- local on_attach_common = function(client)
-- print("LSP Initialized")
-- require'completion'.on_attach(client)
-- require'illuminate'.on_attach(client)
-- end
require'lspconfig'.tsserver.setup {
    cmd = {
        DATA_PATH ..
            "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
        "--stdio"
    },
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },
    on_attach = require'lsp'.tsserver_on_attach,
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    root_dir = require('lspconfig/util').root_pattern("package.json",
                                                      "tsconfig.json",
                                                      "jsconfig.json", ".git"),
    settings = {documentFormatting = false},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = O.lang.tsserver.diagnostics.virtual_text,
                signs = O.lang.tsserver.diagnostics.signs,
                underline = O.lang.tsserver.diagnostics.underline,
                update_in_insert = true

            })
    }
}

if O.lang.tsserver.autoformat then
    require('lv-utils').define_augroups({
        _typescriptreact_autoformat = {
            {
                'BufWritePre', '*.tsx',
                'lua vim.lsp.buf.formatting_sync(nil, 1000)'
            }
        }
    })
end

vim.cmd("setl ts=2 sw=2")

local prettier = {
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local tsserver_args = {}

if O.lang.tsserver.formatter == 'prettier' then
    table.insert(tsserver_args, prettier)
end

if O.lang.tsserver.linter == 'eslint' then table.insert(tsserver_args, eslint) end

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"typescriptreact"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            typescript = tsserver_args,
            typescriptreact = tsserver_args
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            -- markdown = {markdownPandocFormat, markdownlint},
        }
    }
}
