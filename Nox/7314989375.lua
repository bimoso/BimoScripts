-- ############# ---
-- ### SETUP ### ---
-- ############# ---

-- == SERVICES == --
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local PhysicsService = game:GetService("PhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
math.randomseed(os.time())

-- == LINORIA GUI == --
local Library = Library

local Window = Library:CreateWindow({
	Title = "NoxHub - Hunters",
	Center = false,
	AutoShow = true,
	TabPadding = 8,
	MenuFadeTime = 0.2,
	AnchorPoint = Vector2.new(1, 0), -- Top-right corner
	Position = UDim2.fromScale(1, 0.1), -- 10% from the top, right edge
})

local Tabs = {
	Main = Window:AddTab("Main"),
	Autos = Window:AddTab("Autos"),
	["UI Settings"] = Window:AddTab("UI Settings"),
}

-- == VARIABLES == --
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local isMoving = false

player.CharacterAdded:Connect(function(newCharacter)
	character = newCharacter
	humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

-- ################################## --
-- ### UNIVERSAL HELPER FUNCTIONS ### --
-- ################################## --

-- == GET LOCATION OF ITEM == --
local function getLocation(item)
	if item:IsA("BasePart") then
		return item.Position
	elseif item:IsA("Model") then
		if item.PrimaryPart then
			return item.PrimaryPart.Position
		else
			return item:GetPivot().Position
		end
	elseif item:IsA("Attachment") then
		return item.WorldPosition
	elseif item:IsA("MeshPart") then
		return item.Position
	elseif item:IsA("Camera") then
		return item.CFrame.Position
	elseif item:IsA("Light") then
		if item.Parent and item.Parent:IsA("BasePart") then
			return item.Parent.Position
		end
		return nil
	end
end

-- == GET CLOSEST ITEM IN DATA == --
local function getClosestInData(data)
	local currentPosition = (player.Character or player.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").Position
	local shortestDistance = math.huge
	local closestObject = nil
	local items = {}
	if data and data.GetChildren and type(data) ~= "table" then
		items = data:GetChildren()
	elseif type(data) == "table" then
		items = data
	else
		return nil
	end
	for _, item in ipairs(items) do
		local loc = getLocation(item)
		if loc then
			local distance = (currentPosition - loc).Magnitude
			if distance < shortestDistance then
				shortestDistance = distance
				closestObject = item
			end
		end
	end
	return closestObject
end

-- == MOVE TO TARGET FUNCTION == --
local function setCharacterCollision(state, char)
	char = char or (player.Character or player.CharacterAdded:Wait())
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = state
		end
	end
end

local function moveToTarget(target, speed, callback)
	if typeof(target) ~= "Vector3" or typeof(speed) ~= "number" then
		if callback then
			callback()
		end
		return
	end
	character = player.Character or player.CharacterAdded:Wait()
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	setCharacterCollision(false, character)
	startPos = humanoidRootPart.Position
	distance = (target - startPos).Magnitude
	duration = distance / speed
	tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
	tweenGoal = {
		CFrame = CFrame.new(target)
	}
	moveTween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)
	moveTween:Play()
	moveTween.Completed:Connect(function()
		setCharacterCollision(true, character)
		if callback then
			callback()
		end
	end)
end

-- == GET CHILDREN BY GENERATION == --
local function getChildrenByGeneration(parents, generation)
	local allChildren = {}
	if typeof(parents) ~= "table" then
		parents = {
			parents
		}
	end
	local function traverseHierarchy(object, currentGeneration)
		if currentGeneration == generation then
			for _, child in ipairs(object:GetChildren()) do
				table.insert(allChildren, child)
			end
		else
			for _, child in ipairs(object:GetChildren()) do
				traverseHierarchy(child, currentGeneration + 1)
			end
		end
	end
	for _, parent in ipairs(parents) do
		traverseHierarchy(parent, 1)
	end
	return allChildren
end

-- == FILTER FOR OR FILTER OUT PROPERTY SAFELY == --
local function filterItems(data, propertyName, propertyValue, filterMode, matchType)
	local filteredItems = {}
	local items = {}
	if data and data.GetChildren then
		items = data:GetChildren()
	elseif type(data) == "table" then
		items = data
	else
		return filteredItems
	end
	for _, item in ipairs(items) do
		local success, propValue = pcall(function()
			return item[propertyName]
		end)
		if success and propValue ~= nil then
			local matchesCondition = false
			if matchType == "equals" then
				matchesCondition = (tostring(propValue) == tostring(propertyValue))
			elseif matchType == "contains" then
				matchesCondition = (string.find(tostring(propValue), tostring(propertyValue)) ~= nil)
			elseif matchType == "greater than" then
				matchesCondition = (propValue > propertyValue)
			elseif matchType == "less than" then
				matchesCondition = (propValue < propertyValue)
			end
			if filterMode == "filterFor" then
				if matchesCondition then
					table.insert(filteredItems, item)
				end
			elseif filterMode == "filterOut" then
				if not matchesCondition then
					table.insert(filteredItems, item)
				end
			end
		end
	end
	return filteredItems
end

-- == FILTER PARENT BY CHILDREN == --
local function filterParentByGeneration(folder, generation, propertyName, propertyValue, filterMode, matchType)
	local parents = getChildrenByGeneration(folder, 1)
	local parentsWithMatchingChildren = {}
	for _, parent in ipairs(parents) do
		local children = getChildrenByGeneration(parent, generation)
		local filteredChildren = filterItems(children, propertyName, propertyValue, filterMode, matchType)
		if #filteredChildren > 0 then
			table.insert(parentsWithMatchingChildren, parent)
		end
	end
	return parentsWithMatchingChildren
end

-- == GET CLOSEST ITEM IN FOLDER == --
local function getClosestInFolder(folder)
	local children = getChildrenByGeneration(folder, 1)
	currentPosition = (player.Character or player.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").Position
	shortestDistance = math.huge
	local closestObject = nil
	for _, child in ipairs(children) do
		local pos = getLocation(child)
		if pos then
			local distance = (currentPosition - pos).Magnitude
			if distance < shortestDistance then
				shortestDistance = distance
				closestObject = child
			end
		end
	end
	return closestObject
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local offset = 0

local function setCharacterCollisionGroup(character, groupName)
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			PhysicsService:SetPartCollisionGroup(part, groupName)
		end
	end
end

local function disableCharacterCollision(character)
	setCharacterCollisionGroup(character, "NoClip")
end

local function enableCharacterCollision(character)
	setCharacterCollisionGroup(character, "Default")
end

local hoverActive = false
local currentHoverTween = nil
local hoverSpeed = 50

local camera = workspace.CurrentCamera
local cameraOffset = Vector3.new(0, 20 - offset, 15)
local cameraConnection = nil

local function startCameraLock()
	camera.CameraType = Enum.CameraType.Scriptable
	cameraConnection = RunService.RenderStepped:Connect(function()
		local character = player.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then
				camera.CFrame = CFrame.new(hrp.Position + cameraOffset, hrp.Position)
			end
		end
	end)
end

local function stopCameraLock()
	if cameraConnection then
		cameraConnection:Disconnect()
		cameraConnection = nil
	end
	camera.CameraType = Enum.CameraType.Custom
end

local function enableHover(targetPosition)
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:WaitForChild("HumanoidRootPart")
	if not hrp then
		return
	end
	disableCharacterCollision(character)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.PlatformStand = true
	end
	hoverActive = true
	startCameraLock()
	local function tweenHover()
		if not hoverActive then
			return
		end
		local currentPos = hrp.Position
        -- Adding offset to the target's Y position if needed
		local targetPos = Vector3.new(targetPosition.X, targetPosition.Y + offset, targetPosition.Z)
		local distance = (targetPos - currentPos).Magnitude
		local duration = distance / hoverSpeed
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        -- Multiply by a rotation so that the character faces up
		local tweenGoal = {
			CFrame = CFrame.new(targetPos) * CFrame.Angles(math.rad(-90), 0, 0)
		}
		currentHoverTween = TweenService:Create(hrp, tweenInfo, tweenGoal)
		currentHoverTween:Play()
		currentHoverTween.Completed:Wait()
		if hoverActive then
			tweenHover()
		end
	end
	spawn(tweenHover)
end

local function disableHover()
	hoverActive = false
	if currentHoverTween then
		currentHoverTween:Cancel()
	end
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.PlatformStand = false
		end
		enableCharacterCollision(character)
	end
	stopCameraLock()
end

-- ################ ---
-- ### MAIN TAB ### ---
-- ################ ---

--------------------------
-- MAIN: MOVEMENT GROUP --
--------------------------

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local toggles = {
	EnableSpeedHack = false,
	EnableFlight = false,
}

local options = {
	Speed = 100,       -- Adjust as needed
	FlightSpeed = 150, -- Adjust as needed
}
-- == SPEEDHACK FUNCTION == --
local function handleSpeedHack()
	local function initSpeedHack()
		local character = localPlayer.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local bv = hrp:FindFirstChild("SpeedHackVelocity")
				if not bv then
					bv = Instance.new("BodyVelocity")
					bv.Name = "SpeedHackVelocity"
					bv.MaxForce = Vector3.new(1e5, 0, 1e5)
					bv.Velocity = Vector3.new(0, 0, 0)
					bv.Parent = hrp
				end
				return bv
			end
		end
		return nil
	end
	local bv = initSpeedHack()
	while not bv and toggles.EnableSpeedHack do
		task.wait(0.1)
		bv = initSpeedHack()
	end
	while toggles.EnableSpeedHack and localPlayer and localPlayer.Character do
		local character = localPlayer.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		if hrp then
			camera = workspace.CurrentCamera
			local moveDirection = Vector3.new(0, 0, 0)
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				moveDirection = moveDirection + camera.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				moveDirection = moveDirection - camera.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				moveDirection = moveDirection - camera.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				moveDirection = moveDirection + camera.CFrame.RightVector
			end
			if moveDirection.Magnitude > 0 then
				moveDirection = moveDirection.Unit * options.Speed
			else
				moveDirection = Vector3.new(0, 0, 0)
			end
			if bv then
				bv.Velocity = Vector3.new(moveDirection.X, 0, moveDirection.Z)
			end
		end
		task.wait()
	end
	if localPlayer and localPlayer.Character then
		local hrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			local oldBV = hrp:FindFirstChild("SpeedHackVelocity")
			if oldBV then
				oldBV:Destroy()
			end
		end
	end
end

-- == FLIGHT FUNCTION == --
local function handleFlight()
	while toggles.EnableFlight do
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		if hrp then
			camera = workspace.CurrentCamera
			local moveDirection = Vector3.new(0, 0, 0)
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				moveDirection = moveDirection + camera.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				moveDirection = moveDirection - camera.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				moveDirection = moveDirection - camera.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				moveDirection = moveDirection + camera.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				moveDirection = moveDirection + camera.CFrame.UpVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				moveDirection = moveDirection - camera.CFrame.UpVector
			end
			if moveDirection.Magnitude > 0 then
				moveDirection = moveDirection.Unit * options.FlightSpeed
			else
				moveDirection = Vector3.new(0, 0, 0)
			end
			hrp.Velocity = moveDirection
		end
		task.wait()
	end
end

local function onCharacterAdded(character)
	character:WaitForChild("Humanoid")
	task.wait(0.5)
	if toggles.EnableSpeedHack then
		task.spawn(handleSpeedHack)
	end
end
localPlayer.CharacterAdded:Connect(onCharacterAdded)

-- == INFINITE JUMP FUNCTION == --
local function enableInfiniteJump()
	if infiniteJumpConnection then
		infiniteJumpConnection:Disconnect()
	end
	infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
		if Toggles.EnableInfiniteJump and localPlayer.Character then
			local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)
end

local function disableInfiniteJump()
	if infiniteJumpConnection then
		infiniteJumpConnection:Disconnect()
		infiniteJumpConnection = nil
	end
end

-- == GUI MOVEMENT GROUP == --
local MovementGroup = Tabs.Main:AddLeftGroupbox("Movement")

MovementGroup:AddToggle("EnableSpeedHack", {
	Text = "WalkSpeed",
	Default = false,
	Tooltip = "Toggle increased walk speed.",
	Callback = function(active)
		toggles.EnableSpeedHack = active
		if active then
			task.spawn(handleSpeedHack)
		else
			if localPlayer and localPlayer.Character then
				local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					humanoid.WalkSpeed = 16
				end
			end
		end
	end,
})

MovementGroup:AddLabel("WalkSpeed Keybind"):AddKeyPicker("SpeedKeybind", {
	Default = "N",
	Mode = "Toggle",
	Text = "",
	NoUI = false,
	Callback = function(active)
		toggles.EnableSpeedHack = active
		if active then
			task.spawn(handleSpeedHack)
		end
	end,
})
MovementGroup:AddSlider("Speed", {
	Text = "",
	Default = 150,
	Min = 10,
	Max = 500,
	Rounding = 0,
	Tooltip = "Adjust the walk speed",
	Callback = function(value)
		options.Speed = value
	end,
})

MovementGroup:AddToggle("EnableFlight", {
	Text = "Flight",
	Default = false,
	Tooltip = "Toggle flight",
	Callback = function(active)
		toggles.EnableFlight = active
		if active then
			task.spawn(handleFlight)
		else
			if localPlayer and localPlayer.Character then
				local hrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.Velocity = Vector3.new(0, 0, 0)
				end
			end
		end
	end,
})

MovementGroup:AddLabel("Flight Keybind"):AddKeyPicker("FlightKeybind", {
	Default = "J",
	Mode = "Toggle",
	Text = "",
	NoUI = false,
	Callback = function(active)
		toggles.EnableFlight = active
		if active then
			task.spawn(handleFlight)
		end
	end,
})

MovementGroup:AddSlider("FlightSpeed", {
	Text = "",
	Default = 200,
	Min = 10,
	Max = 1000,
	Rounding = 0,
	Tooltip = "Adjust the flight speed.",
	Callback = function(value)
		options.FlightSpeed = value
	end,
})

MovementGroup:AddToggle("EnableInfiniteJump", {
	Text = "Infinite Jump",
	Default = false,
	Tooltip = "Toggle infinite jump",
	Callback = function(active)
		if active then
			enableInfiniteJump()
		else
			disableInfiniteJump()
		end
	end
})

MovementGroup:AddLabel("Infinite Jump Keybind"):AddKeyPicker("InfiniteJumpKeybind", {
	Default = "H",
	Mode = "Toggle",
	Text = "",
	NoUI = false,
	Callback = function(active)
		Toggles.EnableInfiniteJump:SetValue(active)
		if active then
			enableInfiniteJump()
		else
			disableInfiniteJump()
		end
	end
})

local AutoRollEnabled = false
local RollGroup = Tabs.Main:AddLeftGroupbox('AutoRoll')
RollGroup:AddToggle("AutoRoll", {
	Text = "AutoRoll",
	Default = false,
	Callback = function(Value)
		AutoRollEnabled = Value
		if AutoRollEnabled then
			task.spawn(function()
				while AutoRollEnabled do
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Roll"):InvokeServer()
					task.wait(0.1)
				end
			end)
		end
	end
})

------------------------------------------------------------
-- ESP GROUBOX
------------------------
local ESPEnabled = false
local ESPMode = "Mob ESP"  -- default ESP target mode: "Mob ESP", "Player ESP", or "Both"
local ShowHealthESP = true  -- whether to show the dynamic health bar
local ShowNameTagESP = false -- whether to show name tags

local mobAddedConnection     -- connection for Workspace.Mobs.ChildAdded
local playerAddedConnection  -- connection for Players.PlayerAdded
local characterAddedConnections = {}  -- table to store per-player CharacterAdded connections

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

------------------------------------------------------------
-- ESP Helper Functions
------------------------------------------------------------

-- Function to add a Highlight to a model (mob or player character)
local function addHighlight(model)
	if model:IsA("Model") and not model:FindFirstChild("ESPHighlight") then
		local highlight = Instance.new("Highlight")
		highlight.Name = "ESPHighlight"
		highlight.FillTransparency = 0.5       -- adjust fill transparency as desired.
		highlight.OutlineTransparency = 0        -- solid outline.
		highlight.OutlineColor = Color3.new(1, 0, 0) -- red outline.
		highlight.FillColor = Color3.new(1, 0, 0)    -- red fill.
		highlight.Parent = model
	end
end

-- Function to remove the Highlight from a model
local function removeHighlight(model)
	local h = model:FindFirstChild("ESPHighlight")
	if h then
		h:Destroy()
	end
end

-- Function to add a dynamic HP bar (using a BillboardGui) to a model
local function addDynamicHPBar(model)
	if not ShowHealthESP then
		return
	end
	if model:IsA("Model") and not model:FindFirstChild("DynamicHPBar") then
		local humanoid = model:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local part = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
			if part then
				local billboard = Instance.new("BillboardGui")
				billboard.Name = "DynamicHPBar"
				billboard.Adornee = part
				billboard.Size = UDim2.new(3, 0, 0.4, 0)
				billboard.AlwaysOnTop = true
				billboard.StudsOffset = Vector3.new(0, 5, 0)
				local hpFrame = Instance.new("Frame", billboard)
				hpFrame.Name = "HPFrame"
				hpFrame.Size = UDim2.new(1, 0, 1, 0)
				hpFrame.BackgroundColor3 = Color3.new(1, 0, 0)  -- red = health
				hpFrame.BorderSizePixel = 0
				billboard.Parent = model
				humanoid.HealthChanged:Connect(function(health)
					local percent = health / humanoid.MaxHealth
					hpFrame.Size = UDim2.new(percent, 0, 1, 0)
				end)
			end
		end
	end
end

-- Function to remove the dynamic HP bar from a model
local function removeDynamicHPBar(model)
	local bp = model:FindFirstChild("DynamicHPBar")
	if bp then
		bp:Destroy()
	end
end

-- Function to add a name tag (using BillboardGui and TextLabel) to a model
local function addNameTag(model)
	if not ShowNameTagESP then
		return
	end
	if model:IsA("Model") and not model:FindFirstChild("NameTag") then
		local part = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
		if part then
			local billboard = Instance.new("BillboardGui")
			billboard.Name = "NameTag"
			billboard.Adornee = part
			billboard.Size = UDim2.new(3, 0, 1, 0)
			billboard.StudsOffset = Vector3.new(0, 3, 0)
			billboard.AlwaysOnTop = true
			local nameLabel = Instance.new("TextLabel", billboard)
			nameLabel.Size = UDim2.new(2, 0, 2, 0)
			nameLabel.BackgroundTransparency = 1
			nameLabel.TextColor3 = Color3.new(1, 1, 1)
			nameLabel.TextStrokeTransparency = 0
			nameLabel.TextScaled = true
			nameLabel.Text = model.Name
			billboard.Parent = model
		end
	end
end

-- Function to remove the name tag from a model
local function removeNameTag(model)
	local nt = model:FindFirstChild("NameTag")
	if nt then
		nt:Destroy()
	end
end

-- Unified removal for all ESP components from a model
local function removeESP(model)
	removeHighlight(model)
	removeDynamicHPBar(model)
	removeNameTag(model)
end

-- Functions to apply ESP to a mob or a player's character
local function applyESPToMob(mob)
	addHighlight(mob)
	addDynamicHPBar(mob)
	addNameTag(mob)
end

local function applyESPToPlayer(player)
	local character = player.Character
	if character then
		addHighlight(character)
		addDynamicHPBar(character)
		addNameTag(character)
	end
end

------------------------------------------------------------
-- Main Toggle Function for ESP
------------------------------------------------------------

local function toggleESP(enabled)
	ESPEnabled = enabled

-- Process mobs
	if ESPEnabled and (ESPMode == "Mob ESP" or ESPMode == "Both") then
		for _, mob in pairs(Workspace.Mobs:GetChildren()) do
			applyESPToMob(mob)
		end
		mobAddedConnection = Workspace.Mobs.ChildAdded:Connect(function(newMob)
			task.wait(0.1)
			if ESPEnabled and (ESPMode == "Mob ESP" or ESPMode == "Both") then
				applyESPToMob(newMob)
			end
		end)
	else
		for _, mob in pairs(Workspace.Mobs:GetChildren()) do
			removeESP(mob)
		end
		if mobAddedConnection then
			mobAddedConnection:Disconnect()
			mobAddedConnection = nil
		end
	end

-- Process players
	if ESPEnabled and (ESPMode == "Player ESP" or ESPMode == "Both") then
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				applyESPToPlayer(player)
				if not characterAddedConnections[player] then
					characterAddedConnections[player] = player.CharacterAdded:Connect(function(char)
						task.wait(0.1)
						if ESPEnabled and (ESPMode == "Player ESP" or ESPMode == "Both") then
							addHighlight(char)
							addDynamicHPBar(char)
							addNameTag(char)
						end
					end)
				end
			end
		end
		playerAddedConnection = Players.PlayerAdded:Connect(function(player)
			if player ~= Players.LocalPlayer then
				player.CharacterAdded:Connect(function(char)
					task.wait(0.1)
					if ESPEnabled and (ESPMode == "Player ESP" or ESPMode == "Both") then
						addHighlight(char)
						addDynamicHPBar(char)
						addNameTag(char)
					end
				end)
			end
		end)
	else
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				if player.Character then
					removeESP(player.Character)
				end
				if characterAddedConnections[player] then
					characterAddedConnections[player]:Disconnect()
					characterAddedConnections[player] = nil
				end
			end
		end
		if playerAddedConnection then
			playerAddedConnection:Disconnect()
			playerAddedConnection = nil
		end
	end
end

------------------------------------------------------------
-- UI SETUP (Using LinoriaLib)
------------------------------------------------------------

local EspGroupbox = Tabs.Main:AddRightGroupbox('ESP')

-- Toggle to turn ESP on/off
EspGroupbox:AddToggle("ESP", {
	Text = "ESP",
	Default = false,
	Callback = function(Value)
		toggleESP(Value)
	end
})

EspGroupbox:AddDropdown("ESPMode", {
	Text = "ESP Targets",
	Values = {
		"Mob ESP",
		"Player ESP",
		"Both"
	},
	Default = 1,
	Callback = function(Value)
		if type(Value) == "number" then
			local modes = {
				"Mob ESP",
				"Player ESP",
				"Both"
			}
			ESPMode = modes[Value] or "Mob ESP"
		elseif type(Value) == "string" then
			ESPMode = Value
		else
			ESPMode = "Mob ESP"
		end
		if ESPEnabled then
			toggleESP(false)
			task.wait(0.1)
			toggleESP(true)
		end
	end
})

EspGroupbox:AddToggle("ShowHealth", {
	Text = "Show Health Bar",
	Default = true,
	Callback = function(Value)
		ShowHealthESP = Value
		if ESPEnabled then
			toggleESP(false)
			task.wait(0.1)
			toggleESP(true)
		end
	end
})

-- Toggle to show/hide name tags
EspGroupbox:AddToggle("ShowNameTags", {
	Text = "Show Name Tags",
	Default = false,
	Callback = function(Value)
		ShowNameTagESP = Value
		if ESPEnabled then
			toggleESP(false)
			task.wait(0.1)
			toggleESP(true)
		end
	end
})

------------------------
-- MAIN: COMBAT GROUP --
------------------------
local MobsFolder = workspace:WaitForChild("Mobs")
local FreezeEnabled = false
local FreezeBossesEnabled = false
local mobAddedConnection

local function isBoss(mob)
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if hum and hum.HealthDisplayDistance > 120 then
		return true
	end
	return false
end

local function fullFreezeMob(mob)
	local hrp = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then
		return
	end
	if hrp then
		hrp.Anchored = true
	end
	hum.WalkSpeed = 0
	hum.JumpPower = 0
	hum.PlatformStand = true
	hum.AutoRotate = false
	if not mob:FindFirstChild("IsFrozen") then
		local tag = Instance.new("BoolValue")
		tag.Name = "IsFrozen"
		tag.Parent = mob
	end
end
local function unfreezeMob(mob)
	local hrp = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if hrp then
		hrp.Anchored = false
	end
	if hum then
		hum.WalkSpeed = 16
		hum.JumpPower = 50
		hum.PlatformStand = false
		hum.AutoRotate = true
	end
	local tag = mob:FindFirstChild("IsFrozen")
	if tag then
		tag:Destroy()
	end
end
local function shouldFreeze(mob)
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then
		return false
	end
	if FreezeBossesEnabled and isBoss(mob) then
		return true
	end
	if FreezeEnabled and not isBoss(mob) then
		return true
	end
	return false
end
local function handleMob(mob)
	task.wait(1) -- wait 1 second after mob appears
	if shouldFreeze(mob) then
		fullFreezeMob(mob)
	end
end
local function refreshMobs()
	for _, mob in pairs(MobsFolder:GetChildren()) do
		if shouldFreeze(mob) then
			fullFreezeMob(mob)
		else
			unfreezeMob(mob)
		end
	end
end

local function connectMobHandler()
	if mobAddedConnection then
		mobAddedConnection:Disconnect()
	end
	mobAddedConnection = MobsFolder.ChildAdded:Connect(function(mob)
		handleMob(mob)
	end)
end

local function updateFreezing()
	refreshMobs()
	connectMobHandler()
end

local MaxKillRange = 50
local ClosestKillEnabled = false

local function getClosestEntity()
	local localPlayer = game.Players.LocalPlayer
	local character = localPlayer.Character
	if not character or not character:FindFirstChild("HumanoidRootPart") then
		return nil
	end
	local closestEntity
	local shortestDistance = math.huge
	local playerPosition = character.HumanoidRootPart.Position
	for _, entity in pairs(MobsFolder:GetChildren()) do
		local hum = entity:FindFirstChildOfClass("Humanoid")
		local hrp = entity:FindFirstChild("HumanoidRootPart")
		if hum and hum.Health > 0 and hrp then
			local distance = (playerPosition - hrp.Position).Magnitude
			if distance < shortestDistance then
				closestEntity = entity
				shortestDistance = distance
			end
		end
	end
	return closestEntity, shortestDistance
end

local bossTickCounters = {}
local function killClosestEntity()
	local closestEntity, distance = getClosestEntity()
	if closestEntity and distance <= MaxKillRange then
		local hum = closestEntity:FindFirstChildOfClass("Humanoid")
		local hrp = closestEntity:FindFirstChild("HumanoidRootPart")
		if hum and hum.Health > 0 then
        -- 🧠 Detect if it's a boss
			local isBoss = hum.HealthDisplayDistance and hum.HealthDisplayDistance > 120
			if isBoss then
            -- Initialize tick count if not tracked yet
				if not bossTickCounters[closestEntity] then
					bossTickCounters[closestEntity] = 1
					return -- skip first tick
				elseif bossTickCounters[closestEntity] < 5 then
					bossTickCounters[closestEntity] = bossTickCounters[closestEntity] + 1
					return -- skip until 5 ticks reached
				end
			end

        -- Cleanup: if frozen or anchored, fix
			if closestEntity:FindFirstChild("IsFrozen") then
				unfreezeMob(closestEntity)
				task.wait(0.1)
			elseif hrp and hrp.Anchored then
				hrp.Anchored = false
			end
			hum.PlatformStand = false
			hum.AutoRotate = true
			hum:ChangeState(Enum.HumanoidStateType.Physics)
			hum:ChangeState(Enum.HumanoidStateType.Seated)
			task.wait(0.05)
			hum.Health = 0
		end
	end
end

local CombatGroup = Tabs.Main:AddRightGroupbox('Combat')

local AutoAttackEnabled = false
CombatGroup:AddToggle("AutoAttack", {
	Text = "AutoAttack",
	Default = false,
	Callback = function(Value)
		AutoAttackEnabled = Value
		if AutoAttackEnabled then
			task.spawn(function()
				while AutoAttackEnabled do
					game:GetService("ReplicatedStorage").Remotes.Combat:FireServer()
					task.wait(0.1)
				end
			end)
		end
	end
})

CombatGroup:AddSlider("KillRange", {
	Text = "InstaKill Range",
	Default = 200,
	Min = 0,
	Max = 250,
	Rounding = 0,
	Callback = function(Value)
		MaxKillRange = Value
	end
})

CombatGroup:AddToggle("InstaKill", {
	Text = "InstaKill",
	Default = false,
	Callback = function(Value)
		ClosestKillEnabled = Value
		if ClosestKillEnabled then
			task.spawn(function()
				while ClosestKillEnabled do
					killClosestEntity()
					task.wait(0.05)
				end
			end)
		end
	end
})

CombatGroup:AddToggle("FrostFreeze", {
	Text = "Freeze Mobs",
	Default = false,
	Callback = function(state)
		FreezeEnabled = state
		updateFreezing()
	end
})

CombatGroup:AddToggle("FrostFreezeBosses", {
	Text = "Freeze Bosses",
	Default = false,
	Callback = function(state)
		FreezeBossesEnabled = state
		updateFreezing()
	end
})

----------------------
-- MAIN: MISC GROUP --
----------------------
local miscGroupbox = Tabs.Main:AddRightGroupbox("Misc")

-- == FULLBRIGHT == --
local fullbrightEnabled = false
local originalSettings = {}
local Lighting = game:GetService("Lighting")

local function storeOriginalSettings()
	originalSettings = {
		Brightness = Lighting.Brightness,
		ClockTime = Lighting.ClockTime,
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
			Lighting.ClockTime = originalSettings.ClockTime
			Lighting.GlobalShadows = originalSettings.GlobalShadows
			Lighting.Ambient = originalSettings.Ambient
		end
	end
end

RunService.RenderStepped:Connect(function()
	if fullbrightEnabled then
		Lighting.Brightness = 5
		Lighting.ClockTime = 12
		Lighting.GlobalShadows = false
		Lighting.Ambient = Color3.new(1, 1, 1)
	end
end)

miscGroupbox:AddToggle('FullbrightToggle', {
	Text = 'Fullbright',
	Default = false,
	Tooltip = 'Toggle Fullbright',
	Callback = function(Value)
		setFullbright(Value)
	end
})

-- == NO WEATHER == --
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local noWeatherEnabled = false
local originalSettings = {}

local function storeOriginalSettings()
	originalSettings = {
		FogColor = Lighting.FogColor,
		FogEnd = Lighting.FogEnd,
		FogStart = Lighting.FogStart,
		OutdoorAmbient = Lighting.OutdoorAmbient,
	}
end

local function removeWeatherInstances()
	for _, instance in ipairs(Lighting:GetChildren()) do
		if instance:IsA("Sky") or instance:IsA("Atmosphere") then
			instance:Destroy()
		end
	end
end

local function setNoWeather(enabled)
	if enabled then
		storeOriginalSettings()
		Lighting.FogColor = Color3.fromRGB(255, 255, 255)
		Lighting.FogEnd = 1000000
		Lighting.FogStart = 0
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		removeWeatherInstances()
	else
		if next(originalSettings) then
			Lighting.FogColor = originalSettings.FogColor
			Lighting.FogEnd = originalSettings.FogEnd
			Lighting.FogStart = originalSettings.FogStart
			Lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
		end
	end
end

RunService.RenderStepped:Connect(function()
	if noWeatherEnabled then
		removeWeatherInstances()
	end
end)

miscGroupbox:AddToggle('NoFog Toggle', {
	Text = 'NoFog',
	Default = false,
	Tooltip = 'Toggle NoFog',
	Callback = function(Value)
		setNoWeather(Value)
	end
})

miscGroupbox:AddToggle("InfZoom", {
	Text = "Infinite Zoom",
	Default = false,
	Tooltip = "Toggle infinite zoom",
	Callback = function(val)
		if val then
			game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 1000000
		else
			game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 30
		end
	end
})

-- == SELF KILL == --
Players = game:GetService("Players")
TweenService = game:GetService("TweenService")
SoundService = game:GetService("SoundService")
Workspace = game:GetService("Workspace")
LocalPlayer = Players.LocalPlayer

local function selfKill()
	player = Players.LocalPlayer
	character = player.Character or player.CharacterAdded:Wait()
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
	rootPart = character:WaitForChild("HumanoidRootPart")
	local animation = Instance.new("Animation")
	animation.AnimationId = "http://www.roblox.com/asset/?id=83142209002456"  -- Replace with your animation ID
	local animationTrack = humanoid:LoadAnimation(animation)
	animationTrack:Play()
	wait(3.2)
	local meteor = Instance.new("Part")
	meteor.Size = Vector3.new(5, 5, 5)
	meteor.Shape = Enum.PartType.Ball
	meteor.Position = rootPart.Position + Vector3.new(0, 50, 0)
	meteor.Anchored = false
	meteor.CanCollide = false
	meteor.BrickColor = BrickColor.Red()
	meteor.Material = Enum.Material.SmoothPlastic
	meteor.Parent = Workspace
	local bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
	bodyVelocity.Velocity = Vector3.new(0, -100, 0)
	bodyVelocity.Parent = meteor
	local attachment = Instance.new("Attachment")
	attachment.Parent = meteor
	local particleEmitter = Instance.new("ParticleEmitter")
	particleEmitter.Parent = attachment
	particleEmitter.Texture = "rbxassetid://14592957841"  -- Replace with your texture ID
	particleEmitter.Size = NumberSequence.new(6)
	particleEmitter.Rate = 100
	particleEmitter.Lifetime = NumberRange.new(1)
	particleEmitter.LockedToPart = true
	particleEmitter.EmissionDirection = Enum.NormalId.Top
	local function createExplosionAtPosition(position)
		local explosion = Instance.new("Explosion")
		explosion.Position = position
		explosion.BlastRadius = 20
		explosion.BlastPressure = 10000
		explosion.Parent = Workspace
		local explosionSound = Instance.new("Sound")
		explosionSound.SoundId = "rbxassetid://6296105178"  -- Replace with your explosion sound ID
		explosionSound.Volume = 2
		explosionSound.Parent = humanoidRootPart
		explosionSound:Play()
	end
	local function createCraterAtPosition(position)
		local crater = Instance.new("Part")
		crater.Size = Vector3.new(10, 1, 10)
		crater.Position = position - Vector3.new(0, 5, 0)
		crater.Anchored = true
		crater.CanCollide = false
		crater.BrickColor = BrickColor.Black()
		crater.Material = Enum.Material.SmoothPlastic
		crater.Parent = Workspace
		game.Debris:AddItem(crater, 5)
	end
	wait(0.5)
	humanoid.Health = 0
	createExplosionAtPosition(meteor.Position)
	createCraterAtPosition(meteor.Position)
	local goalPosition = rootPart.Position - Vector3.new(0, 5, 0)
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local goal = {
		Position = goalPosition
	}
	local tween = TweenService:Create(rootPart, tweenInfo, goal)
	tween:Play()
	tween.Completed:Wait()
	for i = 1, 10 do
		particleEmitter.Rate = i * 10
		wait(0.1)
	end
	wait(2)
	meteor:Destroy()
	particleEmitter:Destroy()
	animationTrack:Stop()
end

miscGroupbox:AddButton({
	Text = "Best Respawn",
	Func = function()
		wait(0.5)
		selfKill()
	end,
	DoubleClick = false,
	Tooltip = "Please click me!"
})

-- == QUICK KILL == --
miscGroupbox:AddButton({
	Text = "Quick Respawn",
	Func = function()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
	end,
	DoubleClick = false,
	Tooltip = "Boring..."
})

-- ################# ---
-- ### AUTOS TAB ### ---
-- ################# ---

----------------------------
-- AUTOS: SERVER TP GROUP --
----------------------------
local serverGroupbox = Tabs.Autos:AddLeftGroupbox("Server Teleports")

-- == REJOIN == --
serverGroupbox:AddButton({
	Text = "Rejoin",
	Func = function()
		print("Rejoining the same server...")
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end,
	DoubleClick = false,
	Tooltip = "Rejoin the same server"
})

-- == HOP SMALLEST == --
serverGroupbox:AddButton({
	Text = "Hop Random",
	Func = function()
		print("Hopping to the random server...")
		local smallestServerId = nil
		local smallestCount = math.huge
		local cursor = ""
		repeat
			local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
			if cursor and cursor ~= "" then
				url = url .. "&cursor=" .. cursor
			end
			local response = game:HttpGet(url)
			local data = HttpService:JSONDecode(response)
			for _, server in ipairs(data.data) do
				if server.playing < server.maxPlayers and server.playing < smallestCount then
					smallestCount = server.playing
					smallestServerId = server.id
				end
			end
			cursor = data.nextPageCursor or ""
		until cursor == "" or smallestServerId
		if smallestServerId then
			TeleportService:TeleportToPlaceInstance(game.PlaceId, smallestServerId, LocalPlayer)
		else
			warn("No available servers found!")
		end
	end,
	DoubleClick = false,
	Tooltip = "Join a random server"
})

-- == HOP RANDOM == --
serverGroupbox:AddButton({
	Text = "Hop Smallest",
	Func = function()
		print("Hopping to a smallest server...")
		local servers = {}
		local cursor = ""
		repeat
			local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
			if cursor and cursor ~= "" then
				url = url .. "&cursor=" .. cursor
			end
			local response = game:HttpGet(url)
			local data = HttpService:JSONDecode(response)
			for _, server in ipairs(data.data) do
				if server.playing < server.maxPlayers then
					table.insert(servers, server.id)
				end
			end
			cursor = data.nextPageCursor or ""
		until cursor == "" or #servers > 0
		if #servers > 0 then
			local randomServerId = servers[math.random(1, #servers)]
			TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServerId, LocalPlayer)
		else
			warn("No available servers found!")
		end
	end,
	DoubleClick = false,
	Tooltip = "Join the server with the fewest players"
})

-------------------------
-- AUTOS: AUTO DUNGEON --
-------------------------
local AutoDungeonGroupbox = Tabs.Autos:AddLeftGroupbox("Auto Dungeon")

local dungeonTypes = {
	"Singularity",
	"Goblin Caves",
	"Spider Cavern"
}

local friendlyToReal = {
	["Singularity"] = "DoubleDungeonD",
	["Goblin Caves"] = "GoblinCave",
	["Spider Cavern"] = "SpiderCavern",
}

AutoDungeonGroupbox:AddDropdown("Dungeon Type", {
	Text = "Select Dungeon",
	AllowNull = true,
	Values = dungeonTypes,
	Default = false,
	Multi = false,
	Callback = function(Value)
		dungeonType = friendlyToReal[Value]
	end
})

local dungeonDifficulties = {
	"Regular",
	"Hard",
	"Nightmare"
}
local startClearing = false

AutoDungeonGroupbox:AddDropdown("Dungeon Difficulty", {
	Text = "Select Difficulty",
	AllowNull = true,
	Values = dungeonDifficulties,
	Default = false,
	Multi = false,
	Callback = function(Value)
		dungeonDifficulty = Value
	end
})

-- New toggle: Auto Replay
local autoReplayEnabled = false
AutoDungeonGroupbox:AddToggle("AutoReplayToggle", {
	Text = "Auto Replay",
	Default = false,
	Tooltip = "Rerolls if no mobs for 4s, hops at 10s",
	Callback = function(state)
		autoReplayEnabled = state
	end,
})

-- PATCHED JoinDungeon() for AutoDungeon
function JoinDungeon()
	wait(15)
	print("joining dungeon")
	local createArgs = {
		[1] = dungeonType
	}
	game:GetService("ReplicatedStorage")
    :WaitForChild("Remotes")
    :WaitForChild("createLobby")
    :InvokeServer(unpack(createArgs))
	task.wait(0.5)
	local diffArgs = {
		[1] = dungeonDifficulty
	}
	game:GetService("ReplicatedStorage")
    :WaitForChild("Remotes")
    :WaitForChild("LobbyDifficulty")
    :FireServer(unpack(diffArgs))
	task.wait(0.5)
	local args = {
		[1] = "ee6a"
	}
	if isfile("NoxHub/Hunters/AutoReinject.lua") then
		queueonteleport([[
        if isfile("NoxHub/Hunters/AutoReinject.lua") then
            loadstring(readfile("NoxHub/Hunters/AutoReinject.lua"))()
        end
        ]])
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer(unpack(args))
end

local function clearDungeon()
	task.wait(0.2)
	local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if root then
		enableHover(root.Position + Vector3.new(0, 11, 0))
	end
	local function updateHoverPosition()
		while true do
			local mobs = workspace.Mobs:GetChildren()
			local foundTarget = false
			for _, mob in ipairs(mobs) do
				local humanoid = mob:FindFirstChildOfClass("Humanoid")
				if humanoid and humanoid.HealthDisplayDistance and (humanoid.HealthDisplayDistance > 120) then
					local pos = nil
					if mob.PrimaryPart then
						pos = mob.PrimaryPart.Position
					elseif mob:FindFirstChild("HumanoidRootPart") then
						pos = mob.HumanoidRootPart.Position
					end
					if pos then
						enableHover(pos + Vector3.new(0, 11, 0))
						foundTarget = true
						break
					end
				end
			end
			task.wait(1)
		end
	end
	task.spawn(updateHoverPosition)
	task.wait(0.2)
	ClosestKillEnabled = true
	AutoAttackEnabled = true
	Toggles.InstaKill:SetValue(true)
	Toggles.AutoAttack:SetValue(true)
	Toggles.FrostFreezeBosses:SetValue(true)
end

local function clickMiddleLoop()
	local camera = workspace.CurrentCamera
	local viewportSize = camera.ViewportSize
	local centerX = viewportSize.X / 2
	local centerY = viewportSize.Y / 2
	VirtualInputManager:SendMouseButtonEvent(centerX + 100, centerY, 0, true, game, 0)
	VirtualInputManager:SendMouseButtonEvent(centerX + 100, centerY, 0, false, game, 0)
end

-- Services
Players = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")
VIM = game:GetService("VirtualInputManager")
camera = workspace.CurrentCamera

local function performWeaponRerollClick()
	local camera = workspace.CurrentCamera
	local screenSize = camera.ViewportSize
	local absX = 0.355 * screenSize.X
	local absY = 0.69 * screenSize.Y
	VIM:SendMouseButtonEvent(absX, absY, 0, true, game, 0)
	wait()
	VIM:SendMouseButtonEvent(absX, absY, 0, false, game, 0)
	local flash = Instance.new("ScreenGui", game.CoreGui)
	flash.IgnoreGuiInset = true
	flash.ResetOnSpawn = false
	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, 10, 0, 10)
	dot.Position = UDim2.new(0, absX - 5, 0, absY - 5)
	dot.BackgroundColor3 = Color3.new(1, 0, 0)
	dot.BackgroundTransparency = 0
	dot.BorderSizePixel = 0
	dot.Parent = flash
	dot.ZIndex = 9999
	task.spawn(function()
		for i = 1, 20 do
			dot.BackgroundTransparency = i / 20
			wait(0.05)
		end
		flash:Destroy()
	end)
end

-- Updated waitForMobsToBeEmpty
local function waitForMobsToBeEmpty()
	local mobsEmptyTime = 0
	local hasRerolled = false
	repeat
		task.wait(0.5)
		local mobCount = #workspace.Mobs:GetChildren()
		if mobCount == 0 then
			mobsEmptyTime = mobsEmptyTime + 0.5

        -- 4s = reroll
			if autoReplayEnabled and not hasRerolled and mobsEmptyTime >= 4 then
				hasRerolled = true
				performWeaponRerollClick()
			end
		else
			mobsEmptyTime = 0
			hasRerolled = false
		end
	until mobsEmptyTime >= 10
	teleportWithReinject(game.PlaceId, game.Players.LocalPlayer)
end

local autoDungeonActive = false

AutoDungeonGroupbox:AddToggle("AutoDungeonToggle", {
	Text = "AutoDungeon",
	Default = false,
	Tooltip = "Takes 15 seconds to start",
	Callback = function(state)
		if state then
			autoDungeonActive = true
			local player = game:GetService("Players").LocalPlayer
			if not player then
				warn("LocalPlayer not found!")
				return
			end
			if not player.Character then
				player.CharacterAdded:Wait()
			end
			local map = workspace:FindFirstChild("Map")
			local lobby = map and map:FindFirstChild("Lobby")
			if lobby then
				JoinDungeon()
			else
				task.wait(4)
				clearDungeon()
				clickMiddleLoop()
				task.wait(15)
				waitForMobsToBeEmpty()
			end
		else
			if autoDungeonActive then
				disableHover()
				local player = game:GetService("Players").LocalPlayer
				local character = player and player.Character
				ClosestKillEnabled = false
				AutoAttackEnabled = false
				Toggles.FrostFreezeBosses:SetValue(false)
				Toggles.InstaKill:SetValue(false)
				Toggles.AutoAttack:SetValue(false)
				if character then
					local hrp = character:FindFirstChild("HumanoidRootPart")
					if hrp then
						hrp.CFrame = hrp.CFrame * CFrame.new(0, 20, 0)
					else
						warn("HumanoidRootPart not found!")
					end
				else
					warn("Character not found!")
				end
				autoDungeonActive = false
			end
		end
	end,
})

---------------------
-- AUTOS: AUTOSELL --
---------------------
local AutoSellGroup = Tabs.Autos:AddRightGroupbox("AutoSell")

local function sellItem(uid)
	local args = {
		[1] = {
			[1] = uid
		}
	}
	game:GetService("ReplicatedStorage")
:WaitForChild("Remotes")
:WaitForChild("Sell")
:InvokeServer(unpack(args))
end

local function getInventory()
	local rawInv = game:GetService("ReplicatedStorage")
:WaitForChild("Remotes")
:WaitForChild("GetInventory")
:InvokeServer()
	local flatInventory = {}
	for _, subtable in pairs(rawInv or {}) do
		if type(subtable) == "table" then
			for _, item in pairs(subtable) do
				table.insert(flatInventory, item)
			end
		end
	end
	return flatInventory
end

local statMultiplierThreshold = 0.6
AutoSellGroup:AddSlider("StatMultiplierThreshold", {
	Text = "Sell Below Stat Multipier",
	Default = 0.6,
	Min = 0.5,
	Max = 1,
	Rounding = 2,
	Callback = function(Value)
		statMultiplierThreshold = Value
	end
})

AutoSellGroup:AddButton({
	Text = "Sell All",
	Func = function()
		local inventory = getInventory()
		for _, item in pairs(inventory) do
			if item.UID then
				sellItem(item.UID)
			end
		end
	end
})

AutoSellGroup:AddButton({
	Text = "Sell Items Below Multiplier",
	Func = function()  -- Button callback
		local inventory = getInventory()
		for _, item in pairs(inventory) do
			if item.stat_multiplier and item.stat_multiplier < statMultiplierThreshold and item.UID then
				sellItem(item.UID)
			end
		end
	end
})

local autoSellAllEnabled = false
AutoSellGroup:AddToggle("AutoSellAll", {
	Text = "AutoSell All",
	Default = false,
	Callback = function(Value)
		autoSellAllEnabled = Value
		if autoSellAllEnabled then
			task.spawn(function()
				while autoSellAllEnabled do
					local inventory = getInventory()
					for _, item in pairs(inventory) do
						if item.UID then
							sellItem(item.UID)
						end
					end
					task.wait(2)
				end
			end)
		end
	end
})

local autoSellBelowEnabled = false
AutoSellGroup:AddToggle("AutoSellBelow", {
	Text = "AutoSell Items Below Multiplier",
	Default = false,
	Callback = function(Value)
		autoSellBelowEnabled = Value
		if autoSellBelowEnabled then
			task.spawn(function()
				while autoSellBelowEnabled do
					local inventory = getInventory()
					for _, item in pairs(inventory) do
						if item.stat_multiplier and item.stat_multiplier < statMultiplierThreshold and item.UID then
							sellItem(item.UID)
						end
					end
					task.wait(2)
				end
			end)
		end
	end
})

-- ####################### ---
-- ### UI SETTINGS TAB ### ---
-- ####################### ---
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function()
	Library:Unload()
end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
	Default = 'End',
	NoUI = true,
	Text = 'Menu keybind'
})
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({
	'MenuKeybind'
})
ThemeManager:SetFolder('NoxHub')
SaveManager:SetFolder('NoxHub/Hunters')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()