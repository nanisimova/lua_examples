-- отправляем строку и получаем ее в ответ
local socket = require "socket"
local host = "localhost"
local port = 9999

conn = assert(socket.connect(host, port))

assert(conn:send("hello!\n"))
stdout, e = conn:receive()
print(stdout.."\n")