local exec
exec = require("libs.cfglib").exec
local insert, remove
do
  local _obj_0 = table
  insert, remove = _obj_0.insert, _obj_0.remove
end
local MessageQueue
MessageQueue = {
  queue = { },
  maxwait = 20,
  message_delta = 5,
  last_sayed = 0,
  addMessage = function(message, importance)
    print(message, importance)
    local time = os.time()
    MessageQueue.last_sayed = MessageQueue.last_sayed or time - MessageQueue.maxwait
    if importance == 0 then
      if time - MessageQueue.last_sayed < MessageQueue.message_delta then
        return 
      end
      MessageQueue.last_sayed = time
      return exec("say " .. message)
    else
      return insert(MessageQueue.queue, {
        message = message,
        time = time,
        importance = importance
      })
    end
  end,
  cleanupQueue = function()
    local queue, maxwait, last_sayed
    queue, maxwait, last_sayed = MessageQueue.queue, MessageQueue.maxwait, MessageQueue.last_sayed
    local time = os.time()
    for i = #queue, 1, -1 do
      if (queue[i].importance > 1) and (queue[i].maxwait < time - last_sayed) then
        remove(queue, i)
      end
    end
  end,
  processQueue = function()
    local time = os.time()
    if time - MessageQueue.last_sayed < MessageQueue.message_delta then
      return 
    end
    MessageQueue.cleanupQueue()
    local queue
    queue = MessageQueue.queue
    for i = 1, #queue do
      local msg = queue[i]
      print("msg: ", msg.message)
      if msg.time < time - MessageQueue.message_delta then
        exec("say " .. msg.message)
        MessageQueue.last_sayed = time
        break
      end
    end
  end
}
return MessageQueue
