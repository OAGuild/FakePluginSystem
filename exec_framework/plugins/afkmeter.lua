local exec
exec = require("libs.cfglib").exec
local addMessage
addMessage = require("libs.say").addMessage
local Test
do
  local _class_0
  local _base_0 = {
    name = "Unnamed player",
    afk_time = 20,
    afk_time_start = os.clock(),
    previous_update_time = 0,
    update_delta = 2,
    handle = function(self, input)
      local time = os.time()
      if self.afk_time_start and (input:match(self.name)) then
        addMessage("say ^1WARNING: I'm AFK", 1)
      elseif input:match("start afk") then
        self.afk_time_start = os.time()
      end
      if self.afk_time_start then
        local time_left = (os.time() + self.afk_time - self.afk_time_start) / 60
        if time_left <= 0 then
          self.afk_time_start = nil
          return exec("name " .. self.name)
        else
          if time - self.previous_update_time > self.update_delta then
            local newname = string.format("%s | back in %f minutes", self.name, time_left)
            exec("name " .. newname)
            self.previous_update_time = time
          else
            return exec("name " .. self.name .. " | probably not AFK anymore")
          end
        end
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, args)
      self.name = args.name or "Unnamed player"
      self.afk_time = args.time or 60
      self.update_delta = args.delta or 10
    end,
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
