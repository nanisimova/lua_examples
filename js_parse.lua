local jsmod = require "dkjson"

local json1 = [[{
    "name":"Ann",
    "surname":"Trifonova",
    "contacts":{
        "phone":"892190899756",
        "icq":"876689"
    }
}]]

res = jsmod.decode(json1)

for k, v in pairs(res) do
    if type(v)=='table' then
        for k2, v2 in pairs(v) do print(k2,v2) end
    else
        print(k,v)
    end
end