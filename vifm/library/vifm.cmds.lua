---@meta

--managing command-line commands
---@class vifm.cmds
vifm.cmds = {}

do
  ---@class vifm.cmds.add.Cmd
  ---@field name string
  ---@field description? string @nil=""
  ---@field handler fun(info: vifm.cmds.add.handler.Info)
  ---@field complete fun(info: vifm.cmds.add.complete.Info): vifm.cmds.add.complete.Result
  ---@field minargs? integer @nil=0
  ---@field maxargs? integer @nil=minargs

  ---@class vifm.cmds.add.handler.Info
  ---@field args string @All arguments passed to the command.
  ---@field argv string[] @Set of parsed arguments of the command.

  ---@class vifm.cmds.add.complete.Info
  ---@field arg string @Argument being completed.
  ---@field args string @Command-line up to cursor position (for cases when completion depends on what comes before current argument).
  ---@field argv string[] @Same as "args", but parsed into an array.

  ---@class vifm.cmds.add.complete.Result
  ---@field offset? integer @nil=0; Offset from beginning of the argument.  This is useful to avoid prepending prefix that's common to all matches, thus completing only essential part.
  ---@field matches string[]|{match: string, description?: string}[] @List of items in values of the table (keys are ignored). Each list item can either be a string or a table. When item is a string it is used as a completion match.

  --Registers a new :command of a kind that's equivalent to builtin commands.
  --The word "parsing" below refers to processing of command-line arguments like removal of slashes used for escaping and skipping whitespace.
  ---@param cmd Cmd
  ---@return boolean
  function vifm.cmds.add(cmd) end
end

do
  ---@class vifm.cmds.command.Cmd
  ---@field name string
  ---@field description? string @nil=action
  ---@field action string @See |vifm-:command| for possible value.

  --Registers a new :command that works exactly as those registered using |vifm-:command| builtin command.
  ---@param cmd vifm.cmds.command.Cmd
  ---@return boolean
  function vifm.cmds.command(cmd) end
end

--Removes :command added by `vifm.cmds.command()`, basically being an equivalent of |vifm-:delcommand| builtin command.
---@param name string
---@return boolean
function vifm.cmds.delcommand(name) end
