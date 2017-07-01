import exec from require "libs.cfglib"
import addMessage from require "libs.say"

class Teams
  handle: (input) =>
    if input\match("May not switch teams")
      return
    input = input\lower!
    if input\match("teams") or input\match("balance")
      exec "team auto"
