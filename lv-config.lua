--[[
O is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.auto_complete = true
O.colorscheme = "tokyonight"
-- O.transparent_window = true
O.auto_close_tree = 0
O.timeoutlen = 100
O.leader_key = " "
-- O.format_on_save = false

O.plugin.indent_line.active = true

O.dashboard.custom_header = {
  "              ^                      ", --
  "             /|\\                    ", --
  "            //|\\\\                  ", --
  "           ///|\\\\\\                ", --
  "          ////|\\\\\\\\              ", --
  "         /////|\\\\\\\\\\            ", --
  "        //////|\\\\\\\\\\\\          ", --
  "       ///////|\\\\\\\\\\\\\\        ", --
  "      ////////|\\\\\\\\\\\\\\\\      ", --
  "     /////////|\\\\\\\\\\\\\\\\\\    ", --
  "    //////////|\\\\\\\\\\\\\\\\\\\\  ", --
  "     '////////|\\\\\\\\\\\\\\\\'   ", --
  "       '//////|\\\\\\\\\\\\'       ", --
  "         '////|\\\\\\\\'           ", --
  "           '//|\\\\'               ", --
  "             '|'                   ", --
}

O.user_which_key = {
  r = {
    name = "Replace",
    f = {
      "<cmd>lua require('spectre').open_file_search()<cr>",
      "Current File",
    },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
  },
}

O.user_plugins = {
  -- Utility
  { "tpope/vim-surround" }, -- Snippets
  { "xabikos/vscode-javascript" },
  { "dsznajder/vscode-es7-javascript-react-snippets" }, -- Tmux integration
  "christoomey/vim-tmux-navigator", -- Syntax Hightlighting
  "StanAngeloff/php.vim", -- Miniyank
  {
    "bfredl/nvim-miniyank",
    config = function()
      vim.cmd [[
      map p <Plug>(miniyank-autoput)
      map P <Plug>(miniyank-autoPut)


      map <leader>n <Plug>(miniyank-cycle)
      map <leader>N <Plug>(miniyank-cycleback)

      ]]
      -- map <leader>p <Plug>(miniyank-startput)
      -- map <Leader>C <Plug>(miniyank-tochar)
      -- map <Leader>l <Plug>(miniyank-toline)
      -- map <Leader>b <Plug>(miniyank-toblock)
      -- map <leader>P <Plug>(miniyank-startPut)
    end,
  },
  --   {
  --     'phaazon/hop.nvim',
  --     config = function()
  --
  --       require("hop").setup {}
  --       vim.api.nvim_set_keymap("n", "s",
  --         "<cmd>lua require'hop'.hint_words()<cr>",
  --         {silent = true})
  --       vim.api.nvim_set_keymap("v", "s",
  --         "<cmd>lua require'hop'.hint_words()<cr>",
  --         {silent = true})
  --       vim.api.nvim_set_keymap("n", "f",
  --         "<cmd>lua require'hop'.hint_char1()<cr>",
  --         {silent = true})
  --       vim.api.nvim_set_keymap("v", "f",
  --         "<cmd>lua require'hop'.hint_char1()<cr>",
  --         {silent = true})
  --     end
  --   },
  { "ggandor/lightspeed.nvim" },
  { "folke/lsp-colors.nvim" },
  { "iamcco/markdown-preview.nvim" },
  { "andymass/vim-matchup" },
  {
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
  },
  { "folke/tokyonight.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").on_attach()
    end,
    event = "InsertEnter",
  },
}
