---@meta

--A "treesitter node" represents one specific element of the parsed contents of
--a buffer, which can be captured by a |Query| for, e.g., highlighting. It is a
--|luaref-userdata| reference to an object held by the tree-sitter library.
---@class TSNode
TSNode = {}

--Get the node's immediate parent.
---@return TSNode?
function TSNode:parent() end

--Get the node's next sibling.
---@return TSNode?
function TSNode:next_sibling() end

--Get the node's previous sibling.
---@return TSNode?
function TSNode:prev_sibling() end

--Get the node's next named sibling.
---@return TSNode?
function TSNode:next_named_sibling() end

--Get the node's previous named sibling.
---@return TSNode?
function TSNode:prev_named_sibling() end

--Iterates over all the direct children of {tsnode}, regardless of whether they are named or not.
--Returns the child node plus the eventual field name corresponding to this child node.
---@return fun(): TSNode?
function TSNode:iter_children() end

--Returns a table of the nodes corresponding to the {name} field.
---@return TSNode[]
function TSNode:field(name) end

--Get the node's number of children.
---@return number
function TSNode:child_count() end

--Get the node's child at the given {index}, where zero represents the first child.
function TSNode:child(index) end

--Get the node's number of named children.
---@return number
function TSNode:named_child_count() end

--Get the node's named child at the given {index}, where zero represents the first named child.
---@return TSNode
function TSNode:named_child(index) end

--Get the node's start position. Return three values: the row, column and total byte count (all zero-based).
---@return number,number,number
function TSNode:start() end

--Get the node's end position. Return three values: the row, column and total byte count (all zero-based).
---@return number,number,number
function TSNode:end_() end

--Get the range of the node. Return four values: the row, column of the start position, then the row, column of the end position.
---@return number,number,number,number
function TSNode:range() end

--Get the node's type as a string.
---@return string
function TSNode:type() end

--Get the node's type as a numerical id.
---@return number
function TSNode:symbol() end

--Check if the node is named. Named nodes correspond to named rules in the
--grammar, whereas anonymous nodes correspond to string literals in the grammar.
---@return boolean
function TSNode:named() end

--Check if the node is missing. Missing nodes are inserted by the parser in
--order to recover from certain kinds of syntax errors.
---@return boolean
function TSNode:missing() end

--Check if the node is a syntax error or contains any syntax errors.
---@return boolean
function TSNode:has_error() end

--Get an S-expression representing the node as a string.
---@return string
function TSNode:sexpr() end

--Get an unique identifier for the node inside its own tree.
--
--No guarantees are made about this identifier's internal representation,
--except for being a primitive Lua type with value equality (so not a
--table). Presently it is a (non-printable) string.
--
--Note: The `id` is not guaranteed to be unique for nodes from different trees.
---@return string
function TSNode:id() end

--Get the smallest node within this node that spans the given range of (row, column) positions
function TSNode:descendant_for_range(start_row, start_col, end_row, end_col) end

--Get the smallest named node within this node that spans the given range of (row, column) positions
function TSNode:named_descendant_for_range(start_row, start_col, end_row, end_col) end
