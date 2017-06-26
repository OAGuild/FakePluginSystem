#!/usr/bin/env lua

local HOME = os.getenv("HOME")
local PROGRAM = HOME.."/app/openarena-0.8.8/openarena.x86_64"
-- local PROGRAM = "minetest"

os.execute(PROGRAM .. "  2>&1 | lua capture.lua")
