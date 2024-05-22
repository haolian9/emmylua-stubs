---@meta

--provides API service for this plugin
---@class vifm.plugin
---@field name string Name of the plugin
---@field path string Full path to plugin's root directory
vifm.plugin = {}

--Plugin-specific `require`, which loads Lua modules relative to plugin's root.
--Does not create a global variable for the module.
--
--This function is {unsafe}.
---@return table|nil
function vifm.plugin.require(modname) end
