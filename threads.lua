local lanes = require "lanes".configure()
local posix = require "posix"

function t1()
    local posix = require "posix"
    while true do
        print("Thread 1")
        posix.sleep(1)
    end
end

function t2()
    local posix = require "posix"
    while true do
        print("Thread 2")
        posix.sleep(2)
    end
end

gent1 = lanes.gen("*", t1)()
gent2 = lanes.gen("*", t2)()

while true do
    posix.sleep(1)
end
