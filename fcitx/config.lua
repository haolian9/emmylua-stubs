name = "fcitx"

words = {
  "fcitx%.",

}

configs = {
  {
    key = "Lua.runtime.version",
    action = "set",
    value = "LuaJIT",
  },
  {
    key = "Lua.diagnostics.globals",
    action = "add",
    value = "fcitx",
  },
}
