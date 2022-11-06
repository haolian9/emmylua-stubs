name = "mp"

words = {
  "mp%.",
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
    value = "mp",
  },
}
