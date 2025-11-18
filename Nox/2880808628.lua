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
	Name = "Fire Force | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Fire Force...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "NoxHub",
		FileName = "FireForce"
	}
})

-- // Tabs // --
local MainTab = Window:CreateTab("Main", "home")
local PlayerTab = Window:CreateTab("Player", "circle-user")
local AutoTab = Window:CreateTab("Auto", "bot")
local ESPTab = Window:CreateTab("Visual", "eye")
local MiscTab = Window:CreateTab("Misc", "menu")

-- // Services // --
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local VirtualInputManager  = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // References // --
local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local Drawing            = Drawing
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local viewport = camera and camera.ViewportSize or Vector2.new(0, 0)

-- // TWEENING HELPER FUNCTION // --
local speed = 300
local offsetY = 8
local flyingEnabled = false
local targetPosition = nil
local arrivalTargetPosition = nil
local activeConnection = nil

-- RESPAWN PROTECTION
local function refreshCharacter()
	character = player.Character or player.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end

local function disableCollisions(model)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
		end
	end
end

local function enableCollisions(model)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = true
		end
	end
end

local function stopCurrentMovement()
	if activeConnection then
		activeConnection:Disconnect()
		activeConnection = nil
	end
	if humanoidRootPart then
		humanoidRootPart.Anchored = false
		humanoidRootPart.Velocity = Vector3.zero
		humanoidRootPart.RotVelocity = Vector3.zero
	end
	if humanoid then
		humanoid.PlatformStand = false
		humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		task.wait(0.1)
		humanoid:ChangeState(Enum.HumanoidStateType.Running)
	end
	if character then
		enableCollisions(character)
	end
end

local function startFlight(hover)
	if activeConnection then
		activeConnection:Disconnect()
	end
	humanoid.PlatformStand = true
	humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	activeConnection = RunService.Heartbeat:Connect(function(dt)
		if not humanoidRootPart or not humanoid then
			stopCurrentMovement()
			refreshCharacter()
			return
		end
		if not flyingEnabled or not targetPosition then
			stopCurrentMovement()
			return
		end
		disableCollisions(character)
		local adjustedTarget = hover
    and Vector3.new(targetPosition.X, targetPosition.Y + offsetY, targetPosition.Z)
    or targetPosition
		local direction = (adjustedTarget - humanoidRootPart.Position)
		local distance = direction.Magnitude
		if arrivalTargetPosition and (humanoidRootPart.Position - arrivalTargetPosition).Magnitude <= 2 then
			flyingEnabled = hover
			if not hover then
				stopCurrentMovement()
			end
			arrivalTargetPosition = nil
			return
		end
		if distance < 2 then
			humanoidRootPart.Velocity = Vector3.zero
			humanoidRootPart.RotVelocity = Vector3.zero
			return
		end
		local moveVector = direction.Unit * math.min(speed, distance / dt) * dt
		humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + moveVector) * humanoidRootPart.CFrame.Rotation
		humanoidRootPart.Velocity = Vector3.zero
		humanoidRootPart.RotVelocity = Vector3.zero
	end)
end

local function setFlightTarget(pos, flightSpeed, hover, offset)
	speed = flightSpeed or 300
	offsetY = offset or 8
	targetPosition = pos
	arrivalTargetPosition = pos
	flyingEnabled = true
	startFlight(hover)
end

-- ############## --
-- // MAIN TAB // --
-- ############## --

local KILL_RANGE = 200
local MIN_HEALTH_PERCENT = 90
local VOID_Y = -1000
local LOOP_DELAY = 0.1
local BURST_DURATION = 1
local BURST_GAP = 2

local char = player.Character or player.CharacterAdded:Wait()
local rootPart = char:WaitForChild("HumanoidRootPart")
local killing = false
local killThread

-- // FUNCTIONS // --
local function getClosestEnemy()
	local best, bestDistSq = nil, KILL_RANGE * KILL_RANGE
	for _, mdl in ipairs(Workspace:GetDescendants()) do
		if mdl:IsA("Model") and not Players:GetPlayerFromCharacter(mdl) then
			local hum = mdl:FindFirstChildOfClass("Humanoid")
			local hrp = mdl.PrimaryPart or mdl:FindFirstChild("HumanoidRootPart")
			if hum and hum.Health > 0 and hrp then
				local healthPct = (hum.Health / hum.MaxHealth) * 100
				if healthPct <= MIN_HEALTH_PERCENT then
					local distSq = (hrp.Position - rootPart.Position).Magnitude ^ 2
					if distSq < bestDistSq then
						best, bestDistSq = mdl, distSq
					end
				end
			end
		end
	end
	return best
end

local function claimOwnership(model)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			pcall(function()
				part:SetNetworkOwner(player)
			end)
		end
	end
end

local function voidAndKill(model)
	local hum = model:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health > 0 then
		pcall(function()
			hum.Health = 0
		end)
	end
end

local function killLoop()
	while killing do
		local burstStart = tick()
		while killing and (tick() - burstStart < BURST_DURATION) do
			local enemy = getClosestEnemy()
			if enemy then
				claimOwnership(enemy)
				voidAndKill(enemy)
			end
			task.wait(LOOP_DELAY)
		end
		local cooldownStart = tick()
		while killing and (tick() - cooldownStart < BURST_GAP) do
			task.wait()
		end
	end
end

local function startKill()
	if killing then
		return
	end
	killing = true
	pcall(function()
		sethiddenproperty(player, "SimulationRadius", math.huge)
		sethiddenproperty(player, "MaxSimulationRadius", math.huge)
	end)
	killThread = task.spawn(killLoop)
end

local function stopKill()
	killing = false
	killThread = nil
end

MainTab:CreateSection("InstaKill")

MainTab:CreateToggle({
	Name = "Enable Instakill",
	Flag = "EnableInstakill",
	CurrentValue = false,
	Callback = function(state)
		if state then
			startKill()
		else
			stopKill()
		end
	end,
})

MainTab:CreateSlider({
	Name = "Range",
	Range = {
		10,
		400
	},
	Increment = 1,
	CurrentValue = KILL_RANGE,
	Flag = "KillRange",
	Callback = function(val)
		KILL_RANGE = val
	end,
})

MainTab:CreateSlider({
	Name = "Health Threshold (%)",
	Range = {
		1,
		100
	},
	Increment = 1,
	CurrentValue = MIN_HEALTH_PERCENT,
	Flag = "KillHealthThreshold",
	Callback = function(val)
		MIN_HEALTH_PERCENT = val
	end,
})

local liveChests = Workspace:WaitForChild("LiveChests")
local clicking = false
local chestThread

local function fireAllClicks()
	for _, obj in ipairs(liveChests:GetDescendants()) do
		if obj:IsA("ClickDetector") then
			pcall(function()
				fireclickdetector(obj)
			end)
		end
	end
end

local function clickLoop()
	while clicking do
		fireAllClicks()
		task.wait(1)
	end
end

MainTab:CreateToggle({
	Name = "Auto Click Chests",
	Flag = "AutoClickChests",
	CurrentValue = false,
	Callback = function(state)
		clicking = state
		if state then
			chestThread = task.spawn(clickLoop)
		else
			clicking = false
			chestThread = nil
		end
	end,
})

MainTab:CreateSection("Adolla")

local coreGui      = game:GetService("CoreGui")
local shardBoxes   = {}
local shardHighlights = {}
local pollingTask, updateConnection

local function getShardFolder()
	return workspace:FindFirstChild("AdollaShardSpawns")
end

local function getModelPart(model)
	return model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
end

local function isModelVisible(model)
	local part = getModelPart(model)
	if not part then
		return false
	end
	local _, onScreen = Camera:WorldToViewportPoint(part.Position)
	if not onScreen then
		return false
	end
	local origin    = Camera.CFrame.Position
	local direction = part.Position - origin
	local params    = RaycastParams.new()
	params.FilterDescendantsInstances = {
		part
	}
	params.FilterType               = Enum.RaycastFilterType.Whitelist
	local result = workspace:Raycast(origin, direction, params)
	return result and result.Instance == part
end

    -- direction helper
local function getDirectionTo(point)
	local localPos = Camera.CFrame:PointToObjectSpace(point)
	local x, z    = localPos.X, localPos.Z
	if math.abs(x) > math.abs(z) then
		return x > 0 and "right" or "left"
	else
		return z > 0 and "forward" or "behind"
	end
end
MainTab:CreateButton({
	Name = "Fly to Shard",
	Callback = function()
		refreshCharacter()
		local folder = getShardFolder()
		if not folder or not humanoidRootPart then
			return
		end
		local closest, minDist = nil, math.huge
		for _, model in ipairs(folder:GetChildren()) do
			if model:IsA("Model") then
				local part = getModelPart(model)
				if part then
					local d = (humanoidRootPart.Position - part.Position).Magnitude
					if d < minDist then
						minDist, closest = d, model
					end
				end
			end
		end
		if closest then
			local part = getModelPart(closest)
			setFlightTarget(part.Position, 300, false, 8)
		end
	end,
})
local pollingTask
MainTab:CreateToggle({
	Name         = "New Shard Alerts",
	Flag         = "AlertShardsVisible",
	CurrentValue = false,
	Callback     = function(enabled)
		if enabled then
			local seen = {}
			pollingTask = task.spawn(function()
				while true do
					local shardFolder = workspace:FindFirstChild("AdollaShardSpawns")
					if shardFolder then
						for _, model in ipairs(shardFolder:GetChildren()) do
							if model:IsA("Model") and not seen[model] then
								local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
								if part and isPartVisible(part) then
									seen[model] = true
									local dir = getDirectionTo(part.Position)
									Rayfield:Notify({
										Title   = "Shard Spotted",
										Content = ("'%s' is now visible to the %s"):format(model.Name, dir),
										Duration = 4,
										Image   = "info"
									})
								end
							end
						end
					end
					task.wait(0.5)
				end
			end)
		else
			if pollingTask then
				pollingTask:Cancel()
				pollingTask = nil
			end
		end
	end,
})

-- toggle: dynamic ESP boxes
MainTab:CreateToggle({
	Name = "Shard ESP",
	Flag = "ShardESP",
	CurrentValue = false,
	Callback = function(enabled)
		if updateConnection then
			updateConnection:Disconnect()
			updateConnection = nil
		end
		for m, box in pairs(shardBoxes) do
			box:Destroy()
			shardBoxes[m] = nil
		end
		if not enabled then
			return
		end
		local folder = getShardFolder()
		if not folder then
			return
		end
		updateConnection = RunService.Heartbeat:Connect(function()
			for _, model in ipairs(folder:GetChildren()) do
				if model:IsA("Model") then
					local part = getModelPart(model)
					local vis = part and isModelVisible(model)
					local box = shardBoxes[model]
					if vis and not box then
						local sel = Instance.new("SelectionBox")
						sel.Adornee = part
						sel.LineThickness = 0.1
						sel.Color3 = Color3.new(1, 0, 0)
						sel.SurfaceTransparency = 0.5
						sel.Parent = coreGui
						shardBoxes[model] = sel
					elseif not vis and box then
						box:Destroy()
						shardBoxes[model] = nil
					end
				end
			end
		end)
	end,
})

        -- toggle: auto-click detectors within 10 studs
MainTab:CreateToggle({
	Name = "Auto-Collect Nearby Shards",
	Flag = "AutoClickShards",
	CurrentValue = false,
	Callback = function(enabled)
		if not enabled then
			return
		end
		task.spawn(function()
			while MainTab.Flags.AutoClickShards do
				local folder = getShardFolder()
				local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if folder and hrp then
					for _, cd in ipairs(folder:GetDescendants()) do
						if cd:IsA("ClickDetector") then
							local part = cd.Parent:IsA("BasePart") and cd.Parent or cd.Parent:FindFirstChildWhichIsA("BasePart")
							if part and (hrp.Position - part.Position).Magnitude <= 10 then
								pcall(fireclickdetector, cd)
							end
						end
					end
				end
				task.wait(0.5)
			end
		end)
	end,
})

    -- // RAID // --
MainTab:CreateSection("Raids")
local raidToggles = {
	EnterRift = false,
	EnterReaper = false,
	EnterDesert = false,
}
local function autoEnterRift()
	while raidToggles.EnterRift do
		local ignoreFolder = workspace:FindFirstChild("IgnoreParts")
		local riftModel = ignoreFolder and ignoreFolder:FindFirstChild("TheRiftModel")
		if riftModel then
			local riftPart = riftModel:FindFirstChild("RiftPart")
			if riftPart then
				local targetPos = riftPart.Position + Vector3.new(0, 2, 0)
				setFlightTarget(targetPos, 500, false, 0)
				Rayfield:Notify({
					Title = "Teleporting",
					Content = "Heading to Raid Portal",
					Duration = 3,
					Image = "navigation"
				})
				local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if not hrp then
					player.CharacterAdded:Wait()
					hrp = player.Character:WaitForChild("HumanoidRootPart")
				end
				while raidToggles.EnterRift and (hrp.Position - riftPart.Position).Magnitude > 10 do
					task.wait(0.3)
				end
				local prompt = riftPart:FindFirstChild("Activation")
				if prompt and prompt:IsA("ProximityPrompt") then
					task.wait(0.5)
					prompt:InputHoldBegin()
					task.wait(2.8)
					prompt:InputHoldEnd()
				end
				break
			end
		end
		task.wait(2)
	end
end

-- Toggle: Enter Rift
MainTab:CreateToggle({
	Name = "Auto Enter Rift",
	CurrentValue = false,
	Flag = "AutoRiftEntry",
	Callback = function(v)
		raidToggles.EnterRift = v
		if v then
			task.spawn(autoEnterRift)
		end
	end,
})

-- // AUTO ATTACK MODULE // --
MainTab:CreateSection("Kill Aura")

local HRP = character:WaitForChild("HumanoidRootPart")

local WeaponInfo = character:WaitForChild("FistCombat"):WaitForChild("WeaponInfoFolder"):WaitForChild("Fist")
local CombatEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("CombatEvent")
local killauraEnabled = false
local enableKillAuraToggle

local function startKillAura()
	local cycle = 1
	while killauraEnabled do
		CombatEvent:FireServer(
    cycle,
    WeaponInfo,
    CFrame.new(HRP.Position),
    true,
    WeaponInfo
    )
		cycle = cycle + 1
		if cycle > 3 then
			cycle = 1
		end
		task.wait(0.1)
	end
end

enableKillAuraToggle = MainTab:CreateToggle({
	Name = "Kill Aura V2",
	Flag = "KillAura",
	CurrentValue = false,
	Callback = function(state)
		killauraEnabled = state
		if killauraEnabled then
			startKillAura()
		end
	end,
})

MainTab:CreateKeybind({
	Name = "Toggle Kill Aura V2",
	Flag = "KillAuraHotkey",
	CurrentKeybind = "P",
	HoldToInteract = false,
	Callback = function()
		local newState = not killauraEnabled
		enableKillAuraToggle:Set(newState)
	end,
})

-- // TELEPORT TAB // --
local HRP      = (player.Character or player.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

local function keyList(tbl)
	local out = {}
	for k in pairs(tbl) do
		out[#out + 1] = k
	end
	table.sort(out)
	return out
end
local function getBountyBoardClosest()
	local root   = workspace:FindFirstChild("BountyBoards")
	local origin = HRP.Position
	local bestN, bestP, bestD = nil, nil, math.huge
	if root then
		for _, m in ipairs(root:GetChildren()) do
			if m:IsA("Model") then
				local pivot = m:GetPivot().Position
				local d = (pivot - origin).Magnitude
				if d < bestD then
					bestD, bestN, bestP = d, m.Name, pivot
				end
			end
		end
	end
	return bestN and {
		[bestN] = bestP
	} or {}
end
local function getBuyableItems()
	local out, root = {}, workspace:FindFirstChild("BuyableItems")
	if root then
		for _, m in ipairs(root:GetChildren()) do
			if m:IsA("Model") then
				out[m.Name] = m:GetPivot().Position
			end
		end
	end
	return out
end

local function getCapturePoints()
	local out, root = {}, workspace:FindFirstChild("CapturePoints")
	if root then
		for _, p in ipairs(root:GetChildren()) do
			if p:IsA("BasePart") then
				out[p.Name] = p.Position
			end
		end
	end
	return out
end
local function closestNestedModels(root)
	local buckets, origin = {}, HRP.Position
	for _, desc in ipairs(root:GetDescendants()) do
		if desc:IsA("Model") then
			local pos = desc:GetPivot().Position
			buckets[desc.Name] = buckets[desc.Name] or {}
			buckets[desc.Name][#buckets[desc.Name] + 1] = pos
		end
	end
	local out = {}
	for name, list in pairs(buckets) do
		local bestP, bestD = nil, math.huge
		for _, pos in ipairs(list) do
			local d = (pos - origin).Magnitude
			if d < bestD then
				bestD, bestP = d, pos
			end
		end
		out[("%s (%dx)"):format(name, #list)] = bestP
	end
	return out
end

local function getClothingAndAcc()
	local root = workspace:FindFirstChild("ClothingandAccessories")
	return root and closestNestedModels(root) or {}
end

local function getLiveNPCs()
	local out, root = {}, workspace:FindFirstChild("LiveNPCS")
	if root then
		for _, m in ipairs(root:GetChildren()) do
			if m:IsA("Model") then
				out[m.Name] = m:GetPivot().Position
			end
		end
	end
	return out
end

local function getTrainings()
	local root = workspace:FindFirstChild("Trainings")
	return root and closestNestedModels(root) or {}
end

local function getHelpfulNPCs()
	local root   = workspace:FindFirstChild("HelpfulNPCS")
	if not root then
		return {}
	end
	local origin  = HRP.Position
	local buckets = {}
	for _, desc in ipairs(root:GetDescendants()) do
		if desc:IsA("Model") and desc.Name ~= "AnimSaves" then
			local pos  = desc:GetPivot().Position
			local dist = (pos - origin).Magnitude
			local entry = buckets[desc.Name]
			if not entry or dist < entry.dist then
				buckets[desc.Name] = {
					pos = pos,
					dist = dist
				}
			end
		end
	end
	local out = {}
	for name, data in pairs(buckets) do
		out[name] = data.pos
	end
	return out
end

local function getPlayerTPs()
	local out = {}
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character then
			local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				out[plr.DisplayName or plr.Name] = hrp.Position
			end
		end
	end
	return out
end

local function getSpawns()
	local root = workspace:FindFirstChild("Spawns")
	if not root then
		return {}
	end
	local origin = HRP.Position
	local out     = {}
	for _, folder in ipairs(root:GetChildren()) do
		if folder:IsA("Folder") or folder:IsA("Model") then
			local bestPart, bestDist = nil, math.huge
			for _, desc in ipairs(folder:GetDescendants()) do
				if desc:IsA("BasePart") then
					local d = (desc.Position - origin).Magnitude
					if d < bestDist then
						bestDist, bestPart = d, desc
					end
				end
			end
			if bestPart then
				out[folder.Name] = bestPart.Position
			end
		end
	end
	return out
end

local SETS = {
	["Players"]               = getPlayerTPs,
	["Bounty Board"]          = getBountyBoardClosest,
	["Buyable Items"]         = getBuyableItems,
	["Capture Points"]        = getCapturePoints,
	["Clothing & Accessories"] = getClothingAndAcc,
	["Live NPCs"]             = getLiveNPCs,
	["Trainings"]             = getTrainings,
	["Helpful NPCs"]          = getHelpfulNPCs,
	["Clans"]                = getSpawns,
}

local currentSet   = "Clans"
local teleportTbl  = SETS[currentSet]()
local locNames     = keyList(teleportTbl)
local selectedDest = locNames[1] or "-"
local useVerticalPath = false

MainTab:CreateSection("Teleports")

local SET_ORDER = {
	"Clans",
	"Players",
	"Helpful NPCs",
	"Clothing & Accessories",
	"Capture Points",
	"Buyable Items",
	"Live NPCs",
	"Trainings",
	"Bounty Board",
}

local locDropdown
MainTab:CreateDropdown({
	Name          = "Location Set",
	Options       = SET_ORDER,
	CurrentOption = {
		currentSet
	},
	Callback      = function(opt)
		currentSet   = opt[1]
		teleportTbl  = SETS[currentSet]()
		locNames     = keyList(teleportTbl)
		selectedDest = locNames[1] or "-"
		if locDropdown then
			locDropdown:Refresh(locNames)
			locDropdown:Set({
				selectedDest
			})
		end
	end,
})

locDropdown = MainTab:CreateDropdown({
	Name          = "Select Location",
	Options       = locNames,
	CurrentOption = {
		selectedDest
	},
	Callback      = function(opt)
		selectedDest = opt[1]
	end,
})

MainTab:CreateToggle({
	Name         = "Hidden Teleport",
	CurrentValue = useVerticalPath,
	Flag         = "UseVerticalPath",
	Callback     = function(v)
		useVerticalPath = v
	end,
})

MainTab:CreateButton({
	Name = "Teleport",
	Callback = function()
		teleportTbl = SETS[currentSet]()
		local target = teleportTbl[selectedDest]
		if not target then
			return Rayfield:Notify({
				Title   = "Teleport Failed",
				Content = "Invalid location selected.",
				Duration = 4,
				Image   = "x",
			})
		end
		Rayfield:Notify({
			Title   = "Teleporting...",
			Content = "Heading to " .. selectedDest,
			Duration = 4,
			Image   = "navigation",
		})
		spawn(function()
			local speed = 500
			if useVerticalPath then
				local downPos = HRP.Position - Vector3.new(0, 50, 0)
				setFlightTarget(downPos, speed, false, 0)
				repeat
					task.wait()
				until (HRP.Position - downPos).Magnitude < 5
				local midPos = target - Vector3.new(0, 50, 0)
				setFlightTarget(midPos, speed, false, 0)
				repeat
					task.wait()
				until (HRP.Position - midPos).Magnitude < 5
				local upPos = target + Vector3.new(0, 2, 0)
				setFlightTarget(upPos, speed, false, 0)
			else
				setFlightTarget(target + Vector3.new(0, 2, 0), speed, false, 0)
			end
		end)
	end,
})

MainTab:CreateButton({
	Name = "Refresh Locations",
	Callback = function()
		teleportTbl  = SETS[currentSet]()
		locNames     = keyList(teleportTbl)
		selectedDest = locNames[1] or "-"
		locDropdown:Refresh(locNames)
		locDropdown:Set({
			selectedDest
		})
		Rayfield:Notify({
			Title   = "Locations Updated",
			Content = "Re-scanned " .. currentSet,
			Duration = 2,
			Image   = "refresh-cw",
		})
	end,
})

-- ################ --
-- // PLAYER TAB // --
-- ################ --

-- // FLIGHT // --
local flying = false
local flySpeed = 100
local flyKeyDown = {}
local lastY
local flightToggle

local function getHRP()
	character = player.Character
	return character and character:FindFirstChild("HumanoidRootPart")
end
local function getMobileMoveVector()
	if humanoid and UserInputService.TouchEnabled then
		local dir = humanoid.MoveDirection
		if dir.Magnitude > 0 then
			local cf = camera.CFrame
			local forward = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit
			local right = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z).Unit
			return (forward * dir.Z + right * dir.X).Unit
		end
	end
	return Vector3.zero
end

PlayerTab:CreateSection("Movement")

flightToggle = PlayerTab:CreateToggle({
	Name = "Flight",
	Flag = "Flight",
	CurrentValue = false,
	Callback = function(state)
		flying = state
		local hrp = getHRP()
		if state and hrp then
			lastY = hrp.Position.Y
		end
	end
})

PlayerTab:CreateKeybind({
	Name = "Toggle Flight",
	Flag = "flightBind",
	CurrentKeybind = "G",
	HoldToInteract = false,
	Callback = function()
		if flightToggle and flightToggle.Set then
			flightToggle:Set(not flying)
		end
	end
})

PlayerTab:CreateSlider({
	Name = "Flight Speed",
	Flag = "flightSpeed",
	Range = {
		10,
		300
	},
	Increment = 10,
	CurrentValue = 100,
	Callback = function(val)
		flySpeed = val
	end
})

-- FLIGHT LOGIC MOBILE AND PC
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

RunService.RenderStepped:Connect(function()
	if not flying then
		return
	end
	local hrp = getHRP()
	if not hrp then
		return
	end
	local moveDir = Vector3.zero
	local camCF = camera.CFrame
	if not UserInputService.TouchEnabled then
		if flyKeyDown[Enum.KeyCode.W] then
			moveDir += camCF.LookVector
		end
		if flyKeyDown[Enum.KeyCode.S] then
			moveDir -= camCF.LookVector
		end
		if flyKeyDown[Enum.KeyCode.A] then
			moveDir -= camCF.RightVector
		end
		if flyKeyDown[Enum.KeyCode.D] then
			moveDir += camCF.RightVector
		end
	else
		moveDir += getMobileMoveVector()
	end
	if flyKeyDown[Enum.KeyCode.Space] then
		moveDir += Vector3.yAxis
	end
	if flyKeyDown[Enum.KeyCode.LeftShift] then
		moveDir -= Vector3.yAxis
	end
	local velocity
	if moveDir.Magnitude > 0 then
		velocity = moveDir.Unit * flySpeed
		lastY = hrp.Position.Y
	else
		local yOffset = (lastY and (lastY - hrp.Position.Y)) or 0
		velocity = Vector3.new(0, yOffset * 5, 0)
	end
	hrp.Velocity = velocity
end)

                            -- RESPAWN PROTECTION
player.CharacterAdded:Connect(function(newChar)
	character = newChar
	humanoid = newChar:WaitForChild("Humanoid")
	humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	if flying then
		lastY = humanoidRootPart.Position.Y
	end
end)
PlayerTab:CreateSection(" ")

                        -- // PERFORMANCE MODES // --
local function applyPerformanceMode()
	_G._DisabledEffects = {}
	_G._ChangedParts = {}
	for _, obj in ipairs(workspace:GetDescendants()) do
		pcall(function()
			if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
				if obj.Enabled ~= false then
					obj.Enabled = false
					table.insert(_G._DisabledEffects, obj)
				end
			elseif obj:IsA("Light") then
				if obj.Enabled ~= false then
					obj.Enabled = false
					table.insert(_G._DisabledEffects, obj)
				end
			elseif obj:IsA("BasePart") and not obj:IsDescendantOf(player.Character) then
				_G._ChangedParts[obj] = {
					Material = obj.Material,
					CastShadow = obj.CastShadow
				}
				obj.Material = Enum.Material.Plastic
				obj.CastShadow = false
			end
		end)
	end
end
local function restorePerformanceChanges()
	if _G._DisabledEffects then
		for _, obj in ipairs(_G._DisabledEffects) do
			pcall(function()
				if obj and obj.Parent then
					obj.Enabled = true
				end
			end)
		end
		_G._DisabledEffects = {}
	end
	if _G._ChangedParts then
		for obj, props in pairs(_G._ChangedParts) do
			pcall(function()
				if obj and obj.Parent then
					obj.Material = props.Material or Enum.Material.Plastic
					obj.CastShadow = props.CastShadow or true
					if props.Transparency then
						obj.Transparency = props.Transparency
					end
					if props.Anchored ~= nil then
						obj.Anchored = props.Anchored
					end
				end
			end)
		end
		_G._ChangedParts = {}
	end
	pcall(function()
		Lighting.GlobalShadows = true
		Lighting.EnvironmentDiffuseScale = 1
		Lighting.EnvironmentSpecularScale = 1
		Lighting.FogEnd = 1000
		Lighting.Brightness = 2
	end)
	if Terrain then
		pcall(function()
			Terrain.WaterTransparency = 0.5
			Terrain.WaterWaveSize = 0.2
			Terrain.WaterWaveSpeed = 10
			Terrain.WaterReflectance = 0.05
			Terrain.Decorations = true
		end)
	end
end
PlayerTab:CreateToggle({
	Name = "Performance Mode",
	Flag = "PerformanceMode",
	CurrentValue = false,
	Callback = function(state)
		if state then
			applyPerformanceMode()
		else
			restorePerformanceChanges()
		end
	end
})

    -- // ANTI AFK // --
local antiAfkConnection = nil
PlayerTab:CreateToggle({
	Name = "Anti-AFK",
	Flag = "AntiAFK",
	CurrentValue = false,
	Callback = function(enabled)
		if enabled then
			antiAfkConnection = player.Idled:Connect(function()
				VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				task.wait(1)
				VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			end)
		else
			if antiAfkConnection then
				antiAfkConnection:Disconnect()
				antiAfkConnection = nil
			end
		end
	end
})

-- // NO CLIP // --
local noclipConn = nil
local noclipEnabled = false

local function setCharacterCollision(enabled)
	local char = player.Character
	if char then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = enabled
			end
		end
	end
end

player.CharacterAdded:Connect(function()
	if noclipEnabled then
		task.wait(0.5)
		setCharacterCollision(false)
	end
end)

PlayerTab:CreateToggle({
	Name = "No Clip",
	Flag = "noClip",
	CurrentValue = false,
	Callback = function(state)
		noclipEnabled = state
		if state then
			setCharacterCollision(false)
			if not noclipConn then
				noclipConn = RunService.Stepped:Connect(function()
					local char = player.Character
					if char then
						for _, part in ipairs(char:GetDescendants()) do
							if part:IsA("BasePart") and part.CanCollide then
								part.CanCollide = false
							end
						end
					end
				end)
			end
		else
			if noclipConn then
				noclipConn:Disconnect()
				noclipConn = nil
			end
			setCharacterCollision(true)
		end
	end
})

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

PlayerTab:CreateButton({
	Name = "Ragdoll",
	Callback = function()
		local evt = game:GetService("ReplicatedStorage")
:WaitForChild("Events")
:WaitForChild("Ragdoll")
		local args = {
			""
		}
		evt:FireServer(unpack(args))
	end,
})

-- ################ --
-- // AUTO TAB // --
-- ################ --

AutoTab:CreateSection("AutoFarm Mobs")

-- // AUTO M1 // --
local defaultX, defaultY = 0, viewport.Y
local targetX, targetY   = defaultX, defaultY
local clickInterval      = 0.3
local M1Running          = false

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
			Title   = "Auto M1",
			Content = "Click anywhere to set spam location",
			Duration = 2,
		})
		local conn
		conn = UserInputService.InputBegan:Connect(function(input, processed)
			if not processed and input.UserInputType == Enum.UserInputType.MouseButton1 then
				targetX, targetY = input.Position.X, input.Position.Y
				clickPositionInput:Set(("%d, %d"):format(targetX, targetY))
				Rayfield:Notify({
					Title   = "Auto M1",
					Content = ("Location set: %d, %d"):format(targetX, targetY),
					Duration = 2,
					Image   = "pin",
				})
				conn:Disconnect()
			end
		end)
	end,
})

local AutoM1Toggle = AutoTab:CreateToggle({
	Name         = "Auto M1",
	CurrentValue = false,
	Flag         = "AutoM1",
	Callback     = function(enabled)
		M1Running = enabled
		if enabled then
			local saved = Rayfield.Flags.ClickPosition and Rayfield.Flags.ClickPosition.CurrentValue
			if type(saved) == "string" then
				local xStr, yStr = saved:match("^(%-?%d+),%s*(%-?%d+)$")
				if xStr and yStr then
					targetX, targetY = tonumber(xStr), tonumber(yStr)
				end
			end
			clickPositionInput:Set(("%d, %d"):format(targetX, targetY))
			task.spawn(function()
				while M1Running do
					VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, true,  game, 0)
					VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, false, game, 0)
					task.wait(clickInterval)
				end
			end)
		end
	end,
})

AutoTab:CreateDivider()

-- // AUTOFARM MOBS // --
local detectionRadius     = 100
local defaultOffset       = 8
local flightSpeed         = 200

local OFFSET_OVERRIDES = {
	["Infernal"] = 8,
}
local WHITELIST = {}
for _, plr in ipairs(Players:GetPlayers()) do
	if plr.Character then
		WHITELIST[plr.Character.Name] = true
	end
end
local CUSTOM_WHITELIST = {
	"FireForceGuard1",
	"FireForceScientist",
	"HolySolCommander",
	"HolySolAssassin",
	"IgorCombatNPC",
	"AdultCivilianNPC",
}
for _, name in ipairs(CUSTOM_WHITELIST) do
	WHITELIST[name] = true
end

local character, hrp
local function onCharacterAdded(char)
	character = char
	hrp = char:WaitForChild("HumanoidRootPart")
end
player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end

local autoFarmEnabled   = false
local autoGripEnabled   = true
local farmConn
local lastMob, knockStart, isRescuing = nil, nil, false

AutoTab:CreateSlider({
	Name         = "Detection Radius",
	Range        = {
		10,
		1000
	},
	Increment    = 10,
	Suffix       = "studs",
	CurrentValue = detectionRadius,
	Flag         = "DetectionRadius",
	Callback     = function(v)
		detectionRadius = v
	end,
})
AutoTab:CreateSlider({
	Name         = "Default Offset",
	Range        = {
		0,
		20
	},
	Increment    = 0.5,
	Suffix       = "studs",
	CurrentValue = defaultOffset,
	Flag         = "DefaultOffset",
	Callback     = function(v)
		defaultOffset = v
	end,
})
AutoTab:CreateToggle({
	Name         = "Auto Grip",
	CurrentValue = true,
	Flag         = "autoGrip",
	Callback     = function(v)
		autoGripEnabled = v
	end,
})
local function findClosestMob()
	if not hrp then
		return nil
	end
	local alive = workspace:FindFirstChild("Alive")
	if not alive then
		return nil
	end
	local origin       = hrp.Position
	local bestD_high   = math.huge
	local bestD_norm   = math.huge
	local closest_high, closest_norm = nil, nil
	for _, mdl in ipairs(alive:GetDescendants()) do
		if mdl:IsA("Model") and not WHITELIST[mdl.Name] then
			local hum = mdl:FindFirstChildOfClass("Humanoid")
			if hum then
				local state = hum:GetState()
				if state ~= Enum.HumanoidStateType.Physics then
					local hp = hum.Health
					if autoGripEnabled or hp > 1 then
						local pivot = mdl:GetPivot().Position
						local d = (pivot - origin).Magnitude
						if d <= detectionRadius then
							if hp > 1 then
								if d < bestD_high then
									bestD_high, closest_high = d, mdl
								end
							elseif hp > 0 then
								if d < bestD_norm then
									bestD_norm, closest_norm = d, mdl
								end
							end
						end
					end
				end
			end
		end
	end
	return closest_high or closest_norm
end
local function otherMobNearby(exclude)
	if not hrp then
		return false
	end
	local origin = hrp.Position
	local alive  = workspace:FindFirstChild("Alive")
	if not alive then
		return false
	end
	for _, mdl in ipairs(alive:GetDescendants()) do
		if mdl ~= exclude and mdl:IsA("Model") and not WHITELIST[mdl.Name] then
			local hum = mdl:FindFirstChildOfClass("Humanoid")
			if hum and hum.Health > 0 and hum:GetState() ~= Enum.HumanoidStateType.Physics then
				if (mdl:GetPivot().Position - origin).Magnitude <= 15 then
					return true
				end
			end
		end
	end
	return false
end
local function doRescue(mob)
	isRescuing = true
	enableKillAuraToggle:Set(false)
	AutoM1Toggle:Set(false)
	if farmConn then
		farmConn:Disconnect();
		farmConn = nil
	end
	stopCurrentMovement()
	task.wait(0.5)
	hrp.CFrame = CFrame.new(mob:GetPivot().Position + Vector3.new(0, 3, 0))
	task.wait(1)
	VirtualInputManager:SendKeyEvent(true,  Enum.KeyCode.B, false, game)
	task.wait(0.1)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.B, false, game)
	local startTime = tick()
	while tick() - startTime < 5 do
		if otherMobNearby(mob) then
			break
		end
		task.wait(0.1)
	end
	AutoM1Toggle:Set(true)
	enableKillAuraToggle:Set(true)
	lastMob, knockStart, isRescuing = nil, nil, false
	if autoFarmEnabled then
		farmConn = RunService.Heartbeat:Connect(farmLoop)
	end
end
local healthRetreatEnabled = false
local retreating           = false
AutoTab:CreateToggle({
	Name         = "Health Retreat",
	CurrentValue = false,
	Flag         = "HealthRetreat",
	Callback     = function(enabled)
		healthRetreatEnabled = enabled
		if not enabled then
			retreating = false
		end
	end,
})
local retreatAlign
function farmLoop()
	if isRescuing or not autoFarmEnabled or not hrp then
		return
	end
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if healthRetreatEnabled and humanoid then
		local pct = humanoid.Health / humanoid.MaxHealth
		if pct <= 0.30 then
			if not retreating then
				retreating = true
				stopCurrentMovement()
				if not retreatAlign then
					retreatAlign = Instance.new("AlignPosition")
					retreatAlign.Name = "RetreatAlign"
					retreatAlign.Mode = Enum.PositionAlignmentMode.OneAttachment
					retreatAlign.Attachment0 = hrp:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", hrp)
					retreatAlign.RigidityEnabled = true
					retreatAlign.MaxForce = 1e9
					retreatAlign.Responsiveness = 200
					retreatAlign.Parent = hrp
				end
				retreatAlign.Position = hrp.Position + Vector3.new(0, -50, 0)
				retreatAlign.Enabled = true
				Rayfield:Notify({
					Title   = "Health Retreat",
					Content = "Low health! Holding position 50 studs above…",
					Duration = 3,
					Image   = "shield-alert",
				})
			end
			return -- Suspend all other logic during retreat
		elseif retreating and pct >= 0.80 then
			retreating = false
			if retreatAlign then
				retreatAlign.Enabled = false
			end
			Rayfield:Notify({
				Title   = "Health Retreat",
				Content = "Health restored—resuming auto-farm",
				Duration = 3,
				Image   = "shield-check",
			})
		elseif retreating then
			return -- Still retreating and not healed
		end
	end

                -- FARMING logic continues below ONLY if not retreating
	local mob = findClosestMob()
	if mob then
		if autoGripEnabled and mob:FindFirstChild("Knocked") then
			if lastMob ~= mob then
				lastMob, knockStart = mob, tick()
			elseif tick() - knockStart >= 3 then
				doRescue(mob)
				return
			end
		else
			lastMob, knockStart = nil, nil
		end
		local offset = OFFSET_OVERRIDES[mob.Name] or defaultOffset
		local target = mob:GetPivot().Position
		setFlightTarget(target, flightSpeed, true, -offset)
		hrp.CFrame = CFrame.new(hrp.Position, target)
	else
		stopCurrentMovement()
	end
end
local originalDevCamMode = player.DevCameraOcclusionMode
local function startAutoFarm()
	if farmConn then
		return
	end
	autoFarmEnabled = true
	AutoM1Toggle:Set(true)
	player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
	farmConn = RunService.Heartbeat:Connect(farmLoop)
end
local function stopAutoFarm()
	autoFarmEnabled = false
	if farmConn then
		farmConn:Disconnect()
		farmConn = nil
	end
	player.DevCameraOcclusionMode = originalDevCamMode
	stopCurrentMovement()
	task.wait(3)
	enableKillAuraToggle:Set(false)
	AutoM1Toggle:Set(false)
end
local toggleAutoFarmMobs = AutoTab:CreateToggle({
	Name         = "AutoFarm Mobs",
	CurrentValue = false,
	Flag         = "autoFarmMobs",
	Callback     = function(v)
		if v then
			startAutoFarm()
			enableKillAuraToggle:Set(true)
		else
			stopAutoFarm()
			enableKillAuraToggle:Set(false)
		end
	end,
})
AutoTab:CreateSection("Phone Missions")
AutoTab:CreateParagraph({
	Title = "Phone Mission Info",
	Content = "Unfortunatly due to anti-cheat I there is currently no way of automatically clicking on the start mission button. While toggled the GUI will popup but you need to set an autoclicker to actually click the button. Working on a fix."
})

    -- // AUTO PHONE MISSION // --
local autoEnabled             = false
local lastMarker              = nil
local hasTeleportedInfernal   = false
local lastInfernalPart        = nil
local hasReturnedFromInfernal = false
local lastNoMarkerFireTime    = 0
AutoTab:CreateToggle({
	Name         = "Auto Mission",
	CurrentValue = false,
	Flag         = "AutoTeleportAll",
	Callback     = function(state)
		autoEnabled             = state
		lastMarker              = nil
		hasTeleportedInfernal   = false
		lastInfernalPart        = nil
		hasReturnedFromInfernal = false
		lastNoMarkerFireTime    = 0
		if state then
			spawn(function()
				while autoEnabled do
					local gui         = player.PlayerGui:FindFirstChild("SpecialMissionGUI")
					local notifTimer  = gui  and gui:FindFirstChild("NotoficationTimer")
					local frame       = notifTimer and notifTimer:FindFirstChild("Frame")
					local missionLbl  = frame      and frame:FindFirstChild("MissionName")
					local attackLabel = notifTimer and notifTimer:FindFirstChild("Text")
					local attackTxt   = attackLabel and attackLabel.Text or "<nil>"
					local missionText = missionLbl  and missionLbl.Text    or "<nil>"
					if missionText == "Escort the scientist" then
						lastMarker = nil
						lastNoMarkerFireTime = 0
						if attackTxt == "You're being attacked by Infernals! Defeat them."
                and not hasTeleportedInfernal then
							if autoFarmEnabled then
								stopAutoFarm()
							end
							local char = player.Character or player.CharacterAdded:Wait()
							local root = char and char:FindFirstChild("HumanoidRootPart")
							if root then
								local closest, bestDist = nil, math.huge
								for _, mdl in ipairs(workspace:GetDescendants()) do
									if mdl:IsA("Model") and mdl.Name:find("Infernal", 1, true) then
										local part = mdl.PrimaryPart or mdl:FindFirstChildWhichIsA("BasePart")
										if part then
											local d = (root.Position - part.Position).Magnitude
											if d < bestDist then
												bestDist, closest = d, part
											end
										end
									end
								end
								if closest then
									lastInfernalPart = closest
									setFlightTarget(closest.Position + Vector3.new(0, 2, 0), 500, false, 0)
									hasTeleportedInfernal   = true
									hasReturnedFromInfernal = false
									task.delay(1, function()
										if autoEnabled then
											startAutoFarm()
										end
									end)
								else
									warn("No targets found.")
								end
							else
								warn("No root part cannot teleport")
							end
						end
						if hasTeleportedInfernal
                    and lastInfernalPart
                    and not lastInfernalPart.Parent
                    and not hasReturnedFromInfernal then
							if autoFarmEnabled then
								stopAutoFarm()
							end
							local container = workspace:FindFirstChild("AllMissionMarkers")
							local bb        = container and container:FindFirstChild("LocalMissionMarker")
							if bb and bb:IsA("BillboardGui") and bb.Adornee then
								setFlightTarget(bb.Adornee.Position + Vector3.new(0, 2, 0), 500, false, 0)
								Rayfield:Notify({
									Title    = "⏪ Returning",
									Content  = "Back to Mission Marker",
									Duration = 3,
									Image    = "navigation",
								})
								hasReturnedFromInfernal = true
								task.delay(2, function()
									if autoEnabled then
										startAutoFarm()
									end
								end)
							else
								warn("No mission marker to return to.")
							end
						end
					elseif missionText == "Test of Strength" then
						lastMarker = nil
						lastNoMarkerFireTime = 0
						local char = player.Character or player.CharacterAdded:Wait()
						local root = char and char:FindFirstChild("HumanoidRootPart")
						if not root then
							warn("Missing HumanoidRootPart");
							return
						end
						local closestNPC, closestPart, bestDist = nil, nil, math.huge
						for _, npc in ipairs(workspace:GetDescendants()) do
							if npc:IsA("Model") and npc.Name == "AdultInfernalNPC" then
								local clickPart = npc:FindFirstChild("ClickPart")
								if clickPart and clickPart:IsA("BasePart") then
									local dist = (root.Position - clickPart.Position).Magnitude
									if dist < bestDist then
										bestDist = dist
										closestNPC = npc
										closestPart = clickPart
									end
								end
							end
						end
						if closestPart and closestPart:FindFirstChild("ClickDetector") then
							if autoFarmEnabled then
								stopAutoFarm()
							end
							setFlightTarget(closestPart.Position + Vector3.new(0, 2, 0), 500, false, 0)
							Rayfield:Notify({
								Title    = "👹 Test of Strength",
								Content  = "Heading to AdultInfernalNPC",
								Duration = 3,
								Image    = "navigation",
							})
							task.delay(2, function()
								fireclickdetector(closestPart.ClickDetector)
								task.wait(10)
								if autoEnabled then
									startAutoFarm()
								end
								spawn(function()
									while autoEnabled and closestNPC and closestNPC.Parent == workspace.Alive do
										task.wait(1)
									end
									if autoFarmEnabled then
										stopAutoFarm()
									end
									local container = workspace:FindFirstChild("AllMissionMarkers")
									local bb = container and container:FindFirstChild("LocalMissionMarker")
									if bb and bb:IsA("BillboardGui") and bb.Adornee then
										setFlightTarget(bb.Adornee.Position + Vector3.new(0, 2, 0), 500, false, 0)
										Rayfield:Notify({
											Title    = "⏪ Returning",
											Content  = "Back to Mission Marker",
											Duration = 3,
											Image    = "navigation",
										})
										task.delay(2, function()
											if autoEnabled then
												startAutoFarm()
											end
										end)
									else
										warn("No mission marker to return to.")
									end
								end)
							end)
						else
							warn("No valid AdultInfernalNPC found with a ClickDetector.")
						end
					else
						hasTeleportedInfernal   = false
						lastInfernalPart        = nil
						hasReturnedFromInfernal = false
						local container = workspace:FindFirstChild("AllMissionMarkers")
						local bb        = container and container:FindFirstChild("LocalMissionMarker")
						if bb and bb:IsA("BillboardGui") and bb.Adornee then
							lastNoMarkerFireTime = 0
							if lastMarker ~= bb then
								if autoFarmEnabled then
									stopAutoFarm()
								end
								lastMarker = bb
								setFlightTarget(bb.Adornee.Position + Vector3.new(0, 2, 0), 500, false, 0)
								Rayfield:Notify({
									Title    = "⏩ Teleporting",
									Content  = "Heading to Mission Marker",
									Duration = 3,
									Image    = "navigation",
								})
								task.delay(2, function()
									if autoEnabled then
										startAutoFarm()
									end
								end)
							end
						else
							local now = tick()
							if now - lastNoMarkerFireTime >= 45 then
								game:GetService("ReplicatedStorage")
                                            :WaitForChild("Events")
                                            :WaitForChild("MissionHandlerServer")
                                            :FireServer()
								lastNoMarkerFireTime = now
							end
							if autoFarmEnabled then
								stopAutoFarm()
							end
							lastMarker = nil
						end
					end
					wait(1)
				end
				if autoFarmEnabled then
					stopAutoFarm()
				end
			end)
		else
			if autoFarmEnabled then
				stopAutoFarm()
			end
		end
	end,
})

                            -- // POLICE TP // --
AutoTab:CreateSection("Police Missions")
AutoTab:CreateButton({
	Name = "TP to Officer",
	Callback = function()
		setFlightTarget(Vector3.new(-530, 554, 4667), 500, false, 0)
		Rayfield:Notify({
			Title   = "Teleporting",
			Content = "Heading to Officer",
			Duration = 2,
			Image   = "navigation",
		})
	end,
})

                        -- // PAPER STACKER // --
local trainingEvent = ReplicatedStorage
                        :WaitForChild("Events")
                        :WaitForChild("TrainingEvent")
AutoTab:CreateToggle({
	Name         = "Paper Stacker",
	CurrentValue = false,
	Flag         = "LoopAutoStack",
	Callback     = function(enabled)
		autoStackLoop = enabled
		if enabled then
			spawn(function()
				while autoStackLoop do
					local success, keyValue = pcall(function()
						return player.PlayerGui
                                :WaitForChild("TrainingGui", 1)
                                .PaperStacking
                                :WaitForChild("Key", 1)
					end)
					if success and keyValue and keyValue.Value ~= "" then
						trainingEvent:FireServer("Stacking", keyValue.Value)
					end
					task.wait(0.5)
				end
			end)
		end
	end,
})

            -- // TRASH COLLECTOR // --
AutoTab:CreateButton({
	Name = "Broom Trash",
	Callback = function()
		local root = workspace:FindFirstChild("TrashSpawns")
		if not root then
			Rayfield:Notify({
				Title = "Error",
				Content = "No TrashSpawns folder found",
				Duration = 3,
				Image = "x"
			})
			return
		end
		local parts = {}
		for _, desc in ipairs(root:GetDescendants()) do
			if desc:IsA("BasePart") then
				parts[#parts + 1] = desc
			end
		end
		if #parts == 0 then
			Rayfield:Notify({
				Title = "Nothing to collect",
				Content = "No parts under TrashSpawns",
				Duration = 3,
				Image = "info"
			})
			return
		end
		table.sort(parts, function(a, b)
			return (a.Position - hrp.Position).Magnitude < (b.Position - hrp.Position).Magnitude
		end)
		spawn(function()
			for i, part in ipairs(parts) do
				local targetPos = part.Position + Vector3.new(0, 2, 0)
				hrp.CFrame = CFrame.new(targetPos)
				task.wait(0.5)
				local cd = part:FindFirstChildOfClass("ClickDetector") or part:FindFirstChild("ClickDetector")
				if cd then
					pcall(fireclickdetector, cd)
				end
				task.wait(4)
			end
			Rayfield:Notify({
				Title = "Done",
				Content = "Collected all trash",
				Duration = 3,
				Image = "check"
			})
		end)
	end,
})

-- // VENDING MACHINE RUN // --
AutoTab:CreateButton({
	Name = "Vending Machine Run",
	Callback = function()
		local missionFolder = workspace:WaitForChild("MissionItems")
:WaitForChild("VendingMachineMission")
		local vm = missionFolder:WaitForChild("VendingMachine")
		local pivot = vm:GetPivot().Position
		setFlightTarget(pivot + Vector3.new(0, 2, 0), 500, false, 0)
		Rayfield:Notify({
			Title   = "Teleported",
			Content = "You’re at the Vending Machine",
			Duration = 2,
			Image   = "navigation",
		})
		wait(2)
		local cd = vm:FindFirstChildOfClass("ClickDetector")
		if cd then
			pcall(fireclickdetector, cd)
			wait(0.5)
		end
	end,
})

AutoTab:CreateSection("Crook Missions")

AutoTab:CreateButton({
	Name = "TP to Crook",
	Callback = function()
		setFlightTarget(Vector3.new(-1636.48718, 554.699158, 4967.21777), 500, false, 0)
		Rayfield:Notify({
			Title   = "Teleporting",
			Content = "Heading to Crook",
			Duration = 2,
			Image   = "navigation",
		})
	end,
})

AutoTab:CreateButton({
	Name = "Pickpocket",
	Callback = function()
		local alive = workspace:FindFirstChild("Alive")
		if not alive then
			return
		end
		local targetModel, targetPrompt
		for _, inst in ipairs(alive:GetDescendants()) do
			if inst:IsA("ProximityPrompt") then
				local mdl = inst:FindFirstAncestorWhichIsA("Model")
				if mdl and mdl:IsDescendantOf(alive) then
					targetModel  = mdl
					targetPrompt = inst
					break
				end
			end
		end
		local pivotPos = targetModel:GetPivot().Position
		setFlightTarget(pivotPos, 500, false, 0)
		task.delay(1, function()
			if not targetPrompt or not targetPrompt.Parent then
				warn("Prompt no longer available")
				return
			end
			pcall(function()
				targetPrompt:InputHoldBegin()
			end)
			task.wait(targetPrompt.HoldDuration or 0.5)
			pcall(function()
				targetPrompt:InputHoldEnd()
			end)
		end)
	end,
})

-- // GRAFFITI COLLECTOR // --
AutoTab:CreateButton({
	Name = "Graffiti Spray",
	Callback = function()
		local root = workspace:FindFirstChild("MissionItems")
and workspace.MissionItems:FindFirstChild("Graffiti")
		local parts = {}
		for _, desc in ipairs(root:GetDescendants()) do
			if desc:IsA("BasePart") then
				parts[#parts + 1] = desc
			end
		end
		table.sort(parts, function(a, b)
			return (a.Position - hrp.Position).Magnitude < (b.Position - hrp.Position).Magnitude
		end)
		spawn(function()
			for _, part in ipairs(parts) do
				local targetPos = part.Position + Vector3.new(0, 2, 0)
				setFlightTarget(targetPos, flightSpeed, false, 0)
				task.wait(1.7)
				local cd = part:FindFirstChildOfClass("ClickDetector")
				if cd then
					pcall(fireclickdetector, cd)
				end
				task.wait(2)
			end
			Rayfield:Notify({
				Title   = "Done",
				Content = "Tagged all graffiti",
				Duration = 3,
				Image   = "check",
			})
		end)
	end,
})

-- // GO TO ACTIVE CAR SPAWN AND ACTIVATE // --
AutoTab:CreateButton({
	Name = "Smash Car",
	Callback = function()
		local missionItems = workspace:FindFirstChild("MissionItems")
		local carSpawns    = missionItems and missionItems:FindFirstChild("CarSpawns")
		if not carSpawns then
			Rayfield:Notify({
				Title   = "Error",
				Content = "No Cars found",
				Duration = 3,
				Image   = "x",
			})
			return
		end
		local targetFolder
		for _, inst in ipairs(carSpawns:GetDescendants()) do
			if (inst:IsA("Folder") or inst:IsA("Model")) and inst:FindFirstChild("CurrentlyActive") then
				targetFolder = inst
				break
			end
		end
		local part = targetFolder:FindFirstChild("CurrentlyActive")
		if not (part and part:IsA("BasePart")) then
			for _, d in ipairs(targetFolder:GetDescendants()) do
				if d:IsA("BasePart") then
					part = d
					break
				end
			end
		end
		local targetPos = part.Position + Vector3.new(0, 2, 0)
		setFlightTarget(targetPos, flightSpeed, false, 0)
		Rayfield:Notify({
			Title   = "Teleporting",
			Content = "Heading to active car spawn",
			Duration = 2,
			Image   = "navigation",
		})
		task.delay(4, function()
			for _, obj in ipairs(targetFolder:GetDescendants()) do
				if obj:IsA("ClickDetector") then
					pcall(fireclickdetector, obj)
					return
				end
			end
		end)
	end,
})

-- // AUTO STRENGTH // --

AutoTab:CreateSection("Auto Train")

AutoTab:CreateParagraph({
	Title = "Auto Train Info",
	Content = "Unfortunatly due to anti-cheat I there is currently no way of automatically clicking on the start training button. While toggled the GUI will popup but you need to set an autoclicker to actually click the button. Working on a fix."
})

local autoClickEnabled  = false
local clickThread

AutoTab:CreateToggle({
	Name         = "Auto Strength",
	CurrentValue = false,
	Flag         = "autoClickButton",
	Callback     = function(enabled)
		autoClickEnabled = enabled
		if enabled then
			clickThread = task.spawn(function()
				local lastClickTime    = tick()
				local hasDoneFirstFB   = false
				while autoClickEnabled do
					local success, button = pcall(function()
						return player.PlayerGui
        :WaitForChild("TrainingGui", 1)
        .KeyArea
        :WaitForChild("ClickButton", 1)
					end)
					if success and button and button.Visible then
						local pos  = button.AbsolutePosition
						local size = button.AbsoluteSize
						local x = pos.X + size.X / 2
						local y = pos.Y + size.Y / 2 + 40
						VirtualInputManager:SendMouseButtonEvent(x, y, 0, true,  player.PlayerGui, 0)
						VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, player.PlayerGui, 0)
						lastClickTime  = tick()
						hasDoneFirstFB = false
					end
					local elapsed   = tick() - lastClickTime
					local threshold = hasDoneFirstFB and 20 or 3
					if elapsed > threshold then
						local root = (player.Character and player.Character:FindFirstChild("HumanoidRootPart"))
        or player.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")
						local strengthFolder = workspace:FindFirstChild("Trainings")
        and workspace.Trainings:FindFirstChild("Strength")
						local closest, bestDist = nil, math.huge
						if strengthFolder then
							for _, mdl in ipairs(strengthFolder:GetChildren()) do
								if mdl:IsA("Model") then
									local part     = mdl:FindFirstChild("ClickPart")
									local detector = part and part:FindFirstChildWhichIsA("ClickDetector")
									if detector then
										local d = (root.Position - part.Position).Magnitude
										if d < bestDist then
											bestDist, closest = d, detector
										end
									end
								end
							end
						end
						if closest then
							fireclickdetector(closest)
						end
						hasDoneFirstFB = true
						lastClickTime  = tick()
					end
					task.wait(0.5)
				end
			end)
		else
			autoClickEnabled = false
			clickThread      = nil
		end
	end,
})

-- // AUTO DEFENCE // --
local trainingRemote = ReplicatedStorage
:WaitForChild("Events")
:WaitForChild("TrainingEvent")

local function getCurrentStackSequence()
	local gui      = player.PlayerGui:FindFirstChild("TrainingGui")
	local keyOrder = gui and gui:FindFirstChild("KeyOrder")
	if not keyOrder then
		return {}
	end
	local frames = {}
	for _, c in ipairs(keyOrder:GetChildren()) do
		if c:IsA("Frame") then
			table.insert(frames, c)
		end
	end
	table.sort(frames, function(a, b)
		local ax = (a.AbsolutePosition and a.AbsolutePosition.X) or 0
		local bx = (b.AbsolutePosition and b.AbsolutePosition.X) or 0
		return ax < bx
	end)
	local out = {}
	for _, frame in ipairs(frames) do
		local lbl = frame:FindFirstChild("Key")
    or frame:FindFirstChildWhichIsA("TextLabel")
		if lbl and lbl.Text ~= "" then
			table.insert(out, lbl.Text)
		end
	end
	return out
end

local autoStackLoop = false

AutoTab:CreateToggle({
	Name         = "Auto Defence",
	CurrentValue = false,
	Flag         = "LoopAutoStack",
	Callback     = function(enabled)
		autoStackLoop        = enabled
		local lastSeqKey     = ""
		local lastKeyTime    = tick()
		local hasDoneFirstFB = false
		if enabled then
			spawn(function()
				while autoStackLoop do
					local seq = getCurrentStackSequence()
					local key = table.concat(seq, ",")
					if key ~= "" and key ~= lastSeqKey then
						for i, k in ipairs(seq) do
							trainingRemote:FireServer("Defense", k)
							task.wait(0.15)
						end
						lastSeqKey     = key
						lastKeyTime    = tick()
						hasDoneFirstFB = false
					end
					local elapsed   = tick() - lastKeyTime
					local threshold = hasDoneFirstFB and 20 or 3
					if #seq == 0 and elapsed > threshold then
						local root   = (player.Character and player.Character:FindFirstChild("HumanoidRootPart"))
            or player.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")
						local defenseFolder = workspace:FindFirstChild("Trainings")
            and workspace.Trainings:FindFirstChild("Defense")
						local closest, bestDist = nil, math.huge
						if defenseFolder then
							for _, mdl in ipairs(defenseFolder:GetChildren()) do
								if mdl:IsA("Model") then
									local part     = mdl:FindFirstChild("ClickPart")
									local detector = part and part:FindFirstChildWhichIsA("ClickDetector")
									if detector then
										local d = (root.Position - part.Position).Magnitude
										if d < bestDist then
											bestDist, closest = d, detector
										end
									end
								end
							end
						end
						if closest then
							fireclickdetector(closest)
						end
						hasDoneFirstFB = true
						lastKeyTime    = tick()
					end
					task.wait(0.5)
				end
			end)
		end
	end,
})

AutoTab:CreateSection("Auto Raid")

AutoTab:CreateParagraph({
	Title = "AutoRaid Coming Soon...",
	Content = "Sorry didn't time it's mostly done this will be out tommorrow."
})

local selectedKeywords = {}

local RiftDropdown = AutoTab:CreateDropdown({
	Name            = "Monitor Keywords",
	Options         = {
		"Payload",
		"Waves",
		"Miniboss",
		"Boss Rush"
	},
	CurrentOption   = {},
	MultipleOptions = true,
	Flag            = "RiftKeywords",
	Callback        = function(vals)
		selectedKeywords = vals
	end,
})

local autoRiftFarmEnabled = false
local lastRiftTeleport    = false

AutoTab:CreateToggle({
	Name         = "Auto Rift & Farm",
	CurrentValue = false,
	Flag         = "AutoRiftAndFarm",
	Callback     = function(state)
		autoRiftFarmEnabled = state
		lastRiftTeleport    = false
		if state then
			task.spawn(function()
				while autoRiftFarmEnabled do
					local aliveFolder = workspace:FindFirstChild("Alive")
					local modelCount  = 0
					if aliveFolder then
						for _, child in ipairs(aliveFolder:GetChildren()) do
							if child:IsA("Model") then
								modelCount = modelCount + 1
							end
						end
					end
					if modelCount > 1 then
						toggleAutoFarmMobs:Set(true)
						lastRiftTeleport = false
					elseif modelCount == 1 then
						toggleAutoFarmMobs:Set(false)
						if not lastRiftTeleport then
							lastRiftTeleport = true
							local ignoreFolder = workspace:FindFirstChild("IgnoreParts")
							local riftModel    = ignoreFolder and ignoreFolder:FindFirstChild("TheRiftModel")
							if not riftModel then
								Rayfield:Notify({
									Title   = "Error",
									Content = "Could not find TheRiftModel",
									Duration = 4,
									Image   = "x",
								})
							else
								local riftPart = riftModel:FindFirstChild("RiftPart")
								if not (riftPart and riftPart:IsA("BasePart")) then
									Rayfield:Notify({
										Title   = "Error",
										Content = "RiftPart missing or invalid",
										Duration = 4,
										Image   = "x",
									})
								else
									local targetPos = riftPart.Position + Vector3.new(0, 2, 0)
									setFlightTarget(targetPos, 500, false, 0)
									Rayfield:Notify({
										Title   = "⏩ Teleporting",
										Content = "Heading to Rift Portal",
										Duration = 3,
										Image   = "navigation",
									})
									task.spawn(function()
										local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        or player.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")
										repeat
											task.wait(0.3)
										until not riftPart.Parent
                        or (hrp.Position - riftPart.Position).Magnitude <= 10
										local prompt = riftPart:FindFirstChild("Activation")
										if prompt and prompt:IsA("ProximityPrompt") then
											prompt:InputHoldBegin()
											task.wait(2.8)
											prompt:InputHoldEnd()
										end
									end)
								end
							end
						end
					else
						toggleAutoFarmMobs:Set(false)
						lastRiftTeleport = false
					end
					task.wait(1)
				end
				toggleAutoFarmMobs:Set(false)
			end)
		else
			toggleAutoFarmMobs:Set(false)
		end
	end,
})

-- ################# --
-- // VISUALS TAB // --
-- ################# --

ESPTab:CreateSection("Visual")

-- // FULLBRIGHT // --
local fullbrightEnabled = false
local originalSettings = {}

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
		Lighting.Brightness = 2
		Lighting.ClockTime = 12
		Lighting.GlobalShadows = false
		Lighting.Ambient = Color3.new(1, 1, 1)
	end
end)

ESPTab:CreateToggle({
	Name = "Fullbright",
	CurrentValue = false,
	Flag = "FullbrightToggle",
	Callback = function(Value)
		setFullbright(Value)
	end
})

-- // NO FOG // --
local noWeatherConnection = nil
local noWeatherEnabled = false

local originalFogEnd = Lighting.FogEnd
local originalFogStart = Lighting.FogStart
local originalFogColor = Lighting.FogColor
local defaultSky = Lighting:FindFirstChildOfClass("Sky")
local defaultAtmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
local defaultBloom = Lighting:FindFirstChildOfClass("BloomEffect")
local defaultSunRays = Lighting:FindFirstChildOfClass("SunRaysEffect")

local function removeWeatherInstances()
	for _, obj in ipairs(Lighting:GetChildren()) do
		if obj:IsA("Atmosphere") or obj:IsA("BloomEffect") or obj:IsA("SunRaysEffect") or obj:IsA("Sky") then
			obj:Destroy()
		end
	end
end

local function enableNoWeather()
	removeWeatherInstances()
	Lighting.FogEnd = 1e10
	Lighting.FogStart = 1e10
	Lighting.FogColor = Color3.new(0, 0, 0)
	noWeatherConnection = RunService.RenderStepped:Connect(removeWeatherInstances)
end

local function restoreWeatherDefaults()
	if noWeatherConnection then
		noWeatherConnection:Disconnect()
		noWeatherConnection = nil
	end
	Lighting.FogEnd = originalFogEnd
	Lighting.FogStart = originalFogStart
	Lighting.FogColor = originalFogColor
	if defaultAtmosphere then
		defaultAtmosphere:Clone().Parent = Lighting
	end
	if defaultSky then
		defaultSky:Clone().Parent = Lighting
	end
	if defaultBloom then
		defaultBloom:Clone().Parent = Lighting
	end
	if defaultSunRays then
		defaultSunRays:Clone().Parent = Lighting
	end
end

ESPTab:CreateToggle({
	Name = "No Fog",
	Flag = "noFog",
	CurrentValue = false,
	Callback = function(state)
		noWeatherEnabled = state
		if state then
			enableNoWeather()
		else
			restoreWeatherDefaults()
		end
	end
})

-- // FREECAM // --

local camDummy = Instance.new("Part")
camDummy.Anchored     = true
camDummy.CanCollide   = false
camDummy.Size         = Vector3.new(1, 1, 1)
camDummy.Transparency = 1
camDummy.Name         = "FreecamSubject"
camDummy.Parent       = workspace

local flying     = false
local flySpeed   = 100
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
	Name         = "Freecam",
	CurrentValue = false,
	Callback     = function(enabled)
		flying = enabled
		if enabled then
			if humanoidRootPart then
				humanoidRootPart.Anchored = true
			end
			camDummy.CFrame      = camera.CFrame
			camera.CameraType    = Enum.CameraType.Custom
			camera.CameraSubject = camDummy
			camConn = RunService.RenderStepped:Connect(function(dt)
				local moveVec = Vector3.new(0, 0, 0)
				local cf      = camera.CFrame
				if flyKeyDown[Enum.KeyCode.W] then
					moveVec = moveVec + cf.LookVector
				end
				if flyKeyDown[Enum.KeyCode.S] then
					moveVec = moveVec - cf.LookVector
				end
				if flyKeyDown[Enum.KeyCode.A] then
					moveVec = moveVec - cf.RightVector
				end
				if flyKeyDown[Enum.KeyCode.D] then
					moveVec = moveVec + cf.RightVector
				end
				if flyKeyDown[Enum.KeyCode.Space] then
					moveVec = moveVec + cf.UpVector
				end
				if flyKeyDown[Enum.KeyCode.LeftShift] then
					moveVec = moveVec - cf.UpVector
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
			char       = Players.LocalPlayer.Character
			if char then
				camera.CameraSubject = char:FindFirstChild("Humanoid")
        or char:FindFirstChildWhichIsA("BasePart")
			end
			if humanoidRootPart then
				humanoidRootPart.Anchored = false
			end
		end
	end
})

-- // SETTINGS & STATE // --
local Settings = {
	PlayerESP        = false,
	EntityESP        = false,    -- mobs
	EnableBox        = false,
	EnableHighlight  = false,
	EnableTracer     = false,
	ShowNames        = false,
	ShowDistance     = false,
	ShowHealth       = false,
	MaxRange = 100,
	TracerOrigin     = "Center",
	Colors = {
		Player = Color3.fromRGB(0, 255, 255),
		Entity = Color3.fromRGB(255, 0, 255),
	}
}

local ESPObjects = {
	Player = {},
	Entity = {},
}

-- // UTILS // --
local function destroyESP(vis)
	for _, obj in pairs(vis) do
		if typeof(obj) == "Instance" then
			obj:Destroy()
		elseif typeof(obj) == "table" or typeof(obj) == "userdata" then
			if typeof(obj.Remove) == "function" then
				obj:Remove()
			end
		end
	end
end

local function removeESP(category)
	for target, vis in pairs(ESPObjects[category]) do
		destroyESP(vis)
		ESPObjects[category][target] = nil
	end
end

-- // CREATE VISUALS // --
local function createESP(target, category)
	if category == "Player" and target == player.Character then
		return
	end

-- clean up existing if any
	if ESPObjects[category][target] then
		destroyESP(ESPObjects[category][target])
	end
	local color   = Settings.Colors[category]
	local visuals = {}

-- BOX
	if Settings.EnableBox then
		local box = Drawing.new("Square")
		box.Color     = color
		box.Thickness = 1
		box.Filled    = false
		box.Visible   = true
		visuals.Box   = box
	end

-- TRACER
	if Settings.EnableTracer then
		local line = Drawing.new("Line")
		line.Color     = color
		line.Thickness = 1
		line.Visible   = true
		visuals.Tracer = line
	end

-- HIGHLIGHT
	if Settings.EnableHighlight and target:IsA("Model") then
		local adornPart = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChildWhichIsA("BasePart")
		if adornPart then
			local hl = Instance.new("Highlight")
			hl.Name              = "NoxHighlight"
			hl.FillColor         = color
			hl.FillTransparency  = 0.5
			hl.OutlineColor      = Color3.new(0, 0, 0)
			hl.OutlineTransparency = 0
			hl.DepthMode         = Enum.HighlightDepthMode.AlwaysOnTop
			hl.Adornee           = target
			hl.Parent            = target
			visuals.Highlight    = hl
		end
	end

-- LABEL
	if Settings.ShowNames or Settings.ShowDistance then
		local txt = Drawing.new("Text")
		txt.Size     = 16
		txt.Center   = true
		txt.Outline  = true
		txt.Font     = 2
		txt.Color    = Color3.new(1, 1, 1)
		txt.Visible  = true
		visuals.Label = txt
	end

-- HEALTH BAR
	if Settings.ShowHealth then
		local hb = Drawing.new("Square")
		hb.Thickness = 0
		hb.Filled    = true
		hb.Visible   = true
		visuals.HealthBar     = hb
		local outline = Drawing.new("Square")
		outline.Thickness = 1
		outline.Filled    = false
		outline.Visible   = true
		outline.Color     = Color3.new(0, 0, 0)
		visuals.HealthOutline = outline
	end
	ESPObjects[category][target] = visuals
end

-- // RENDER UPDATE // --
RunService.RenderStepped:Connect(function()
	local camPos = camera.CFrame.Position

-- helper to hide everything in an ESP entry
	local function hideAll(vis)
		for _, obj in pairs(vis) do
			if typeof(obj.Visible) == "boolean" then
				obj.Visible = false
			end
		end
	end
	for category, targets in pairs(ESPObjects) do
		for target, vis in pairs(targets) do
			repeat
            -- 1) must be a valid object
				if not target or not target.Parent then
					destroyESP(vis)
					ESPObjects[category][target] = nil
					break
				end
				local worldPos
				if target:IsA("Model") then
					worldPos = target:GetPivot().Position
				elseif target:IsA("BasePart") then
					worldPos = target.Position
				else
					destroyESP(vis)
					ESPObjects[category][target] = nil
					break
				end

            -- 3) if it’s out of range, hide & skip
				if (worldPos - camPos).Magnitude > Settings.MaxRange then
					hideAll(vis)
					break
				end

            -- 4) project to screen
				local screenPos, onScreen = camera:WorldToViewportPoint(worldPos)
				local pos2D = Vector2.new(screenPos.X, screenPos.Y)
				if not onScreen then
					hideAll(vis)
					break
				end

            -- ─── IT’S ON–SCREEN ───

            -- BOX
				if vis.Box and target:IsA("Model") then
					local cf, size = target:GetBoundingBox()
					local half = size / 2
					local minW = cf.Position - half
					local maxW = cf.Position + half
					local minS, onMin = camera:WorldToViewportPoint(minW)
					local maxS, onMax = camera:WorldToViewportPoint(maxW)
					if onMin and onMax then
						local topLeft = Vector2.new(
                    math.min(minS.X, maxS.X),
                    math.min(minS.Y, maxS.Y)
                    )
						local size2D = Vector2.new(
                    math.abs(maxS.X - minS.X),
                    math.abs(maxS.Y - minS.Y)
                    )
						vis.Box.Position = topLeft
						vis.Box.Size     = size2D
						vis.Box.Visible  = true
					else
						vis.Box.Visible = false
					end
				end

            -- TRACER
				if vis.Tracer then
					local from
					local origin = Settings.TracerOrigin
					if     origin == "Center" then
						from = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
					elseif origin == "Top" then
						from = Vector2.new(camera.ViewportSize.X / 2, 0)
					elseif origin == "Bottom" then
						from = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
					elseif origin == "Mouse" then
						from = UserInputService:GetMouseLocation() - Vector2.new(0, 36)
					elseif origin == "Player" then
						local pr = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
						if pr then
							local sp, on = camera:WorldToViewportPoint(pr.Position)
							from = on
                        and Vector2.new(sp.X, sp.Y)
                        or Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
						else
							from = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
						end
					else
						from = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
					end
					vis.Tracer.From    = from
					vis.Tracer.To      = pos2D
					vis.Tracer.Visible = true
				end

            -- LABEL
				if vis.Label then
					local txt = ""
					if Settings.ShowNames then
						txt = (category == "Entity" and "[MOB] " or "") .. target.Name
					end
					if Settings.ShowDistance then
						local d = (worldPos - camPos).Magnitude
						txt = txt .. string.format(" [%.0fm]", d)
					end
					vis.Label.Text     = txt
					vis.Label.Position = pos2D - Vector2.new(0, 45)
					vis.Label.Visible  = true
				end

            -- HEALTH BAR
				if vis.HealthBar then
					local hum  = target:FindFirstChild("Humanoid")
					local root = target:FindFirstChild("HumanoidRootPart")
					if hum and root and hum.Health > 0 then
						local topW = root.Position + Vector3.new(0, root.Size.Y, 0)
						local botW = root.Position - Vector3.new(0, root.Size.Y, 0)
						local sTop, _ = camera:WorldToViewportPoint(topW)
						local sBot, _ = camera:WorldToViewportPoint(botW)
						local barH  = math.clamp(sBot.Y - sTop.Y, 25, 100)
						local barW  = 3
						local ratio = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
						local fill  = math.max(barH * ratio, 1)
						local barWP, _ = camera:WorldToViewportPoint(
                    topW + Vector3.new(-root.Size.X / 2 - 1, 0, 0)
                    )
						vis.HealthOutline.Position = Vector2.new(barWP.X, sTop.Y)
						vis.HealthOutline.Size     = Vector2.new(barW, barH)
						vis.HealthOutline.Visible  = true
						vis.HealthBar.Position = Vector2.new(barWP.X, sTop.Y + (barH - fill))
						vis.HealthBar.Size     = Vector2.new(barW, fill)
						vis.HealthBar.Color    = (ratio > 0.6 and Color3.new(0, 1, 0))
                    or (ratio > 0.3 and Color3.new(1, 1, 0))
                    or Color3.new(1, 0, 0)
						vis.HealthBar.Visible  = true
					else
						destroyESP(vis)
						ESPObjects[category][target] = nil
					end
				end
			until true
		end
	end
end)

-- // SPAWN & DESPAWN HANDLING // --
local function loadESP()
-- players
	if Settings.PlayerESP then
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= player and plr.Character then
				createESP(plr.Character, "Player")
			end
			plr.CharacterAdded:Connect(function(c)
				c:WaitForChild("HumanoidRootPart", 5)
				if Settings.PlayerESP then
					createESP(c, "Player")
				end
			end)
		end
	end
	if Settings.EntityESP then
		for _, h in ipairs(Workspace:GetDescendants()) do
			if h:IsA("Humanoid") and h.Parent and h.Parent:IsA("Model") then
				local mdl = h.Parent
				if not Players:GetPlayerFromCharacter(mdl) then
					createESP(mdl, "Entity")
				end
			end
		end
		Workspace.DescendantAdded:Connect(function(obj)
			if Settings.EntityESP and obj:IsA("Humanoid") and obj.Parent and obj.Parent:IsA("Model") then
				local mdl = obj.Parent
				if not Players:GetPlayerFromCharacter(mdl) then
					createESP(mdl, "Entity")
				end
			end
		end)
	end
end

local function refreshAll()
	removeESP("Player")
	removeESP("Entity")
	loadESP()
end

-- // GUI HOOKUP (Rayfield) // --
ESPTab:CreateSection("ESP")

ESPTab:CreateToggle({
	Name         = "Player ESP",
	CurrentValue = Settings.PlayerESP,
	Flag         = "PlayerESP",
	Callback     = function(v)
		Settings.PlayerESP = v
		refreshAll()
	end
})

ESPTab:CreateToggle({
	Name         = "Entity ESP",
	CurrentValue = Settings.EntityESP,
	Flag         = "EntityESP",
	Callback     = function(v)
		Settings.EntityESP = v
		refreshAll()
	end
})

ESPTab:CreateDivider()

ESPTab:CreateToggle({
	Name         = "Show Box",
	CurrentValue = Settings.EnableBox,
	Flag         = "ESPBox",
	Callback     = function(v)
		Settings.EnableBox = v
		refreshAll()
	end
})

ESPTab:CreateToggle({
	Name         = "Show Highlight",
	CurrentValue = Settings.EnableHighlight,
	Flag         = "ESPHighlight",
	Callback     = function(v)
		Settings.EnableHighlight = v
		refreshAll()
	end
})

ESPTab:CreateToggle({
	Name         = "Show Tracers",
	CurrentValue = Settings.EnableTracer,
	Flag         = "ESPTracer",
	Callback     = function(v)
		Settings.EnableTracer = v
		refreshAll()
	end
})

ESPTab:CreateDropdown({
	Name          = "Tracer Origin",
	Options       = {
		"Center",
		"Top",
		"Bottom",
		"Mouse",
		"Player"
	},
	CurrentOption = {
		Settings.TracerOrigin
	},
	Flag          = "TracerOrigin",
	Callback      = function(opt)
		Settings.TracerOrigin = opt[1]
		refreshAll()
	end
})

ESPTab:CreateSlider({
	Name         = "Max ESP Range",
	Range        = {
		50,
		5000
	},
	Increment    = 10,
	Suffix       = "studs",
	CurrentValue = Settings.MaxRange,
	Flag         = "ESPMaxRange",
	Callback     = function(v)
		Settings.MaxRange = v
	end,
})

ESPTab:CreateDivider()

ESPTab:CreateToggle({
	Name         = "Show Names",
	CurrentValue = Settings.ShowNames,
	Flag         = "ESPNames",
	Callback     = function(v)
		Settings.ShowNames = v
		refreshAll()
	end
})

ESPTab:CreateToggle({
	Name         = "Show Distance",
	CurrentValue = Settings.ShowDistance,
	Flag         = "ESPDistance",
	Callback     = function(v)
		Settings.ShowDistance = v
		refreshAll()
	end
})

ESPTab:CreateToggle({
	Name         = "Show Health",
	CurrentValue = Settings.ShowHealth,
	Flag         = "ESPHealth",
	Callback     = function(v)
		Settings.ShowHealth = v
		refreshAll()
	end
})

ESPTab:CreateDivider()

ESPTab:CreateColorPicker({
	Name    = "Player Color",
	Color   = Settings.Colors.Player,
	Callback = function(c)
		Settings.Colors.Player = c
		removeESP("Player")
		if Settings.PlayerESP then
			loadESP()
		end
	end
})

ESPTab:CreateColorPicker({
	Name    = "Entity Color",
	Color   = Settings.Colors.Entity,
	Callback = function(c)
		Settings.Colors.Entity = c
		removeESP("Entity")
		if Settings.EntityESP then
			loadESP()
		end
	end
})

-- ############## --
-- // MISC TAB // --
-- ############## --

-- // SERVER HOP // --
local PlaceId = game.PlaceId
local JobId = game.JobId

MiscTab:CreateSection("Server Panel")
MiscTab:CreateButton({
	Name = "Rejoin Server",
	Callback = function()
		TeleportService:TeleportToPlaceInstance(PlaceId, JobId, player)
	end
})
MiscTab:CreateButton({
	Name = "Join Random Server",
	Callback = function()
		local success, response = pcall(function()
			return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
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
			Title = "Server Join Failed",
			Content = "Couldn't find a different server.",
			Duration = 5,
			Image = "x"
		})
	end
})

-- // AMBIENT // --
MiscTab:CreateSection("Theme")
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

-- THEME DROPDOWN --
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

Rayfield:LoadConfiguration()

Rayfield:Notify({
	Title = "NoxHub Loaded",
	Content = "Enjoy using our script!",
	Duration = 4,
	Image = "check"
})