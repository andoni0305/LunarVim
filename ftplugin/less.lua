-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
    on_attach = require'lsp'.common_on_attach
}

if O.lang.css.autoformat then
    require('lv-utils').define_augroups({
        _css_autoformat = {
            {
                'BufWritePre', '*.css',
                'lua vim.lsp.buf.formatting_sync(nil, 1000)'
            }
        },
        _less_autoformat = {
            {
                'BufWritePre', '*.less',
                'lua vim.lsp.buf.formatting_sync(nil, 1000)'
            }
        },
        _sass_autoformat = {
            {
                'BufWritePre', '*.scss',
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

if O.lang.css.formatter == 'prettier' then table.insert(tsserver_args, prettier) end

if O.lang.css.linter == 'eslint' then table.insert(tsserver_args, eslint) end

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"less"},
    settings = {rootMarkers = {".git/"}, languages = {less = {prettier}}}
}
