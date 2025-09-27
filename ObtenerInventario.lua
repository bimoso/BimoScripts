local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_ = Remotes:WaitForChild("CommF_")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local args = { [1] = "getInventory" }
local inventoryData = CommF_:InvokeServer(unpack(args))

if type(inventoryData) == "table" then
    local grouped = {}
    for _, item in ipairs(inventoryData) do
        local t = item.Type or "Desconocido"
        grouped[t] = grouped[t] or {}
        table.insert(grouped[t], item)
    end

    local embedFields = {}
    for tipo, items in pairs(grouped) do
        local contenido = ""
        for _, item in ipairs(items) do
            local cant = item.Count and ("x" .. item.Count) or ""
            contenido = contenido .. string.format("%s %s (Rango: %s)\n", item.Name, cant, item.Rarity or "N/A")
        end
        table.insert(embedFields, { name = tipo, value = contenido })
    end

    local dataToSend = {
        fields = embedFields
    }

    -- Serializamos la data para guardarla en formato JSON
    local fileData = HttpService:JSONEncode(dataToSend)
    local folderName = "BloxFruitsInventory"
    if not isfolder(folderName) then
        makefolder(folderName)
    end

    -- Utilizamos el nombre del LocalPlayer para el nombre del archivo con extensión .json
    local player = Players.LocalPlayer
    local playerName = player and player.Name or "Desconocido"
    local fileName = folderName .. "/" .. playerName .. ".json"
    writefile(fileName, fileData)
    print("Archivo guardado: " .. fileName)
else
    print("No es una tabla; valor devuelto:", inventoryData)
end