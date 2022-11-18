name = 'vifm'

words = {
  'vifm%.'
}

configs = {
  {
    key = 'Lua.runtime.version',
    action = 'set',
    value = 'Lua 5.4',
  },
  {
    key = 'Lua.diagnostics.globals',
    action = 'add',
    value = 'vifm',
  },
}
