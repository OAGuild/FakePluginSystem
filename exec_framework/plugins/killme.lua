local exec
exec = require("libs.cfglib").exec
local addMessage
addMessage = require("libs.say").addMessage
local Killme
do
  local _class_0
  local _base_0 = {
    handle = function(self, input)
      if input:lower():match("kill") then
        return exec("kill")
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Killme"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Killme = _class_0
  return _class_0
end
