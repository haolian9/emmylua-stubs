provides annotations of some lua libraries which can be used for sumneko/lua-language-server.

## included libraries
* [x] vifm 0.13.0
* [x] mpv 0.35.0: https://github.com/mpv-player/mpv/raw/2e5d0d6e07b373445dfecc3bb59454d08d9439d5/DOCS/man/lua.rst
* [x] nvim 0.10.0
* [x] luv https://github.com/Bilal2453/luvit-meta/blob/ce76f6f6cdc9201523a5875a4471dcfe0186eb60/library/uv.lua
* [x] fcitx5 5.0.10
* [ ] awesomewm 4.3

## configure

see: https://github.com/LuaLS/lua-language-server/wiki/Settings#workspacelibrary

`vim.lsp.start`, for example:

```
vim.lsp.start({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vifm" },
      },
      workspace = {
        library = { "/path/to/this/repo/vifm" },
      },
    },
  },
  -- other configures for lua_ls
})
```

## todo
* annotation generators, but it seems to be hard to parse the api document of vifm
