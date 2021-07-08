local md5_mod = require "md5"

local hash = md5_mod.sum("hello")
local hex = md5_mod.sumhexa("hello")

print("sum: "..hash)
print("hex: "..hex)
