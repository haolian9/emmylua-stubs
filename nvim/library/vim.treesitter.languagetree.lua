---@meta

---@class vim.treesitter.languagetree
vim.treesitter.languagetree = {}

--A |LanguageTree| holds the treesitter parser for a given language {lang}
--used to parse a buffer. As the buffer may contain injected languages, the LanguageTree needs to store parsers for these child languages as well (which in turn
--may contain child languages themselves, hence the name).
--
---@param source number|string Buffer or a string of text to parse
---@param lang string Root language this tree represents
---@param opts table|nil Optional keyword arguments:
--              • injections table Mapping language to injection query
--                strings. This is useful for overriding the built-in
--                runtime file searching for the injection language query
--                per language.
---@return LanguageTree
function vim.treesitter.languagetree.new(source, lang, opts) end
