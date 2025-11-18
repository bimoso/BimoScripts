-- // UI SETUP AND THEMES // --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local CustomThemes = {
	NoxHubDark = {
		TextColor = Color3.fromRGB(230, 230, 255),
		Background = Color3.fromRGB(15, 15, 30),
		Topbar = Color3.fromRGB(20, 20, 35),
		Shadow = Color3.fromRGB(10, 10, 20),
		NotificationBackground = Color3.fromRGB(25, 25, 35),
		NotificationActionsBackground = Color3.fromRGB(40, 40, 50),
		TabBackground = Color3.fromRGB(25, 25, 40),
		TabStroke = Color3.fromRGB(30, 30, 50),
		TabBackgroundSelected = Color3.fromRGB(60, 60, 90),
		TabTextColor = Color3.fromRGB(200, 200, 255),
		SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
		ElementBackground = Color3.fromRGB(20, 20, 35),
		ElementBackgroundHover = Color3.fromRGB(25, 25, 40),
		SecondaryElementBackground = Color3.fromRGB(18, 18, 30),
		ElementStroke = Color3.fromRGB(30, 30, 50),
		SecondaryElementStroke = Color3.fromRGB(25, 25, 45),
		SliderBackground = Color3.fromRGB(80, 120, 255),
		SliderProgress = Color3.fromRGB(100, 140, 255),
		SliderStroke = Color3.fromRGB(120, 160, 255),
		ToggleBackground = Color3.fromRGB(20, 20, 30),
		ToggleEnabled = Color3.fromRGB(80, 120, 255),
		ToggleDisabled = Color3.fromRGB(70, 70, 70),
		ToggleEnabledStroke = Color3.fromRGB(100, 140, 255),
		ToggleDisabledStroke = Color3.fromRGB(90, 90, 90),
		ToggleEnabledOuterStroke = Color3.fromRGB(120, 160, 255),
		ToggleDisabledOuterStroke = Color3.fromRGB(60, 60, 60),
		DropdownSelected = Color3.fromRGB(30, 30, 50),
		DropdownUnselected = Color3.fromRGB(25, 25, 40),
		InputBackground = Color3.fromRGB(22, 22, 35),
		InputStroke = Color3.fromRGB(40, 40, 60),
		PlaceholderColor = Color3.fromRGB(150, 150, 180)
	},
	NoxHubWave = {
		TextColor = Color3.fromRGB(230, 255, 255),
		Background = Color3.fromRGB(18, 25, 35),
		Topbar = Color3.fromRGB(25, 35, 45),
		Shadow = Color3.fromRGB(10, 15, 20),
		NotificationBackground = Color3.fromRGB(20, 30, 40),
		NotificationActionsBackground = Color3.fromRGB(40, 60, 70),
		TabBackground = Color3.fromRGB(35, 45, 55),
		TabStroke = Color3.fromRGB(45, 60, 70),
		TabBackgroundSelected = Color3.fromRGB(0, 170, 200),
		TabTextColor = Color3.fromRGB(180, 220, 240),
		SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
		ElementBackground = Color3.fromRGB(30, 40, 50),
		ElementBackgroundHover = Color3.fromRGB(40, 50, 60),
		SecondaryElementBackground = Color3.fromRGB(25, 35, 45),
		ElementStroke = Color3.fromRGB(50, 70, 80),
		SecondaryElementStroke = Color3.fromRGB(40, 60, 70),
		SliderBackground = Color3.fromRGB(0, 140, 180),
		SliderProgress = Color3.fromRGB(0, 180, 220),
		SliderStroke = Color3.fromRGB(0, 210, 255),
		ToggleBackground = Color3.fromRGB(30, 45, 55),
		ToggleEnabled = Color3.fromRGB(0, 180, 255),
		ToggleDisabled = Color3.fromRGB(90, 110, 120),
		ToggleEnabledStroke = Color3.fromRGB(0, 210, 255),
		ToggleDisabledStroke = Color3.fromRGB(110, 130, 140),
		ToggleEnabledOuterStroke = Color3.fromRGB(60, 90, 100),
		ToggleDisabledOuterStroke = Color3.fromRGB(45, 65, 70),
		DropdownSelected = Color3.fromRGB(35, 50, 60),
		DropdownUnselected = Color3.fromRGB(30, 40, 50),
		InputBackground = Color3.fromRGB(30, 45, 55),
		InputStroke = Color3.fromRGB(60, 80, 90),
		PlaceholderColor = Color3.fromRGB(160, 180, 200)
	}
}

-- // UI Setup // --
local Window = Rayfield:CreateWindow({
	Name = "Dandy's World | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Dandy's World...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "NoxHub",
		FileName = "DandysWorld"
	}
})

-- GUI TABS
local MovementTab = Window:CreateTab("Player", "Footprints")
local ESPTab = Window:CreateTab("Visuals", "Eye")
local MiscTab = Window:CreateTab("Misc", "zap-off")
local TeleportTab = Window:CreateTab("Lobby", "Compass")
local ThemesTab = Window:CreateTab("Themes", "Paintbrush")

--DEPENDENCIES
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local camera = workspace.CurrentCamera

-- VARIABLES
local generatorESPColor = Color3.fromRGB(0, 0, 255) -- Default blue
local monsterESPColor = Color3.fromRGB(255, 0, 0) -- Default Red
local itemESP = false
local itemESPThread = nil
local itemESPColor = Color3.fromRGB(0, 255, 0) -- Default green
local walkSpeedHackEnabled = false
local autoSkillCheckEnabled = false
local autoSkillCheckLoop = nil
local monsterESP = false
local fullbrightEnabled = false
local itemESPTextSize = 30 -- default size
getgenv().WalkSpeedValue = 15 -- Default walk speed

-- Backup original lighting settings so you can restore them
local originalLighting = {
	Ambient = Lighting.Ambient,
	Brightness = Lighting.Brightness,
	ClockTime = Lighting.ClockTime,
	FogEnd = Lighting.FogEnd,
	GlobalShadows = Lighting.GlobalShadows,
	OutdoorAmbient = Lighting.OutdoorAmbient,
}

ESPTab:CreateSection("Brightness")

ESPTab:CreateToggle({
	Name = "Fullbright",
	CurrentValue = false,
	Callback = function(state)
		fullbrightEnabled = state
		if state then
			Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.Brightness = 2
			Lighting.ClockTime = 12
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		else
    -- Restore original lighting
			for property, value in pairs(originalLighting) do
				Lighting[property] = value
			end
		end
	end
})

-- Highlight function
local function highlightEntity(entity)
	if entity:FindFirstChild("Highlight") then
		return
	end
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = monsterESPColor
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = entity
	highlight.Parent = entity
end

-- Persistent monitor loop
task.spawn(function()
	while true do
		task.wait(1)
		if monsterESP then
			local currentRoom = workspace:FindFirstChild("CurrentRoom")
			if currentRoom then
				for _, child in ipairs(currentRoom:GetChildren()) do
					if child:IsA("Model") then
						local monsters = child:FindFirstChild("Monsters")
						if monsters then
							for _, monster in ipairs(monsters:GetChildren()) do
								if monster:IsA("Model") and not monster:FindFirstChild("Highlight") then
									highlightEntity(monster)
								end
							end
						end
					end
				end
			end
		end
	end
end)

ESPTab:CreateSection("ESP Toggles")

-- Rayfield toggle
ESPTab:CreateToggle({
	Name = "Twisted ESP",
	CurrentValue = false,
	Callback = function(state)
		monsterESP = state

-- Remove highlights if disabled
		if not state then
			local currentRoom = workspace:FindFirstChild("CurrentRoom")
			if currentRoom then
				for _, child in ipairs(currentRoom:GetChildren()) do
					if child:IsA("Model") then
						local monsters = child:FindFirstChild("Monsters")
						if monsters then
							for _, monster in ipairs(monsters:GetChildren()) do
								local hl = monster:FindFirstChild("Highlight")
								if hl then
									hl:Destroy()
								end
							end
						end
					end
				end
			end
		end
	end
})

-- Function to highlight generators
local function highlightGenerator(generator)
	if generator:FindFirstChild("Highlight") then
		return
	end
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = generatorESPColor
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = generator
	highlight.Parent = generator
end

-- Generator ESP toggle
ESPTab:CreateToggle({
	Name = "Generator ESP",
	CurrentValue = false,
	Callback = function(state)
		generatorESP = state
		task.spawn(function()
			while generatorESP do
				local currentRoom = workspace:FindFirstChild("CurrentRoom")
				if currentRoom then
					for _, room in ipairs(currentRoom:GetChildren()) do
						local generatorsFolder = room:FindFirstChild("Generators")
						if generatorsFolder then
							for _, generator in ipairs(generatorsFolder:GetChildren()) do
								if generator:IsA("Model") then
									if not generator:FindFirstChild("Highlight") then
										highlightGenerator(generator)
									end
								end
							end
						end
					end
				end
				task.wait(1)
			end
		end)
	end
})

local function getCurrentRoom()
	local currentRoom = workspace:FindFirstChild("CurrentRoom")
	if currentRoom then
		for _, child in ipairs(currentRoom:GetChildren()) do
			if child:IsA("Model") then
				return child
			end
		end
	end
	return nil
end

local function addLabelToItem(item)
	if item:FindFirstChild("ESP_Label") then
		return
	end
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "ESP_Label"
	billboard.Adornee = item
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.LightInfluence = 0
	billboard.Parent = item
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = item.Name
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextStrokeTransparency = 0.5
	label.TextStrokeColor3 = Color3.new(0, 0, 0)
	label.Font = Enum.Font.SourceSansBold
	label.TextScaled = false
	label.TextSize = itemESPTextSize
	label.Parent = billboard
end

-- Main ESP Toggle for Item ESP
ESPTab:CreateToggle({
	Name = "Item ESP",
	CurrentValue = false,
	Callback = function(state)
		itemESP = state
		if itemESP then
			itemESPThread = task.spawn(function()
				while itemESP do
					local room = getCurrentRoom()
					if room then
						local itemsFolder = room:FindFirstChild("Items")
						if itemsFolder then
							for _, item in ipairs(itemsFolder:GetChildren()) do
								if item:IsA("Model") then
                        -- Highlight
									if not item:FindFirstChild("Highlight") then
										local highlight = Instance.new("Highlight")
										highlight.Name = "Highlight"
										highlight.FillColor = itemESPColor
										highlight.OutlineColor = itemESPColor
										highlight.FillTransparency = 0.4
										highlight.OutlineTransparency = 0
										highlight.Adornee = item
										highlight.Parent = item
									end

                        -- Label
									addLabelToItem(item)
								end
							end
						end
					end
					task.wait(2)
				end
			end)
		else
    -- Turn off: remove highlights and labels
			local room = getCurrentRoom()
			if room then
				local itemsFolder = room:FindFirstChild("Items")
				if itemsFolder then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						local hl = item:FindFirstChild("Highlight")
						if hl then
							hl:Destroy()
						end
						local label = item:FindFirstChild("ESP_Label")
						if label then
							label:Destroy()
						end
					end
				end
			end
			if itemESPThread then
				task.cancel(itemESPThread)
				itemESPThread = nil
			end
		end
	end
})
ESPTab:CreateSection("ESP Config")
ESPTab:CreateColorPicker({
	Name = "Twisted ESP Color",
	Color = monsterESPColor,
	Callback = function(value)
		monsterESPColor = value

    -- Update all active highlights with the new color
		if monsterESP then
			local currentRoom = workspace:FindFirstChild("CurrentRoom")
			if currentRoom then
				for _, child in ipairs(currentRoom:GetChildren()) do
					if child:IsA("Model") then
						local monsters = child:FindFirstChild("Monsters")
						if monsters then
							for _, monster in ipairs(monsters:GetChildren()) do
								local hl = monster:FindFirstChild("Highlight")
								if hl then
									hl.FillColor = monsterESPColor
								end
							end
						end
					end
				end
			end
		end
	end
})

ESPTab:CreateColorPicker({
	Name = "Generator ESP Color",
	Color = generatorESPColor,
	Callback = function(value)
		generatorESPColor = value
		if generatorESP then
			local currentRoom = workspace:FindFirstChild("CurrentRoom")
			if currentRoom then
				for _, room in ipairs(currentRoom:GetChildren()) do
					local generatorsFolder = room:FindFirstChild("Generators")
					if generatorsFolder then
						for _, generator in ipairs(generatorsFolder:GetChildren()) do
							local hl = generator:FindFirstChild("Highlight")
							if hl then
								hl.FillColor = generatorESPColor
							end
						end
					end
				end
			end
		end
	end
})

ESPTab:CreateColorPicker({
	Name = "Item ESP Color",
	Color = itemESPColor,  -- Use itemESPColor as the default color
	Callback = function(value)
		itemESPColor = value
		if itemESP then
			local room = getCurrentRoom()
			if room then
				local itemsFolder = room:FindFirstChild("Items")
				if itemsFolder then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						local hl = item:FindFirstChild("Highlight")
						if hl then
							hl.FillColor = itemESPColor
						end
					end
				end
			end
		end
	end
})

ESPTab:CreateToggle({
	Name = "Item Labels",
	CurrentValue = true, -- default is on
	Callback = function(state)
		itemESPLabels = state

-- Apply changes to labels immediately
		if itemESP then
			local room = getCurrentRoom()
			if room then
				local itemsFolder = room:FindFirstChild("Items")
				if itemsFolder then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						if item:IsA("Model") then
							local label = item:FindFirstChild("ESP_Label")
							if label then
								label.Enabled = itemESPLabels
							end
						end
					end
				end
			end
		end
	end
})

ESPTab:CreateSlider({
	Name = "Item Label Size",
	Range = {
		10,
		30
	}, -- Set the minimum and maximum sizes
	Increment = 1, -- The increment step
	CurrentValue = 14, -- Default size
	Suffix = "px", -- Optional, add units
	Callback = function(value)
		itemESPTextSize = value

-- Apply changes to label size immediately
		if itemESP then
			local room = getCurrentRoom()
			if room then
				local itemsFolder = room:FindFirstChild("Items")
				if itemsFolder then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						if item:IsA("Model") then
							local label = item:FindFirstChild("ESP_Label")
							if label then
								local textLabel = label:FindFirstChildOfClass("TextLabel")
								if textLabel then
									textLabel.TextSize = itemESPTextSize
								end
							end
						end
					end
				end
			end
		end
	end
})

ESPTab:CreateSection("Freecam")
local camDummy = Instance.new("Part")
camDummy.Anchored = true
camDummy.CanCollide = false
camDummy.Size = Vector3.new(1, 1, 1)
camDummy.Transparency = 1
camDummy.Name = "FreecamSubject"
camDummy.Parent = workspace
local flying = false
local flySpeed = 100
local flyKeyDown = {}
local camConn

UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		flyKeyDown[input.KeyCode] = true
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		flyKeyDown[input.KeyCode] = false
	end
end)

ESPTab:CreateToggle({
	Name = "Freecam",
	CurrentValue = false,
	Callback = function(state)
		flying = state
		if state then
			if humanoidRootPart then
				humanoidRootPart.Anchored = true
			end
			camDummy.CFrame = camera.CFrame
			camera.CameraType = Enum.CameraType.Custom
			camera.CameraSubject = camDummy
			camConn = RunService.RenderStepped:Connect(function(dt)
				local move = Vector3.zero
				local camCF = camera.CFrame
				if flyKeyDown[Enum.KeyCode.W] then
					move += camCF.LookVector
				end
				if flyKeyDown[Enum.KeyCode.S] then
					move -= camCF.LookVector
				end
				if flyKeyDown[Enum.KeyCode.A] then
					move -= camCF.RightVector
				end
				if flyKeyDown[Enum.KeyCode.D] then
					move += camCF.RightVector
				end
				if flyKeyDown[Enum.KeyCode.Space] then
					move += camCF.UpVector
				end
				if flyKeyDown[Enum.KeyCode.LeftShift] then
					move -= camCF.UpVector
				end
				if move.Magnitude > 0 then
					camDummy.CFrame = camDummy.CFrame + move.Unit * flySpeed * dt
				end
			end)
		else
			if camConn then
				camConn:Disconnect()
			end
			camera.CameraType = Enum.CameraType.Custom
			camera.CameraSubject = Players.LocalPlayer.Character:FindFirstChild("Humanoid") or Players.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart")
			if humanoidRootPart then
				humanoidRootPart.Anchored = false
			end
		end
	end
})
MovementTab:CreateSection("WalkSpeed Hacks")
local walkSpeedConnection
local function hookWalkSpeed()
	local player = game.Players.LocalPlayer
	player.CharacterAdded:Connect(function(char)
		local humanoid = char:WaitForChild("Humanoid")
		if walkSpeedConnection then
			walkSpeedConnection:Disconnect()
		end
		walkSpeedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
			if walkSpeedHackEnabled then
				humanoid.WalkSpeed = getgenv().WalkSpeedValue
			end
		end)
		if walkSpeedHackEnabled then
			humanoid.WalkSpeed = getgenv().WalkSpeedValue
		end
	end)

                    -- Apply to current character too
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	if walkSpeedConnection then
		walkSpeedConnection:Disconnect()
	end
	walkSpeedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if walkSpeedHackEnabled then
			humanoid.WalkSpeed = getgenv().WalkSpeedValue
		end
	end)
	humanoid.WalkSpeed = getgenv().WalkSpeedValue
end
MovementTab:CreateToggle({
	Name = "WalkSpeed Hack",
	CurrentValue = false,
	Callback = function(state)
		walkSpeedHackEnabled = state
		local char = game.Players.LocalPlayer.Character
		if state then
			hookWalkSpeed()
		elseif char and char:FindFirstChild("Humanoid") then
			if walkSpeedConnection then
				walkSpeedConnection:Disconnect()
				walkSpeedConnection = nil
			end
			char.Humanoid.WalkSpeed = 15 -- Default WalkSpeed
		end
	end
})
MovementTab:CreateSlider({
	Name = "Walk Speed Value",
	Range = {
		15,
		32
	},
	Increment = 1,
	CurrentValue = 15,
	Callback = function(value)
		getgenv().WalkSpeedValue = value
		if walkSpeedHackEnabled then
			local char = game.Players.LocalPlayer.Character
			if char and char:FindFirstChild("Humanoid") then
				char.Humanoid.WalkSpeed = value
			end
		end
	end
})
MovementTab:CreateSection("Auto SkillCheck")
local function startAutoSkillCheck()
	local Players = game:GetService("Players")
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local player = Players.LocalPlayer
	autoSkillCheckLoop = task.spawn(function()
		while autoSkillCheckEnabled do
			task.wait(0.05)
			local gui = player:FindFirstChild("PlayerGui")
			if not gui then
				continue
			end
			local frame = gui:FindFirstChild("ScreenGui", true)
			if not frame then
				continue
			end
			local menu = frame:FindFirstChild("Menu")
			if not menu then
				continue
			end
			local skillCheck = menu:FindFirstChild("SkillCheckFrame")
			if not skillCheck or not skillCheck.Visible then
				continue
			end
			local marker = skillCheck:FindFirstChild("Marker")
			local gold = skillCheck:FindFirstChild("GoldArea")
			if not marker or not gold then
				continue
			end
			local markerAbsPos = marker.AbsolutePosition.X + (marker.AbsoluteSize.X / 2)
			local goldMin = gold.AbsolutePosition.X
			local goldMax = goldMin + gold.AbsoluteSize.X
			if markerAbsPos >= goldMin and markerAbsPos <= goldMax then
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
				task.wait(0.05)
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
			end
		end
	end)
end
MovementTab:CreateToggle({
	Name = "Auto SkillCheck",
	CurrentValue = false,
	Callback = function(state)
		autoSkillCheckEnabled = state
		if state then
			startAutoSkillCheck()
		else
			if autoSkillCheckLoop then
				task.cancel(autoSkillCheckLoop)
				autoSkillCheckLoop = nil
			end
		end
	end
})
MovementTab:CreateSection("Jump")
local jumpEnabled = false
local humanoidConnection -- connection to humanoid added event
local function setJumpHeight(humanoid)
	if jumpEnabled then
		humanoid.JumpHeight = 20
	else
		humanoid.JumpHeight = 0
	end
end
local function onCharacterAdded(char)
        -- Disconnect any old humanoid listener
	if humanoidConnection then
		humanoidConnection:Disconnect()
		humanoidConnection = nil
	end
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if humanoid then
		setJumpHeight(humanoid)
	else
            -- Wait for humanoid to be added, then set jump height
		humanoidConnection = char.ChildAdded:Connect(function(child)
			if child:IsA("Humanoid") then
				setJumpHeight(child)
				humanoidConnection:Disconnect()
				humanoidConnection = nil
			end
		end)
	end
end

player.CharacterAdded:Connect(onCharacterAdded)

MovementTab:CreateToggle({
	Name = "Enable Jump",
	CurrentValue = false,
	Callback = function(Value)
		jumpEnabled = Value
		local char = player.Character
		if char then
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			if humanoid then
				setJumpHeight(humanoid)
			elseif jumpEnabled then
        -- Wait for humanoid to spawn if enabled and humanoid missing
				if humanoidConnection then
					humanoidConnection:Disconnect()
				end
				humanoidConnection = char.ChildAdded:Connect(function(child)
					if child:IsA("Humanoid") then
						setJumpHeight(child)
						humanoidConnection:Disconnect()
						humanoidConnection = nil
					end
				end)
			end
		end
	end
})

TeleportTab:CreateSection("Lobby Teleports")

TeleportTab:CreateButton({
	Name = "Teleport to Elevator1",
	Callback = function()
-- Teleport code here
		local targetPosition = Vector3.new(-50, 23, -93) -- Change this to your desired location
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			humanoidRootPart.CFrame = CFrame.new(targetPosition)
		else
			warn("HumanoidRootPart not found!")
		end
	end,
})

TeleportTab:CreateButton({
	Name = "Teleport to Elevator2",
	Callback = function()
-- Teleport code here
		local targetPosition = Vector3.new(15, 23, -157) -- Change this to your desired location
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			humanoidRootPart.CFrame = CFrame.new(targetPosition)
		else
			warn("HumanoidRootPart not found!")
		end
	end,
})

TeleportTab:CreateButton({
	Name = "Teleport to Elevator3",
	Callback = function()
-- Teleport code here
		local targetPosition = Vector3.new(78, 23, -93) -- Change this to your desired location
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			humanoidRootPart.CFrame = CFrame.new(targetPosition)
		else
			warn("HumanoidRootPart not found!")
		end
	end,
})

TeleportTab:CreateButton({
	Name = "Teleport to Shop",
	Callback = function()
-- Teleport code here
		local targetPosition = Vector3.new(-3, 27, 25) -- Change this to your desired location
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			humanoidRootPart.CFrame = CFrame.new(targetPosition)
		else
			warn("HumanoidRootPart not found!")
		end
	end,
})

--##########--
-- MISC TAB --
--##########--

-- Setup
local Events = ReplicatedStorage:WaitForChild("Events")
local monsterRedirectEnabled = false
local fakePosition = Vector3.new(1000, 0, 1000) -- Default faraway location
local clickConnection

-- Override the server request for your position
Events.GetCharacterPosition.OnClientInvoke = function()
	if monsterRedirectEnabled then
		return fakePosition
	else
		return player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or Vector3.zero
	end
end

MiscTab:CreateSection("Monster AI Spoof")
MiscTab:CreateParagraph(
{
	Title = "AI Spoof Instructions",
	Content = "Turn on Redirect Monsters and click somewhere. Monsters will think that this is your location."
}
)

-- UI Toggle (MiscTab)
MiscTab:CreateToggle({
	Name = "Redirect Monsters (Click to Set)",
	CurrentValue = false,
	Callback = function(state)
		monsterRedirectEnabled = state
		if state then
			clickConnection = mouse.Button1Down:Connect(function()
				local unitRay = workspace.CurrentCamera:ScreenPointToRay(mouse.X, mouse.Y)
				local raycastParams = RaycastParams.new()
				raycastParams.FilterDescendantsInstances = {
					player.Character
				}
				raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
				local result = workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000, raycastParams)
				if result and result.Position then
					fakePosition = result.Position
					print("[Monster Exploit] Fake position updated to:", fakePosition)
				end
			end)
		else
			if clickConnection then
				clickConnection:Disconnect()
				clickConnection = nil
			end
    -- Reset to real position
			fakePosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or Vector3.zero
		end
	end
})

ThemesTab:CreateSection("Themes")

-- // GUI THEMES // --
local Dropdown = ThemesTab:CreateDropdown({
	Name = "Select Gui Theme",
	Flag = "guiTheme",
	Options = {
		"Default",
		"AmberGlow",
		"Amethyst",
		"Bloom",
		"DarkBlue",
		"Green",
		"Light",
		"Ocean",
		"Serenity"
	},
	CurrentOption = {
		"Default"
	},
	MultipleOptions = false,
	Flag = "ThemeDropdown",
	Callback = function(Options)
		Window.ModifyTheme(Options[1])
	end,
})

Rayfield:LoadConfiguration()