---@meta

---@class vim.treesitter.query
vim.treesitter.query = {}

--Adds a new directive to be used in queries
--
--Handlers can set match level data by setting directly on the metadata
--object `metadata.key = value`, additionally, handlers can set node level
--data by using the capture id on the metadata table
--`metadata[capture_id].key = value`
--
---@param name string Name of the directive, without leading #
---@param handler fun(match: {[string]: TSNode}, pattern: string, bufnr: number, predicate: string[], metadata: table)
---@param force? boolean
function vim.treesitter.query.add_directive(name, handler, force) end

--Adds a new predicate to be used in queries
--
---@param name string Name of the predicate, without leading #
---@param handler fun(match: {[string]: TSNode}, pattern: string, bufnr: number, predicate: string[])
function vim.treesitter.query.add_predicate(name, handler, force) end

--Returns the runtime query {query_name} for {lang}.
--
---@param lang string Language to use for the query
---@param query_name string Name of the query (e.g. "highlights")
---@return Query
function vim.treesitter.query.get(lang, query_name) end

--Gets the list of files used to make up a query
--
---@param lang string Language to get query for
---@param query_name string Name of the query to load (e.g., "highlights")
---@param is_included boolean|nil Internal parameter, most of the time left as `nil`
---@return table string[] query_files List of files to load for given query and language
function vim.treesitter.query.get_files(lang, query_name, is_included) end

--Lists the currently available directives to use in queries.
---@return table string[] List of supported directives.
function vim.treesitter.query.list_directives() end

--Lists the currently available predicates to use in queries.
---@return table string[] List of supported predicates.
function vim.treesitter.query.list_predicates() end

--Parse {query} as a string. (If the query is in a file, the caller should
--read the contents into a string before calling).
--
--Returns a `Query` (see |lua-treesitter-query|) object which can be used to search nodes in
--the syntax tree for the patterns defined in {query} using `iter_*` methods below.
--
--Exposes `info` and `captures` with additional context about {query}.
-- • `captures` contains the list of unique capture names defined in {query}.
--   -`info.captures` also points to `captures`.
-- • `info.patterns` contains information about predicates.
--
---@param lang string Language to use for the query
---@param query string Query in s-expr syntax
---@return Query
function vim.treesitter.query.parse(lang, query) end

--Sets the runtime query named {query_name} for {lang}
--This allows users to override any runtime files and/or configuration set by plugins.
--
---@param lang string Language to use for the query
---@param query_name string Name of the query (e.g., "highlights")
---@param text string Query text (unparsed).
function vim.treesitter.query.set(lang, query_name, text) end
