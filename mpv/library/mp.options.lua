---@meta
--
--see: https://mpv.io/manual/stable/#mp-options-functions

--mpv comes with a built-in module to manage options from config-files and the
--command-line. All you have to do is to supply a table with default options
--to the read_options function. The function will overwrite the default values
--with values found in the config-file and the command-line (in that order).
---@class mp.options
---@module 'mp.options'
mp.options = {}

function mp.options.read_options(table, identifier, on_update) end
