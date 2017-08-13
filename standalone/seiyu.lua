local HOME = os.getenv("HOME")
local OA_PATH = HOME .. "/app/openarena-0.8.8/openarena.x86_64"
local say
say = function(text)
  if not text then
    return 
  end
  print("saying ", text)
  local espeak_cmd = [[espeak --stdout -s250 -k18 -a50 -v female2 | play -t wav - \
  gain 3
  ]]
  do
    local _with_0 = io.popen(espeak_cmd, "w")
    _with_0:write(text)
    _with_0:close()
    return _with_0
  end
end
local timer = {
  time = os.time(),
  reset = function(self)
    self.time = os.time()
  end,
  diff = function(self)
    return os.time() - self.time
  end
}
local fd = io.popen(OA_PATH .. " 2>&1 ", "r")
while true do
  local input = fd:read()
  if not input then
    break
  end
  input = input:gsub("%^.", ""):lower()
  if input:match("guild") and (timer:diff() > 1) then
    say(input:gsub("guild", ""))
    timer:reset()
  end
end
