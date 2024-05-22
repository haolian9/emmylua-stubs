---@meta

--This global `vifm.keys` table provides means of managing key bindings.
---@class vifm.keys
vifm.keys = {}

do
  ---@class vifm.keys.add.Key
  ---@field shortcut string @Left-hand side of the mapping.
  ---@field description? string @nil=""
  ---@field modes ('cmdline'|'nav'|'normal'|'visual'|'menus'|'view'|'dialogs')[]
  ---@field isselector? boolean @nil=false; Whether this handler defines a selector rather than a regular key.
  ---@field followedby? 'none'|'selector' @nil=none
  ---@field handler fun(info: vifm.keys.add.handler.Info): nil|vifm.keys.add.handler.SelectorResult

  ---@class vifm.keys.add.handler.Info
  ---@field count? integer @Count preceding the key or nil if none.
  ---@field register? string @Register name or nil if none was specified.
  ---@field indexes? table @present if key is followed by selector; Table of indexes returned by selector key.
  ---@field keyarg? string @present if key is followed by keyarg; Key argument (e.g., "x" in "mx" sequence).

  ---@class vifm.keys.add.handler.SelectorResult
  ---@field indexes integer[] @Table of indexes of entries of the current view (|vifm-l_vifm.currview()|) that were selected for the operation.  Invalid, nonexistent and duplicate indexes are silently ignored.  Indexes are sorted before processing.
  ---@field cursorpos? integer @New position of the cursor.  Non-integer values are ignored.

  --Registers in one or several modes:
  -- * a new user-defined key which might replace an existing one
  -- * a new selector which must not conflict with an existing one
  --{key}.handler for selectors is executed in a safe environment and can't call API marked as {unsafe}.
  ---@param key vifm.keys.add.Key
  ---@return boolean
  function vifm.keys.add(key) end
end
