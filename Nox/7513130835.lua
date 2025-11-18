local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

-- Create GUI
local GUI = Mercury:Create{
	Name = "NoxHub",
	Size = UDim2.fromOffset(600, 400),
	Theme = Mercury.Themes.Dark,
	Link = "https://github.com/NoxHub/UntitledDrillGame"
}

-- Create Tabs
local MainTab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://8569322835"
}

local FarmTab = GUI:Tab{
	Name = "Farm",
	Icon = "rbxassetid://8569322835"
}

-- Variables
local players = game:GetService("Players")
local plr = players.LocalPlayer
local sellPart = workspace:FindFirstChild("Scripted"):FindFirstChild("Sell")
local drillsUi = plr.PlayerGui:FindFirstChild("Menu"):FindFirstChild("CanvasGroup").Buy
local handdrillsUi = plr.PlayerGui:FindFirstChild("Menu"):FindFirstChild("CanvasGroup").HandDrills
local plot = nil
local playerList = {}
local choosenPlayer = nil
local lastPos = nil
local drillsDelay = 10
local storDelay = 10
local sellDelay = 10

-- Config variables
local autodrillEnabled = false
local autopickupEnabled = false
local autosellEnabled = false
local autorebirthEnabled = false
local collectdrillsEnabled = false
local collectstorageEnabled = false
local drillsfullEnabled = false
local drillsdelayEnabled = false
local storagesfullEnabled = false
local storagesdelayEnabled = false
local drillsUIVisible = false
local handdrillsUIVisible = false

-- Get Player Plot
if plr then
	for _, p in ipairs(workspace.Plots:GetChildren()) do
		if p:FindFirstChild("Owner") and p.Owner.Value == plr then
			plot = p
			break
		end
	end
end

-- Sell Logic
local function sell()
	local wasDrillsUiOpen = drillsUi.Visible
	local wasHandDrillsUiOpen = handdrillsUi.Visible
	drillsUi.Visible = false
	handdrillsUi.Visible = false
	lastPos = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
	plr.Character:FindFirstChild("HumanoidRootPart").CFrame = sellPart.CFrame
	task.wait(0.2)
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Knit = require(ReplicatedStorage.Packages:WaitForChild("Knit"))
	local OreService = Knit.GetService("OreService")
	OreService.SellAll:Fire()
	task.wait(0.2)
	if lastPos and lastPos ~= nil then
		plr.Character:FindFirstChild("HumanoidRootPart").CFrame = lastPos
	end
	if wasDrillsUiOpen then
		drillsUi.Visible = true
		drillsUIVisible = true
	end
	if wasHandDrillsUiOpen then
		handdrillsUi.Visible = true
		handdrillsUIVisible = true
	end
end

-- Player List Update
local function updatePlayerList()
	playerList = {}
	for _, v in ipairs(players:GetPlayers()) do
		if v ~= plr then
			table.insert(playerList, {
				v.Name,
				v.Name
			}) -- Format for Mercury dropdown {name, value}
		end
	end
	return playerList
end

players.PlayerAdded:Connect(function()
	updatePlayerList()
end)

players.PlayerRemoving:Connect(function()
	updatePlayerList()
end)

-- Main Tab
MainTab:Toggle{
	Name = "Open Drills UI",
	StartingState = false,
	Description = "Opens the drills menu",
	Callback = function(state)
		drillsUIVisible = state
		if drillsUIVisible then
			handdrillsUIVisible = false
			handdrillsUi.Visible = false
		end
		drillsUi.Visible = drillsUIVisible
	end
}

MainTab:Toggle{
	Name = "Open HandDrills UI",
	StartingState = false,
	Description = "Opens the hand drills menu",
	Callback = function(state)
		handdrillsUIVisible = state
		if handdrillsUIVisible then
			drillsUIVisible = false
			drillsUi.Visible = false
		end
		handdrillsUi.Visible = handdrillsUIVisible
	end
}

drillsUi:GetPropertyChangedSignal("Visible"):Connect(function()
	if not drillsUi.Visible then
		drillsUIVisible = false
	end
end)

handdrillsUi:GetPropertyChangedSignal("Visible"):Connect(function()
	if not handdrillsUi.Visible then
		handdrillsUIVisible = false
	end
end)

local playerDropdown = MainTab:Dropdown{
	Name = "Choose Player",
	StartingText = "Select...",
	Description = "Select a player to teleport to",
	Items = updatePlayerList(),
	Callback = function(item)
		choosenPlayer = item
	end
}

MainTab:Button{
	Name = "Teleport to Player",
	Description = "Teleport to the selected player",
	Callback = function()
		if choosenPlayer then
			local targetPlayer = players:FindFirstChild(choosenPlayer)
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local targetPosition = targetPlayer.Character.HumanoidRootPart.CFrame
				if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					plr.Character.HumanoidRootPart.CFrame = targetPosition
				else
					GUI:Notification{
						Title = "Error",
						Text = "Your character is missing HumanoidRootPart",
						Duration = 5
					}
				end
			else
				GUI:Notification{
					Title = "Error",
					Text = "Target player not found or invalid",
					Duration = 5
				}
			end
		else
			GUI:Notification{
				Title = "Error",
				Text = "No player selected",
				Duration = 5
			}
		end
	end
}

MainTab:Button{
	Name = "Teleport to Player Plot",
	Description = "Teleport to the selected player's plot",
	Callback = function()
		if choosenPlayer then
			local targetPlayer = players:FindFirstChild(choosenPlayer)
			if targetPlayer then
				local targetPlot = nil
				for _, p in ipairs(workspace.Plots:GetChildren()) do
					if p:FindFirstChild("Owner") and p.Owner.Value == targetPlayer then
						targetPlot = p
						break
					end
				end
				if targetPlot and targetPlot:FindFirstChild("PlotSpawn") then
					local plotCenter = targetPlot.PlotSpawn.CFrame
					if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						plr.Character.HumanoidRootPart.CFrame = plotCenter
					else
						GUI:Notification{
							Title = "Error",
							Text = "Your character is missing HumanoidRootPart",
							Duration = 5
						}
					end
				else
					GUI:Notification{
						Title = "Error",
						Text = "Target player's plot not found or invalid",
						Duration = 5
					}
				end
			else
				GUI:Notification{
					Title = "Error",
					Text = "Target player not found",
					Duration = 5
				}
			end
		else
			GUI:Notification{
				Title = "Error",
				Text = "No player selected",
				Duration = 5
			}
		end
	end
}

MainTab:Button{
	Name = "Anti AFK",
	Description = "You won't get kicked in 20 minutes by afk",
	Callback = function()
		local bb = game:GetService("VirtualUser")
		plr.Idled:Connect(
function()
			bb:CaptureController()
			bb:ClickButton2(Vector2.new())
			GUI:Notification{
				Title = "NoxHub",
				Text = "Anti-AFK Activated",
				Duration = 3
			}
		end
)
		GUI:Notification{
			Title = "NoxHub",
			Text = "Anti-AFK Enabled",
			Duration = 3
		}
	end
}

-- Farm Tab
FarmTab:Toggle{
	Name = "Auto Drill",
	StartingState = false,
	Description = "Automatically drill for ores",
	Callback = function(state)
		autodrillEnabled = state
		if autodrillEnabled then
			task.spawn(function()
				while autodrillEnabled do
					game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild(
        "Services"
        ):WaitForChild("OreService"):WaitForChild("RE"):WaitForChild("RequestRandomOre"):FireServer()
					task.wait(.01)
				end
			end)
		end
	end
}

FarmTab:Toggle{
	Name = "Auto Drill Pickup",
	StartingState = false,
	Description = "Automatically equip hand drill",
	Callback = function(state)
		autopickupEnabled = state
		if autopickupEnabled then
			task.spawn(function()
				while autopickupEnabled do
					local drill = (function()
						for _, obj in pairs(plr.Character:GetChildren()) do
							if obj:GetAttribute("Type") == "HandDrill" then
								return obj
							end
						end
					end)()
					if not drill then
						for _, obj in pairs(plr.Backpack:GetChildren()) do
							if obj:GetAttribute("Type") == "HandDrill" then
								obj.Parent = plr.Character
								break
							end
						end
					end
					task.wait(2)
				end
			end)
		end
	end
}

FarmTab:Button{
	Name = "Sell All",
	Description = "Sell all ores",
	Callback = function()
		sell()
		GUI:Notification{
			Title = "NoxHub",
			Text = "Sold all ores",
			Duration = 3
		}
	end
}

FarmTab:Textbox{
	Name = "Auto Sell Delay",
	Callback = function(text)
		local num = tonumber(text)
		if num and num >= 1 then
			sellDelay = num
		else
			GUI:Notification{
				Title = "Warning",
				Text = "Only numbers (1+)",
				Duration = 5
			}
		end
	end
}

FarmTab:Toggle{
	Name = "Auto Sell",
	StartingState = false,
	Description = "Automatically sell ores at the set interval",
	Callback = function(state)
		autosellEnabled = state
		if autosellEnabled then
			task.spawn(function()
				while autosellEnabled do
					sell()
					task.wait(sellDelay)
				end
			end)
		end
	end
}

FarmTab:Toggle{
	Name = "Auto Rebirth",
	StartingState = false,
	Description = "Automatically rebirth when possible",
	Callback = function(state)
		autorebirthEnabled = state
		if autorebirthEnabled then
			task.spawn(function()
				while autorebirthEnabled do
					game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild(
        "RebirthService"
        ):WaitForChild("RE"):WaitForChild("RebirthRequest"):FireServer()
					task.wait(1)
				end
			end)
		end
	end
}

-- Collection Section
FarmTab:Button{
	Name = "--- Auto Collect Settings ---",
	Callback = function()
	end
}

FarmTab:Toggle{
	Name = "Auto Collect Drills",
	StartingState = false,
	Description = "Automatically collect from drills",
	Callback = function(state)
		collectdrillsEnabled = state
		if collectdrillsEnabled then
			task.spawn(function()
				while collectdrillsEnabled do
					if plot and plot:FindFirstChild("Drills") then
						for _, drill in pairs(plot.Drills:GetChildren()) do
							if not collectdrillsEnabled then
								break
							end
							local drillData = drill:FindFirstChild("DrillData")
							local ores = drill:FindFirstChild("Ores")
							if drillData and ores then
								local capacity = drillData:FindFirstChild("Capacity")
								if capacity then
									local val = 0
									for _, ore in pairs(ores:GetChildren()) do
										if ore:IsA("IntValue") or ore:IsA("NumberValue") then
											val += ore.Value
										end
									end
									if drillsdelayEnabled or not drillsfullEnabled or val >= capacity.Value then
										game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(drill)
									end
								end
							end
						end
					end
					task.wait(drillsdelayEnabled and drillsDelay or 2)
				end
			end)
		end
	end
}

FarmTab:Toggle{
	Name = "Auto Collect Storages",
	StartingState = false,
	Description = "Automatically collect from storages",
	Callback = function(state)
		collectstorageEnabled = state
		if collectstorageEnabled then
			task.spawn(function()
				while collectstorageEnabled do
					if plot and plot:FindFirstChild("Storage") then
						for _, storage in pairs(plot.Storage:GetChildren()) do
							if not collectstorageEnabled then
								break
							end
							local storageData = storage:FindFirstChild("DrillData")
							local storageOres = storage:FindFirstChild("Ores")
							if storageData and storageOres then
								local storageCapacity = storageData:FindFirstChild("Capacity")
								if storageCapacity then
									local storVal = 0
									for _, ore in pairs(storageOres:GetChildren()) do
										if ore:IsA("IntValue") or ore:IsA("NumberValue") then
											storVal += ore.Value
										end
									end
									if (storagesfullEnabled and storVal >= storageCapacity.Value) or not storagesfullEnabled then
										game:GetService("ReplicatedStorage").Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(storage)
									end
								end
							end
						end
					end
					task.wait(storagesdelayEnabled and storDelay or 2)
				end
			end)
		end
	end
}

-- Drill collection settings
FarmTab:Button{
	Name = "--- Drill Collection Settings ---",
	Callback = function()
	end
}

FarmTab:Toggle{
	Name = "If drill is full",
	StartingState = false,
	Description = "Only collect when drill is full",
	Callback = function(state)
		drillsfullEnabled = state
		if drillsfullEnabled and drillsdelayEnabled then
			drillsdelayEnabled = false
		end
	end
}

FarmTab:Toggle{
	Name = "In ... seconds",
	StartingState = false,
	Description = "Collect drills at a set interval",
	Callback = function(state)
		drillsdelayEnabled = state
		if drillsdelayEnabled and drillsfullEnabled then
			drillsfullEnabled = false
		end
	end
}

FarmTab:Textbox{
	Name = "Drills Delay",
	Callback = function(text)
		local num = tonumber(text)
		if num and num >= 1 then
			drillsDelay = num
		else
			GUI:Notification{
				Title = "Warning",
				Text = "Only numbers (1+)",
				Duration = 5
			}
		end
	end
}

-- Storage collection settings
FarmTab:Button{
	Name = "--- Storage Collection Settings ---",
	Callback = function()
	end
}

FarmTab:Toggle{
	Name = "If storage is full",
	StartingState = false,
	Description = "Only collect when storage is full",
	Callback = function(state)
		storagesfullEnabled = state
		if storagesfullEnabled and storagesdelayEnabled then
			storagesdelayEnabled = false
		end
	end
}

FarmTab:Toggle{
	Name = "In ... seconds",
	StartingState = false,
	Description = "Collect storages at a set interval",
	Callback = function(state)
		storagesdelayEnabled = state
		if storagesdelayEnabled and storagesfullEnabled then
			storagesfullEnabled = false
		end
	end
}

FarmTab:Textbox{
	Name = "Storages Delay",
	Callback = function(text)
		local num = tonumber(text)
		if num and num >= 1 then
			storDelay = num
		else
			GUI:Notification{
				Title = "Warning",
				Text = "Only numbers (1+)",
				Duration = 5
			}
		end
	end
}