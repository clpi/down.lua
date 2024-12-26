local down = require("down")
local mod = down.mod

local M = mod.new("cmd.mod")

---@class down.cmd.mod.Data
M.data = {

  -- The table containing all the functions. This can get a tad complex so I recommend you read the wiki entry
  commands = {
    mod = {
      subcommands = {
        new = {
          args = 1,
          name = "mod.new",
        },
        load = {
          args = 1,
          name = "mod.setup",
        },

        list = {
          args = 0,
          name = "mod.list",
        },
      },
    },
  },
}
M.setup = function()
  return { loaded = true, requires = { "cmd" } }
end


M.on = function(event)
  if event.type == "cmd.events.mod.setup" then
    local ok = pcall(mod.load_mod, event.content[1])

    if not ok then
      vim.notify(string.format("init `%s` does not exist!", event.content[1]), vim.log.levels.ERROR, {})
    end
  end

  if event.type == "cmd.events.mod.list" then
    local Popup = require("nui.popup")

    local mods_popup = Popup({
      position = "50%",
      size = { width = "50%", height = "80%" },
      enter = true,
      buf_options = {
        filetype = "markdown",
        modifiable = true,
        readonly = false,
      },
      win_options = {
        conceallevel = 3,
        concealcursor = "nvi",
      },
    })

    mods_popup:on("VimResized", function()
      mods_popup:update_layout()
    end)

    local function close()
      mods_popup:unmount()
    end

    mods_popup:map("n", "<Esc>", close, {})
    mods_popup:map("n", "q", close, {})

    local lines = {}

    for name, _ in pairs(down.mod.loaded_mod) do
      table.insert(lines, "- `" .. name .. "`")
    end

    vim.api.nvim_buf_set_lines(mods_popup.bufnr, 0, -1, true, lines)

    vim.bo[mods_popup.bufnr].modifiable = false

    mods_popup:mount()
  end
end
M.subscribed = {
  cmd = {
    -- ["mod.new"] = true,
    ["mod.setup"] = true,
    ["mod.list"] = true,
  },
}
return M
