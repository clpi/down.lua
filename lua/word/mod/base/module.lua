--[[
    file: base
    summary: Metamodule for storing the most necessary mod.
    internal: true
    ---
This file contains all of the most important mod that any user would want
to have a "just works" experience.

Individual entries can be disabled via the "disable" flag:
```lua
load = {
    ["base"] = {
        config = {
            disable = {
                -- module list goes here
                "autocmd",
                "itero",
            },
        },
    },
}
```
--]]

local word = require("word")
local mod = word.mod

return mod.create_meta(
-- "treesitter",

  "base",
  "encrypt",
  "autocmd",
  "notes",
  "maps",
  "cmd",
  "store",
  "code",
  "export",
  "preview",
  "pick",
  -- "icon",
  "lsp",
  'completion',
  'data',
  "resources",
  "metadata",
  "capture",
  "template",
  "track",
  "snippets",
  "run",
  "sync",
  "search",
  "todo",
  "ui",
  "calendar",
  "publish",
  "link"
)