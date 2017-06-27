local say = require("libs.say")
local exec
exec = require("libs.cfglib").exec
local send_signal
send_signal = require("libs.xdotool").send_signal
local parseargs = require("argparser")
local plugged = {
  ignore_list = {
    "magic.cfg",
    "Unknown command",
    "renamed"
  },
  plugins = { },
  plug = function(self, lib, args)
    local ok, plugin = pcall(require, "plugins." .. lib)
    if ok then
      self.plugins[lib] = plugin
      return exec("echo plugin " .. lib .. " loaded")
    else
      return exec("echo failed to load plugin " .. lib)
    end
  end,
  unplug = function(self, lib)
    self.plugins[lib] = nil
  end,
  pset = function(self, lib, args)
    return pcall(function()
      self.plugins[lib][args[1]] = args[2]
    end)
  end,
  ignore = function(self, input)
    for i, v in pairs(self.ignore_list) do
      if input:match(v) then
        return true
      end
    end
  end,
  handleInput = function(self, input)
    say.processQueue()
    if self:ignore(input) then
      return 
    end
    local args = parseargs(input)
    if args then
      send_signal({
        class = "OpenArena",
        key = "quoteleft"
      })
      self[args[1]](self, args[2], {
        select(3, unpack(args))
      })
      return 
    end
    return self:runPlugins(input)
  end,
  runPlugins = function(self, input)
    for k, plugin in pairs(self.plugins) do
      if plugin:handle(input) then
        break
      end
    end
  end
}
plugged:plug("test")
while true do
  local input = io.read()
  if not input then
    break
  end
  plugged:handleInput(input)
end
