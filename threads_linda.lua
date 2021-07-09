-- создаем два потока выполнения, которые обмениваются между собой значением counter и постоянно увеличиваеют его
-- полезная документация по теме: https://lualanes.github.io/lanes/
local lanes = require "lanes".configure()
local linda = lanes.linda()
local posix = require "posix"

function t1()
    local posix = require "posix"
    local counter = 1
    while true do
        local key, val = linda:receive(0.5, "data")
        if val ~= nil then
            counter = val
        end
        print("Thread 1, Counter "..counter)
        counter = counter + 1
        linda:send("data", counter)
        posix.sleep(1)
    end
end

function t2()
    local posix = require "posix"
    local counter = 1
    while true do
        local key, val = linda:receive(0.5, "data")
        if val ~= nil then
            counter = val
        end
        print("Thread 2, Counter "..counter)
        counter = counter + 1
        linda:send("data", counter)
        posix.sleep(2)
    end
end

gent1 = lanes.gen("*", t1)()
gent2 = lanes.gen("*", t2)()

while true do
    posix.sleep(1)
end
