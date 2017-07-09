#!/usr/bin/env lua5.3
-- Because some tags are hard to setup inside OA
local cfglib = require "libs.cfglib"

local tag = "^3\u{1D}^1Guild^3\u{1F}"
local name = arg[1] or "^5T^7est" -- You can do ./rename_with_clan_tag.lua ^5T^7est

cfglib.hide_console()
cfglib.exec('seta name "' .. (tag .. name) .. '"')
