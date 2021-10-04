local home_dir = vim.loop.os_homedir()
local utils = require "utils"

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
    c = {
      formatters = {
        -- {
        --   exe = "clang_format",
        --   args = {},
        -- },
        -- {
        --   exe = "uncrustify",
        --   args = {},
        -- },
      },
      linters = {},
    },
    css = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = { {
        exe = "stylelint",
        args = {},
      } },
    },
    less = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
    },
    dockerfile = {
      formatters = {},
      linters = {},
    },
    elixir = {
      formatters = {
        -- {
        --   exe = "mix",
        --   args = {},
        -- },
      },
      linters = {},
    },
    go = {
      formatters = {
        -- {
        --   exe = "gofmt",
        --   args = {},
        -- },
        -- {
        --   exe = "goimports",
        --   args = {},
        -- },
        -- {
        --   exe = "gofumpt",
        --   args = {},
        -- },
      },
      linters = {},
    },
    graphql = {
      formatters = {},
      linters = {},
    },
    html = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
    },
    java = {
      formatters = {
        -- {
        --   exe = "clang_format",
        --   args = {},
        -- },
        -- {
        --   exe = "uncrustify",
        --   args = {},
        -- },
      },
      linters = {},
    },
    json = {
      formatters = {
        -- {
        --   exe = "json_tool",
        --   args = {},
        -- },
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
    },
    lua = {
      formatters = {
        {
          exe = "stylua",
          args = {},
        },
        -- {
        --   exe = "lua_format",
        --   args = {},
        -- },
      },
      linters = {
        {
          exe = "luacheck",
          args = {},
        },
      },
    },
    javascript = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      -- @usage can be {"eslint"} or {"eslint_d"}
      linters = {
        {
          exe = "eslint_d",
          args = {},
        },
      },
    },
    javascriptreact = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {
        {
          exe = "eslint_d",
          args = {},
        },
      },
    },
    python = {
      formatters = {
        -- {
        --   exe = "yapf",
        --   args = {},
        -- },
        -- {
        --   exe = "isort",
        --   args = {},
        -- },
      },
      linters = {},
    },
    ruby = {
      formatters = {
        -- {
        --   exe = "rufo",
        --   args = {},
        -- },
      },
      linters = {},
    },
    rust = {
      formatters = {
        -- {
        --   exe = "rustfmt",
        --   args = {},
        -- },
      },
      linters = {},
    },
    sh = {
      -- formatters = {
      --   {
      --     exe = "shfmt",
      --     args = {},
      --   },
      -- },
      linters = {
        {
          exe = "shellcheck",
          args = {},
        },
      },
    },
    svelte = {
      formatters = {},
      linters = {},
    },
    tailwindcss = {},
    terraform = {
      formatters = {
        -- {
        --   exe = "terraform_fmt",
        --   args = {},
        -- },
      },
      linters = {},
    },
    typescript = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
      },
      linters = {
        {
          exe = "eslint_d",
          args = {},
        },
      },
    },
    typescriptreact = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
      },
      -- @usage can be {"eslint"} or {"eslint_d"}
      linters = {
        {
          exe = "eslint_d",
          args = {},
        },
      },
    },
    vim = {
      formatters = {},
      linters = {},
    },
    vue = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
      },
      linters = {},
    },
    yaml = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
    },
  },
}
