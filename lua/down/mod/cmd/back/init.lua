--[[
    file: cmd-return
    title: Provides the `:down return` Command
    summary: Return to last location before entering down.
    internal: true
    ---
When executed (`:down return`), all currently open `.down` files are deleted from
the buffer list, and the current workspace is set to "config".
--]]

local down = require("down")
local mod = down.mod

local init = mod.create("cmd.back")

init.setup = function()
  return { loaded = true, requires = { "cmd" } }
end

init.data = {
  commands = {
    back = {
      args = 0,
      name = "back",
    },
  },
}

init.on = function(event)
  if event.type == "cmd.events.back" then
    -- Get all the buffers
    local buffers = vim.api.nvim_list_bufs()

    local to_delete = {}
    for buffer in vim.iter(buffers):rev() do
      if vim.fn.buflisted(buffer) == 1 then
        -- If the listed buffer we're working with has a .down extension then remove it (not forcibly)
        if not vim.endswith(vim.api.nvim_buf_get_name(buffer), ".md") then
          vim.api.nvim_win_set_buf(0, buffer)
          break
        else
          table.insert(to_delete, buffer)
        end
      end
    end

    for _, buffer in ipairs(to_delete) do
      vim.api.nvim_buf_delete(buffer, {})
    end
  end
end

init.events.subscribed = {
  cmd = {
    ["back"] = true,
  },
}

return init