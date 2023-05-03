---@meta

---@class Regex
Regex = {}

--Match the string against the regex. If the string should match the regex
--precisely, surround the regex with `^` and `$`. If the was a match, the
--byte indices for the beginning and end of the match is returned. When
--there is no match, `nil` is returned. As any integer is truth-y,
--`regex:match()` can be directly used as a condition in an if-statement.
---@param str string
---@return number?,number?
function Regex:match_str(str) end

--Match line {line_idx} (zero-based) in buffer {bufnr}. If {start} and {end}
--are supplied, match only this byte index range. Otherwise see
--|regex:match_str()|. If {start} is used, then the returned byte indices
--will be relative {start}.
---@param bufnr number
---@param line_idx number zero-based
---@param start? number
---@param end_? number
---@return number?,number?
function Regex:match_line(bufnr, line_idx, start, end_) end
