--[[
    HttpSpy v1.1.3
]]

if rconsoleprint then
    rconsoleprint("https://eleutheri.com - #1 Whitelist Service\n\n")
end;

assert(syn or http, "Unsupport exploit (should support syn.request or http.request)");

local options = ({...})[1] or { AutoDecode = true, Highlighting = true, SaveLogs = true, CLICommands = true, ShowResponse = true, BlockedURLs = {}, API = true };
local version = "v1.1.3";
local logname = string.format("%d-%s-log.txt", game.PlaceId, os.date("%d_%m_%y"));

if options.SaveLogs then
    writefile(logname, string.format("Http Logs from %s\n\n", os.date("%d/%m/%y"))) 
end;

local Serializer = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotDSF/leopard/main/rbx/leopard-syn.lua"))();
local clonef = clonefunction;
local pconsole = clonef(rconsoleprint);
local format = clonef(string.format);
local gsub = clonef(string.gsub);
local match = clonef(string.match);
local append = clonef(appendfile);
local Type = clonef(type);
local crunning = clonef(coroutine.running);
local cwrap = clonef(coroutine.wrap);
local cresume = clonef(coroutine.resume);
local cyield = clonef(coroutine.yield);
local Pcall = clonef(pcall);
local Pairs = clonef(pairs);
local Error = clonef(error);
local getnamecallmethod = clonef(getnamecallmethod);
local blocked = options.BlockedURLs;
local enabled = true;
local reqfunc = (syn or http).request;
local libtype = syn and "syn" or "http";

-- Use global hooks table to persist between script loads
if not getgenv()._HTTPSPY_GLOBAL_HOOKS then
    getgenv()._HTTPSPY_GLOBAL_HOOKS = {}
end
local hooked = getgenv()._HTTPSPY_GLOBAL_HOOKS;

local proxied = {};
local isHookSetup = false;
local methods = {
    HttpGet = not syn,
    HttpGetAsync = not syn,
    GetObjects = true,
    HttpPost = not syn,
    HttpPostAsync = not syn
}

Serializer.UpdateConfig({ highlighting = options.Highlighting });

local RecentCommit = game.HttpService:JSONDecode(game:HttpGet("https://api.github.com/repos/NotDSF/HttpSpy/commits?per_page=1&path=init.lua"))[1].commit.message;
local OnRequest = Instance.new("BindableEvent");

local function printf(...) 
    if options.SaveLogs then
        append(logname, gsub(format(...), "%\27%[%d+m", ""));
    end;
    return pconsole(format(...));
end;

local function ConstantScan(constant)
    for i,v in Pairs(getgc(true)) do
        if type(v) == "function" and islclosure(v) and getfenv(v).script == getfenv(saveinstance).script and table.find(debug.getconstants(v), constant) then
            return v;
        end;
    end;
end;

local function DeepClone(tbl, cloned)
    cloned = cloned or {};

    for i,v in Pairs(tbl) do
        if Type(v) == "table" then
            cloned[i] = DeepClone(v);
            continue;
        end;
        cloned[i] = v;
    end;

    return cloned;
end;

local __namecall, __request;
__namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod();

    if methods[method] then
        printf("game:%s(%s)\n\n", method, Serializer.FormatArguments(...));
    end;

    return __namecall(self, ...);
end));

__request = hookfunction(reqfunc, newcclosure(function(req) 
    if Type(req) ~= "table" then return __request(req); end;
    
    local RequestData = DeepClone(req);
    if not enabled then
        return __request(req);
    end;

    if Type(RequestData.Url) ~= "string" then return __request(req) end;

    if not options.ShowResponse then
        printf("%s.request(%s)\n\n", libtype, Serializer.Serialize(RequestData));
        return __request(req);
    end;

    local t = crunning();
    cwrap(function() 
        if RequestData.Url and blocked[RequestData.Url] then
            printf("%s.request(%s) -- blocked url\n\n", libtype, Serializer.Serialize(RequestData));
            return cresume(t, {});
        end;

        if RequestData.Url then
            local Host = string.match(RequestData.Url, "https?://(%w+.%w+)/");
            if Host and proxied[Host] then
                RequestData.Url = gsub(RequestData.Url, Host, proxied[Host], 1);
            end; 
        end;

        OnRequest:Fire(RequestData);

        local ok, ResponseData = Pcall(__request, RequestData);
        if not ok then Error(ResponseData, 0) end;

        local BackupData = {};
        for i,v in Pairs(ResponseData) do BackupData[i] = v end;

        if BackupData.Headers and BackupData.Headers["Content-Type"]
        and match(BackupData.Headers["Content-Type"], "application/json")
        and options.AutoDecode then
            local ok2, res = Pcall(game.HttpService.JSONDecode, game.HttpService, BackupData.Body);
            if ok2 then BackupData.Body = res end;
        end;

        -- Check for hooks with better logic
        local hookFn
        for prefix, fn in Pairs(hooked) do
            if RequestData.Url:sub(1, #prefix) == prefix then
                hookFn = fn
                break
            end
        end

        -- Apply hook if found and modify both BackupData and ResponseData
        if hookFn then
            local success, modifiedResponse = Pcall(hookFn, DeepClone(ResponseData), DeepClone(RequestData))
            if success and modifiedResponse then
                ResponseData = modifiedResponse
                -- Recreate BackupData completely from modified response
                BackupData = {}
                for i,v in Pairs(modifiedResponse) do 
                    BackupData[i] = Type(v) == "table" and DeepClone(v) or v
                end
                
                -- Re-decode JSON if modified Body is JSON and AutoDecode is enabled
                if BackupData.Headers and BackupData.Headers["Content-Type"]
                and match(BackupData.Headers["Content-Type"], "application/json")
                and options.AutoDecode
                and Type(BackupData.Body) == "string" then
                    local ok2, res = Pcall(game.HttpService.JSONDecode, game.HttpService, BackupData.Body);
                    if ok2 then BackupData.Body = res end;
                end;
            end
        end

        printf("%s.request(%s)\n\nResponse Data: %s\n\n",
               libtype,
               Serializer.Serialize(RequestData),
               Serializer.Serialize(BackupData)
        );

        cresume(t, ResponseData)
    end)();
    return cyield();
end));

isHookSetup = true;

if request then
    replaceclosure(request, reqfunc);
end;

if syn and syn.websocket then
    local WsConnect, WsBackup = debug.getupvalue(syn.websocket.connect, 1);
    WsBackup = hookfunction(WsConnect, function(...) 
        printf("syn.websocket.connect(%s)\n\n", Serializer.FormatArguments(...));
        return WsBackup(...);
    end);
end;

-- I already know this will make some people mad :troll:
if syn and syn.websocket then
    local HttpGet;
    HttpGet = hookfunction(getupvalue(ConstantScan("ZeZLm2hpvGJrD6OP8A3aEszPNEw8OxGb"), 2), function(self, ...) 
        printf("game.HttpGet(game, %s)\n\n", Serializer.FormatArguments(...));
        return HttpGet(self, ...);
    end);

    local HttpPost;
    HttpPost = hookfunction(getupvalue(ConstantScan("gpGXBVpEoOOktZWoYECgAY31o0BlhOue"), 2), function(self, ...) 
        printf("game.HttpPost(game, %s)\n\n", Serializer.FormatArguments(...));
        return HttpPost(self, ...);
    end);
end

for method, enabled in Pairs(methods) do
    if enabled then
        local b;
        b = hookfunction(game[method], newcclosure(function(self, ...)
            local args = Serializer.FormatArguments(...)
            local result = b(self, ...)
            local resultStr
            if Type(result) == "table" then
                resultStr = Serializer.Serialize(result)
            else
                resultStr = tostring(result)
            end
            printf("game.%s(game, %s)\n\nRespuesta: %s\n\n", method, args or "", resultStr or "")
            return result
        end));
    end;
end

if not debug.info(2, "f") then
    pconsole("You are running an outdated version, please use the loadstring at https://github.com/NotDSF/HttpSpy\n");
end;

pconsole(format("HttpSpy %s (Creator: https://github.com/NotDSF)\nChange Logs:\n\t%s\nLogs are automatically being saved to: \27[32m%s\27[0m\n\n", version, RecentCommit, options.SaveLogs and logname or "(You aren't saving logs, enable SaveLogs if you want to save logs)"));

if not options.API then return end;

local API = {};
API.OnRequest = OnRequest.Event;

function API:HookSynRequest(url, hook) 
    hooked[url] = function(response, request)
        return hook(response, request)
    end;
    getgenv()._HTTPSPY_GLOBAL_HOOKS[url] = hooked[url]; -- Ensure it's stored globally
    if not isHookSetup then
        pconsole("WARNING: Hook registrado antes de que HttpSpy esté completamente configurado\n");
    end
end;

function API:ProxyHost(host, proxy) 
    proxied[host] = proxy;
end;

function API:RemoveProxy(host) 
    if not proxied[host] then
        error("host isn't proxied", 0);
    end;
    proxied[host] = nil;
end;

function API:UnHookSynRequest(url) 
    if not hooked[url] then
        error("url isn't hooked", 0);
    end;
    hooked[url] = nil;
    getgenv()._HTTPSPY_GLOBAL_HOOKS[url] = nil;
end

function API:BlockUrl(url) 
    blocked[url] = true;
end;

function API:WhitelistUrl(url) 
    blocked[url] = false;
end;

return API;

