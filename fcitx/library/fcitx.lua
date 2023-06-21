---@meta

---@class fcitx
---
fcitx = {}

---The lua version of fcitx::KeyState. It represent the value of modifier keys.
---@class fcitx.KeyState
---@field None         any
---@field Shift        any
---@field CapsLock     any
---@field Ctrl         any
---@field Alt          any
---@field NumLock      any
---@field Mod3         any
---@field Super        any
---@field Mod5         any
---@field MousePressed any
---@field HandledMask  any
---@field IgnoredMask  any
---@field Super2       any
---@field Hyper        any
---@field Meta         any
---@field UsedMask     any
fcitx.KeyState = {}

---The lua version of fcitx::StandardPath::Type. It represent the value of different type of directory.
---see /usr/include/Fcitx5/Utils/fcitx-utils/standardpath.h
---@class fcitx.StandardPath
---
---@field Config    integer
---@field PkgConfig integer
---@field Data      integer
---@field Cache     integer
---@field Runtime   integer
---@field Addon     integer
---@field PkgData   integer
fcitx.StandardPath = {}

---The lua version of fcitx::QuickPhraseAction. It represent the different value that can be returned from quickphrase handler.
---@class fcitx.QuickPhraseAction
---
---@field Break          any
---@field Commit         any
---@field TypeToBuffer   any
---@field DigitSelection any
---@field AlphaSelection any
---@field NoneSelection  any
---@field DoNothing      any
---@field AutoCommit     any
fcitx.QuickPhraseAction = {}

---The lua version of fcitx::EventType. It represent the value of different type of events.
---see: /usr/include/Fcitx5/Core/fcitx/event.h
---@class fcitx.EventType
---
---@field ContextCreated         integer
---@field ContextDestroyed       integer
---@field FocusOut               integer
---@field FocusIn                integer
---@field KeyEvent               integer
---@field SurroundingTextUpdated integer
---@field CursorRectChanged      integer
---@field SwitchInputMethod      integer
---@field InputMethodActivated   integer
---@field InputMethodDeactivated integer
---@field CommitString           integer
---@field UpdatePreedit          integer
fcitx.EventType = {}

---Call a global function by its name
---@param function_name string name of the function
---@param ... any the arguments forwarded to the function
---@return any @nil if function is not found, or the return value of the function
function fcitx.call_by_name(function_name, ...) end

---Get the version of fcitx.
---@return string @The version of fcitx
function fcitx.version() end

---Get the last committed string
---@return string @The last commit string from fcitx
function fcitx.lastCommit() end

---a helper function to split the string by delimiter.
---@param str string string to be split.
---@param delim string string used as delimiter.
---@return string[] @An array of string split by delimiter, empty string will be skipped.
function fcitx.splitString(str, delim) end

---a helper function to send Debug level log to fcitx.
---@param str string log string.
function fcitx.log(str) end

---Watch for a event from fcitx.
---@see fcitx.EventType
---@param event integer Event Type.
---@param fn string the function name.
---@return integer @A unique integer identifier.
function fcitx.watchEvent(event, fn) end

---Unwatch a certain event.
---@see fcitx.watchEvent
---@param id integer id of the watcher.
function fcitx.unwatchEvent(id) end

---Return the current input method.
---@return string @the unique string of current input method.
function fcitx.currentInputMethod() end

---Change the current input method
---@param name string the unique string of the input method name.
function fcitx.setCurrentInputMethod(name) end

---Return the current program name
---@return string the string of current program name.
function fcitx.currentProgram() end

---Add a string converter for committing string.
---@param fn string the function name.
---@return integer @A unique integer identifier.
function fcitx.addConverter(fn) end

---Remove a converter.
---@param id integer id of this converter.
function fcitx.removeConverter(id) end

---Add a quick phrase handler.
---@param fn string the function name.
---@return integer @A unique integer identifier.
function fcitx.addQuickPhraseHandler(fn) end

---Remove a quickphrase handler.
---@see fcitx.addQuickPhraseHandler
---@param id integer id of this handler.
function fcitx.removeQuickPhraseHandler(id) end

---Commit string to current input context.
---@param str string string to be commit to input context.
function fcitx.commitString(str) end

---Locate all files with given path and suffix.
---@see fcitx.StandardPath
---@param type integer
---@param path string
---@param suffix string
---@return table A table of full file name.
function fcitx.standardPathLocate(type, path, suffix) end

---Helper function to convert UTF16 string to UTF8.
---@param str string UTF16 string.
---@return string UTF8 string or empty string if it fails.
function fcitx.UTF16ToUTF8(str) end

---Helper function to convert UTF8 string to UTF16.
---@param str string UTF8 string.
---@return string UTF16 string or empty string if it fails.
function fcitx.UTF8ToUTF16(str) end
