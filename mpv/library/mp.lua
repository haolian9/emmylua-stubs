---@meta
--
-- see:
-- * https://github.com/mpv-player/mpv/blob/master/DOCS/man/lua.rst
-- * https://mpv.io/manual/stable/#mp-functions

--The mp module is preloaded, although it can be loaded manually with require 'mp'. It provides the core client API.
---@class mp
mp = {}

--Run the given command. This is similar to the commands used in input.conf.
--See `List of Input Commands`_.
--
--By default, this will show something on the OSD (depending on the command),
--as if it was used in ``input.conf``. See `Input Command Prefixes`_ how
--to influence OSD usage per command.
--
--Returns ``true`` on success, or ``nil, error`` on error.
function mp.command(string) end

--Similar to ``mp.command``, but pass each command argument as separate
--parameter. This has the advantage that you don't have to care about
--quoting and escaping in some cases.
--
--Example:
--    mp.command("loadfile " .. filename .. " append")
--    mp.commandv("loadfile", filename, "append")
--
--These two commands are equivalent, except that the first version breaks
--if the filename contains spaces or certain special characters.
--
--Note that properties are *not* expanded.  You can use either ``mp.command``,
--the ``expand-properties`` prefix, or the ``mp.get_property`` family of
--functions.
--
--Unlike ``mp.command``, this will not use OSD by default either (except
--for some OSD-specific commands).
function mp.commandv(arg1, arg2, ...) end

function mp.command_native(table, def) end
function mp.command_native_async(table, fn) end
function mp.abort_async_command(t) end
function mp.get_property(name, def) end
function mp.get_property_osd(name, def) end
function mp.get_property_bool(name, def) end
function mp.get_property_number(name, def) end
function mp.get_property_native(name, def) end
function mp.set_property(name, value) end
function mp.set_property_bool(name, value) end
function mp.set_property_number(name, value) end
function mp.set_property_native(name, value) end
function mp.get_time() end
function mp.add_key_binding(key, name_or_fn, fn, flags) end
function mp.add_forced_key_binding(...) end
function mp.remove_key_binding(name) end
function mp.register_event(name, fn) end
function mp.unregister_event(fn) end
function mp.observe_property(name, type, fn) end
function mp.unobserve_property(fn) end
function mp.add_timeout(seconds, fn) end
function mp.add_periodic_timer(seconds, fn) end
function mp.get_opt(key) end
function mp.get_script_name() end
function mp.get_script_directory() end
function mp.osd_message(text, duration) end
