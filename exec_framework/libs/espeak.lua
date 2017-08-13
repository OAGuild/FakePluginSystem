local say
say = function(text)
  local espeak_cmd = [[espeak --stdout -s250 -k18 -a50 -v female2 | play -t wav - \
  gain 10
  ]]
  do
    local _with_0 = io.popen(espeak_cmd, "w")
    _with_0:write(text)
    _with_0:close()
    return _with_0
  end
end
return {
  say = say
}
