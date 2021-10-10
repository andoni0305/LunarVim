local home_dir = vim.loop.os_homedir()
local utils = require "utils"

-- local prettier = { exe = "prettier" }
-- local stylelint = { exe = "stylelint" }
-- local eslint_d = { exe = "eslint_d" }
-- local stylua = { exe = "stylua" }
-- local luacheck = { exe = "luacheck" }
-- local shellcheck = { exe = "shellcheck" }

lvim = {
  leader = "space",
  colorscheme = "onedarker",
  line_wrap_cursor_movement = true,
  transparent_window = false,
  format_on_save = true,
  vsnip_dir = utils.join_paths(home_dir, ".config", "snippets"),
  database = { save_location = utils.join_paths(home_dir, ".config", "lunarvim_db"), auto_execute = 1 },
  keys = {},

  builtin = {},

  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "warn",
    viewer = {
      ---@usage this will fallback on "less +F" if not found
      cmd = "lnav",
      layout_config = {
        ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "horizontal",
        open_mapping = "",
        size = 40,
        float_opts = {},
      },
    },
  },
  plugins = {
    -- use config.lua for this not put here
  },

  autocommands = {},

  lang = {

--     css = {
--       formatters = { prettier },
--       linters = { stylelint },
--     },

--     less = {

--       formatters = { prettier },
--       linters = { stylelint },
--     },

--     scss = {
--       formatters = { prettier },
--       linters = { stylelint },
--     },

--     html = {
--       formatters = { prettier },
--     },
--     json = {
--       formatters = { prettier },
--     },

--     lua = {
--       formatters = { stylua },
--       linters = { luacheck },
--     },

--     -- sh.formatters = { { exe = "shfmt" } }
--     sh = {

--       linters = { shellcheck },
--     },

--     javascript = {
--       formatters = { prettier },
--       -- @usage can be {"eslint"} or {"eslint_d"}
--       linters = { eslint_d },
--     },

--     javascriptreact = {
--       formatters = { prettier },
--       linters = { eslint_d },
--     },

--     typescript = {
--       formatters = { prettier },
--       linters = { eslint_d },
--     },

--     typescriptreact = {
--       formatters = { prettier },
--       linters = { eslint_d },
--     },

--     yaml = {
--       formatters = { prettier },
--     },
  },
}
