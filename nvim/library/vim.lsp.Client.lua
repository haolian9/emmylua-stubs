---@meta

---@see vim.lsp.client
---LSP client object. You can get an active client object via |vim.lsp.get_client_by_id()| or |vim.lsp.get_active_clients()|.
---@class vim.lsp.Client
---
---@field id integer
---
---If a name is specified on creation, that will be used. Otherwise it is just the client id. This is used for logs and messages.
---@field name string
---
---RPC client object, for low level interaction with the client. See |vim.lsp.rpc.start()|
---@field rpc any
---
---The encoding used for communicating with the server. You can modify this in the `config`'s `on_init` method before text is sent to the server.
---@field offset_encoding string
---
---The handlers used by the client as described in |lsp-handler|.
---@field handlers {[string]: vim.lsp.Handler}
---
---The current pending requests in flight to the server.
---@field requests {[integer]: {type: 'pending'|'cancel', bufnr: integer, method: string}} @{request_id: ctx}
---
---copy of the table that was passed by the user to |vim.lsp.start_client()|
---@field config table
---
---Response from the server sent on `initialize` describing the server's capabilities.
---@field server_capabilities table
vim.lsp.Client = {}

---Sends a request to the server.
---This is a thin wrapper around {client.rpc.request} with some additional checking.
---If {handler} is not specified, If one is not found there, then an error will occur.
---@param method string
---@param params any
---@param handler? vim.lsp.Handler @lsp-handler
---@param bufnr integer
---@return boolean,integer? @status,request_id; request_id is only available when status=true
function vim.lsp.Client.request(method, params, handler, bufnr) end

---Sends a request to the server and synchronously waits for the response. This is a wrapper around {client.request}.
---@param method string
---@param params any
---@param timeout_ms integer
---@param bufnr integer
---@return any
function vim.lsp.Client.request_sync(method, params, timeout_ms, bufnr) end

---Sends a notification to an LSP server.
---@param method string
---@param params any
---@return boolean
function vim.lsp.Client.notify(method, params) end

---Cancels a request with a given request id. Returns:
---@param id integer @request id
---@return boolean
function vim.lsp.Client.cancel_request(id) end

---Stops a client, optionally with force.
---By default, it will just ask the server to shutdown without force.
---If you request to stop a client which has previously been requested to shutdown, ---it will automatically escalate and force shutdown.
---@param force? boolean @nil=false
function vim.lsp.Client.stop(force) end

---@return boolean
function vim.lsp.Client.is_stopped() end

---Runs the on_attach function from the client's config if it was defined. Useful for buffer-local setup.
---@param client vim.lsp.Client
---@param bufnr integer
function vim.lsp.Client.on_attach(client, bufnr) end
