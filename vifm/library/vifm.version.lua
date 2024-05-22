---@meta

--This global `vifm.version` table provides information about Vifm and Lua API.
---@class vifm.version
vifm.version = {}

---@class vifm.version.app
----@field str string
----@field major integer
----@field minor integer
----@field patch integer
vifm.version.app = {}

--Checks presence of a feature. There are no features to test yet.
---@return boolean
function vifm.version.api.has(feature) end

--Checks version of Lua API.
---@param major integer
---@param minor integer,0
---@param patch integer,0
---@return boolean
function vifm.version.api.atleast(major, minor, patch) end
