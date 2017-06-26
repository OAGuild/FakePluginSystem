#!/usr/bin/env moon

import exec from require "libs.cfglib"
import insert, remove from table

local MessageQueue

MessageQueue =
  queue: {}
  maxwait: 20 -- seconds
  message_delta: 5
  last_sayed: 0

  addMessage: (message, importance) ->
    print message, importance
    time = os.time()
    MessageQueue.last_sayed = MessageQueue.last_sayed or time - MessageQueue.maxwait
    if importance == 0 then
      if time - MessageQueue.last_sayed < MessageQueue.message_delta
        return
      MessageQueue.last_sayed = time
      exec "say " .. message
    else
      insert MessageQueue.queue, {:message, :time, :importance}

  cleanupQueue: ->
    import queue, maxwait, last_sayed from MessageQueue
    time = os.time!
    for i = #queue, 1, -1 do
      if (queue[i].importance > 1) and (queue[i].maxwait < time - last_sayed)
        remove queue, i

  processQueue: ->
    time = os.time!
    if time - MessageQueue.last_sayed < MessageQueue.message_delta
      return
    MessageQueue.cleanupQueue!
    import queue from MessageQueue
    for i = 1, #queue do
      msg = queue[i]
      print("msg: ", msg.message)
      if msg.time < time - MessageQueue.message_delta
        exec "say " .. msg.message
        MessageQueue.last_sayed = time
        break

MessageQueue
