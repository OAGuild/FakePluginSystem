local V, R, S, C, Ct, P
do
  local _obj_0 = require("libs.lulpeg")
  V, R, S, C, Ct, P = _obj_0.V, _obj_0.R, _obj_0.S, _obj_0.C, _obj_0.Ct, _obj_0.P
end
local spaces = P(" ") ^ 1
local spaced
spaced = function(x)
  return spaces * x * spaces
end
local G = P({
  [1] = "args",
  args = "]\\" * Ct(V("func") * spaces * V("arglist")),
  func = C((P("plug") + P("unplug") + P("set"))),
  arglist = V("arg") * (spaces * V("arg")) ^ 0,
  arg = V("int") / tonumber + V("string"),
  string = C((R("az") + R("AZ") + R("09") + S("._-+*/=")) ^ 1) + P("'") * V("int") * P("'"),
  int = C(P("0") + R("19") * (R("09") ^ 0))
})
return function(s)
  return G:match(s)
end
