send_signal = (args) ->
  cmd = string.format "xdotool search --class %s key %s", args.class, args.key
  os.execute cmd

{:send_signal}
