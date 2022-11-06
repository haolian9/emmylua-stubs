---@meta
--
-- see: https://mpv.io/manual/stable/#mp-msg-functions

--This module allows outputting messages to the terminal, and can be loaded with require 'mp.msg'.
---@class mp.msg
mp.msg = {}

function mp.msg.log(level, ...) end
function mp.msg.fatal(...) end
function mp.msg.error(...) end
function mp.msg.warn(...) end
function mp.msg.info(...) end
function mp.msg.verbose(...) end
function mp.msg.debug(...) end
function mp.msg.trace(...) end
