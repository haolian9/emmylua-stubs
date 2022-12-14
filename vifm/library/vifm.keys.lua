---@meta

--This global `vifm.keys` table provides means of managing key bindings.
---@class vifm.keys
vifm.keys = {}

--Registers in one or several modes:
-- * a new user-defined key which might replace an existing one
-- * a new selector which must not conflict with an existing one
--
--Possible fields of {key}:
-- - "shortcut" (string)
--   Left-hand side of the mapping.
-- - "description" (string) (default: "")
--   Description of the key.
-- - "modes" (array of strings)
--   List of modes to register the key in.  Supported values: cmdline, normal,
--   visual, menus, view and dialogs (sort, attributes, change and file info).
--   Unsupported values are ignored.
-- - "isselector" (boolean) (default: false)
--   Whether this handler defines a selector rather than a regular key.
-- - "followedby" (string) (default: "none")
--   "none", "selector" (e.g., "j" in "dj") or "keyarg" (e.g., "q" in "'q").
-- - "handler" (function)
--   Handler which accepts {info} and returns a table for selector handlers.
--   See below.
--
--{key}.handler for selectors is executed in a safe environment and can't call
--API marked as {unsafe}.
--
--Fields of {info} argument for {key}.handler:
-- - "count" (integer)
--   Count preceding the key or nil if none.
-- - "register" (string)
--   Register name or nil if none was specified.
-- - "indexes" (table) (present if key is followed by selector)
--   Table of indexes returned by selector key.
-- - "keyarg" (string) (present if key is followed by keyarg)
--   Key argument (e.g., "x" in "mx" sequence).
--
--Fields of table returned by {key}.handler for selectors:
-- - "indexes" (table)
--   Table of indexes of entries of the current view (|vifm-l_vifm.currview()|)
--   that were selected for the operation.  Out of range values and duplicates
--   are silently ignored.  Indexes are sorted before processing.
--
---@param key table Table with information about a key.
---@return boolean
function vifm.keys.add(key) end
