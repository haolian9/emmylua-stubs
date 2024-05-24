---@meta

---@class vim.treesitter.language
vim.treesitter.language = {}

--Load parser with name {lang}
--Parsers are searched in the `parser` runtime directory, or the provided {path}
---@param lang string Name of the parser (alphanumerical and `_` only)
---@param opts? {filetype: string|string[]|nil, path: string?, symbol_name: string?}
function vim.treesitter.language.add(lang, opts) end

--Get the filetypes associated with the parser named {lang}.
---@param lang string Name of parser
---@return string[] filetypes
function vim.treesitter.language.get_filetypes(lang) end

---@param filetype string
---@return string?
function vim.treesitter.language.get_lang(filetype) end

--Inspects the provided language.
--Inspecting provides some useful information on the language like node names, ...
---@param lang string Language
---@return table
function vim.treesitter.language.inspect_language(lang) end

--Register a parser named {lang} to be used for {filetype}(s).
---@param lang string Name of parser
---@param filetype string|string[] Filetype(s) to associate with lang
function vim.treesitter.language.register(lang, filetype) end
