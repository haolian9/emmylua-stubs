provides annotations of some lua libraries which can be used for sumneko/lua-language-server.

## included libraries
* [x] vifm 0.12.1: https://github.com/vifm/vifm/blob/0f6dd626a4e64c0d342e8a6e0504cdf6871a5dbb/data/vim/doc/app/vifm-lua.txt
* [x] mpv 0.35.0: https://github.com/mpv-player/mpv/raw/2e5d0d6e07b373445dfecc3bb59454d08d9439d5/DOCS/man/lua.rst
* [x] nvim 0.9.0: https://github.com/ii14/emmylua-nvim/tree/2d97dd135f2a7272eb169cbb602a8144bc2eb7d2
* [x] vim.treesitter 0.9.0
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


## thoughts
* why dont i contribute to the upstream repositories directly?
* potential license issue with the included repositories?
