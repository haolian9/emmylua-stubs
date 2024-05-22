name = "nvim"

words = {
  "vim%.",
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
    value = "vim",
  },
}
