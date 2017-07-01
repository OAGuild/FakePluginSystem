import exec from require "libs.cfglib"
import addMessage from require "libs.say"

class Killme
  handle: (input) =>
    if input\lower!\match("kill")
      exec "kill"
