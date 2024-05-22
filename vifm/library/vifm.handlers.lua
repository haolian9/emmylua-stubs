---@meta

---Lua handlers are extension points within existing command-system of Vifm
---which enable invoking plugin functionality in a well-defined manner.
---
---A handler is a named Lua function, which is registered via a call to
---|vifm-l_vifm.addhandler()|.  The call specifies "partial name" which is
---prepended with a namespace ("`#pluginname#`" string) behind the scenes to form
---a full name.  This is done to avoid conflicts between plugins.
---
---The scope of handlers is limited to extensions that accept and return all
---relevant information on each invocation.  Things like keys or commands can't
---be handled this way because they need to communicate metadata about how to
---call them.
---
---Handlers are executed in a safe environment and can't call API marked as
---{unsafe}.
---
---A handler can be used in place of an external program in |vifm-:filetype| or
---|vifm-:filextype| commands like this: >
---  filetype {*.png} #pluginname#open
---
---A handler can be used in place of an external viewer in |vifm-:fileviewer|
---command like this: >
---  fileviewer {*.vim} #pluginname#view --strip-comments %c
---
---A viewer can also be called through |vifm-%q|: >
---  :!#pluginname#something %q
---
---A handler can be used to generate |vifm-'statusline'| or |vifm-'tabline'|
---value like this: >
---  set statusline=#pluginname#statusline
---  set tabline=#pluginname#tabline
vifm.handlers = {}

--todo:
--* statusline

do
  ---@class vifm.handlers.filetype.Info
  ---@field command string @Command which handles the file.
  ---@field entry vifm.Entry

  ---@param info vifm.handlers.filetype.Info
  function vifm.handlers.filetype(info) end
end

do
  ---@class vifm.handlers.fileviewer.Info
  ---@field command string @Command with which the viewer was invoked.
  ---@field path string @Path to the file which is being viewed.
  ---@field x integer @X coordinate of the preview area in characters.
  ---@field y integer @Y coordinate of the preview area in characters.
  ---@field width integer @Width of the preview area in characters.
  ---@field height integer @Height of the preview area in characters.

  ---@param info vifm.handlers.fileviewer.Info
  ---@return {lines: string[]} @preview text
  function vifm.handlers.fileviewer(info) end
end

do
  ---@class vifm.handlers.statusline.Info
  ---@field view vifm.View @current view
  ---@field width integer @Width of the status line.

  ---@param info vifm.handlers.statusline.Info
  ---@return {format: string} @Value for |vifm-'statusline'|.
  function vifm.handlers.statusline(info) end
end

do
  ---@class vifm.handlers.tabline.Info
  ---@field other boolean @Whether this is for the tabline of inactive pane in case of pane tabs.
  ---@field width integer @Width of the tab line.

  ---@param info vifm.handlers.tabline.Info
  ---@return {format: string} @Value for |vifm-'tabline'|.
  function vifm.handlers.tabline(info) end
end

do
  ---@class vifm.handlers.vicmd.Info
  ---@field command string @Command specified in one of the options.

  ---Editor is invoked by Vifm in several different contexts with generally
  ---different input data and sometimes different expectations (like waiting until
  ---editing is finished).  This is why a handler needs to process several kinds of
  ---actions which correspond to those contexts.
  ---
  ---@param info vifm.handlers.vicmd.Info
  ---@return {success: boolean}
  function vifm.handlers.vicmd(info) end
  vifm.handlers.vixcmd = vifm.handlers.vicmd
end

---todo: complete me
function vifm.handlers.open_help() end

do
  ---@class vifm.handlers.edit_one.Info
  ---@field action 'edit-one'
  ---@field path string @Path to the file to open.
  ---@field mustwait boolean @Whether handler must not return until editor has exited.
  ---@field line? integer @Line number at which to open the file.
  ---@field column integer @Column number at which to open the file.  Present only if "line" field is present.

  --Occurs on:
  -- - |vifm-:help| command if |vifm-'vimhelp'| is unset
  -- - pressing |vifm-v_v| key in view mode
  -- - opening file from a menu
  -- - opening file with a FUSE mounter using |vifm-i|
  -- - using |vifm-q:|, |vifm-q/| and |vifm-q?| commands in normal mode
  -- - requests to provide file names (like on :copy? or |vifm-:rename|)
  --
  --Should open single file at an optionally specified location (line, column) and
  --support waiting until editing has finished.
  ---@param info vifm.handlers.edit_one.Info
  function vifm.handlers.edit_one(info) end
end

do
  ---@class vifm.handlers.edit_many.Info
  ---@field action 'edit-many'
  ---@field paths string[] @Paths to the files to open.

  --Occurs on:
  -- - opening selection or current file on |vifm-Enter| key in normal mode
  -- - using |vifm-:edit| command
  --
  --Should open one or multiple files in an editor, likely as a list of buffers or tabs.
  ---@param info vifm.handlers.edit_many.Info
  function vifm.handlers.edit_many(info) end
end

do
  ---@class vifm.handlers.edit_list.Info
  ---@field action 'edit-list'
  ---@field current integer @position of current entry
  ---@field entries string[] @List of entries to pass to an editor.
  ---@field isquickfix boolean @Whether input entries are of the form "path[:line[:column]][:text]". Because such lists come from external tools, this information is determined using a simple heuristic and might not always be correct.

  --Occurs on pressing |vifm-m_v| key in view mode.  Should open list of files or
  --quickfix entries in an editor as a navigation list.
  ---@param info vifm.handlers.edit_list.Info
  function vifm.handlers.edit_list(info) end
end
