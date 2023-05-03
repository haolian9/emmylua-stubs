--https://github.com/kikito/inspect.lua#options
---@param value any
---@param options? {depth: number, newline: boolean, indent: boolean, process: fun(item: any, path: string[]): any}
function vim.inspect(value, options) end

--Parse the Vim regex {re} and return a regex object. Regexes are "magic"
--and case-sensitive by default, regardless of 'magic' and 'ignorecase'.
--They can be controlled with flags, see |/magic| and |/ignorecase|.
---@param re string
---@return Regex
function vim.regex(re) end
