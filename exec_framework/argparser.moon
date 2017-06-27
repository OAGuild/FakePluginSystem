#!/usr/bin/env moon

import V, R, S, C, Ct, P from require "libs.lulpeg"

spaces = P" "^1
spaced = (x) -> spaces * x * spaces
quoted = (x) -> P"'" * x * P"'"

-- TODO: tests
G = P{
  [1]: "args",
  args: "]\\" * Ct(V"func" * spaces * V"arglist"),
  func: C (P"plug" + P"unplug" + P"pset"),
  arglist: V"arg" * (spaces * V"arg")^0,
  arg: V"int"/tonumber + V"string",
  string: quoted(C((V"stringrange" + P" ")^0)) + C(V"stringrange"^1) + quoted(V"int"),
  stringrange: R"az"+R"AZ"+R"09"+S".?!_-+*/=^~&",
  int: C(P"0" + R"19"*(R"09"^0)),
}

-- import p from require "moon"
-- tests = {
--   "]\\plug test",
--   "set asd x"
-- }
--
-- for i, v in ipairs tests
--   p G\match v
--

return (s) -> G\match s
