
local placeId = game.PlaceId or "Unknown"
local gameId = game.GameId or "Unknown"
local place = game:GetService("MarketplaceService"):GetProductInfo(placeId)
local gameName = place.Name or "Unknown"

print("========================================")
print("Información del juego:")
print("Nombre: " .. gameName)
print("PlaceId: " .. placeId)
print("GameId: " .. tostring(gameId))
print("CreatorType: " .. tostring(game.CreatorType))
print("========================================")

local gameScripts = {
    [123123214] = "BloxFruits.lua"
}

local gameId = game.GameId

local scriptName = gameScripts[gameId]
if scriptName then
    local url = "https://raw.githubusercontent.com/bimoso/BimoScripts/main/" .. scriptName
    print("Cargando script: " .. scriptName)
    loadstring(game:HttpGet(url))()
else
    print("No se encontró script para GameId:", gameId)
end
