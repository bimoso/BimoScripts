-- #### UI SETUP #### --
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

-- #### UI Setup #### --
local Window = Rayfield:CreateWindow({
	Name = "Dig | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Dig...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "NoxHub",
		FileName = "Dig"
	}
})

-- #### SERVICES AND REFERENCES #### --
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera     = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Lighting   = game:GetService("Lighting")
local Workspace  = game:GetService("Workspace")
local UserInputService  = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager  = game:GetService("VirtualInputManager")
local viewport = Camera and Camera.ViewportSize or Vector2.new(0, 0)

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local mouse    = player:GetMouse()

-- #### Tabs #### --
local MainTab = Window:CreateTab("Main", "home")
local PlayerTab = Window:CreateTab("Player", "circle-user")
local AutoTab = Window:CreateTab("Auto", "bot")
local MiscTab = Window:CreateTab("Misc", "menu")

-- ############## --
-- // MAIN TAB // --
-- ############## --

MainTab:CreateSection("Main")

-- Function to Sell All Items (Teleport to Rocky, Sell, Teleport Back)
local function sellAllItems()
	local player = game:GetService("Players").LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local originalPosition = humanoidRootPart.Position
	local rocky = workspace:WaitForChild("World"):WaitForChild("NPCs"):WaitForChild("Rocky")
	humanoidRootPart.CFrame = CFrame.new(rocky.HumanoidRootPart.Position)
	wait(0.3)
	local args = {
		rocky
	}
	game:GetService("ReplicatedStorage"):WaitForChild("DialogueRemotes"):WaitForChild("SellAllItems"):FireServer(unpack(args))
	Rayfield:Notify({
		Title = "Sell All Items",
		Content = "All items sold to Rocky.",
		Duration = 3,
		Image = "box"
	})
	wait(0.3)
	humanoidRootPart.CFrame = CFrame.new(originalPosition)
end

-- Button to manually trigger "Sell All Items"
local sellButton = MainTab:CreateButton({
	Name = "Sell All Items",
	Callback = function()
		sellAllItems()
	end
})

MainTab:CreateSection("Teleports")

-- Get all parts from the folder workspace.Spawns.TeleportSpawns
local teleportSpawnsFolder = workspace.Spawns.TeleportSpawns
local spawnNames = {}

-- Populate the dropdown options with the names of the parts in the folder
for _, part in pairs(teleportSpawnsFolder:GetChildren()) do
	if part:IsA("BasePart") then  -- Ensure the child is a part
		table.insert(spawnNames, part.Name)  -- Add part name to the list
	end
end

-- Create the Dropdown in Rayfield UI with the spawn names
local spawnDropdown = MainTab:CreateDropdown({
	Name = "Select Location",
	Options = spawnNames,  -- List of spawn names
	CurrentOption = {
		spawnNames[1]
	},
	Flag = "TeleportSpawnFlag",
	Callback = function(selectedSpawn)
	end
})

MainTab:CreateButton({
	Name = "Teleport",
	Callback = function()
		local selectedSpawnName = spawnDropdown.CurrentOption[1]  -- Get the selected spawn name
		local selectedSpawn = teleportSpawnsFolder:FindFirstChild(selectedSpawnName)
		if selectedSpawn and selectedSpawn:IsA("BasePart") then
    -- Add 7 studs above the selected spawn part's position
			local teleportPosition = selectedSpawn.Position + Vector3.new(0, 7, 0)
			game:GetService("Players").LocalPlayer.Character:MoveTo(teleportPosition)
			Rayfield:Notify({
				Title = "Teleporting",
				Content = "Teleported 7 studs above " .. selectedSpawnName,
				Duration = 3,
				Image = "check-circle"  -- Optional notification icon
			})
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Selected spawn part not found.",
				Duration = 3,
				Image = "alert-circle"  -- Optional error icon
			})
		end
	end
})

local npcFolder = workspace.World.NPCs
local npcNames = {}

for _, npc in pairs(npcFolder:GetChildren()) do
	if npc:IsA("Model") then
		table.insert(npcNames, npc.Name)
	end
end

-- Create the Dropdown with NPC names
local npcDropdown = MainTab:CreateDropdown({
	Name = "Select NPC",
	Options = npcNames,
	CurrentOption = {
		npcNames[1]
	},
	Flag = "NPCFlag",
	Callback = function(selectedNPC)
	end
})

-- Create the Button to teleport to the selected NPC
MainTab:CreateButton({
	Name = "Teleport",
	Callback = function()
		local selectedNPCName = npcDropdown.CurrentOption[1]  -- Get the selected NPC name
		local selectedNPC = npcFolder:FindFirstChild(selectedNPCName)
		if selectedNPC and selectedNPC:IsA("Model") and selectedNPC:FindFirstChild("HumanoidRootPart") then
    -- Teleport the player to the selected NPC's position
			game:GetService("Players").LocalPlayer.Character:MoveTo(selectedNPC.HumanoidRootPart.Position)

    -- Notify the user the teleportation was successful
			Rayfield:Notify({
				Title = "Teleporting",
				Content = "Teleported to " .. selectedNPCName,
				Duration = 3,
				Image = "check-circle"  -- Optional notification icon
			})
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Selected NPC model not found or doesn't have a HumanoidRootPart.",
				Duration = 3,
				Image = "alert-circle"  -- Optional error icon
			})
		end
	end
})

-- Get all models in the workspace.World.Interactive.Purchaseable folder
local purchaseableFolder = workspace.World.Interactive.Purchaseable
local modelNames = {}

-- Populate the dropdown options with the names of the models in the folder
for _, model in pairs(purchaseableFolder:GetChildren()) do
	if model:IsA("Model") then  -- Ensure the child is a model (Purchaseable item)
		table.insert(modelNames, model.Name)  -- Add model name to the list
	end
end

local modelDropdown = MainTab:CreateDropdown({
	Name = "Select Item",
	Options = modelNames,
	CurrentOption = {
		modelNames[1]
	},
	Flag = "ModelFlag",
	Callback = function(selectedModel)
	end
})

MainTab:CreateButton({
	Name = "Teleport",
	Callback = function()
		local selectedModelName = modelDropdown.CurrentOption[1]
		local selectedModel = purchaseableFolder:FindFirstChild(selectedModelName)
		if selectedModel and selectedModel:IsA("Model") then
			if selectedModel.PrimaryPart then
				game:GetService("Players").LocalPlayer.Character:MoveTo(selectedModel.PrimaryPart.Position)
				Rayfield:Notify({
					Title = "Teleporting",
					Content = "Teleported to " .. selectedModelName,
					Duration = 3,
					Image = "check-circle"
				})
			else
				Rayfield:Notify({
					Title = "Error",
					Content = selectedModelName .. " does not have a PrimaryPart.",
					Duration = 3,
					Image = "alert-circle"  -- Optional error icon
				})
			end
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Selected model not found or is not a valid model.",
				Duration = 3,
				Image = "alert-circle"  -- Optional error icon
			})
		end
	end
})

MainTab:CreateSection("Appraiser")

-- Create the button to trigger the remote
MainTab:CreateButton({
	Name = "Appraise Held",  -- Name of the button
	Callback = function()
-- Run the specified remote when the button is clicked
		game:GetService("ReplicatedStorage"):WaitForChild("DialogueRemotes"):WaitForChild("Appraiser_Appraise"):InvokeServer()

-- Notify the user that the action has been triggered
		Rayfield:Notify({
			Title = "Appraisal Started",
			Content = "The appraisal has been triggered.",
			Duration = 3,
			Image = "check-circle"  -- Optional icon for notification
		})
	end
})

-- ############## --
-- // PLAYER TAB // --
-- ############## --

PlayerTab:CreateSection("Movement")

-- #### FLIGHT #### --
local flying       = false
local flySpeed     = 100
local lastY        = nil
local bodyGyro     = nil

local flightToggle = PlayerTab:CreateToggle({
	Name         = "Flight",
	Flag         = "Flight",
	CurrentValue = false,
	Callback     = function(state)
		flying = state
		if humanoid and hrp then
			if state then
				humanoid.PlatformStand = true
				lastY = hrp.Position.Y
				local bg = Instance.new("BodyGyro")
				bg.Name      = "FlightGyro"
				bg.P         = 20000
				bg.D         = 1000
				bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
				bg.CFrame    = hrp.CFrame
				bg.Parent    = hrp
				bodyGyro     = bg
			else
				humanoid.PlatformStand = false
				if bodyGyro then
					bodyGyro:Destroy()
					bodyGyro = nil
				end
				hrp.Velocity = Vector3.new(0, 0, 0)
			end
		end
	end,
})

PlayerTab:CreateKeybind({
	Name             = "Toggle Flight",
	Flag             = "flightBind",
	CurrentKeybind   = "G",
	HoldToInteract   = false,
	Callback         = function(state)
		if flying then
			flightToggle:Set(false)
		else
			flightToggle:Set(true)
		end
	end,
})

PlayerTab:CreateSlider({
	Name         = "Flight Speed",
	Flag         = "flightSpeed",
	Range        = {
		10,
		300
	},
	Increment    = 10,
	CurrentValue = flySpeed,
	Callback     = function(val)
		flySpeed = val
	end,
})

local function onCharacterAdded(char)
	character = char
	humanoid   = char:WaitForChild("Humanoid")
	hrp        = char:WaitForChild("HumanoidRootPart")
	if flying and hrp then
		humanoid.PlatformStand = true
		lastY = hrp.Position.Y
		local bg = Instance.new("BodyGyro")
		bg.Name      = "FlightGyro"
		bg.P         = 20000
		bg.D         = 1000
		bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
		bg.CFrame    = hrp.CFrame
		bg.Parent    = hrp
		bodyGyro     = bg
	end
end

if player.Character then
	onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)

local inputState = {
	Forward  = false,
	Backward = false,
	Left     = false,
	Right    = false,
	Up       = false,
	Down     = false,
}

local function onInputBegan(input, gameProcessed)
	if gameProcessed then
		return
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local k = input.KeyCode
		if     k == Enum.KeyCode.W then
			inputState.Forward  = true
		elseif k == Enum.KeyCode.S then
			inputState.Backward = true
		elseif k == Enum.KeyCode.A then
			inputState.Left     = true
		elseif k == Enum.KeyCode.D then
			inputState.Right    = true
		elseif k == Enum.KeyCode.Space then
			inputState.Up    = true
		elseif k == Enum.KeyCode.LeftShift then
			inputState.Down = true
		end
	end
end

local function onInputEnded(input, gameProcessed)
	if gameProcessed then
		return
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local k = input.KeyCode
		if     k == Enum.KeyCode.W then
			inputState.Forward  = false
		elseif k == Enum.KeyCode.S then
			inputState.Backward = false
		elseif k == Enum.KeyCode.A then
			inputState.Left     = false
		elseif k == Enum.KeyCode.D then
			inputState.Right    = false
		elseif k == Enum.KeyCode.Space then
			inputState.Up    = false
		elseif k == Enum.KeyCode.LeftShift then
			inputState.Down = false
		end
	end
end

UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)

local function getMobileMoveVector()
	if humanoid and UserInputService.TouchEnabled then
		local dir = humanoid.MoveDirection
		if dir.Magnitude > 0 then
			local cf      = camera.CFrame
			local forward = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit
			local right   = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z).Unit
			return (forward * dir.Z + right * dir.X).Unit
		end
	end
	return Vector3.zero
end

RunService.RenderStepped:Connect(function()
	if not flying or not humanoid or not hrp then
		return
	end
	local moveDir = Vector3.new(0, 0, 0)
	local camCF   = camera.CFrame
	if not UserInputService.TouchEnabled then
		if inputState.Forward  then
			moveDir = moveDir + camCF.LookVector
		end
		if inputState.Backward then
			moveDir = moveDir - camCF.LookVector
		end
		if inputState.Left     then
			moveDir = moveDir - camCF.RightVector
		end
		if inputState.Right    then
			moveDir = moveDir + camCF.RightVector
		end
	else
		moveDir = getMobileMoveVector()
	end
	if inputState.Up   then
		moveDir = moveDir + Vector3.new(0, 1, 0)
	end
	if inputState.Down then
		moveDir = moveDir - Vector3.new(0, 1, 0)
	end
	if bodyGyro then
		bodyGyro.CFrame = CFrame.new(hrp.Position, hrp.Position + camCF.LookVector)
	end
	local velocity = Vector3
	if moveDir.Magnitude > 0 then
		velocity = moveDir.Unit * flySpeed
		lastY    = hrp.Position.Y
	else
		local yOffset = lastY and (lastY - hrp.Position.Y) or 0
		velocity = Vector3.new(0, yOffset * 5, 0)
	end
	hrp.Velocity = velocity
end)

                    -- #### Hold V to TP #### --
local mouse        = player:GetMouse()
local vDown        = false
local vDownConn    = nil
local vUpConn      = nil
local rightConn    = nil
local function teleportToCursor()
	local char = player.Character
	if not char then
		return
	end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return
	end
	local targetPos = mouse.Hit.Position
	hrp.CFrame = CFrame.new(targetPos + Vector3.new(0, hrp.Size.Y / 2 + 1, 0))
end
local function onRightClick()
	if vDown then
		teleportToCursor()
	end
end
local function onInputBegan(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.V then
		vDown = true
	end
end
local function onInputEnded(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.V then
		vDown = false
	end
end
PlayerTab:CreateToggle({
	Name         = "V + Right Click TP",
	CurrentValue = false,
	Flag         = "VTeleport",
	Callback     = function(enabled)
		if enabled then
			vDownConn = UserInputService.InputBegan:Connect(onInputBegan)
			vUpConn   = UserInputService.InputEnded:Connect(onInputEnded)
			rightConn = mouse.Button2Down:Connect(onRightClick)
		else
			if vDownConn then
				vDownConn:Disconnect()
				vDownConn = nil
			end
			if vUpConn   then
				vUpConn:Disconnect()
				vUpConn   = nil
			end
			if rightConn then
				rightConn:Disconnect()
				rightConn = nil
			end
			vDown = false
		end
	end,
})
PlayerTab:CreateSection("Misc")

                    -- #### FULLBRIGHT #### --
local fullbrightEnabled = false
local originalSettings = {}
local function storeOriginalSettings()
	originalSettings = {
		Brightness = Lighting.Brightness,
		GlobalShadows = Lighting.GlobalShadows,
		Ambient = Lighting.Ambient
	}
end
local function setFullbright(enabled)
	fullbrightEnabled = enabled
	if enabled then
		storeOriginalSettings()
	else
		if next(originalSettings) then
			Lighting.Brightness = originalSettings.Brightness
			Lighting.GlobalShadows = originalSettings.GlobalShadows
			Lighting.Ambient = originalSettings.Ambient
		end
	end
end
RunService.RenderStepped:Connect(function()
	if fullbrightEnabled then
		Lighting.Brightness = 5
		Lighting.GlobalShadows = false
		Lighting.Ambient = Color3.new(1, 1, 1)
	end
end)
PlayerTab:CreateToggle({
	Name = "Fullbright",
	CurrentValue = false,
	Flag = "FullbrightToggle",
	Callback = function(Value)
		setFullbright(Value)
	end
})

    -- #### NO FOG #### --
local originalFogEnd      = Lighting.FogEnd
local originalFogStart    = Lighting.FogStart
local originalFogColor    = Lighting.FogColor
local removedWeatherItems = {}
local childAddedConn      = nil
local WEATHER_CLASSES = {
	Atmosphere      = true,
	BloomEffect     = true,
	SunRaysEffect   = true,
	Sky             = true,
}
local function isWeatherObject(inst)
	return WEATHER_CLASSES[inst.ClassName] == true
end

local function removeExistingWeather()
	for _, child in ipairs(Lighting:GetChildren()) do
		if isWeatherObject(child) then
			removedWeatherItems[#removedWeatherItems + 1] = child
			child.Parent = nil
		end
	end
end

local function onChildAdded(child)
	if isWeatherObject(child) then
		removedWeatherItems[#removedWeatherItems + 1] = child
		child.Parent = nil
	end
end

local function enableNoFog()
	removeExistingWeather()
	childAddedConn = Lighting.ChildAdded:Connect(onChildAdded)
	Lighting.FogEnd   = 1e10
	Lighting.FogStart = 1e10
	Lighting.FogColor = Color3.new(0, 0, 0)
end

local function restoreFogAndWeather()
	if childAddedConn then
		childAddedConn:Disconnect()
		childAddedConn = nil
	end
	Lighting.FogEnd   = originalFogEnd
	Lighting.FogStart = originalFogStart
	Lighting.FogColor = originalFogColor
	for _, inst in ipairs(removedWeatherItems) do
		if inst and inst.Parent == nil then
			inst.Parent = Lighting
		end
	end
	table.clear(removedWeatherItems)
end

PlayerTab:CreateToggle({
	Name         = "No Fog",
	Flag         = "noFog",
	CurrentValue = false,
	Callback     = function(state)
		if state then
			enableNoFog()
		else
			restoreFogAndWeather()
		end
	end,
})

-- #### NO CLIP #### --
local noclipEnabled = false
local noclipConn    = nil

local function setCharacterCollisions(state)
	if not player.Character then
		return
	end
	for _, part in ipairs(player.Character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = state
		end
	end
end

local function toggleNoClip(on)
	noclipEnabled = on
	if on then
		noclipConn = RunService.Stepped:Connect(function()
			setCharacterCollisions(false)
		end)
	else
		if noclipConn then
			noclipConn:Disconnect()
			noclipConn = nil
		end
		setCharacterCollisions(true)
	end
end

player.CharacterAdded:Connect(function(char)
	character    = char
	humanoidRoot = char:WaitForChild("HumanoidRootPart")
	if noclipEnabled then
		if noclipConn then
			noclipConn:Disconnect()
		end
		noclipConn = RunService.Stepped:Connect(function()
			setCharacterCollisions(false)
		end)
	end
end)

PlayerTab:CreateToggle({
	Name         = "NoClip",
	CurrentValue = false,
	Flag         = "NoClipToggle",
	Callback     = function(state)
		toggleNoClip(state)
	end,
})

-- #### FREECAM #### --
local camDummy = Instance.new("Part")
camDummy.Name         = "FreecamSubject"
camDummy.Size         = Vector3.new(1, 1, 1)
camDummy.Transparency = 1
camDummy.Anchored     = true
camDummy.CanCollide   = false
camDummy.Parent       = workspace

local flying     = false
local flySpeed   = 100
local flyKeyDown = {}
local camConn    = nil

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		flyKeyDown[input.KeyCode] = true
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		flyKeyDown[input.KeyCode] = false
	end
end)

PlayerTab:CreateToggle({
	Name         = "Freecam",
	Flag         = "freecamToggle",
	CurrentValue = false,
	Callback     = function(state)
		flying = state
		if state then
			if humanoidRootPart then
				humanoidRootPart.Anchored = true
			end
			camDummy.CFrame = camera.CFrame
			camera.CameraType    = Enum.CameraType.Custom
			camera.CameraSubject = camDummy
			camConn = RunService.RenderStepped:Connect(function(dt)
				local moveVec = Vector3.new(0, 0, 0)
				local camCF   = camera.CFrame
				if flyKeyDown[Enum.KeyCode.W] then
					moveVec = moveVec + camCF.LookVector
				end
				if flyKeyDown[Enum.KeyCode.S] then
					moveVec = moveVec - camCF.LookVector
				end
				if flyKeyDown[Enum.KeyCode.A] then
					moveVec = moveVec - camCF.RightVector
				end
				if flyKeyDown[Enum.KeyCode.D] then
					moveVec = moveVec + camCF.RightVector
				end
				if flyKeyDown[Enum.KeyCode.Space] then
					moveVec = moveVec + camCF.UpVector
				end
				if flyKeyDown[Enum.KeyCode.LeftShift] then
					moveVec = moveVec - camCF.UpVector
				end
				if moveVec.Magnitude > 0 then
					local delta = moveVec.Unit * flySpeed * dt
					camDummy.CFrame = camDummy.CFrame + delta
				end
			end)
		else
			if camConn then
				camConn:Disconnect()
				camConn = nil
			end
			camera.CameraType = Enum.CameraType.Custom
			local char = player.Character
			if char then
				local hrp = char:FindFirstChild("Humanoid") or char:FindFirstChildWhichIsA("BasePart")
				if hrp then
					camera.CameraSubject = hrp
				end
			end
			if humanoidRootPart then
				humanoidRootPart.Anchored = false
			end
		end
	end,
})

-- #### RESET #### --
PlayerTab:CreateButton({
	Name = "Reset",
	Callback = function()
		local char = player.Character
		local humanoid = char and char:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = 0
		end
	end
})

-- #### FOV SLIDER #### --
PlayerTab:CreateSlider({
	Name = "FOV",
	Range = {
		50,
		120
	},
	Increment = 1,
	Suffix = "°",
	CurrentValue = game:GetService("Workspace").CurrentCamera.FieldOfView,
	Callback = function(value)
		game:GetService("Workspace").CurrentCamera.FieldOfView = value
	end,
})

-- #### PERFORMANCE MODE #### --
local original = {
	QualityLevel     = settings().Rendering.QualityLevel,
	GlobalShadows    = Lighting.GlobalShadows,
	Ambient          = Lighting.Ambient,
	Brightness       = Lighting.Brightness,
	FogEnd           = Lighting.FogEnd,
	FogStart         = Lighting.FogStart,
	EffectsEnabled   = {},
	WaterWaveSize    = nil,
	WaterReflectance = nil,
	WaterTransparency = nil,
}

local effectClasses = {
	"BloomEffect",
	"ColorCorrectionEffect",
	"SunRaysEffect",
	"DepthOfFieldEffect",
	"BlurEffect",
	"ShadowMap",
}

for _, className in ipairs(effectClasses) do
	for _, inst in ipairs(Lighting:GetDescendants()) do
		if inst.ClassName == className then
			original.EffectsEnabled[inst] = inst.Enabled
		end
	end
end

local terrain = Workspace:FindFirstChildOfClass("Terrain")
if terrain then
	original.WaterWaveSize     = terrain.WaterWaveSize
	original.WaterReflectance  = terrain.WaterReflectance
	original.WaterTransparency = terrain.WaterTransparency
end

local performanceEnabled = false

PlayerTab:CreateToggle({
	Name         = "Performance Mode",
	CurrentValue = false,
	Flag         = "PerformanceMode",
	Callback     = function(enabled)
		performanceEnabled = enabled
		if enabled then
			settings().Rendering.QualityLevel = 1
			Lighting.GlobalShadows = false
			Lighting.Ambient    = Color3.new(0.3, 0.3, 0.3)
			Lighting.Brightness = 1
			Lighting.FogEnd   = 1e10
			Lighting.FogStart = 1e10
			for inst, wasEnabled in pairs(original.EffectsEnabled) do
				if inst and inst.Parent then
					inst.Enabled = false
				end
			end
			if terrain then
				terrain.WaterWaveSize     = 0
				terrain.WaterReflectance  = 0
				terrain.WaterTransparency = 1
			end
			for _, particle in ipairs(Workspace:GetDescendants()) do
				if particle:IsA("ParticleEmitter") or particle:IsA("Trail") then
					particle.Enabled = false
				end
			end
		else
			settings().Rendering.QualityLevel = original.QualityLevel
			Lighting.GlobalShadows = original.GlobalShadows
			Lighting.Ambient       = original.Ambient
			Lighting.Brightness    = original.Brightness
			Lighting.FogEnd        = original.FogEnd
			Lighting.FogStart      = original.FogStart
			for inst, wasEnabled in pairs(original.EffectsEnabled) do
				if inst and inst.Parent then
					inst.Enabled = wasEnabled
				end
			end
			if terrain then
				terrain.WaterWaveSize     = original.WaterWaveSize
				terrain.WaterReflectance  = original.WaterReflectance
				terrain.WaterTransparency = original.WaterTransparency
			end
			for _, particle in ipairs(Workspace:GetDescendants()) do
				if particle:IsA("ParticleEmitter") or particle:IsA("Trail") then
					particle.Enabled = true
				end
			end
		end
	end,
})

-- ################## --
-- #### AUTO TAB #### --
-- ################## --

local function performRemoteAction()
	local args = {
		0,
		{
			{
				Orientation = vector.zero,
				Transparency = 1,
				Name = "PositionPart",
				Position = vector.create(2094.32861328125, 109.00457763671875, -349.717529296875),
				Color = Color3.new(0.6392157077789307, 0.6352941393852234, 0.6470588445663452),
				Material = Enum.Material.Plastic,
				Shape = Enum.PartType.Block,
				Size = vector.create(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
			},
			{
				Orientation = vector.create(0, 90, 90),
				Transparency = 0,
				Name = "CenterCylinder",
				Position = vector.create(2094.32861328125, 108.95457458496094, -349.717529296875),
				Color = Color3.new(0.4627451002597809, 0.3921568691730499, 0.29019609093666077),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Cylinder,
				Size = vector.create(0.20000000298023224, 4.22039270401001, 4.293518543243408)
			},
			{
				Orientation = vector.create(-22, 45.00400161743164, 0),
				Transparency = 0,
				Name = "Rock/1",
				Position = vector.create(2096.0908203125, 108.57476043701172, -347.9547424316406),
				Color = Color3.new(0.6901960968971252, 0.5843137502670288, 0.43529412150382996),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(3.8491411209106445, 2.408350706100464, 2.3636562824249268)
			},
			{
				Orientation = vector.create(-23, 77.72699737548828, 0),
				Transparency = 0,
				Name = "Rock/2",
				Position = vector.create(2096.771484375, 108.6034927368164, -349.1859130859375),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(4.304372787475586, 2.408350706100464, 2.4475009441375732)
			},
			{
				Orientation = vector.create(-30, 110.45800018310547, 0),
				Transparency = 0,
				Name = "Rock/3",
				Position = vector.create(2096.704833984375, 108.80781555175781, -350.6041259765625),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(4.400483131408691, 2.408350706100464, 2.783618688583374)
			},
			{
				Orientation = vector.create(-32, 143.17999267578125, 0),
				Transparency = 0,
				Name = "Rock/4",
				Position = vector.create(2095.8525390625, 108.86680603027344, -351.7530212402344),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(4.245153903961182, 2.408350706100464, 2.5244524478912354)
			},
			{
				Orientation = vector.create(-26, 175.9080047607422, 0),
				Transparency = 0,
				Name = "Rock/5",
				Position = vector.create(2094.508544921875, 108.69047546386719, -352.2301940917969),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(3.982388734817505, 2.408350706100464, 2.381211519241333)
			},
			{
				Orientation = vector.create(-32, -151.35800170898438, 0),
				Transparency = 0,
				Name = "Rock/6",
				Position = vector.create(2093.109375, 108.86680603027344, -351.9491271972656),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(4.103878498077393, 2.408350706100464, 2.2738311290740967)
			},
			{
				Orientation = vector.create(-22, -118.63899993896484, 0),
				Transparency = 0,
				Name = "Rock/7",
				Position = vector.create(2092.139892578125, 108.57476043701172, -350.9123229980469),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(3.640437602996826, 2.408350706100464, 2.5220258235931396)
			},
			{
				Orientation = vector.create(-27, -85.90899658203125, 0),
				Transparency = 0,
				Name = "Rock/8",
				Position = vector.create(2091.8095703125, 108.71968078613281, -349.5375671386719),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(4.742544651031494, 2.408350706100464, 2.0655157566070557)
			},
			{
				Orientation = vector.create(-21, -53.178001403808594, 0),
				Transparency = 0,
				Name = "Rock/9",
				Position = vector.create(2092.33935546875, 108.54609680175781, -348.22802734375),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(2.5994510650634766, 2.408350706100464, 2.4076199531555176)
			},
			{
				Orientation = vector.create(-31, -20.461000442504883, 0),
				Transparency = 0,
				Name = "Rock/10",
				Position = vector.create(2093.440185546875, 108.8372802734375, -347.337646484375),
				Color = Color3.new(0.6039215922355652, 0.5098039507865906, 0.3803921639919281),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(1.9557678699493408, 2.408350706100464, 2.5764777660369873)
			},
			{
				Orientation = vector.create(-29, 12.276000022888184, 0),
				Transparency = 0,
				Name = "Rock/11",
				Position = vector.create(2094.86767578125, 108.77835083007812, -347.2422790527344),
				Color = Color3.new(0.6901960968971252, 0.5843137502670288, 0.43529412150382996),
				Material = Enum.Material.Pebble,
				Shape = Enum.PartType.Block,
				Size = vector.create(3.393181562423706, 2.408350706100464, 2.3218605518341064)
			}
		}
	}
-- Trigger the remote with the defined arguments
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Dig_Finished"):FireServer(unpack(args))
end

AutoTab:CreateSection("Auto Sell")
local autoSellEnabled = false
local intervalTime = 400  -- Default interval of 60 seconds

-- Slider to set the interval time between auto-sells (60 to 600 seconds)
AutoTab:CreateSlider({
	Name         = "Auto Sell Interval",
	Range        = {
		60,
		1200
	},
	Increment    = 1,
	Suffix       = "s",
	CurrentValue = intervalTime,
	Flag         = "AutoSellInterval",
	Callback     = function(val)
		intervalTime = val
	end,
})

-- Toggle to start/stop the auto sell process
AutoTab:CreateToggle({
	Name         = "Auto Sell",
	CurrentValue = false,
	Flag         = "AutoSellToggle",
	Callback     = function(enabled)
		autoSellEnabled = enabled
		if enabled then
			task.spawn(function()
				while autoSellEnabled do
					sellAllItems()
					wait(intervalTime)
				end
			end)
		end
	end,
})

AutoTab:CreateSection("Auto Dig")
local repeatCheckFlag = false

local RepeatCheckToggle = AutoTab:CreateToggle({
	Name = "AutoEquip Shovel",
	CurrentValue = false,
	Flag = "RepeatCheckFlag",
	Callback = function(Value)
		repeatCheckFlag = Value
		if repeatCheckFlag then
			task.spawn(function()
				while repeatCheckFlag do
        -- Get the player's backpack
					local backpack = game:GetService("Players").LocalPlayer.Backpack
					local shovelFound = false
					local shovelName = ""

        -- Loop through the backpack to find a shovel
					for _, item in pairs(backpack:GetChildren()) do
						if item:IsA("Tool") and string.find(item.Name, "Shovel") then
							shovelFound = true
							shovelName = item.Name
							break
						end
					end

        -- If a shovel is found, equip it
					if shovelFound then
						local shovel = game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild(shovelName)
						local args = {
							shovel
						}
						game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Backpack_Equip"):FireServer(unpack(args))
						wait(1)
					else
						wait(1)
					end
				end
			end)
		end
	end
})

local defaultX, defaultY = 0, viewport.Y
local targetX, targetY   = defaultX, defaultY
local digRunning         = false

local clickPositionInput = AutoTab:CreateInput({
	Name                    = "Click Position (X, Y)",
	CurrentValue            = "",
	PlaceholderText         = ("%d, %d"):format(defaultX, defaultY),
	RemoveTextAfterFocusLost = false,
	Flag                    = "ClickPosition",
	Callback                = function(text)
	end,
})

AutoTab:CreateButton({
	Name     = "Set Click Pos",
	Callback = function()
		Rayfield:Notify({
			Title   = "Auto Dig",
			Content = "Click anywhere to set dig click location.",
			Duration = 2,
			Image   = "mouse-pointer-click",
		})
		local conn
		conn = UserInputService.InputBegan:Connect(function(input, processed)
			if not processed and input.UserInputType == Enum.UserInputType.MouseButton1 then
				targetX, targetY = input.Position.X, input.Position.Y
				clickPositionInput:Set(("%d, %d"):format(targetX, targetY))
				Rayfield:Notify({
					Title   = "Auto Dig",
					Content = ("Position set to: %d, %d"):format(targetX, targetY),
					Duration = 2,
					Image   = "pin",
				})
				conn:Disconnect()
			end
		end)
	end,
})

-- #### Auto Dig (Check for Shovel and Auto Equip) #### --
local AutoDigEnabled = false
local distanceThreshold = 20  -- Set the default threshold to 20px, adjust as needed

AutoTab:CreateToggle({
	Name         = "Auto Dig [Blatant]",
	CurrentValue = false,
	Flag         = "AutoDig",
	Callback     = function(enabled)
		AutoDigEnabled = enabled
		RepeatCheckToggle:Set(enabled)
		if enabled then
			local saved = Rayfield.Flags.ClickPosition and Rayfield.Flags.ClickPosition.CurrentValue
			local x, y = nil, nil

    -- Check if click position is saved
			if type(saved) == "string" then
				x, y = saved:match("^(%-?%d+),%s*(%-?%d+)$")
				if x and y then
					targetX, targetY = tonumber(x), tonumber(y)
					Rayfield:Notify({
						Title = "Auto Dig",
						Content = ("Click position loaded: %d, %d"):format(targetX, targetY),
						Duration = 3,
						Image = "check-circle",
					})
				else
					Rayfield:Notify({
						Title = "Auto Dig",
						Content = "❗ Click position not set. Please set it first.",
						Duration = 4,
						Image = "alert-circle",
					})
				end
			else
				Rayfield:Notify({
					Title = "Auto Dig",
					Content = "❗ Click position not set. Please set it first.",
					Duration = 4,
					Image = "alert-circle",
				})
			end
			clickPositionInput:Set(("%d, %d"):format(targetX, targetY))
			task.spawn(function()
				local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
				local digVisibleSince = nil
				while AutoDigEnabled do
					local digUI = PlayerGui:FindFirstChild("Dig")
					if digUI then
						if not digVisibleSince then
							digVisibleSince = tick()
						elseif tick() - digVisibleSince >= 1 then
							performRemoteAction()
							digVisibleSince = nil
						end
					else
            -- If no dig UI, click on the target position
						digVisibleSince = nil
						VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, true, game, 0)
						VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, false, game, 0)
					end
					task.wait(0.1)
				end
			end)
		end
	end,
})

local Keybind = AutoTab:CreateKeybind({
	Name = "Instant Dig",
	CurrentKeybind = "Q",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
		performRemoteAction()
	end,
})

AutoTab:CreateSection("Legit Dig")

-- #### Distance Threshold Slider #### --
local distanceThreshold = 20

AutoTab:CreateSlider({
	Name         = "Distance Threshold",
	Range        = {
		5,
		50
	},  -- You can set the minimum and maximum values for the threshold.
	Increment    = 1,
	Suffix       = "px",
	CurrentValue = distanceThreshold,
	Flag         = "DistanceThreshold",
	Callback     = function(val)
		distanceThreshold = val
	end,
})

-- #### LEGIT DIG (Auto Equip Shovel + Distance Threshold Click + Click When No Dig UI) #### --
local legitDigEnabled = false
local distanceThreshold = 20

AutoTab:CreateToggle({
	Name         = "Legit Dig",
	CurrentValue = false,
	Flag         = "LegitDigExact",
	Callback     = function(enabled)
		legitDigEnabled = enabled
		RepeatCheckToggle:Set(enabled)
		local saved = Rayfield.Flags.ClickPosition and Rayfield.Flags.ClickPosition.CurrentValue
		local x, y = nil, nil

-- Check if click position is saved
		if type(saved) == "string" then
			x, y = saved:match("^(%-?%d+),%s*(%-?%d+)$")
			if x and y then
				targetX, targetY = tonumber(x), tonumber(y)
				Rayfield:Notify({
					Title = "Auto Dig",
					Content = ("Click position loaded: %d, %d"):format(targetX, targetY),
					Duration = 3,
					Image = "check-circle",
				})
			else
				Rayfield:Notify({
					Title = "Auto Dig",
					Content = "❗ Click position not set. Please set it first.",
					Duration = 4,
					Image = "alert-circle",
				})
			end
		else
			Rayfield:Notify({
				Title = "Auto Dig",
				Content = "❗ Click position not set. Please set it first.",
				Duration = 4,
				Image = "alert-circle",
			})
		end

-- Proceed with Legit Dig logic if click position is set
		if enabled then
			task.spawn(function()
				local plr       = game:GetService("Players").LocalPlayer
				local playerGui = plr:WaitForChild("PlayerGui")
				local prevDelta, prevTime
				local lastClickTime = 0
				local pending = false
				local x, y = saved:match("^(%-?%d+),%s*(%-?%d+)$")
				targetX, targetY = tonumber(x), tonumber(y)
				while legitDigEnabled do
					local now = tick()

        -- Find Holder safely
					local holder = playerGui:FindFirstChild("Dig")
        and playerGui.Dig:FindFirstChild("Safezone")
        and playerGui.Dig.Safezone:FindFirstChild("Holder")
					if holder then
						local bar    = holder:FindFirstChild("PlayerBar")
						local strong = holder:FindFirstChild("Area_Strong")
						if bar and strong then
							local barCX    = bar.AbsolutePosition.X + bar.AbsoluteSize.X / 2
							local strongCX = strong.AbsolutePosition.X + strong.AbsoluteSize.X / 2
							local delta    = strongCX - barCX
							local absDelta = math.abs(delta)

                -- Only proceed if bars are getting closer (converging)
							if prevDelta and prevTime then
								local dt      = now - prevTime
								local prevAbs = math.abs(prevDelta)
								if absDelta < prevAbs then
									if absDelta <= distanceThreshold then
                            -- Perform the click when bars are close
										VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, true, game, 0)
										VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, false, game, 0)
									end
								end
							end
							prevDelta = delta
							prevTime  = now
						end
					else
            -- If no Dig UI, perform the click on the target position
						VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, true, game, 0)
						VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, false, game, 0)
						wait(1)
					end
					task.wait(0.05) -- Check every frame
				end
			end)
		end
	end,
})

-- #### AUTO PIZZA #### --
AutoTab:CreateSection("Pizza")
local repeatQuestFlag = false

local RepeatQuestToggle = AutoTab:CreateToggle({
	Name = "Auto Pizza",
	CurrentValue = false,
	Flag = "RepeatQuestFlag",
	Callback = function(Value)
		repeatQuestFlag = Value
	end
})

local function performQuestActions()
	local args = {
		"Pizza Penguin"
	}
	game:GetService("ReplicatedStorage"):WaitForChild("DialogueRemotes"):WaitForChild("StartInfiniteQuest"):InvokeServer(unpack(args))
	Rayfield:Notify({
		Title = "Starting Quest",
		Content = "Starting quest with Pizza Penguin.",
		Duration = 3,
		Image = "play"
	})
	wait(2)
	local pizzaCustomers = workspace.Active.PizzaCustomers:GetChildren()
	if #pizzaCustomers > 0 then
		local randomCustomer = pizzaCustomers[math.random(1, #pizzaCustomers)]
		if randomCustomer and randomCustomer:FindFirstChild("HumanoidRootPart") then
			LocalPlayer.Character:MoveTo(randomCustomer.HumanoidRootPart.Position)
			wait(2)
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Quest_DeliverPizza"):InvokeServer()
			Rayfield:Notify({
				Title = "Delivering Pizza",
				Content = "Delivering pizza to customer...",
				Duration = 3,
				Image = "box"
			})
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "No valid pizza customer found.",
				Duration = 3,
				Image = "box"
			})
		end
	end
	wait(2)  -- Wait for 2 seconds after delivering the pizza
	game:GetService("ReplicatedStorage"):WaitForChild("DialogueRemotes"):WaitForChild("CompleteInfiniteQuest"):InvokeServer(unpack(args))
	Rayfield:Notify({
		Title = "Quest Completed",
		Content = "Completed quest with Pizza Penguin.",
		Duration = 3,
		Image = "check-circle"
	})
	wait(20)
end

spawn(function()
	while true do
		if repeatQuestFlag then
			performQuestActions()
		else
			wait(0.1)
		end
	end
end)

-- ################## --
-- #### MISC TAB #### --
-- ################## --

MiscTab:CreateSection("Server Panel")

-- #### THEMES #### --
MiscTab:CreateDropdown({
	Name = "Current Theme",
	Options = {
		"NoxHubDark",
		"NoxHubWave",
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
	Flag = "CurrentTheme",
	Callback = function(Options)
		local theme = Options[1]
		if CustomThemes[theme] then
			Window.ModifyTheme(CustomThemes[theme])
		else
			Window.ModifyTheme(theme)
		end
	end,
})

-- #### SERVER PANEL #### --
local PlaceId = game.PlaceId
local JobId   = game.JobId
local player  = Players.LocalPlayer

MiscTab:CreateButton({
	Name     = "Rejoin Server",
	Callback = function()
		TeleportService:TeleportToPlaceInstance(PlaceId, JobId, player)
	end,
})

MiscTab:CreateButton({
	Name     = "Join Random Server",
	Callback = function()
		local success, response = pcall(function()
			return HttpService:JSONDecode(
game:HttpGet(
"https://games.roblox.com/v1/games/" .. PlaceId ..
"/servers/Public?sortOrder=Asc&limit=100"
)
)
		end)
		if success and response and response.data then
			for _, server in ipairs(response.data) do
				if server.playing < server.maxPlayers and server.id ~= JobId then
					TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
					return
				end
			end
		end
		Rayfield:Notify({
			Title   = "Server Join Failed",
			Content = "Couldn't find a different server.",
			Duration = 5,
			Image    = "x"
		})
	end,
})

MiscTab:CreateButton({
	Name     = "Join Lowest Server",
	Callback = function()
		local success, response = pcall(function()
			return HttpService:JSONDecode(
game:HttpGet(
"https://games.roblox.com/v1/games/" .. PlaceId ..
"/servers/Public?sortOrder=Asc&limit=100"
)
)
		end)
		if success and response and response.data then
			for _, server in ipairs(response.data) do
				if server.playing < server.maxPlayers and server.id ~= JobId then
					TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
					return
				end
			end
		end
		Rayfield:Notify({
			Title    = "Server Join Failed",
			Content  = "No suitable server found with fewer players.",
			Duration = 5,
			Image    = "x"
		})
	end,
})

MiscTab:CreateButton({
	Name = "Copy Join Script",
	Callback = function()
		local snippet = "local TeleportService = game:GetService('TeleportService')\n" ..
"TeleportService:TeleportToPlaceInstance(" .. PlaceId .. ", '" .. JobId .. "', game.Players.LocalPlayer)\n"
		if setclipboard then
			setclipboard(snippet)
			Rayfield:Notify({
				Title   = "Copied!",
				Content = "Run this in an executor to join the current server.",
				Duration = 4,
				Image    = "check"
			})
		else
			Rayfield:Notify({
				Title   = "Clipboard Error",
				Content = "setclipboard() not available.",
				Duration = 4,
				Image    = "x"
			})
		end
	end,
})

MiscTab:CreateSection("Theme")

-- #### AMBIENT #### --
local ambientEnabled = false
local customAmbientColor = Color3.fromRGB(128, 128, 128)
local originalAmbient = Lighting.Ambient

local function updateAmbient()
	if ambientEnabled then
		Lighting.Ambient = customAmbientColor
	else
		Lighting.Ambient = originalAmbient
	end
end

MiscTab:CreateToggle({
	Name = "Custom Ambient",
	Flag = "Ambient",
	CurrentValue = false,
	Callback = function(state)
		ambientEnabled = state
		updateAmbient()
	end
})

MiscTab:CreateColorPicker({
	Name = "Ambient Color",
	Flag = "ambientColor",
	Color = customAmbientColor,
	Callback = function(newColor)
		customAmbientColor = newColor
		if ambientEnabled then
			updateAmbient()
		end
	end
})

-- #### CUSTOM TIME #### --
local timeLockEnabled = false
local timeLockConn    = nil
local timeValue = Lighting.ClockTime

MiscTab:CreateToggle({
	Name         = "Custom Time of Day",
	CurrentValue = false,
	Flag         = "LockTimeOfDayToggle",
	Callback     = function(enabled)
		timeLockEnabled = enabled
		if enabled then
			Rayfield:Notify({
				Title = "Time of Day Locked",
				Content = "The daylight cycle is frozen",
				Duration = 5,
				Image = "timer"
			})
			Lighting.ClockTime = timeValue
			timeLockConn = RunService.RenderStepped:Connect(function()
				Lighting.ClockTime = timeValue
			end)
		else
			Rayfield:Notify({
				Title = "Time of Day Unlocked",
				Content = "The daylight cycle will resume",
				Duration = 5,
				Image = "timer"
			})
			if timeLockConn then
				timeLockConn:Disconnect()
				timeLockConn = nil
			end
		end
	end,
})

MiscTab:CreateSlider({
	Name         = "Time of Day",
	Range        = {
		0,
		24
	},
	Increment    = 1,
	Suffix       = "h",
	CurrentValue = timeValue,
	Flag         = "TimeOfDaySlider",
	Callback     = function(val)
		timeValue = val
		if timeLockEnabled then
			Lighting.ClockTime = timeValue
		end
	end,
})