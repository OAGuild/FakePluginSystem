#!/usr/bin/env moon

say = require "libs.say"
import exec from require "libs.cfglib"
import send_signal from require "libs.xdotool"
parseargs = require "argparser"

plugged =
  ignore_list: {
    "magic.cfg",
    "Unknown command",
    "renamed",
  }

  plugins: {}

  plug: (lib, args) =>
    ok, plugin = pcall require, "plugins." .. lib
    if ok
      @plugins[lib] = plugin
      exec "echo plugin " .. lib .. " loaded"
    else
      exec "echo failed to load plugin " .. lib

  unplug: (lib) =>
    @plugins[lib] = nil

  pset: (lib, args) =>
    ok = pcall -> @plugins[lib][args[1]] = args[2]
    if ok
      print lib .. "." .. args[1] .. " is set to " .. args[2]

  pprint: (lib, args) =>
    pcall ->
      exec "echo " .. lib .. "." .. args[1] .. " is set to " .. tostring(@plugins[lib][args[1]])

  ignore: (input) =>
    for i, v in pairs @ignore_list do
      if input\match v
        return true
    return

  handleInput: (input) =>
    say.processQueue!
    if @ignore input
      return
    args = parseargs input
    if args
      send_signal {class: "OpenArena", key:"quoteleft"} -- hide console
      @[args[1]](@, args[2], {select(3, unpack args)})
      return

    @runPlugins input

  runPlugins: (input) =>
    for k, plugin in pairs @plugins
      if plugin\handle input
        break

plugged\plug "test"

while true
  input = io.read!
  if not input then
    break
  plugged\handleInput input
