---@meta

do
  ---@class vifm.addcolumntype.Column.Info
  ---@field entry vifm.Entry @Information about a file list entry as an instance of |vifm-l_VifmEntry|.
  ---@field width table @Calculated width of the column.

  ---@class vifm.addcolumntype.Column
  ---@field name string @Name of the command.  Must consist of Latin characters and not start with the lower case one (those are reserved for builtin columns).
  ---@field handler fun(info: vifm.addcolumntype.Column.Info): text, matchstart, matchsend @Handler which accepts {info} and returns a table.  See below.
  ---@field isprimary? boolean @nil=false; Whether this column is highlighted with file color and search match is highlighted as well.

  --Registers a new view column type to be used in vifm-'viewcolumns' option.
  --
  --{column}.handler is executed in a safe environment and can't call API marked as {unsafe}.
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
  --Raises an error: If {column}.name has incorrect value.
  --
  ---@return boolean @`true` if column was added.
  function vifm.addcolumntype(column) end
end

do
  ---@class vifm.addhandler.Handler
  ---@field name string @Partial name of the handler. Must not contain any spaces. Can be #-separated list of names, e.g. "view#pdf".
  ---@field handler fun(info: any) @see vifm.handlers.*

  --Registers a new handler that will be accessible in viewers.
  --See |vifm-lua-handlers| for general description and details about specific use-cases.
  --
  --Raises an error: If {handler}.name has incorrect value.
  --
  ---@param handler vifm.addhandler.Handler
  ---@return boolean @`true` if handler was added, `false` if a handler with such name already exists.
  function vifm.addhandler(handler) end
end

---Retrieves a reference to active view.
---@return vifm.View
function vifm.currview() end

---Retrieves a reference to inactive view.
---@return vifm.View
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

---If {what} is absolute or relative path, checks whether it exists and refers to an executable, otherwise checks whether command named {what} is present in directories listed in $PATH.
---Checks for various executable extensions on Windows.
---@param what string
---@return boolean
function vifm.executable(what) end

--Checks existence of a path without resolving symbolic links.
---@return boolean
function vifm.exists(path) end

--Creates target path and missing intermediate directories.
--Return: `true` on success. Trying to create path that already exists is not considered to be an error.
---@return boolean
function vifm.makepath(path) end

do
  ---@class vifm.run.Info
  ---@field cmd string @Comand to execute.
  ---@field pause? string 'onerror'|'never'|'always' @nil=onerror; When to pause after command execution: "never", "onerror", "always".
  ---@field usetermmux? boolean @nil=true; Whether to open terminal multiplexer if support was enabled via |vifm-:screen|.

  --Runs an external command similar to |vifm-:!|.  Waits for it to finish if terminal multiplexer is not involved.
  --Command is dispatched via a shell, but |vifm-'shellcmdflag'| is always ignored.
  --
  --Return:~
  --  Exit code of the command, see |vifm-l_VifmJob:exitcode()| for details.
  --  Mind that if terminal multiplexer is used, this will be exit code of a
  --  command that communicates with the multiplexer.
  --
  --Raises an error: If {info}.pause has incorrect value.
  --
  ---@param info vifm.run.Info
  ---@return integer exitcode
  function vifm.run(info) end
end

do
  ---@class vifm.startjob.Info
  ---@field cmd string
  ---@field description? string
  ---@field iomode? 'r'|'w'|'' @nil=r
  ---@field onexit? fun(job: vifm.Job)
  ---@field mergestreams? boolean @nil=false; Whether to merge error stream of the command with its output stream.
  ---@field visible? boolean @nil=false; Whether to show this job on a job bar.

  --Launches an external command as a background job.  Returns without waiting for it to finish.
  --
  --Command is dispatched via a shell, but |vifm-'shellcmdflag'| is always ignored.
  --
  -- - "iomode" (string) (default: "r")
  --   Specififes mode of interaction with the job:
  --    - "r" - reading output of the process (see |vifm-l_VifmJob:stdout()|)
  --    - "w" - providing input to the process (see |vifm-l_VifmJob:stdin()|)
  --    - ""  - no I/O interaction
  --
  --Raises: If "iomode" has incorrect value.
  --
  ---@param info vifm.startjob.Info
  ---@return vifm.Job
  function vifm.startjob(info) end
end

---Retrieves stream to which Vifm's standard stream was redirected.
---Return:~
---  The stream that can't be closed or `nil` if output stream wasn't redirected
---  to a TTY (character device on Windows).  In the former case the same stream
---  is returned on each call.
function vifm.stdout() end

do
  ---@class vifm.input.Info
  ---@field prompt string @Prompt invitation.
  ---@field initial? string @Initial input for the prompt.
  ---@field complete? 'dir'|'file'|'' @nil=''; how to complete input

  ---Prompts user for input via command-line prompt.
  ---@param info {prompt: string, initial?: string, complete?: 'dir'|'file'|''}
  ---@return string|nil @String on success or nil if the prompt was cancelled.
  function vifm.input(info) end
end
