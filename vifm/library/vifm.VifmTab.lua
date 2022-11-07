---@meta

--Instances of this type are returned by |vifm-l_vifm.tabs.get()|.
--
--The corresponding tab exists independently of this type and once the tab is
--closed accessing bound instance raises an error.
---@class VifmTab
VifmTab = {}

--Retrieves layout of a global tab or shared TUI state for a pane tab.
--
--Fields of the result:
-- - "only" (boolean)
--   Whether there is only one visible window.
-- - "split" (string)
--   `nil` when in only one window is visible, "v" or "h" otherwise.
--
---@return table
function VifmTab:getlayout() end

--Retrieves name of the tab if it was set.
---@return string|nil
function VifmTab:getname() end

--Possible fields of {query}:
-- - "pane" (integer) (default: 1)
--   Which view to get from a global tab.  1 is left/top pane, 2 is right/bottom
--   one.  Ignored for a pane tab.
--
---@return VifmView
function VifmTab:getview(query) end
