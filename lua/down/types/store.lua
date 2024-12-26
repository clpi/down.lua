--- @meta    down.types.store
--- @brief   Provides core data types
--- @version <5.2,JIT
---
--- @brief down.Store --------------------------------
---
--- The important store value object
--- @class (exact) down.Store<I>: { [down.store.Item.Kind]?: down.store.map.Kind<I> }
---
--- @brief down.store.Key | down.store.Item ----------
---
--- @alias down.store.Item.Kind "log" log"
--- | "workspace" log"
--- | "note" log"
--- | "project" log"
--- | "group" group
--- | "scope" scope
--- | "task" task
--- | "scope" scope
--- | "tag" tag
--- | "flag" flag
--- | "store" store
--- | "status" status
--- | "priority" priority
--- | "weekday" weekday
--- | "category" category
--- | "month" month
--- | "year" year
--- | "time" time
--- | "date" date
--- | "datetime" datetime
--- | "location" location
--- | "event" event
--- | "person" person
--- | "rank" rank
--- | "file" file
--- | "folder" folder
--- | "definition" definition
--- | "mod" mod ``
---
--- @alias down.store.Key.Kind
--- | "uri" uri
---
--- Configuration for global settings.
--- @alias down.store.Key down.Tag Tag
--- | down.Flag Flag
--- | down.Tag
--- | down.Uri
--- | down.Id
--- | down.Dir
--- | down.File File
--- | down.Workspace
--- | down.Scope
--- | down.Project
--- | down.task.Priority
--- | down.task.Status
--- | down.Uri
--- | down.Anchor
--- | down.Ranking
--- | number string
--- | down.Category
--- | down.Date
--- | string
---
--- Configuration for global settings.
--- @alias down.store.Item down.Store
--- | down.Workspace workspace
--- | down.User User
--- | down.Anchor Anchor
--- | down.Dir dir
--- | down.Id Id
--- | down.File file
--- | down.Position file
--- | down.Task task
--- | down.Position position
--- | down.Uri task
--- | down.Log log
--- | down.Project PProject
--- | down.Note note
--- | down.Tag tag
--- | down.Agenda agenda
--- | down.Flag Flag
--- | down.Store Store
--- | down.store.Item Item
--- | down.store.Key Key
--- | down.Scope Scope
--- | down.Group Group
--- | down.Category Category
--- | down.Mod mod Tag
--- | down.Category Category
--- | down.Ranking Ranking
--- | down.task.Priority
--- | down.task.Status
--- | { [down.store.Key]: down.store.Item }
--- | { [string]: string }
---
--- @brief down.store ----------------------
---
--- @alias down.store.Name string The name associated with the vault of a certain kind
---
--- @alias down.store.Index integer The index in the list of vault
---
--- The important store value object
---   Contains a map of K to item type V
---   And an identifier, name, and kind string
---   id is like (if local): default.kind.item.
--- @class down.Store<K, V>: {
---   id?: down.Id,
---   uri?: down.Uri,
---   name?: string,
---   about?: string,
---   workspace?: down.Id,
---   default?: K,
---   store?: { [K]?: V },
---   config?: down.config.Local,
---   metadata?: { [string]?: any },
---   scope?: down.Scope,
---   index?: number | down.store.Item.Kind,
---   config?: down.config.Local,
---   type?: type,
--- } Map from id to store of kind
---
--- @alias down.store.Workspace<V> down.Store<string, V, down.config.Local>
---
--- @alias down.store.List<V> down.Store<integer, V>
---
--- @alias down.store.Id<V> down.Store<down.Id, V>
---
--- @alias down.store.Kind<V> down.Store<down.store.Item.Kind, V>
---
--- @alias down.store.Map<KK, VK, VV> down.Store<KK, down.Store<VK, VV>>
---
--- @alias down.KindId down.Store<down.store.Item.Kind, down.Store<down.Id, down.Project>>
---
--- @class (exact) down.store.KindIdDateMap<V> { default?: down.store.Item.Kind, [down.store.Item.Kind]?: down.store.map.Id<V> }
---
---
--- @brief down.store.data
---
--- @alias down.store.KindId<V> down.Store<string, down.Store<down.Id, down.store.Item>>
---
--- THe data object for workspaces.
--- @class (exact) down.store.Stores The data object for stores.
---   @field public store? down.store.KindId<down.Store> stores
---   @field public agenda? down.store.KindId<down.Agenda> agenda
---   @field public tasks? down.store.KindId<down.Task> agenda
---   @field public logs? down.store.KindId<down.Log> agenda
---   @field public stores? down.store.KindId<down.Store> agenda
---   @field public notes? down.store.KindId<down.Note> agenda
---   @field public files? down.store.KindId<down.File> agenda
---   @field public dirs? down.store.KindId<down.Dir> agenda
---   @field public tags? down.store.KindId<down.Tag> agenda
---   @field public flags? down.store.KindId<down.Flag> agenda
---   @field public projects? down.store.KindId<down.Project> proj
---   @field public groups? down.store.KindId<down.Group> proj
---   @field public scopes? down.store.KindId<down.Scope> proj