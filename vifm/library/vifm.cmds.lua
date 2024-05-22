---@meta

--managing command-line commands
---@class vifm.cmds
vifm.cmds = {}

do
  ---@class Cmd
  ---@field name string
  ---@field description string
  ---@field minargs number
  ---@field maxargs number
  Cmd = {}

  --Handler which accepts {info}.
  ---@param info table @{args: str, argv: [str]}
  function Cmd.handler(info) end

  --Completion function which accepts {info} and returns {results}.
  ---@param info table @{arg: str, args: str, argv: [str]}
  ---@return number,table @(offset: int, matches: [str])
  function Cmd.complete(info) end
end

--Registers a new :command of a kind that's equivalent to builtin commands.
--
--The word "parsing" below refers to processing of command-line arguments like
--removal of slashes used for escaping and skipping whitespace.
--
--Possible fields of {cmd}:
-- - "name" (string)
--   Name of the command.
-- - "description" (string) (default: "")
--   Description of the command.
-- - "handler" (function)
--   Handler which accepts {info}.
-- - "complete" (function)
--   Completion function which accepts {info} and returns {results}.
-- - "minargs" (integer) (default: 0)
--   Minimal number of arguments.
-- - "maxargs" (integer) (default: minargs)
--   Maximal number of arguments.  Negative number means "indefinite".
--
--Fields of {info} argument for "handler":
-- - "args" (string)
--   All arguments passed to the command.
-- - "argv" (array of strings)
--   Set of parsed arguments of the command.
--
--Fields of {info} argument for "complete":
-- - "arg" (string)
--   Argument being completed.
-- - "args" (string)
--   Command-line up to cursor position (for cases when completion depends on
--   what comes before current argument).
-- - "argv" (array of strings)
--   Same as "args", but parsed into an array.
--
--Fields of {results} return value of "complete":
-- - "offset" (integer) (default: 0)
--   Offset from beginning of the argument.  This is useful to avoid prepending
--   prefix that's common to all matches, thus completing only essential part.
--   For example, in case of "var=val" use offset=4 to complete part after "=".
-- - "matches" (array of strings or tables)
--   List of items in values of the table (keys are ignored).  Each list item
--   can either be a string or a table.  When item is a string it is used as a
--   completion match.  When item is a table it can contain these keys:
--    - "match" (string)
--      Use "match" as a completion match.
--    - "description" (string) (optional)
--      A string that will be showed along with the "match" but not inserted on
--      the command line.
--   All other items of unspecified types will be silently ignored.
--
---@param cmd Cmd
---@return boolean
function vifm.cmds.add(cmd) end

--Registers a new :command that works exactly as those registered using
--|vifm-:command| builtin command.
--
--Possible fields of {cmd}:
-- - "name" (string)
--   Name of the command.
-- - "description" (string) (default: action)
--   Description of the command.
-- - "action" (string)
--   Value of the command.  See |vifm-:command| for possible value.
--
---@return boolean
function vifm.cmds.command(cmd) end

--Removes :command added by `vifm.cmds.command()`, basically being an
--equivalent of |vifm-:delcommand| builtin command.
---@return boolean
function vifm.cmds.delcommand(name) end
