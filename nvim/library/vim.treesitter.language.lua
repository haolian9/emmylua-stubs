---@meta

---@class vim.treesitter.language
vim.treesitter.language = {}

--Inspects the provided language.
--Inspecting provides some useful information on the language like node names, ...
---@param lang string Language
---@return table
function vim.treesitter.language.inspect_language(lang) end

--Asserts that a parser for the language {lang} is installed.
--Parsers are searched in the `parser` runtime directory, or the provided {path}
---@param lang string Language the parser should parse
---@param path string|nil Optional path the parser is located at
---@param silent boolean|nil Don't throw an error if language not found
---@param symbol_name string|nil Internal symbol name for the language to load
---@return boolean If the specified language is installed
function vim.treesitter.language.require_language(lang, path, silent, symbol_name) end
