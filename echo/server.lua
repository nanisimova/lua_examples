-- ожидаем входящее сообщение, отправляем его обратно и завершаем работу
local socket = require "socket"

-- localhost:9999
local host = "*"
local port = 9999 -- netstat -ltup проверяем занятые порты, чтобы выбрать свободный

local server = assert(socket.bind(host, port))
local ip, port = server:getsockname()

local client = server:accept()
client:settimeout(10)
local line, err = client:receive()

if not err then
    client:send(line.."\n")
end
client:close()