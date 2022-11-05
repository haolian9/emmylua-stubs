name = 'vifm'

words = {
  'vifm%.'
}

configs = {
  {
    key = 'Lua.runtime.version',
    action = 'set',
    value = 'LuaJIT',
  },
  {
    key = 'Lua.diagnostics.globals',
    action = 'add',
    value = 'vifm',
  },
}
