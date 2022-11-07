---@meta

--This global `vifm.events` table groups items related to events.
---@class vifm.events
vifm.events = {}

--Registers a handler for an event.
--
--Possible fields of {event}:
-- - "event" (string)
--   Name of event to listen for.  See below.
-- - "handler" (function)
--   Handler to invoke when the event happens.
--
--Events:
-- - "app.exit"
--   Occurs before Vifm exits normally.  Does not happen on |vifm-:restart|.
--
--Registering the same handler more than once for the same event has no effect.
--
--Raises an error:~
--  On unknown event name.
---@param event table
function vifm.events.listen(event) end
