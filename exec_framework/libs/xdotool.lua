local send_signal
send_signal = function(args)
  local cmd = string.format("xdotool search --class %s key %s", args.class, args.key)
  return os.execute(cmd)
end
return {
  send_signal = send_signal
}
