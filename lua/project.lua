local api = vim.api

local M = {}
local config

function M.on_init(client, _)
  local root_dir = client.config.root_dir

  if config.echo then
    api.nvim_echo({{"[project.nvim] changing directory to" .. " " .. root_dir, "ProjectHint"}}, true, {})
  end

  vim.cmd(string.format("%s %s", config.cd_cmd, root_dir))
end

do
  local default_config = {
    echo = false,
    cd_cmd = 'lcd',
  }

  function M.setup(user_config)
    dump(user_config)
    config = vim.tbl_extend("keep", user_config or {}, default_config)
    dump(config)

    vim.cmd [[highlight default link ProjectHint LspDiagnosticsDefaultHint]]
  end
end

return M
