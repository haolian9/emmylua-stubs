---@meta

--This global `vifm.events` table groups items related to events.
---@class vifm.events
vifm.events = {}

--Occurs after a successful execution of a file-system operation.
---@class vifm.events.FsopEvent
--
--Type of an operation
--* "copy"    Copying a file/directory from one location to another.
--* "create"  Creation of a file/directory.
--* "move"    Moving a file/directory from one location to another.  Includes renames,
--            moves across partition boundaries, deletion to trash and moving out of trash.
--* "remove"  Removal of a file/directory.  This includes symbolic link removal on changing its target.
--* "symlink" Creation of a symbolic link, which might be a second step of updating its target.
--
--The list of operations isn't complete, to be extended as needed.
--Operations performed in background aren't reported.
---@field op "copy"|"create"|"move"|"remove"|"symlink"
--
---@field path string Source path or the only path affected by the operation.
---@field target string? Destination path or target of a symbolic link.
---@field isdir boolean Whether operation is performed on a directory.
--
--"move" operation sets the flag if "path" points inside a trash directory,
--meaning that file was restored or otherwise moved from trash.
---@field fromtrash boolean?
--
--"move" operation sets the flag if "target" points inside a trash directory,
--meaning that file was deleted to trash.
---@field totrash boolean?
vifm.events.FsopEvent = {}

--Registers a handler for an event.
--
--Events:
-- - "app.exit" Occurs before Vifm exits normally.  Does not happen on |vifm-:restart|.
-- - "app.fsop" Occurs after a successful execution of a file-system operation.
--
--Registering the same handler more than once for the same event has no effect.
--
--Raises an error:~
--  On unknown event name.
--
---@param defn {event: "app.exit"|"app.fsop", handler: fun(event: nil|vifm.events.FsopEvent)}
function vifm.events.listen(defn) end
