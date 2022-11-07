---@meta

--This global `vifm.sb` table groups functions for managing status bar.
---@class vifm.sb
vifm.sb = {}

--Displays a regular message on status bar.
function vifm.sb.info(msg) end

--Displays an error message on status bar.
function vifm.sb.error(msg) end

--Displays a quick message on status bar.  It's discarded on first redraw and
--isn't stored in the history of messages.
function vifm.sb.quick(msg) end
