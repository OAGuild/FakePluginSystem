import exec from require "libs.cfglib"

class Test
  last_test_say: nil
  handle: (input) =>
    if input\match "test"
      now = os.time!
      if (not @last_test_say) or (now - @last_test_say > 2)
        exec "say ^1WARNING: ^2Some test detected!"
        @last_test_say = now
      -- print "WARNING: some test detected", input
