---@meta

--Registers a new view column type to be used in vifm-'viewcolumns' option.
--Possible fields of {column}:
-- - "name" (string)
--   Name of the command.  Must consist of Latin characters and not start with
--   the lower case one (those are reserved for builtin columns).
-- - "handler" (function)
--   Handler which accepts {info} and returns a table.  See below.
-- - "isprimary" (boolean) (default: false)
--   Whether this column is highlighted with file color and search match
--   is highlighted as well.
--
--{column}.handler is executed in a safe environment and can't call API marked
--as {unsafe}.
--
--Fields of {info} argument for {column}.handler:
-- - "entry" (table)
--   Information about a file list entry as an instance of |vifm-l_VifmEntry|.
-- - "width" (table)
--   Calculated width of the column.
--
--Fields of table returned by {column}.handler:
-- - "text" (string)
--    Table cell's value as a string or convertible to it.
-- - "matchstart" (integer) (default: 0)
--    For a search match this is the end position of a substring found in
--    entry's name, zero otherwise.
-- - "matchend" (integer) (default: 0)
--    For a search match this is the end position of a substring found in
--    entry's name, zero otherwise.
--
--Return: `true` if column was added.
--Raises an error: If {column}.name has incorrect value.
--
---@return boolean
function vifm.addcolumntype(column) end

--Registers a new handler that will be accessible in viewers.
--See |vifm-lua-handlers| for general description and details about specific use-cases.
--
--Possible fields of {handler}:
-- - "name" (string)
--   Partial name of the handler.  Must not contain any spaces.  Can be
--   #-separated list of names, e.g. "view#pdf".
-- - "handler" (function)
--   Handler which accepts {info} and returns a table.  See below.
--
--Return: `true` if handler was added, `false` if a handler with such name already exists.
--Raises an error: If {handler}.name has incorrect value.
--
---@return boolean
function vifm.addhandler(handler) end

---@return VifmView
function vifm.currview() end

---@return VifmView
function vifm.otherview() end

--Displays error dialog
function vifm.errordialog(title, msg) end

--Expands environment variables and macros in a string.
---@return string
function vifm.expand(str) end

--Changes path according to modifiers.
--
--Parameters:~
--  {path}  Path to modify.
--  {mods}  Modifiers to apply (`:p`, `:t`, etc.).
--  {base}  Base directory for relative paths.
--          Default: path of active pane.
function vifm.fnamemodify(path, mods, base) end

--Escapes input to make it suitable for use in an external command for current value of |vifm-'shell'|.
---@param what string
---@return string
function vifm.escape(what) end

--Checks existence of a path without resolving symbolic links.
---@return boolean
function vifm.exists(path) end

--Creates target path and missing intermediate directories.
--Return: `true` on success. Trying to create path that already exists is not considered to be an error.
---@return boolean
function vifm.makepath(path) end

--Runs an external command similar to |vifm-:!|.  Waits for it to finish if
--terminal multiplexer is not involved.
--
--Command is dispatched via a shell, but |vifm-'shellcmdflag'| is always ignored.
--
--Possible fields of {info}:
-- - "cmd" (string)
--   Comand to execute.
-- - "pause" (string) (default: "onerror")
--   When to pause after command execution: "never", "onerror", "always".
-- - "usetermmux" (boolean) (default: true)
--   Whether to open terminal multiplexer if support was enabled via
--   |vifm-:screen|.
--
--Return:~
--  Exit code of the command, see |vifm-l_VifmJob:exitcode()| for details.
--  Mind that if terminal multiplexer is used, this will be exit code of a
--  command that communicates with the multiplexer.
--
--Raises an error: If {info}.pause has incorrect value.
--
---@param info table
function vifm.run(info) end

--Launches an external command as a background job.  Returns without waiting
--for it to finish.
--
--Command is dispatched via a shell, but |vifm-'shellcmdflag'| is always
--ignored.
--
--Possible fields of {job}:
-- - "cmd" (string)
--   Comand to execute.
-- - "description" (string) (default: "")
--   Description of the job to be displayed on the job bar (when "visible" key
--   is set to true).
-- - "iomode" (string) (default: "r")
--   Specififes mode of interaction with the job:
--    - "r" - reading output of the process (see |vifm-l_VifmJob:stdout()|)
--    - "w" - providing input to the process (see |vifm-l_VifmJob:stdin()|)
--    - ""  - no I/O interaction
-- - "onexit" (function) (default: `nil`)
--   Handler to invoke when the job is done.  The handler is {delayed}.
-- - "mergestreams" (boolean) (default: false)
--   Whether to merge error stream of the command with its output stream.
-- - "visible" (boolean) (default: false)
--   Whether to show this job on a job bar.
--
--Return: Returns an instance of |vifm-l_VifmJob|.
--Raises: If "iomode" has incorrect value.
--
---@param job table
---@return VifmJob
function vifm.startjob(job) end
