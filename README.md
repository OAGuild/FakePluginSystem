# What?
A fake plugin system for OpenArena

## Requirements
* Lua 5.1-5.3
* xdotool
* Currently tested only for GNU/Linux.
* (Not really required unless you want to edit source .moon files) Moonscript compiler

You'll also have to bind `F7` to `exec magic.cfg`.

## But why?
Just for fun, of course.

## How does it work?
run.lua executes OpenArena (you'll have to configure path first) and redirects its output to capture.lua.
Then capture.lua will read input line-by-line and do one of the following things for each line:
* ignore
* send line to plugins to handle (plugins are special scripts in 'plugins' folder)
* decide that you've just typed a command and try to run it

Possible commands are:
* /plug plugin_name [args] (turn on plugin)
* /unplug plugin_name (turn off plugin)
* /pset plugin variable value (set plugin's variable)
* /pprint plugin variable (print plugin's variable using /echo command)

These commands don't exist in OpenArena, but the script will understand you.

## Warning
Work in progress, beware of falling ~~breaks~~ bricks
