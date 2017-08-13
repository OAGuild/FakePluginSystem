#!/usr/bin/env moon

say = (text) ->
  espeak_cmd = [[espeak --stdout -s250 -k18 -a50 -v female2 | play -t wav - \
  gain 10
  ]]
  with io.popen espeak_cmd, "w"
    \write text
    \close!

return {
  :say
}
