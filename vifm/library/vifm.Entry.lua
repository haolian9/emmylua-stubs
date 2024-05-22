---@meta

--Instances of this type are used in filetype |vifm-lua-handlers| and in
--callbacks of |vifm-l_vifm.addcolumntype()|.  They are also returned by
--|vifm-l_VifmView:entry()|.
--
--Fields of this table are just copies, changing their values won't affect state
--of the application.
---@class vifm.Entry
--
---@field name string Name of the file
---@field location string Location of the file
---@field size number Size of the file in bytes
---@field atime number File access time (e.g., read, executed).  In seconds since the Unix epoch.
---@field ctime number File change time (changes in metadata, like mode).  In seconds since the Unix epoch.
---@field mtime number File modification time (when file contents is changed).  In seconds since the Unix epoch.
--
--Type of the entry. See |vifm-filetype()| for the list of values.
---@field type string
--
--True if an entry is either a directory or a symbolic link to a directory.
---@field isdir boolean
--
--Whether this entry is folded.
---@field folded boolean
--
--Whether this entry is selected.
---@field selected boolean
--
--Whether this entry is a search match.
---@field match boolean
--
--For a search match this is the start position of a substring found in name,
--zero otherwise.
---@field matchstart integer
--
--For a search match this is the end position of a substring found in name,
--zero otherwise.
---@field matchend integer
vifm.Entry = {}

--Table that describes name decorations.  Its fields:
-- - "prefix" (string)
--   File name prefix.
-- - "suffix" (string)
--   File name suffix.
--
---@class vifm.Entry.classify
---@field prefix string
---@field suffix string
vifm.Entry.classify = {}

--Gets target of a symbolic link (not to be confused with real path resolution).
--
--Raises an error:~
--  If entry doesn't correspond to a symbolic link.
--  If resolving symbolic link has failed.
--
---@return string
function vifm.Entry:gettarget() end

--Gets a MIME type.  Resolves target of symbolic links.
--
--Return:~
--  Returns MIME type as a string, or `nil` if no MIME type recognisers are
--  available.
--
---@return string|nil
function vifm.Entry:mimetype() end
