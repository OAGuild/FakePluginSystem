#!/usr/bin/env moon

import p, run_with_scope from require "moon"

p {}

somefunc = (x) ->
  print x

run_with_scope somefunc, {print: error}, 1
