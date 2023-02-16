---@meta

---@class LanguageTree
LanguageTree = {}

--Returns a map of language to child tree.
function LanguageTree:children() end

--Determines whether {range} is contained in the |LanguageTree|.
--
---@param range table `{ start_line, start_col, end_line, end_col }`
---@return boolean
function LanguageTree:contains(range) end

--Destroys this |LanguageTree| and all its children.
--Any cleanup logic should be performed here.
--Note: This DOES NOT remove this tree from a parent. Instead, `remove_child` must be called on the parent to remove it.
function LanguageTree:destroy() end

--Invokes the callback for each |LanguageTree| and its children recursively
--
---@param fn function function(tree: LanguageTree, lang: string)
---@param include_self boolean Whether to include the invoking tree in the results
function LanguageTree:for_each_child(fn, include_self) end

--Invokes the callback for each |LanguageTree| recursively.
--Note: This includes the invoking tree's child trees as well.
--
---@param fn function function(tree: TSTree, languageTree: LanguageTree)
function LanguageTree:for_each_tree(fn) end

--Gets the set of included regions
function LanguageTree:included_regions() end

--Invalidates this parser and all its children
function LanguageTree:invalidate(reload) end

--Determines whether this tree is valid. If the tree is invalid, call `parse()` . This will return the updated tree.
function LanguageTree:is_valid() end

--Gets the language of this tree node.
function LanguageTree:lang() end

--Gets the appropriate language that contains {range}.
--
---@param range table `{ start_line, start_col, end_line, end_col }`
---@return LanguageTree
function LanguageTree:language_for_range(range) end

--Gets the smallest named node that contains {range}.
--
---@param range table `{ start_line, start_col, end_line, end_col }`
---@param opts table|nil Optional keyword arguments:
--             • ignore_injections boolean Ignore injected languages (default true)
---@return TSNode|nil
function LanguageTree:named_node_for_range(range, opts) end

--Parses all defined regions using a treesitter parser for the language this
--tree represents. This will run the injection query for this language to
--determine if any child languages should be created.
--
--Return:
--    userdata[] Table of parsed |tstree|
--    (table) Change list
--
---@return TSTree[] Table of parsed TSTree
function LanguageTree:parse() end

--Registers callbacks for the |LanguageTree|.
--
---@param cbs table An |nvim_buf_attach()|-like table argument with the
--            following handlers:
--            • `on_bytes` : see |nvim_buf_attach()|, but this will be called after the parsers callback.
--            • `on_changedtree` : a callback that will be called every time
--              the tree has syntactical changes. It will only be passed one
--              argument, which is a table of the ranges (as node ranges)
--              that changed.
--            • `on_child_added` : emitted when a child is added to the
--              tree.
--            • `on_child_removed` : emitted when a child is removed from
--              the tree.
function LanguageTree:register_cbs(cbs) end

--Returns the source content of the language tree (bufnr or string).
function LanguageTree:source() end

--Gets the tree that contains {range}.
--
---@param range table `{ start_line, start_col, end_line, end_col }`
---@param opts table|nil Optional keyword arguments:
--             • ignore_injections boolean Ignore injected languages
--               (default true)
---@return TSTree|nil
function LanguageTree:tree_for_range(range, opts) end

--Returns all trees this language tree contains. Does not include child languages.
---@return TSTree[]
function LanguageTree:trees() end
