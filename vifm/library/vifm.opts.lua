---@meta

--managing options
---@class vifm.opts
--
--Table that provides access to global options.  The mapping between option
--types and Lua types is quite obvious:
-- - boolean option   -> boolean type
-- - integer option   -> number type
-- - any other option -> string type
-- - bad option       -> nil type
---@field global table
vifm.opts = {}
