---@meta

--A "treesitter tree" represents the parsed contents of a buffer, which can be
--used to perform further analysis. It is a |luaref-userdata| reference to an
--object held by the tree-sitter library.
---@class TSTree
TSTree = {}

--Return the root node of this tree.
function TSTree:root() end

--Returns a copy of the `tstree`.
function TSTree:copy() end
