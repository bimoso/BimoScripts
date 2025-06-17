local RS = cloneref(game:GetService("ReplicatedStorage"))
local scanned = {}

local wrapHook
wrapHook = hookfunction(getrenv().coroutine.wrap, function(...)
    if not checkcaller() then
        return task.wait(9e9)
    end
    return wrapHook(...)
end)

local function hookRemote(remote: RemoteEvent)
    if remote:IsDescendantOf(RS) then return end
    local old
    old = hookfunction(remote.FireServer, function(self, ...)
        local first = ...
        if typeof(first) == "string" and (first:lower() == "x-15" or first:lower() == "x-16") then
            return task.wait(9e9)
        end
        return old(self, ...)
    end)
end

local function scan(value)
    if scanned[value] then return end
    scanned[value] = true

    local tv = typeof(value)
    if tv == "Instance" and value:IsA("RemoteEvent") then
        hookRemote(value)
    elseif tv == "function" then
        for _, v in next, getupvalues(value) do
            scan(v)
        end
    elseif tv == "table" then
        for _, v in next, value do
            scan(v)
        end
    end
end

for _, obj in next, getgc(true) do
    if typeof(obj) == "function" and islclosure(obj) and not isexecutorclosure(obj) then
        scan(obj)
    end
end
