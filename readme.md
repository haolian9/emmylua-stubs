provides annotations of some lua libraries which can be used for sumneko/lua-language-server.

## contained libraries
* [x] vifm 0.12.1: https://github.com/vifm/vifm/blob/0f6dd626a4e64c0d342e8a6e0504cdf6871a5dbb/data/vim/doc/app/vifm-lua.txt
* [x] mpv: 0.35.0: https://github.com/mpv-player/mpv/raw/2e5d0d6e07b373445dfecc3bb59454d08d9439d5/DOCS/man/lua.rst
* [x] nvim+treesitter: 0.8.1: https://github.com/ii14/emmylua-nvim/commit/b7e0dc546aa65615d230656050faded69c1f003e

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
