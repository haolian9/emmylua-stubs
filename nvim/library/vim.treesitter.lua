---@meta

---@class vim.treesitter
vim.treesitter = {}

--Returns a list of highlight capture names under the cursor
---@param winnr number|nil Window handle or 0 for current window (default)
---@return table string[] List of capture names
function vim.treesitter.get_captures_at_cursor(winnr) end

--Returns a list of highlight captures at the given position
--
--Each capture is represented by a table containing the capture name as a
--string as well as a table of metadata (`priority`, `conceal`, ...; empty
--if none are defined).
--
---@param bufnr number Buffer number (0 for current buffer)
---@param row number Position row
---@param col number Position column
---@return table List of captures `{ capture = "capture name", metadata = { ...
function vim.treesitter.get_captures_at_pos(bufnr, row, col) end

--Returns the smallest named node under the cursor
--
---@param winnr number|nil Window handle or 0 for current window (default)
---@return string
function vim.treesitter.get_node_at_cursor(winnr) end

--Returns the smallest named node at the given position
--
---@param bufnr number Buffer number (0 for current buffer)
---@param row number Position row
---@param col number Position column
---@param opts table Optional keyword arguments:
--             • ignore_injections boolean Ignore injected languages
--               (default true)
---@return TSNode
function vim.treesitter.get_node_at_pos(bufnr, row, col, opts) end

--Returns the node's range or an unpacked range table
--
---@param node_or_range TSNode|table or table of positions
---@return table `{ start_row, start_col, end_row, end_col }`
function vim.treesitter.get_node_range(node_or_range) end

--Returns the parser for a specific buffer and filetype and attaches it to the buffer
--If needed, this will create the parser.
--
---@param bufnr number|nil Buffer the parser should be tied to (default: current buffer)
---@param lang string|nil Filetype of this parser (default: buffer filetype)
---@param opts table|nil Options to pass to the created language tree
---@return LanguageTree
function vim.treesitter.get_parser(bufnr, lang, opts) end

--Returns a string parser
--
---@param str string Text to parse
---@param lang string Language of this string
---@param opts table|nil Options to pass to the created language tree
---@return LanguageTree
function vim.treesitter.get_string_parser(str, lang, opts) end

--Determines whether a node is the ancestor of another
--
---@param dest TSNode Possible ancestor
---@param source TSNode Possible descendant
---@return boolean  True if {dest} is an ancestor of {source}
function vim.treesitter.is_ancestor(dest, source) end

--Determines whether (line, col) position is in node range
--
---@param node TSNode defining the range
---@param line number Line (0-based)
---@param col number Column (0-based)
---@return boolean True if the position is in node range
function vim.treesitter.is_in_node_range(node, line, col) end

--Determines if a node contains a range
--
---@param node TSNode
---@param range table
---@return boolean True if the {node} contains the {range}
function vim.treesitter.node_contains(node, range) end

--Starts treesitter highlighting for a buffer
--Can be used in an ftplugin or FileType autocommand.
--
--Note: By default, disables regex syntax highlighting, which may be
--required for some plugins. In this case, add `vim.bo.syntax = 'on'` after
--the call to `start`.
--
--Example:
-- vim.api.nvim_create_autocmd( 'FileType', { pattern = 'tex',
--     callback = function(args)
--         vim.treesitter.start(args.buf, 'latex')
--         vim.bo[args.buf].syntax = 'on'  -- only if additional legacy syntax is needed
--     end
-- })
--
---@param bufnr number|nil Buffer to be highlighted (default: current buffer)
---@param lang string|nil Language of the parser (default: buffer filetype)
function vim.treesitter.start(bufnr, lang) end

--Stops treesitter highlighting for a buffer
--
---@param bufnr number|nil Buffer to stop highlighting (default: current buffer)
function vim.treesitter.stop(bufnr) end
