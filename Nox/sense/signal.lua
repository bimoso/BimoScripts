-- Simple Signal
local Signal = {};
Signal.__index = Signal;

function Signal.new()
    local self = setmetatable({}, Signal);
    self._connections = {};
    self._waiting = {};
    return self;
end;

function Signal:Fire(...)
    local args = {...};
    local argCount = select("#", ...);
    
    -- Fire all connections
    for i = #self._connections, 1, -1 do
        local connection = self._connections[i];
        if connection._disconnected then
            table.remove(self._connections, i);
        else
            task.spawn(function()
                connection._handler(unpack(args, 1, argCount));
            end);
        end;
    end;
    
    -- Resume waiting threads
    for i = #self._waiting, 1, -1 do
        local thread = table.remove(self._waiting, i);
        task.spawn(thread, unpack(args, 1, argCount));
    end;
end;

function Signal:Connect(handler)
    local connection = {
        _signal = self,
        _handler = handler,
        _disconnected = false
    };
    
    function connection:Disconnect()
        connection._disconnected = true;
    end;
    
    table.insert(self._connections, connection);
    return connection;
end;

function Signal:Wait()
    table.insert(self._waiting, coroutine.running());
    return coroutine.yield();
end;

function Signal:Destroy()
    table.clear(self._connections);
    table.clear(self._waiting);
end;

return Signal;