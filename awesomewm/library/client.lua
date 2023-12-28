---@meta

---A process window.
---
---Clients are the name used by Awesome (and X11) to refer to a window.
---
---A program can have multiple clients (e.g. for dialogs) or none at all (e.g. command line applications). Clients are usually grouped by classes. A class is the name used by X11 to help the window manager distinguish between windows and write rules for them. A client's behavior is also defined by its type and size_hints properties. See the xprop command line application to query properties for a client.
---@class Client
