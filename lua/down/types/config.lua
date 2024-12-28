--- @meta    down.types.config
--- @brief   Provides core data types
--- @version <5.2,JIT
---
--- @brief down.config
---
--- The local config for setting up workspaces.
--- @class (exact) down.config.Local workspace config local
---   @field public dir? down.Uri"./.down/" by default
---   @field public init? down.config.Init, optional init
---   metadata?: { [string]?: any },
---
--- Configuration for base directories globally.
--- @class (exact) down.config.Dirs dirs
---   @field public home down.Dir default "~/.down/"
---   @field public config down.Dir default "~/.config/down/"
---   @field public cache down.Dir  default "~/.cache/down/"
---   @field public temp down.Dir default "~/.temp/down/"
---   @field public runtime down.Dir string default "~/.down/runtime/"
---   @field public log down.Dir string default "~/.down/log/"
---
--- Configuration for global settings.
--- @class (exact) down.config.Global: down.Workspaces Down global configuration
---   @field public user down.User used
---   @field public dirs down.config.Dirs dirs
---   @field public workspaces down.Workspace> workspace list
---   @field public mod table<string, down.Mod> mod list
---   @field public config down.Config config
---   @field public [string]? down.Mod modules
---
--- @brief down.config.local
---
--- @brief down.config.global
---
--- @brief down.handlefig.init
---
--- The important store value object
--- @class (exact) down.config.Init Init
---   @field git? down.config.init.Git Git
---   @field sync? down.config.init.Sync sync
---   @field markdown? down.config.init.Markdown sync
---   @field command? down.config.init.Command command
---   @field [string]? down.config.init.Command
---
--- The important store value object
--- @class (exact) down.config.init.Markdown Git init
---   @field public enabled boolean Enable
---
--- The important store value object
--- @class (exact) down.config.init.Git Git init
---   @field public enabled boolean Enable
---
--- The important store value object
--- @class (exact) down.config.init.Command command init
---   @field public enabled? boolean Enable
---   @field public command? string Enable
---   @field public args? string[] Enable
---
--- The important store value object
--- @class (exact) down.config.init.Sync Sync init
---   @field public enabled boolean Enable
---
