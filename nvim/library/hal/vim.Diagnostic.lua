---@meta

---@class vim.Diagnostic
---@field bufnr?     integer
---@field lnum       integer @0-based
---@field end_lnum?  integer @0-based
---@field col        integer @0-based
---@field end_col?   integer @0-based, exclusive?
---@field severity?  'HINT'|'INFO'|'WARN'|'ERROR'
---@field message    string
---@field source?    any     @The source of the diagnostic
---@field code?      integer @The diagnostic code
---@field user_data? any     @Arbitrary data plugins or users can add
vim.Diagnostic = {}
