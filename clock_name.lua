#!/usr/bin/env lua
-- assuming you did /bind F7 exec name.cfg

local UPDATE_TIME = 10
local MOD = "CTF"

local function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

local config = os.getenv("HOME").."/.openarena/"..MOD.."/name.cfg"

while true do
  local fd = io.open(config, "w+")
  fd:write("seta name Now is ".. os.date().."\n")
  fd:close()
  sleep(UPDATE_TIME)
  os.execute("xdotool search --class OpenArena key F7")
end
