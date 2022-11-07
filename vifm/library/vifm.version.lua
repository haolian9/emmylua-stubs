---@meta

--This global `vifm.version` table provides information about Vifm and Lua API.
---@class vifm.version
vifm.version = {}

---@class vifm.version.app
----@field str string
----@field major number
----@field minor number
----@field patch number
vifm.version.app = {}

--Checks presence of a feature. There are no features to test yet.
---@return boolean
function vifm.version.api.has(feature) end

--Checks version of Lua API.
---@param major number
---@param minor number,0
---@param patch number,0
---@return boolean
function vifm.version.api.atleast(major, minor, patch) end
