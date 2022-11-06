---@meta
--
--see: https://mpv.io/manual/stable/#advanced-mp-functions

function mp.get_wakeup_pipe() end
function mp.get_next_timeout() end
function mp.dispatch_events(allow_wait) end
function mp.register_idle(fn) end
function mp.unregister_idle(fn) end
function mp.enable_messages(level) end
function mp.register_script_message(name, fn) end
function mp.unregister_script_message(name) end
function mp.create_osd_overlay(format) end
function mp.get_osd_size() end
