vim.cmd [[
  set rtp+=./
  set rtp+=~/.local/share/nvim/lazy/nvim-nio
  set rtp+=~/.local/share/nvim/lazy/nvim-treesitter
  set rtp+=~/.local/share/nvim/lazy/pathlib.nvim
  set rtp+=~/.local/share/nvim/lazy/nui.nvim
  set rtp+=~/.local/share/nvim/lazy/plenary.nvim
]]

local jot = require("jot")
jot.setup(
  {
    mods = {
      config = {},
      workspace = {
        config = {
          workspaces = {
            book = "./book/src"
          }
        }
      },
    }
  }
)
