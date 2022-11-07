provides annotations of some lua libraries which can be used for sumneko/lua-language-server.

## contained libraries
* [x] vifm: https://github.com/vifm/vifm/blob/0f6dd626a4e64c0d342e8a6e0504cdf6871a5dbb/data/vim/doc/app/vifm-lua.txt
* [ ] mpv: https://github.com/mpv-player/mpv/blob/master/DOCS/man/lua.rst
* [x] nvim+treesitter: 0.8.0

## how to use in neovim
* add it to your nvim plugin manager, say it's vim-plug
* configure nvim-lspconfig for sumneko/lua-language-server

```
lspconfig["sumneko_lua"].setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {
            "vifm",
            -- and others
        },
      },
      workspace = {
        library = {
          -- for vifm annotations only
          string.format("%s/%s", vim.fn.stdpath("data"), "plugged/emmylua-stubs/vifm"),
          -- and others
        },
      },
    },
  },
})
```

## todo
* annotation generators, but it seems to be hard to parse the api document of vifm and mpv
