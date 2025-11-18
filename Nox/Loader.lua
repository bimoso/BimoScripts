local UniversalIDs = {
    "7326934954", -- 99 Noches en el Bosque
"7882829745", -- Anine Eternal
"6115988515", -- Anime Saga
"4931927012", -- Basketball Legends
"7095682825", -- Beaks
"4777817887", -- Blade Ball
"7822444776", -- Build a Plane
"5569032992", -- Dandy's World
"7018190066", -- Dead Rails
"7218065222", -- Dig
"5677613211", -- Eat the Word
"2880808628", -- Fire Force Online
"5750914919", -- Fish
"7436755782", -- Grow A Garden
"2535080489", -- Heros Online 2
"7750955984", -- Zombie Hunty
"7314989375", -- Hunters
"6048923315", -- Kaizen
"7709344486", -- Steal a Brainrot
"7513130835" -- Untitled Drill Game
}

local gameId = game.GameId
if not table.find(UniversalIDs, tostring(gameId)) then print("Game not support") return end

loadstring(game:HttpGet("https://raw.githubusercontent.com/bimoso/BimoScripts/main/Nox/" .. gameId .. ".lua"))()
