local exec
exec = require("libs.cfglib").exec
local addMessage
addMessage = require("libs.say").addMessage
local Teams
do
  local _class_0
  local _base_0 = {
    handle = function(self, input)
      if input:match("May not switch teams") then
        return 
      end
      input = input:lower()
      if input:match("teams") or input:match("balance") then
        return exec("team auto")
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Teams"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Teams = _class_0
  return _class_0
end
