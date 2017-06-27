local exec
exec = require("libs.cfglib").exec
local Test
do
  local _class_0
  local _base_0 = {
    last_test_say = nil,
    msg = "test",
    handle = function(self, input)
      if input:match("test") then
        local now = os.time()
        if (not self.last_test_say) or (now - self.last_test_say > 2) then
          exec("say ^1WARNING: ^2" .. self.msg)
          self.last_test_say = now
        end
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Test"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Test = _class_0
  return _class_0
end
