---@meta
--
--see: https://mpv.io/manual/stable/#mp-utils-functions

--This built-in module provides generic helper functions for Lua, and have
--strictly speaking nothing to do with mpv or video/audio playback. They are
--provided for convenience. Most compensate for Lua's scarce standard library.
---@class mp.utils
mp.utils = {}

function mp.utils.getcwd() end
function mp.utils.readdir(path, filter) end
function mp.utils.file_info(path) end
function mp.utils.split_path(path) end
function mp.utils.join_path(p1, p2) end
function mp.utils.subprocess(t) end
function mp.utils.subprocess_detached(t) end
function mp.utils.getpid() end
function mp.utils.get_env_list() end
function mp.utils.parse_json(str, trail) end
function mp.utils.format_json(v) end
function mp.utils.to_string(v) end
