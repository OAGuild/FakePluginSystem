local send_signal
send_signal = require("libs.xdotool").send_signal
local This
This = {
  CONFIG_PATH = os.getenv("HOME") .. "/.openarena/baseoa/magic.cfg",
  CFG_RELOAD_KEY = "F7",
  exec = function(cfg)
    local fd = io.open(This.CONFIG_PATH, "w+")
    fd:write(cfg)
    fd:write("\n")
    fd:close()
    return send_signal({
      class = "OpenArena",
      key = This.CFG_RELOAD_KEY
    })
  end
}
return This
