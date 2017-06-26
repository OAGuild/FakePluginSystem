import exec from require "libs.cfglib"
import addMessage from require "libs.say"

class Test
  name: "Unnamed player"
  afk_time: 20
  previous_update_time: 0
  update_delta: 2

  new: (args) =>
    @name = args.name or "Unnamed player"
    @afk_time = args.time or 60
    @update_delta = args.delta or 10

  handle: (input) =>
    time = os.time!
    if @afk_time_start and (input\match @name)
      addMessage "say ^1WARNING: I'm AFK", 1
    elseif input\match "start afk"
      @afk_time_start = os.time!
    if @afk_time_start
      time_left = (os.time! + @afk_time - @afk_time_start) / 60
      if time_left <= 0
        @afk_time_start = nil
        exec "name " .. @name
      else
        if time - @previous_update_time > @update_delta
          newname =  string.format "%s | back in %f minutes", @name, time_left
          exec "name " .. newname
          @previous_update_time = time
        else
          exec "name " .. @name .. " | probably not AFK anymore"
