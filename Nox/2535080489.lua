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
	Name = "Heros Online II | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Heros Online II...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "NoxHub",
		FileName = "HerosOnline"
	}
})

-- // Tabs // --
local MainTab = Window:CreateTab("Main", "home")
local PlayerTab = Window:CreateTab("Player", "circle-user")
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
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

-- // References // --
local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local root = character:WaitForChild("HumanoidRootPart")

-- // WEBHOOK SENDER // --
local function sendToWebhook(webhookUrl, messageContent)
	local payload = {
		["content"] = messageContent,
		["username"] = "NoxHub Logger",
		["avatar_url"] = "https://media.disscordapp.net/attachments/936776180026204241/1351880348728037517/Nox_hub_banner.png?ex=6814acaf&is=68135b2f&hm=6e7ff57031a094a0b58d38fe0857845b66af92f2a904f482efbb78054e9343ac&=&format=webp&quality=lossless&width=2638&height=1484"
	}
	local success, response = pcall(function()
		return syn and syn.request({
			Url = webhookUrl,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(payload)
		}) or http_request and http_request({
			Url = webhookUrl,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(payload)
		}) or request and request({
			Url = webhookUrl,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(payload)
		})
	end)
	return success, response
end

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
local Players      = game:GetService("Players")
local Workspace    = game:GetService("Workspace")
local RunService   = game:GetService("RunService")
local player       = Players.LocalPlayer

-- CONFIG
local KILL_RANGE        = 200
local MIN_HEALTH_PCT    = 90   -- only kill NPCs below this health
local LOOP_DELAY        = 0.1

local KILL_AURA_INTERVAL = 0.05
local killing, killThread = false
local killAuraEnabled     = false
local killAuraAcc         = 0

local rootPart

-- helper to grab latest character & root
local function onCharacterAdded(char)
	rootPart = char:WaitForChild("HumanoidRootPart")
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end

-- build a live enemy cache (skips real players)
local function updateEnemyCache()
	local t = {}
	if not rootPart then
		return t
	end
	for _, mdl in ipairs(Workspace:GetChildren()) do
		if mdl:IsA("Model") then
            -- SKIP real players
			if not Players:GetPlayerFromCharacter(mdl) then
				local hum = mdl:FindFirstChildOfClass("Humanoid")
				local hrp = mdl.PrimaryPart or mdl:FindFirstChild("HumanoidRootPart")
				if hum and hrp and hum.Health > 0 then
					local dist = (rootPart.Position - hrp.Position).Magnitude
					if dist <= KILL_RANGE and (hum.Health / hum.MaxHealth) * 100 <= MIN_HEALTH_PCT then
						table.insert(t, {
							Humanoid = hum,
							Model = mdl
						})
					end
				end
			end
		end
	end
	return t
end

-- void out health
local function killThem(data)
-- claim network ownership so the kill sticks
	for _, part in ipairs(data.Model:GetDescendants()) do
		if part:IsA("BasePart") then
			pcall(part.SetNetworkOwner, part, player)
		end
	end
	pcall(function()
		data.Humanoid.Health = 0
	end)
end

-- main kill loop
local function killLoop()
	while killing do
		local enemies = updateEnemyCache()
		for _, data in ipairs(enemies) do
			killThem(data)
		end
		task.wait(LOOP_DELAY)
	end
end

local function startKill()
	if killing then
		return
	end
	killing = true
	killThread = task.spawn(killLoop)
end
local function stopKill()
	killing = false
	killThread = nil
end

-- Kill Aura (pure melee hit spam)
local RS           = game:GetService("ReplicatedStorage")
local CloseCombat  = RS:WaitForChild("Events"):WaitForChild("CloseCombatEvent")
RunService.Heartbeat:Connect(function(dt)
	if not killAuraEnabled then
		return
	end
	killAuraAcc = killAuraAcc + dt
	if killAuraAcc >= KILL_AURA_INTERVAL then
		killAuraAcc = killAuraAcc - KILL_AURA_INTERVAL
		pcall(CloseCombat.FireServer, CloseCombat, "CheckMeleeHit")
	end
end)

-- ===== UI =====
MainTab:CreateSection("InstaKill & Kill Aura")

MainTab:CreateToggle({
	Name = "Enable InstaKill",
	Flag = "EnableInstaKill",
	CurrentValue = false,
	Callback = function(on)
		if on then
			startKill()
		else
			stopKill()
		end
	end,
})
MainTab:CreateSlider({
	Name         = "Kill Range",
	Range        = {
		10,
		500
	},
	Increment    = 5,
	CurrentValue = KILL_RANGE,
	Flag         = "KillRange",
	Callback     = function(v)
		KILL_RANGE = v
	end,
})
MainTab:CreateSlider({
	Name         = "Health Threshold (%)",
	Range        = {
		1,
		100
	},
	Increment    = 1,
	CurrentValue = MIN_HEALTH_PCT,
	Flag         = "KillHealthThreshold",
	Callback     = function(v)
		MIN_HEALTH_PCT = v
	end,
})
MainTab:CreateToggle({
	Name         = "Enable Kill Aura",
	Flag         = "EnableKillAura",
	CurrentValue = false,
	Callback     = function(on)
		killAuraEnabled = on
		killAuraAcc     = 0
	end,
})

MainTab:CreateSlider({
	Name         = "Kill Aura Interval",
	Range        = {
		0.01,
		0.5
	},
	Increment    = 0.01,
	Suffix       = "s",
	CurrentValue = KILL_AURA_INTERVAL,
	Flag         = "KillAuraInterval",
	Callback     = function(v)
		KILL_AURA_INTERVAL = v
	end,
})

-- // TELEPORT TAB // --
local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart", 5)
end

local function keyList(tbl)
	local out = {}
	for k in pairs(tbl) do
		out[#out + 1] = k
	end
	table.sort(out)
	return out
end

local function indexDuplicateNames(models)
	local counter, out = {}, {}
	for _, model in ipairs(models) do
		local baseName = model.Name
		counter[baseName] = (counter[baseName] or 0) + 1
		local indexedName = baseName
		if counter[baseName] > 1 then
			indexedName = ("%s (%d)"):format(baseName, counter[baseName])
		end
		out[indexedName] = model:GetPivot().Position
	end
	return out
end

local function getQuestBoardTargets(folderName)
	local folder = workspace:FindFirstChild(folderName)
	if not folder then
		return {}
	end
	return indexDuplicateNames(folder:GetChildren())
end

local function getPlayerTargets()
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

local function getNPCsByRole(targetRole)
	local matches = {}
	for _, model in ipairs(workspace:GetChildren()) do
		if model:IsA("Model") and not Players:GetPlayerFromCharacter(model) then
			local settings = model:FindFirstChild("Settings")
			local roleVal = settings and settings:FindFirstChild("Role")
			if roleVal and roleVal:IsA("StringValue") then
				local role = roleVal.Value
				if
            (targetRole == "Villain" and role == "Villain") or
            (targetRole == "Hero" and role == "Hero") or
            (targetRole == "Neutral" and role ~= "Hero" and role ~= "Villain")
            then
					table.insert(matches, model)
				end
			end
		end
	end
	return indexDuplicateNames(matches)
end

local TELEPORT_SETS = {
	["Hero Quest Boards"]    = function()
		return getQuestBoardTargets("HeroQuestBoards")
	end,
	["Villain Quest Boards"] = function()
		return getQuestBoardTargets("VillainQuestBoards")
	end,
	["Players"]              = getPlayerTargets,
	["Hero NPCs"]            = function()
		return getNPCsByRole("Hero")
	end,
	["Villain NPCs"]         = function()
		return getNPCsByRole("Villain")
	end,
	["Neutral NPCs"]         = function()
		return getNPCsByRole("Neutral")
	end,
}

local currentSet   = "Villain Quest Boards"
local teleportTbl  = TELEPORT_SETS[currentSet]()
local locNames     = keyList(teleportTbl)
local selectedDest = locNames[1] or "-"
local useVerticalPath = false

MainTab:CreateSection("Teleports")

local locDropdown
MainTab:CreateDropdown({
	Name          = "Location Set",
	Options       = keyList(TELEPORT_SETS),
	CurrentOption = {
		currentSet
	},
	Callback      = function(opt)
		currentSet   = opt[1]
		teleportTbl  = TELEPORT_SETS[currentSet]()
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

MainTab:CreateButton({
	Name = "Teleport",
	Callback = function()
		teleportTbl = TELEPORT_SETS[currentSet]()
		local target = teleportTbl[selectedDest]
		if not target then
			return Rayfield:Notify({
				Title   = "Teleport Failed",
				Content = "Invalid location selected.",
				Duration = 4,
				Image   = "x",
			})
		end
		local hrp = getHRP()
		Rayfield:Notify({
			Title   = "Teleported",
			Content = "Moved to " .. selectedDest,
			Duration = 3,
			Image   = "navigation",
		})
		hrp.CFrame = CFrame.new(target + Vector3.new(0, 3, 0))
	end,
})

MainTab:CreateButton({
	Name = "Refresh Locations",
	Callback = function()
		teleportTbl  = TELEPORT_SETS[currentSet]()
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

local HttpService = game:GetService("HttpService")
local DataFunction = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DataFunction")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart", 5)
end

MainTab:CreateButton({
	Name = "Teleport to Closest Quest Marker [BETA]",
	Callback = function()
		local hrp = getHRP()
		local raw = DataFunction:InvokeServer("GetData")
		local data = HttpService:JSONDecode(raw)
		local quest = data and data.CurrentQuest
		local origin = hrp.Position
		local closest, closestDist = nil, math.huge
		if quest and typeof(quest.PartMarkers) == "table" and #quest.PartMarkers > 0 then
			for _, name in ipairs(quest.PartMarkers) do
				for _, obj in ipairs(workspace:GetDescendants()) do
					if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == name then
						local part = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")) or obj
						if part then
							local dist = (part.Position - origin).Magnitude
							if dist < closestDist then
								closest, closestDist = part, dist
							end
						end
					end
				end
			end
		end
		if not closest and quest and typeof(quest.QuestName) == "string" then
			local questNameLower = quest.QuestName:lower()
			local keyword = nil
			if questNameLower:find("prisoner") then
				keyword = "Prisoner"
			elseif questNameLower:find("civilian") then
				keyword = "Civilian"
			end
			if keyword then
				local folder = workspace:FindFirstChild("Hostages")
				if folder then
					for _, model in ipairs(folder:GetChildren()) do
						if model:IsA("Model") and model.Name:lower():find(keyword:lower()) then
							local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
							if part then
								local dist = (part.Position - origin).Magnitude
								if dist < closestDist then
									closest, closestDist = part, dist
								end
							end
						end
					end
				end
			end
		end
		if not closest and quest and typeof(quest.QuestName) == "string" then
			if quest.QuestName:lower():find("ex%-villatel") then
				local targetName = "Retired Thug" .. player.Name
				local model = workspace:FindFirstChild(targetName)
				if model and model:IsA("Model") then
					local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
					if part then
						closest = part
					end
				end
			end
		end
		if closest then
			hrp.CFrame = CFrame.new(closest.Position + Vector3.new(0, 3, 0))
			Rayfield:Notify({
				Title = "Teleported",
				Content = "To: " .. closest.Name,
				Duration = 3,
				Image = "navigation"
			})
		else
			Rayfield:Notify({
				Title = "Teleport Failed",
				Content = "Nothing found.",
				Duration = 3,
				Image = "x"
			})
		end
	end
})

MainTab:CreateSection("Bosses")

local bossNotifyConn = nil
local notificationsEnabled = false

local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart", 5)
end

local function findClosestActiveBoss()
	local folder = Workspace:FindFirstChild("BossSpawns")
	if not folder then
		return nil
	end
	local hrp = getHRP()
	local origin = hrp.Position
	local bestPart, bestDist = nil, math.huge
	for _, part in ipairs(folder:GetChildren()) do
		if part:IsA("BasePart") and part:GetAttribute("Active") == true then
			local dist = (part.Position - origin).Magnitude
			if dist < bestDist then
				bestDist = dist
				bestPart = part
			end
		end
	end
	return bestPart
end

MainTab:CreateButton({
	Name = "TP to Closest Active Boss",
	Callback = function()
		local part = findClosestActiveBoss()
		if not part then
			return Rayfield:Notify({
				Title = "Teleport Failed",
				Content = "No active bosses found.",
				Duration = 3,
				Image = "x"
			})
		end
		local hrp = getHRP()
		hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 3, 0))
		Rayfield:Notify({
			Title = "Teleported",
			Content = "To boss at: " .. part.Name,
			Duration = 3,
			Image = "navigation"
		})
	end
})

MainTab:CreateToggle({
	Name = "Active Boss Alerts",
	Flag = "NotifyBossState",
	CurrentValue = false,
	Callback = function(state)
		notificationsEnabled = state
		if bossNotifyConn then
			for _, conn in ipairs(bossNotifyConn) do
				conn:Disconnect()
			end
			bossNotifyConn = nil
		end
		if not state then
			return
		end
		bossNotifyConn = {}
		local folder = Workspace:FindFirstChild("BossSpawns")
		if folder then
			for _, part in ipairs(folder:GetChildren()) do
				if part:IsA("BasePart") then
					local conn = part:GetAttributeChangedSignal("Active"):Connect(function()
						local new = part:GetAttribute("Active")
						Rayfield:Notify({
							Title = "Boss Spawn Updated",
							Content = string.format("%s is now %s", part.Name, tostring(new)),
							Duration = 3,
							Image = "bell"
						})
					end)
					table.insert(bossNotifyConn, conn)
				end
			end
		end
	end
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
PlayerTab:CreateSection("Utils")

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
local function applyUltraPerformanceMode()
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
			elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("SurfaceGui") then
				obj:Destroy()
			elseif obj:IsA("Accessory") and not obj:IsDescendantOf(player.Character) then
				obj:Destroy()
			elseif obj:IsA("BasePart") and not obj:IsDescendantOf(player.Character) then
				_G._ChangedParts[obj] = {
					Material = obj.Material,
					CastShadow = obj.CastShadow,
					Transparency = obj.Transparency,
					Anchored = obj.Anchored
				}
				obj.Material = Enum.Material.SmoothPlastic
				obj.CastShadow = false
				obj.Transparency = 0
				obj.Anchored = true
			end
		end)
	end
	pcall(function()
		Lighting.GlobalShadows = false
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.EnvironmentSpecularScale = 0
		Lighting.FogEnd = 1000000
		Lighting.Brightness = 0
	end)
	if Terrain then
		pcall(function()
			Terrain.WaterTransparency = 1
			Terrain.WaterWaveSize = 0
			Terrain.WaterWaveSpeed = 0
			Terrain.WaterReflectance = 0
			Terrain.Decorations = false
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

PlayerTab:CreateToggle({
	Name = "Ultra Performance Mode",
	Flag = "UltraPerformanceMode",
	CurrentValue = false,
	Callback = function(state)
		if state then
			applyUltraPerformanceMode()
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

PlayerTab:CreateToggle({
	Name = "Infinite Zoom",
	Flag = "infZoom",
	CurrentValue = false,
	Callback = function(state)
		if state then
			player.CameraMaxZoomDistance = 1000000
		else
			player.CameraMaxZoomDistance = 128
		end
	end,
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

-- ############# --
-- // ESP TAB // --
-- ############# --

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
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local function getPlayerViewportPos()
	local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		local vpos = Camera:WorldToViewportPoint(hrp.Position)
		return Vector2.new(vpos.X, vpos.Y)
	end
	return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
end
local function getLocalWorldPos()
	local char = LocalPlayer.Character
	if char then
		local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
		if hrp then
			return hrp.Position
		end
	end
	return Camera.CFrame.Position
end
local function findPart(obj)
	if obj:IsA("BasePart") then
		return obj
	end
	if obj:IsA("Model") then
		return obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
	end
	return nil
end

                        -- ESP Categories
local ESP_CATEGORIES = {
	["Players"] = function()
		local list = {}
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
				table.insert(list, plr.Character)
			end
		end
		return list
	end,
	["Villain NPCs"] = function()
		local list = {}
		for _, model in ipairs(workspace:GetChildren()) do
			if model:IsA("Model") and not Players:GetPlayerFromCharacter(model) then
				local settings = model:FindFirstChild("Settings")
				local role = settings and settings:FindFirstChild("Role")
				if role and role:IsA("StringValue") and role.Value == "Villain" then
					table.insert(list, model)
				end
			end
		end
		return list
	end,
	["Neutral NPCs"] = function()
		local list = {}
		for _, model in ipairs(workspace:GetChildren()) do
			if model:IsA("Model") and not Players:GetPlayerFromCharacter(model) then
				local settings = model:FindFirstChild("Settings")
				local role = settings and settings:FindFirstChild("Role")
				if role and role:IsA("StringValue") then
					local val = role.Value
					if val ~= "Hero" and val ~= "Villain" then
						table.insert(list, model)
					end
				end
			end
		end
		return list
	end,
	["Hero NPCs"] = function()
		local list = {}
		for _, model in ipairs(workspace:GetChildren()) do
			if model:IsA("Model") and not Players:GetPlayerFromCharacter(model) then
				local settings = model:FindFirstChild("Settings")
				local role = settings and settings:FindFirstChild("Role")
				if role and role:IsA("StringValue") and role.Value == "Hero" then
					table.insert(list, model)
				end
			end
		end
		return list
	end,
}
local DEFAULT_COLORS = {
	["Players"] = Color3.fromRGB(0, 255, 0),
	["Villain NPCs"] = Color3.fromRGB(255, 0, 0),
	["Neutral NPCs"] = Color3.fromRGB(255, 255, 0),
	["Hero NPCs"] = Color3.fromRGB(0, 128, 255),
}
local CATEGORY_ORDER = {
	"Players",
	"Villain NPCs",
	"Neutral NPCs",
	"Hero NPCs",
}
local TracerOrigin = "Bottom"
local NameSize = 14
local states = {}
ESPTab:CreateSection("Universal ESP Settings")
ESPTab:CreateDropdown({
	Name = "Tracer Origin",
	Options = {
		"Center",
		"Top",
		"Bottom",
		"Mouse",
		"Player"
	},
	CurrentOption = {
		TracerOrigin
	},
	Flag = "ESP_TracerOrigin",
	Callback = function(opt)
		TracerOrigin = opt[1]
	end
})
ESPTab:CreateSlider({
	Name = "Name Size",
	Range = {
		8,
		48
	},
	Increment = 1,
	Suffix = "px",
	CurrentValue = NameSize,
	Flag = "ESP_NameSize",
	Callback = function(v)
		NameSize = v
		for _, st in pairs(states) do
			for _, gui in pairs(st.nameGuis) do
				local lbl = gui:FindFirstChildOfClass("TextLabel")
				if lbl then
					lbl.TextSize = NameSize
				end
			end
		end
	end
})
local function getOriginPoint()
	local vs = Camera.ViewportSize
	if TracerOrigin == "Center" then
		return vs / 2
	elseif TracerOrigin == "Top" then
		return Vector2.new(vs.X / 2, 0)
	elseif TracerOrigin == "Bottom" then
		return Vector2.new(vs.X / 2, vs.Y)
	elseif TracerOrigin == "Mouse" then
		return UserInputService:GetMouseLocation()
	elseif TracerOrigin == "Player" then
		return getPlayerViewportPos()
	end
	return vs / 2
end
for _, displayName in ipairs(CATEGORY_ORDER) do
	local fetchFunc = ESP_CATEGORIES[displayName]
	local defaultColor = DEFAULT_COLORS[displayName] or Color3.new(1, 1, 1)
	local st = {
		Color = defaultColor,
		Range = 500,
		nameEnabled = false,
		nameGuis = {},
		tracerEnabled = false,
		tracerLines = {},
		tracerConn = nil,
	}
	states[displayName] = st
	ESPTab:CreateSection(displayName .. " ESP")
	ESPTab:CreateColorPicker({
		Name = "Color",
		Color = st.Color,
		Flag = "ESP_" .. displayName:gsub("%W", "") .. "Color",
		Callback = function(c)
			st.Color = c
			for _, gui in pairs(st.nameGuis) do
				local lbl = gui:FindFirstChildOfClass("TextLabel")
				if lbl then
					lbl.TextColor3 = c
				end
			end
			for _, line in pairs(st.tracerLines) do
				line.Color = c
			end
		end
	})
	ESPTab:CreateSlider({
		Name = "Range",
		Range = {
			0,
			5000
		},
		Increment = 50,
		Suffix = "Studs",
		CurrentValue = st.Range,
		Flag = "ESP_" .. displayName:gsub("%W", "") .. "Range",
		Callback = function(v)
			st.Range = v
		end
	})
	ESPTab:CreateToggle({
		Name = "Names",
		CurrentValue = false,
		Flag = "ESP_" .. displayName:gsub("%W", "") .. "Names",
		Callback = function(on)
			st.nameEnabled = on
			if on then
				spawn(function()
					while st.nameEnabled do
						local wpos = getLocalWorldPos()
						for _, obj in ipairs(fetchFunc()) do
							local part = findPart(obj)
							if part and (part.Position - wpos).Magnitude <= st.Range and not st.nameGuis[obj] then
								local gui = Instance.new("BillboardGui", part)
								gui.Name = displayName .. "Label"
								gui.Adornee = part
								gui.AlwaysOnTop = true
								gui.Size = UDim2.new(0, 150, 0, 40)
								gui.StudsOffset = Vector3.new(0, part.Size.Y + 1, 0)
								local lbl = Instance.new("TextLabel", gui)
								lbl.Size = UDim2.new(1, 0, 1, 0)
								lbl.BackgroundTransparency = 1
								lbl.Text = obj.Name
								lbl.TextColor3 = st.Color
								lbl.TextSize = NameSize
								lbl.Font = Enum.Font.SourceSansBold
								lbl.TextScaled = false
								st.nameGuis[obj] = gui
							end
						end
						task.wait(5)
					end
				end)
			else
				for _, gui in pairs(st.nameGuis) do
					gui:Destroy()
				end
				st.nameGuis = {}
			end
		end
	})
	ESPTab:CreateToggle({
		Name = "Tracers",
		CurrentValue = false,
		Flag = "ESP_" .. displayName:gsub("%W", "") .. "Tracers",
		Callback = function(on)
			st.tracerEnabled = on
			if st.tracerConn then
				st.tracerConn:Disconnect()
				st.tracerConn = nil
			end
			if on then
				st.tracerConn = RunService.RenderStepped:Connect(function()
					local origin = getOriginPoint()
					local wpos = getLocalWorldPos()
					for _, obj in ipairs(fetchFunc()) do
						local part = findPart(obj)
						if part and (part.Position - wpos).Magnitude <= st.Range then
							local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
							local line = st.tracerLines[obj]
							if not line then
								line = Drawing.new("Line")
								line.Thickness = 1
								line.Transparency = 1
								st.tracerLines[obj] = line
							end
							line.Color = st.Color
							line.Visible = onScreen
							if onScreen then
								line.From = origin
								line.To = Vector2.new(screenPos.X, screenPos.Y)
							end
						end
					end
					for obj, line in pairs(st.tracerLines) do
						if not table.find(fetchFunc(), obj) then
							pcall(line.Remove, line)
							st.tracerLines[obj] = nil
						end
					end
				end)
			else
				for _, line in pairs(st.tracerLines) do
					pcall(line.Remove, line)
				end
				st.tracerLines = {}
			end
		end
	})
end

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

MiscTab:CreateButton({
	Name = "Join Smallest Server",
	Callback = function()
		local Http      = game:GetService("HttpService")
		local Teleport  = game:GetService("TeleportService")
		local Plr       = game.Players.LocalPlayer
		local placeId   = game.PlaceId
		local thisJob   = game.JobId
		local ok, res = pcall(function()
			return Http:JSONDecode(game:HttpGet(
"https://games.roblox.com/v1/games/" .. placeId ..
"/servers/Public?sortOrder=Asc&limit=100"
))
		end)
		if ok and res and res.data then
			for _, srv in ipairs(res.data) do
				if srv.playing < srv.maxPlayers and srv.id ~= thisJob then
					Teleport:TeleportToPlaceInstance(placeId, srv.id, Plr)
					return
				end
			end
		end
	end,
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