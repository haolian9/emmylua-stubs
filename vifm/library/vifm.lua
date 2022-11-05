---@meta

---@class Cmd
---@field name string
---@field description string
---@field minargs number
---@field maxargs number
Cmd = {}
--Handler which accepts {info}.
---@param info table @{args: str, argv: [str]}
Cmd.handler = function(info) end
--Completion function which accepts {info} and returns {results}.
---@param info table @{arg: str, args: str, argv: [str]}
---@return number,table @(offset: int, matches: [str])
Cmd.complete = function(info) end

-- Instances of this type are used in filetype |vifm-lua-handlers| and in
-- callbacks of vifm.addcolumntype().
-- They are also returned by VifmView:entry().
---@class Entry
---@field name string Name of the file
---@field location string Location of the file
---@field size number Size of the file in bytes
---@field atime number
---@field ctime number
---@field mtime number
---@field type string Type of the entry. See |vifm-filetype()| for the list of values.
---@field folded boolean Whether is folded
---@field selected boolean Whether is selected.
---@field match boolean Whether is a search match.
---@field matchstart number For a search match this is the start position of a substring found in name zero otherwise.
---@field matchend number For a search match this is the end position of a substring found in name zero otherwise.
Entry = {}
-- describes name decorations
---@class Entry.classify
---@field prefix string
---@field suffix string
Entry.classify = {}

---@class View
--
--Equivalent of |vifm.opts.global| for location-specific values of
--view-specific options.  These are "local" values of view-specific options
--which are reset to "global" ones on file list change.
--Assigning local options is {unsafe}.
---@field locopts table
--
--Equivalent of |vifm.opts.global| for view-specific options, see there
--for details.  These are "global" values of view-specific options.
--Assigning view options is {unsafe}.
---@field viewopts table
--
--Index of the current entry (starts at zero).
---@field currententry number
--
---@field cwd string
---@field entrycount number
View = {}
--Changes location of the view.  {path} isn't expanded in any way.
--This function is {unsafe}.
---@return boolean
View.cd = function(path) end
---@return Entry
View.entry = function(index) end

---@class Job
Job = {}
Job.wait = function() end
Job.exitcode = function() end
-- Returns file stream from standard I/O library of Lua.
Job.stdin = function() end
-- Retrieves stream associated with standard output of a job.
-- Includes error stream if `mergestreams` was set to `true`.
Job.stdout = function() end
-- Retrieves data collected from error stream of the job.  It's accumulated
-- automatically in background and contains all data collected so far, the call
-- doesn't wait for arrival of data.  Empty if `mergestreams` was set to `true`.
Job.errors = function() end

--managing command-line commands
---@class vifm.cmds
vifm.cmds = {}
--Registers a new :command of a kind that's equivalent to builtin commands.
---@param defn Cmd
---@return boolean
vifm.cmds.add = function(defn) end
--Registers a new :command that works exactly as those registered using vifm-:command builtin command.
---@param defn table @{name: str, description: str, action: str}
---@return boolean
vifm.cmds.command = function(defn) end
---@return boolean
vifm.cmds.delcommand = function(name) end

--managing options
---@class vifm.opts
vifm.opts = {}
--Table that provides access to global options.  The mapping between option
--types and Lua types is quite obvious:
--* boolean option   -> boolean type
--* integer option   -> number type
--* any other option -> string type
--* bad option       -> nil type
vifm.opts.global = {}

--provides API service for this plugin
---@class vifm.plugin
---@field name string Name of the plugin
---@field path string Full path to plugin's root directory
vifm.plugin = {}
--Plugin-specific `require`, which loads Lua modules relative to plugin's root
---@return table|nil @nil=fail
vifm.plugin.require = function(modname) end

--managing plugins
---@class vifm.plugins
---@field all table contains all plugins indexed by their names.
vifm.plugins = {}

--functions for managing status bar
---@class vifm.sb
vifm.sb = {}
--display a regular message on statusbar
vifm.sb.info = function(msg) end
--display a error message on statusbar
vifm.sb.error = function(msg) end
--Displays a quick message on status bar.
--It's discarded on first redraw and isn't stored in the history of messages.
vifm.sb.quick = function(msg) end

--version information
---@class vifm.version
vifm.version = {}

---@class vifm.version.app
----@field str string
----@field major number
----@field minor number
----@field patch number
vifm.version.app = {}
vifm.version.app.has = function(feature) end
---@class vifm.version.api
vifm.version.api = {}
vifm.version.api.atleast = function(major, minor, patch) end

--Registers a new view column type to be used in vifm-'viewcolumns' option.
vifm.addcolumntype = function(column) end
--Registers a new handler that will be accessible in viewers.
vifm.addhandler = function(handler) end
---@return View
vifm.currview = function() end
---@return View
vifm.otherview = function() end
vifm.errordialog = function(title, msg) end
vifm.expand = function(str) end
---@param base string|nil @Base directory for relative paths.
vifm.fnamemodify = function(path, mods, base) end
vifm.exists = function(path) end
--Creates target path and missing intermediate directories.
--exists ok
---@return boolean
vifm.makepath = function(path) end
---@param cmd string
---@param description string @default=""
---@param iomode string @default="" enum(r, w, "")
---@param mergestreams boolean @default=false
---@param visible boolean @default=false
---@return Job
vifm.startjob = function(cmd, description, iomode, mergestreams, visible) end
