local p, run_with_scope
do
  local _obj_0 = require("moon")
  p, run_with_scope = _obj_0.p, _obj_0.run_with_scope
end
p({ })
local somefunc
somefunc = function(x)
  return print(x)
end
return run_with_scope(somefunc, {
  print = error
}, 1)
