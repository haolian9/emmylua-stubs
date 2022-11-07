---@meta

---@class vim.treesitter.highlighter
vim.treesitter.highlighter = {}

--Creates a new highlighter using
--
---@param tree LanguageTree parser object to use for highlighting
---@param opts table|nil Configuration of the highlighter:
--            • queries table overwrite queries used by the highlighter
---@return TSHighlighter Created highlighter object
function vim.treesitter.highlighter.new(tree, opts) end
