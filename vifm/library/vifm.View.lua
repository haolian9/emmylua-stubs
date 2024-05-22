---@meta

--Instances of this type are returned by:
-- * |vifm-l_vifm.currview()|
-- * |vifm-l_vifm.otherview()|
-- * |vifm-l_VifmTab:getview()|
--
--The corresponding view exists independently of this type and once the view is
--gone (e.g., its tab is closed) accessing bound instance raises an error.
---@class vifm.View
--
--Equivalent of |vifm.opts.global| for location-specific values of
--view-specific options.  These are "local" values of view-specific options
--which are reset to "global" ones on file list change.
--Assigning local options is {unsafe}.
---@field locopts table
--
--Equivalent of |vifm.opts.global| for view-specific options, see there
--for details.  These are "global" values of view-specific options.
--Assigning view options is {unsafe}.
---@field viewopts table
--
--Index of the current entry (starts at zero).
---@field currententry number
--
---@field cwd string
---@field entrycount number
---@field custom nil|{title: string, type: string} @Table with information about custom file list.
vifm.View = {}

--Changes location of the view.  {path} isn't expanded in any way.
--This function is {unsafe}.
---@return boolean
function vifm.View:cd(path) end

--Retrieves an entry by index.
---@return vifm.Entry
function vifm.View:entry(index) end

--Selects entries. Does nothing in visual non-amend mode. See |vifm-l_VifmView:unselect()| to unselect entries.
--This function is {unsafe}.
---@param entries {indexes: integer[]} @Indexes of entries to select. Invalid and nonexistent indexes are silently ignored.
---@return integer @Number of new selected entries.
function vifm.View:select(entries) end

--Unselects entries. Does nothing in visual non-amend mode. See |vifm-l_VifmView:select()| to select entries.
--This function is {unsafe}.
---@param entries {indexes: integer[]} @Indexes of entries to unselect. Invalid and nonexistent indexes are silently ignored.
---@return integer @Number of new unselected entries.
function vifm.View:unselect(entries) end
