local M = {}

local null_ls = require "null-ls"
local services = require "lvim.lsp.null-ls.services"
local Log = require "lvim.core.log"

local is_registered = function(name)
  local query = {
    name = name,
    method = require("null-ls").methods.CODE_ACTION,
  }
  return require("null-ls.sources").is_registered(query)
end

function M.list_registered_providers(filetype)
  local null_ls_methods = require "null-ls.methods"
  local codeact_method = null_ls_methods.internal["CODE_ACTION"]
  local registered_providers = services.list_registered_providers_names(filetype)
  return registered_providers[codeact_method] or {}
end

function M.list_available(filetype)
  local code_actions = {}
  local tbl = require "lvim.utils.table"
  for _, provider in pairs(null_ls.builtins.diagnostics) do
    if tbl.contains(provider.filetypes or {}, function(ft)
      return ft == "*" or ft == filetype
    end) then
      table.insert(code_actions, provider.name)
    end
  end

  table.sort(code_actions)
  return code_actions
end

function M.list_configured(codeact_configs)
  local code_actions, errors = {}, {}

  for _, codeact_config in pairs(codeact_configs) do
    local name = codeact_config.exe:gsub("-", "_")
    local code_action = null_ls.builtins.code_actions[name]

    if not code_action then
      Log:error("Not a valid code action: " .. codeact_config.exe)
      errors[codeact_config.exe] = {} -- Add data here when necessary
    elseif is_registered(codeact_config.exe) then
      Log:trace "Skipping registering the source more than once"
    else
      local codeact_cmd = services.find_command(code_action._opts.command)
      if not codeact_cmd then
        Log:warn("Not found: " .. code_action._opts.command)
        errors[name] = {} -- Add data here when necessary
      else
        Log:debug("Using code_action: " .. codeact_cmd)
        table.insert(
          code_actions,
          code_action.with {
            command = codeact_cmd,
            extra_args = codeact_config.args,
            filetypes = codeact_config.filetypes,
          }
        )
      end
    end
  end

  return { supported = code_actions, unsupported = errors }
end

function M.setup(codeacts_configs)
  if vim.tbl_isempty(codeacts_configs) then
    return
  end

  local code_actions = M.list_configured(codeacts_configs)
  null_ls.register { sources = code_actions.supported }
end

return M
