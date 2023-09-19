---@meta

---@class vim.InspectOpts
---@field depth? integer @nil=inf
---@field newline? string @nil=\n
---@field indent? string @nil=<spc><spc>
---@field process? fun(item: any, path: any[])

--https://github.com/kikito/inspect.lua#options
---@param value any
---@param options? vim.InspectOpts
function vim.inspect(value, options) end

--Parse the Vim regex {re} and return a regex object. Regexes are "magic"
--and case-sensitive by default, regardless of 'magic' and 'ignorecase'.
--They can be controlled with flags, see |/magic| and |/ignorecase|.
---@param re string
---@return vim.Regex
function vim.regex(re) end

---@class vim.WinInfo
---@field botline   number last complete displayed buffer line
---@field bufnr     number number of buffer in the window
---@field height    number window height (excluding winbar)
---@field loclist   number 1 if showing a location list
---@field quickfix  number 1 if quickfix or location list window
---@field terminal  number 1 if a terminal window
---@field tabnr     number tab page number
---@field topline   number first displayed buffer line
---@field variables table a reference to the dictionary with window-local variables
---@field width     number window width
---@field winbar    number 1 if the window has a toolbar, 0 otherwise
---@field wincol    number leftmost screen column of the window; "col" from |win_screenpos()|
---@field textoff   number number of columns occupied by any 'foldcolumn', 'signcolumn' and line number in front of the text
---@field winid     number window-ID
---@field winnr     number window number
---@field winrow    number topmost screen line of the window; "row" from |win_screenpos()|
vim.WinInfo = {}

---@param win_id number
---@return vim.WinInfo[]
function vim.fn.getwininfo(win_id) end
