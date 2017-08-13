#!/usr/bin/env moon

HOME = os.getenv"HOME"
OA_PATH = HOME.."/app/openarena-0.8.8/openarena.x86_64"

send_signal = (args) ->
  cmd = string.format "xdotool search --class %s key %s", args.class, args.key
  os.execute cmd

say = (text) ->
  if not text
    return
  espeak_cmd = [[espeak --stdout -s250 -k18 -a50 -v female2 | play -t wav - \
  gain 3
  ]]
  with io.popen espeak_cmd, "w"
    \write text
    \close!

clear = (text) ->
  text = text\gsub("%^.", "")\lower!
  text

fd = io.popen OA_PATH .. " 2>&1 ", "r"
while true
  input = fd\read!
  if not input
    break
  input = clear input
  if input\match "guild"
    say input\gsub "guild", ""
