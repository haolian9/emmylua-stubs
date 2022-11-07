---@meta

--This global `vifm.tabs` table provides means for inspecting and controlling tabs.
---@class vifm.tabs
vifm.tabs = {}

--Retrieves a tab.  Omitting {query} is equivalent to passing an empty one.
--Possible fields of {query}:
-- - "index" (integer) (default: `tabs.getcurrent()`)
--   Index of the tab.
-- - "other" (boolean) (default: false)
--   Whether to get a pane tab from inactive view.  Ignored if global tabs are
--   active.
--
--Raises an error: If tab index is out of range.
--
---@param query table|nil
---@return VifmTab|nil
function vifm.tabs.get(query) end

--Retrieves number of open tabs.
--
--Possible fields of {query}:
-- - "other" (boolean) (default: false)
--   Whether to operate on tab from inactive view.  Ignored if global tabs are
--   active.
--
---@param query table|nil
---@return number
function vifm.tabs.getcount(query) end

--Retrieves index of current tab.
--
--Possible fields of {query}:
-- - "other" (boolean) (default: false)
--   Whether to operate on tab from inactive view.  Ignored if global tabs are
--   active.
--
---@param query table|nil
---@return number
function vifm.tabs.getcurrent(query) end
