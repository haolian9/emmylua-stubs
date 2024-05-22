---@meta

---managing command-line abbreviations.
vifm.abbrevs = {}

do
  ---@class vifm.abbrevs.add.Abbrev
  ---@field lhs string
  ---@field noremap? boolean @nil=true
  ---@field handler fun(info: vifm.abbrevs.add.Info): vifm.abbrevs.add.Result @Handler which accepts {info} and returns {results}.

  ---@class vifm.abbrevs.add.Info
  ---@field lhs string

  ---@class vifm.abbrevs.add.Result
  ---@field rhs string

  ---Registers a new command-line abbreviation.
  ---This function is {unsafe}.
  ---@param abbrev vifm.abbrevs.add.Abbrev
  function vifm.abbrevs.add(abbrev) end
end
