#!/usr/bin/env lua
-- bind F7 exec magic.cfg

local UPDATE_TIME = 2
local AFK_TIME = 5 * 60 -- seconds
local NAME = "Zzzzz"

local function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

local magic_cfg_path = os.getenv("HOME").."/.openarena/baseoa/magic.cfg"

local function write_magic(script)
  local fd = io.open(magic_cfg_path, "w+")
  fd:write(script)
  fd:close()
end

local function exec_magic(script)
  write_magic(script)
  os.execute("xdotool search --class OpenArena key F7")
end

local start_time = os.time()

repeat
  local time = os.time()
  exec_magic(string.format("name %s | Back in %.2f minutes", NAME, (AFK_TIME - time + start_time)/60.0))
  sleep(UPDATE_TIME)
until time - start_time + UPDATE_TIME > AFK_TIME

exec_magic("name " .. NAME .. " probably not AFK anymore")
