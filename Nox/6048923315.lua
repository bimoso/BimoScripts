task.wait(5)

-- #### UI SETUP AND THEMES #### --
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
	Name = "Kaizen | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Kaizen...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "NoxHub",
		FileName = "Kaizen"
	}
})

-- #### Tabs #### --
local MainTab = Window:CreateTab("Main", "home")
local PlayerTab = Window:CreateTab("Player", "circle-user")
local ESPTab = Window:CreateTab("Visual", "eye")
local MiscTab = Window:CreateTab("Misc", "menu")

-- #### Services #### --
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local VirtualInputManager  = game:GetService("VirtualInputManager")

-- #### References #### --
local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local viewport = camera and camera.ViewportSize or Vector2.new(0, 0)

-- #### WEBHOOK SENDER #### --
local function sendToWebhook(webhookUrl, embedTitle, messageContent)
	local embed = {
		["title"]       = embedTitle,
		["description"] = messageContent,
		["color"]       = 5294577,
		["timestamp"]   = os.date("!%Y-%m-%dT%H:%M:%SZ"),
	}
	local payload = {
		["username"]   = "NoxHub Logger",
		["avatar_url"] = "https://media.discordapp.net/attachments/936776180026204241/1351880348728037517/Nox_hub_banner.png?ex=683d8b2f&is=683c39af&hm=76cce0ce6792f011cfe6124bfb71e099cff554e162776905ba6d19e6fd4ed4b0&=&format=webp&quality=lossless&width=2638&height=1484",
		["embeds"]     = {
			embed
		},
	}
	local jsonBody = HttpService:JSONEncode(payload)
	local success, response = pcall(function()
		return syn and syn.request({
			Url     = webhookUrl,
			Method  = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body    = jsonBody
		}) or http_request and http_request({
			Url     = webhookUrl,
			Method  = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body    = jsonBody
		}) or request and request({
			Url     = webhookUrl,
			Method  = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body    = jsonBody
		})
	end)
	return success, response
end

-- #### TWEENING HELPER FUNCTION #### --
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

-- ################## --
-- #### MAIN TAB #### --
-- ################## --

local Players             = game:GetService("Players")
local TeleportService     = game:GetService("TeleportService")
local HttpService         = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local localPlayer = Players.LocalPlayer
local placeId     = game.PlaceId
local jobId       = game.JobId

-- precache the Jujutsu Tech spawn CFrame
local jujutsuPart = workspace
.StreamExclusions
.SpawnLocations:FindFirstChild("Jujutsu Tech")
local jujutsuPos = jujutsuPart and jujutsuPart.Position or Vector3.new()

-- helper: build & sort chest list
local function getChestList()
	local list = {}
	for _, mdl in ipairs(workspace.Effects:GetDescendants()) do
		if mdl:IsA("Model") and mdl.Name:lower():find("chest", 1, true) then
			local ok, cf = pcall(function()
				return mdl:GetPivot()
			end)
			if ok then
				table.insert(list, {
					model = mdl,
					pos = cf.Position
				})
			end
		end
	end
	table.sort(list, function(a, b)
		local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then
			return false
		end
		return (a.pos - hrp.Position).Magnitude < (b.pos - hrp.Position).Magnitude
	end)
	return list
end

-- simplified sendSequence: “\” → Enter → “\”
local function sendSequence()
	local cam = workspace.CurrentCamera
	if not cam then
		return
	end

    -- click center to focus
	local cx, cy = cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2
	VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, true,  cam, 0)
	VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, false, cam, 0)
	task.wait(4)

    -- the three‐key sequence
	local seq = {
		Enum.KeyCode.BackSlash,
		Enum.KeyCode.Return,
		Enum.KeyCode.BackSlash,
	}
	for _, key in ipairs(seq) do
        -- key down
		VirtualInputManager:SendKeyEvent(true,  key, false, game)
		task.wait(0.03)
		VirtualInputManager:SendKeyEvent(false, key, false, game)
		task.wait(0.3)
	end
end

MainTab:CreateParagraph({
	Title = "BETA Script",
	Content = "This script is still in EARLY BETA. It will be recieving many updates over the next few days / weeks. This is not its final form. Please report any bugs you may find in our discord."
})

-- #### TELEPORTS #### --
local HRP = nil
local function updateHRP(char)
	HRP = char and char:WaitForChild("HumanoidRootPart", 3) or nil
end
player.CharacterAdded:Connect(updateHRP)
if player.Character then
	updateHRP(player.Character)
end

local function keyList(tbl)
	local out = {}
	for k in pairs(tbl) do
		out[#out + 1] = k
	end
	table.sort(out)
	return out
end

local function closestNestedModels(root)
	local buckets = {}
	local origin = (HRP and HRP.Position) or Vector3.new(0, 0, 0)
	for _, desc in ipairs(root:GetDescendants()) do
		if desc:IsA("Model") then
			local success, pivotCFrame = pcall(function()
				return desc:GetPivot()
			end)
			if success then
				local pos = pivotCFrame.Position
				buckets[desc.Name] = buckets[desc.Name] or {}
				table.insert(buckets[desc.Name], pos)
			end
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
		out[("%s (%d×)"):format(name, #list)] = bestP
	end
	return out
end

local function findOverheadText(model)
	for _, desc in ipairs(model:GetDescendants()) do
		if desc.Name == "Overhead" then
			local lbl = desc:FindFirstChildWhichIsA("TextLabel", true)
			if lbl and lbl.Text ~= "" then
				return lbl.Text
			end
		end
	end
	return nil
end

local function getPlayers()
	local out = {}
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = plr.Character.HumanoidRootPart
			local displayName = plr.DisplayName or plr.Name
			out[displayName] = hrp.Position
		end
	end
	return out
end

local function getCollectibles()
	local root = workspace:FindFirstChild("Collectibles")
	if not root then
		return {}
	end
	return closestNestedModels(root)
end

local function getChests()
	local root   = workspace:FindFirstChild("Effects")
	local origin = (HRP and HRP.Position) or Vector3.new(0, 0, 0)
	if not root then
		return {}
	end
	local buckets = {}
	for _, desc in ipairs(root:GetDescendants()) do
		if desc:IsA("Model") and desc.Name:lower():find("chest", 1, true) then
			local success, pivotCFrame = pcall(function()
				return desc:GetPivot()
			end)
			if success then
				local pos = pivotCFrame.Position
				buckets[desc.Name] = buckets[desc.Name] or {}
				table.insert(buckets[desc.Name], pos)
			end
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
		out[("%s (%d×)"):format(name, #list)] = bestP
	end
	return out
end

local function getEnemies()
	local root = workspace:FindFirstChild("Enemies")
	if not root then
		return {}
	end
	local buckets = {}
	local origin  = (HRP and HRP.Position) or Vector3.new(0, 0, 0)
	for _, mdl in ipairs(root:GetChildren()) do
		if mdl:IsA("Model") and mdl.Name ~= "Bosses" then
			local displayName = findOverheadText(mdl)
			if displayName then
				local success, pivotCFrame = pcall(function()
					return mdl:GetPivot()
				end)
				if success then
					local pos = pivotCFrame.Position
					buckets[displayName] = buckets[displayName] or {}
					table.insert(buckets[displayName], pos)
				end
			end
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
		out[("%s (%d×)"):format(name, #list)] = bestP
	end
	return out
end

-- 3.E) BOSSES: all Models under workspace.Enemies.Bosses
local function getBosses()
	local enemiesFolder = workspace:FindFirstChild("Enemies")
	if not enemiesFolder then
		return {}
	end
	local bossesFolder  = enemiesFolder:FindFirstChild("Bosses")
	if not bossesFolder then
		return {}
	end
	local out = {}
	for _, boss in ipairs(bossesFolder:GetChildren()) do
		if boss:IsA("Model") then
			local success, pivotCFrame = pcall(function()
				return boss:GetPivot()
			end)
			if success then
				out[boss.Name] = pivotCFrame.Position
			end
		end
	end
	return out
end
local function getQuestGivers()
	local root = workspace:FindFirstChild("QuestGivers")
	if not root then
		return {}
	end
	local out = {}
	for _, mdl in ipairs(root:GetChildren()) do
		if mdl:IsA("Model") then
			local success, pivotCFrame = pcall(function()
				return mdl:GetPivot()
			end)
			if success then
				out[mdl.Name] = pivotCFrame.Position
			end
		end
	end
	return out
end
local function getSpawns()
	local root = workspace:FindFirstChild("StreamExclusions")
	if not root then
		return {}
	end
	root = root:FindFirstChild("SpawnLocations")
	if not root then
		return {}
	end
	local origin = (HRP and HRP.Position) or Vector3.new(0, 0, 0)
	local out    = {}
	for _, child in ipairs(root:GetChildren()) do
		if child:IsA("BasePart") then
			out[child.Name] = child.Position
		elseif child:IsA("Model") or child:IsA("Folder") then
			local bestPart, bestDist = nil, math.huge
			for _, desc in ipairs(child:GetDescendants()) do
				if desc:IsA("BasePart") then
					local d = (desc.Position - origin).Magnitude
					if d < bestDist then
						bestDist, bestPart = d, desc
					end
				end
			end
			if bestPart then
				out[child.Name] = bestPart.Position
			end
		end
	end
	return out
end

        -- 4) SETS & ORDER (including “Players” at top)
local SETS = {
	["Players"]      = getPlayers,
	["Collectibles"] = getCollectibles,
	["Chests"]       = getChests,
	["Enemies"]      = getEnemies,
	["Bosses"]       = getBosses,
	["Quest Givers"] = getQuestGivers,
	["Spawns"]       = getSpawns,
}
local SET_ORDER = {
	"Players",
	"Collectibles",
	"Chests",
	"Enemies",
	"Bosses",
	"Quest Givers",
	"Spawns",
}
local currentSet   = SET_ORDER[1]
local teleportTbl  = SETS[currentSet]()
local locNames     = keyList(teleportTbl)
local selectedDest = locNames[1] or ""
MainTab:CreateSection("Teleports")
local locDropdown
MainTab:CreateDropdown({
	Name          = "Category",
	Options       = SET_ORDER,
	CurrentOption = {
		currentSet
	},
	Callback      = function(opt)
		currentSet   = opt[1]
		teleportTbl  = SETS[currentSet]()
		locNames     = keyList(teleportTbl)
		selectedDest = locNames[1] or ""
		if locDropdown then
			locDropdown:Refresh(locNames)
			locDropdown:Set({
				selectedDest
			})
		end
	end,
})
locDropdown = MainTab:CreateDropdown({
	Name          = "Destination",
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
		if not HRP or not HRP.Parent then
			return Rayfield:Notify({
				Title   = "Teleport Failed",
				Content = "Character not fully spawned yet.",
				Duration = 3,
				Image    = "x",
			})
		end
		teleportTbl = SETS[currentSet]()
		local target = teleportTbl[selectedDest]
		if not target then
			return Rayfield:Notify({
				Title   = "Teleport Failed",
				Content = "Invalid destination: " .. tostring(selectedDest),
				Duration = 4,
				Image    = "x",
			})
		end
		Rayfield:Notify({
			Title   = "Teleporting...",
			Content = "Going to " .. selectedDest,
			Duration = 3,
			Image    = "navigation",
		})
		HRP.CFrame = CFrame.new(target.X, target.Y + 2, target.Z)
	end,
})

MainTab:CreateButton({
	Name = "Refresh Locations",
	Callback = function()
		teleportTbl  = SETS[currentSet]()
		locNames     = keyList(teleportTbl)
		selectedDest = locNames[1] or ""
		locDropdown:Refresh(locNames)
		locDropdown:Set({
			selectedDest
		})
		Rayfield:Notify({
			Title   = "Locations Updated",
			Content = "Re‐scanned “" .. currentSet .. "”",
			Duration = 2,
			Image    = "refresh-cw",
		})
	end,
})

MainTab:CreateSection("Auto Chest")

MainTab:CreateToggle({
	Name         = "Auto Chest with Server Hop",
	CurrentValue = false,
	Flag         = "autoChestLoop",
	Callback     = function(enabled)
		if not enabled then
			return
		end
		task.spawn(function()
			local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			local hrp  = char:WaitForChild("HumanoidRootPart", 10)
			if not hrp then
				return
			end
			local menuFrame = localPlayer.PlayerGui:WaitForChild("MainMenu", 5)
        :WaitForChild("Frame", 5)
			if menuFrame and menuFrame.Visible then
				sendSequence(true)
				task.wait(1)
			end
			hrp.CFrame = CFrame.new(jujutsuPos + Vector3.new(0, 2, 0))
			task.wait(1)
			for _, entry in ipairs(getChestList()) do
				hrp.CFrame = CFrame.new(entry.pos + Vector3.new(0, 2, 0))
				task.wait(2)
			end
			local success, resp = pcall(function()
				return HttpService:JSONDecode(
        game:HttpGet(
        "https://games.roblox.com/v1/games/" ..
        placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        )
        )
			end)
			if success and resp and resp.data then
				for _, srv in ipairs(resp.data) do
					if srv.playing < srv.maxPlayers and srv.id ~= jobId then
						TeleportService:TeleportToPlaceInstance(placeId, srv.id, localPlayer)
						return
					end
				end
			end
		end)
	end,
})

-- #### AUTO WEAPON #### --
local Players             = game:GetService("Players")
local RunService          = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player              = Players.LocalPlayer

-- Wait until ToolSlots exist
local function waitSlots()
	return player:WaitForChild("PlayerGui", 10)
:WaitForChild("NeoHotbar", 10)
:WaitForChild("Hotbar", 10)
:WaitForChild("Buttons", 10)
:WaitForChild("ToolSlots", 10)
end

-- Return sorted list of non-empty Tool.Value under each HotbarSlot
local function getTools()
	local out = {}
	for _, slot in ipairs(waitSlots():GetChildren()) do
		if slot:IsA("Frame") and slot.Name:match("^HotbarSlot") then
			local t = slot:FindFirstChild("Tool")
			if t and t:IsA("ValueBase") then
				local v = tostring(t.Value)
				if v ~= "" and not table.find(out, v) then
					table.insert(out, v)
				end
			end
		end
	end
	table.sort(out)
	return out
end

-- Find GuiObject to click for a given toolValue
local function findGuiForTool(toolValue)
	for _, slot in ipairs(waitSlots():GetChildren()) do
		if slot:IsA("Frame") then
			local t = slot:FindFirstChild("Tool")
			if t and tostring(t.Value) == toolValue then
				local tb = slot:FindFirstChild("ToolButton")
				if tb then
					local cont = tb:FindFirstChild("Container")
					if cont then
						local bi = cont:FindFirstChild("ButtonImage")
						if bi then
							return bi:FindFirstChild("Image") or bi
						end
					end
				end
			end
		end
	end
	return nil
end

local function toolCountInCharacter()
	local chars = workspace:FindFirstChild("Characters")
	if not chars then
		return 0
	end
	local charFolder = chars:FindFirstChild(player.Name)
	if not charFolder then
		return 0
	end
	local count = 0
	for _, desc in ipairs(charFolder:GetDescendants()) do
		if desc:IsA("Tool") then
			count = count + 1
		end
	end
	return count
end

MainTab:CreateSection("Auto Attack")

local toolsList = getTools()
local dropdown = MainTab:CreateDropdown({
	Name          = "Select Weapon",
	Options       = toolsList,
	CurrentOption = {
		toolsList[1] or ""
	},
	Flag          = "WeaponDropdown",
	Callback      = function(opt)
		selectedTool = opt[1]
	end,
})
local selectedTool = toolsList[1]

MainTab:CreateButton({
	Name     = "Refresh Weapons",
	Callback = function()
		local newList = getTools()
		dropdown:Refresh(newList)
		dropdown:Set({
			newList[1] or ""
		})
		selectedTool = newList[1]
		Rayfield:Notify({
			Title   = "Weapons Refreshed",
			Content = "Found " .. #newList .. " weapons.",
			Duration = 2,
			Image   = "refresh-cw",
		})
	end,
})

local autoEnabled = false
local autoTask

MainTab:CreateToggle({
	Name         = "Auto Equip",
	CurrentValue = false,
	Flag         = "AutoAttackToggle",
	Callback     = function(state)
		autoEnabled = state
		if autoTask then
			autoTask:Disconnect()
			autoTask = nil
		end
		if autoEnabled then
			local elapsed = 0
			autoTask = RunService.Heartbeat:Connect(function(dt)
				if not autoEnabled then
					return
				end
				elapsed = elapsed + dt
				if elapsed < 0.2 then
					return
				end
				elapsed = 0
				if toolCountInCharacter() == 0 and selectedTool then
					local guiObj = findGuiForTool(selectedTool)
					if guiObj then
						local pos  = guiObj.AbsolutePosition
						local size = guiObj.AbsoluteSize
						local cx   = pos.X + size.X / 2
						local cy   = pos.Y + size.Y / 2
						local sh   = workspace.CurrentCamera.ViewportSize.Y
						local ay   = cy + sh * 0.08
						VirtualInputManager:SendMouseButtonEvent(cx, ay, 0, true,  workspace.CurrentCamera, 0)
						task.wait(0.03)
						VirtualInputManager:SendMouseButtonEvent(cx, ay, 0, false, workspace.CurrentCamera, 0)
					end
				end
			end)
		end
	end,
})

local periodicEnabled   = false
local periodicConnection

MainTab:CreateToggle({
	Name         = "Auto Attack",
	CurrentValue = false,
	Flag         = "PeriodicClickToggle",
	Callback     = function(state)
		periodicEnabled = state
		if periodicConnection then
			periodicConnection:Disconnect()
			periodicConnection = nil
		end
		if periodicEnabled then
			local elapsed = 0
			periodicConnection = RunService.Heartbeat:Connect(function(dt)
				if not periodicEnabled then
					return
				end
				elapsed = elapsed + dt
				if elapsed < 0.3 then
					return
				end
				elapsed = 0
				if not selectedTool then
					return
				end
				local guiObj = findGuiForTool(selectedTool)
				if not guiObj then
					return
				end
				local pos  = guiObj.AbsolutePosition
				local size = guiObj.AbsoluteSize
				local cx   = pos.X + size.X / 2
				local cy   = pos.Y + size.Y / 2
				local screenHeight = workspace.CurrentCamera.ViewportSize.Y
				local adjustedY    = cy
				VirtualInputManager:SendMouseButtonEvent(cx, adjustedY, 0, true,  workspace.CurrentCamera, 0)
				task.wait(0.03)
				VirtualInputManager:SendMouseButtonEvent(cx, adjustedY, 0, false, workspace.CurrentCamera, 0)
			end)
		end
	end,
})

-- #### AUTOFARM (Death-Resistant) #### --
local folderName    = "__AutoFarmTargets"
local targetsFolder = workspace:FindFirstChild(folderName)
if not targetsFolder then
	targetsFolder = Instance.new("Folder")
	targetsFolder.Name   = folderName
	targetsFolder.Parent = workspace
end

-- Ensure character references update on respawn
player.CharacterAdded:Connect(refreshCharacter)
refreshCharacter()

local function refreshAutoFarmTargets()
	for _, child in ipairs(targetsFolder:GetChildren()) do
		child:Destroy()
	end
	local enemiesRoot = workspace:FindFirstChild("Enemies")
	if not enemiesRoot then
		return
	end
	for _, mdl in ipairs(enemiesRoot:GetChildren()) do
		if mdl:IsA("Model") and mdl.Name ~= "Bosses" then
			local dn = findOverheadText(mdl)
			if dn and dn ~= "" and not targetsFolder:FindFirstChild(dn) then
				local ov = Instance.new("ObjectValue")
				ov.Name  = dn
				ov.Value = mdl
				ov.Parent = targetsFolder
			end
		end
	end
	local bossesFolder = enemiesRoot:FindFirstChild("Bosses")
	if bossesFolder then
		for _, bmdl in ipairs(bossesFolder:GetChildren()) do
			if bmdl:IsA("Model") then
				local dn = findOverheadText(bmdl) or bmdl.Name
				if dn and dn ~= "" and not targetsFolder:FindFirstChild(dn) then
					local ov = Instance.new("ObjectValue")
					ov.Name  = dn
					ov.Value = bmdl
					ov.Parent = targetsFolder
				end
			end
		end
	end
end

refreshAutoFarmTargets()

local function getAutoFarmNames()
	local names = {}
	for _, ov in ipairs(targetsFolder:GetChildren()) do
		names[#names + 1] = ov.Name
	end
	table.sort(names)
	return names
end

local function findFirstPart(model)
	if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then
		return model.PrimaryPart
	end
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("BasePart") then
			return desc
		end
	end
	return nil
end

local selectedAuto      = {}
local hoverOffset      = offsetY or 8
local autoHoverEnabled  = false
local hoverConnection
local highlightedModel  = nil
local selectionBox      = nil

MainTab:CreateSection("AutoFarm")

local autoNames = getAutoFarmNames()
local autoDropdown = MainTab:CreateDropdown({
	Name            = "Select Targets",
	Options         = autoNames,
	CurrentOption   = {},
	MultipleOptions = true,
	Flag            = "AutoFarmTargetsDropdown",
	Callback        = function(options)
		selectedAuto = options or {}
	end,
})

MainTab:CreateButton({
	Name     = "Refresh Targets",
	Callback = function()
		refreshAutoFarmTargets()
		local newNames = getAutoFarmNames()
		autoDropdown:Refresh(newNames)
		autoDropdown:Set({})
		selectedAuto = {}
		Rayfield:Notify({
			Title   = "AutoFarm Targets Refreshed",
			Content = "Found " .. tostring(#newNames) .. " target(s).",
			Duration = 2,
			Image   = "refresh-cw",
		})
	end,
})

MainTab:CreateSlider({
	Name         = "Hover Offset",
	Range        = {
		-20,
		20
	},
	Increment    = 1,
	Suffix       = " studs",
	CurrentValue = hoverOffset,
	Flag         = "AutoFarmHoverOffset",
	Callback     = function(val)
		hoverOffset = val
	end,
})

MainTab:CreateToggle({
	Name         = "Enable AutoFarm",
	CurrentValue = false,
	Flag         = "AutoFarmHoverToggle",
	Callback     = function(state)
		autoHoverEnabled = state
		if hoverConnection then
			hoverConnection:Disconnect()
			hoverConnection = nil
		end
		if selectionBox then
			selectionBox:Destroy()
			selectionBox = nil
			highlightedModel = nil
		end
		if autoHoverEnabled then
			hoverConnection = RunService.Heartbeat:Connect(function()
				if not humanoid or not humanoidRootPart then
					refreshCharacter()
					if not humanoid or not humanoidRootPart then
						return
					end
				end
				local validModels = {}
				for _, name in ipairs(selectedAuto) do
					local ov = targetsFolder:FindFirstChild(name)
					if ov and ov.Value and ov.Value:IsDescendantOf(workspace) then
						table.insert(validModels, ov.Value)
					end
				end
				if #validModels == 0 then
					stopCurrentMovement()
					if humanoidRootPart then
						local upPos = humanoidRootPart.Position + Vector3.new(0, hoverOffset + 5, 0)
						humanoidRootPart.CFrame = CFrame.new(upPos)
					end
					if selectionBox then
						selectionBox:Destroy()
						selectionBox = nil
						highlightedModel = nil
					end
					return
				end
				local origin = humanoidRootPart.Position
				local closestModel, bestDist
				for _, mdl in ipairs(validModels) do
					local ok, pivotCFrame = pcall(function()
						return mdl:GetPivot()
					end)
					if ok then
						local pos = pivotCFrame.Position
						local d = (pos - origin).Magnitude
						if not bestDist or d < bestDist then
							bestDist = d
							closestModel = mdl
						end
					end
				end
				if not closestModel then
					return
				end
				if highlightedModel ~= closestModel then
					if selectionBox then
						selectionBox:Destroy()
						selectionBox = nil
					end
					highlightedModel = closestModel
					local partToAdorn = findFirstPart(closestModel)
					if partToAdorn then
						selectionBox = Instance.new("SelectionBox")
						selectionBox.Adornee            = partToAdorn
						selectionBox.LineThickness       = 0.05
						selectionBox.SurfaceColor3       = Color3.new(1, 0, 0)
						selectionBox.SurfaceTransparency = 0.5
						selectionBox.Parent             = workspace
					end
				end
				local ok, pivotCFrame = pcall(function()
					return closestModel:GetPivot()
				end)
				if not ok then
					return
				end
				local pivotPos  = pivotCFrame.Position
				local targetPos = Vector3.new(pivotPos.X, pivotPos.Y - hoverOffset, pivotPos.Z)
				local lookCFrame = CFrame.new(targetPos, pivotPos)
				humanoidRootPart.CFrame = lookCFrame
				setFlightTarget(targetPos, speed, true, hoverOffset)
			end)
		else
			stopCurrentMovement()
			if selectionBox then
				selectionBox:Destroy()
				selectionBox = nil
				highlightedModel = nil
			end
		end
	end,
})

    -- #################### --
    -- #### PLAYER TAB #### --
    -- #################### --
PlayerTab:CreateSection("Visual")

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
		Lighting.Brightness = 2
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
PlayerTab:CreateSection("Misc Utils")

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

-- ################## --
-- #### AUTO TAB #### --
-- ################## --

-- ################# --
-- #### ESP TAB #### --
-- ################# --

-- #### ESP: CATEGORIES MATCHING TELEPORT, ONLY SHOW IF VALID NAME #### --

-- 0) SERVICES & REFERENCES
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace        = game:GetService("Workspace")
local camera           = Workspace.CurrentCamera
local player           = Players.LocalPlayer

-- 1) DEATH‐RESISTANT HRP REFERENCE
local HRP = nil
local function updateHRP(char)
	HRP = char and char:WaitForChild("HumanoidRootPart", 3) or nil
end
player.CharacterAdded:Connect(updateHRP)
if player.Character then
	updateHRP(player.Character)
end

-- 2) HELPER FUNCTIONS

-- 2.A) Find any BasePart for a Model or return the Part itself
local function findPart(obj)
	if not obj then
		return nil
	end
	if obj:IsA("BasePart") then
		return obj
	elseif obj:IsA("Model") then
		if obj.PrimaryPart then
			return obj.PrimaryPart
		else
			for _, desc in ipairs(obj:GetDescendants()) do
				if desc:IsA("BasePart") then
					return desc
				end
			end
		end
	end
	return nil
end

-- 2.B) Convert 3D world position to 2D screen position
local function worldToScreenPos(worldPos)
	local screenPos, onScreen = camera:WorldToViewportPoint(worldPos)
	return Vector2.new(screenPos.X, screenPos.Y), onScreen
end

-- 2.C) Compute 2D bounding‐box corners for a Model or Part
local function getBounding2DCorners(rootModel)
	local rootPart = findPart(rootModel)
	if not rootPart then
		return nil
	end
	local cframe, size
	if rootModel:IsA("Model") then
		if not rootModel.PrimaryPart and not rootPart:IsDescendantOf(Workspace) then
			return nil
		end
		cframe = rootModel:GetModelCFrame()
		size   = rootModel:GetExtentsSize()
	else
		if not rootPart:IsDescendantOf(Workspace) then
			return nil
		end
		cframe = rootPart.CFrame
		size   = rootPart.Size
	end
	local half = size * 0.5
	local corners = {
		Vector3.new( half.X,  half.Y,  half.Z),
		Vector3.new( half.X,  half.Y, -half.Z),
		Vector3.new( half.X, -half.Y,  half.Z),
		Vector3.new( half.X, -half.Y, -half.Z),
		Vector3.new(-half.X,  half.Y,  half.Z),
		Vector3.new(-half.X,  half.Y, -half.Z),
		Vector3.new(-half.X, -half.Y,  half.Z),
		Vector3.new(-half.X, -half.Y, -half.Z),
	}
	local minX, minY = math.huge, math.huge
	local maxX, maxY = -math.huge, -math.huge
	for _, offset in ipairs(corners) do
		local worldCorner = (cframe * CFrame.new(offset)).Position
		local screenPos, _ = camera:WorldToViewportPoint(worldCorner)
		local sx, sy = screenPos.X, screenPos.Y
		if sx < minX then
			minX = sx
		end
		if sx > maxX then
			maxX = sx
		end
		if sy < minY then
			minY = sy
		end
		if sy > maxY then
			maxY = sy
		end
	end
	return Vector2.new(minX, minY), Vector2.new(maxX, maxY)
end

            -- 2.D) Determine starting point for tracers
local TracerOriginMode   = "Center"
local function getGlobalTracerOrigin()
	local vs = camera.ViewportSize
	if TracerOriginMode == "Center" then
		return vs * 0.5
	elseif TracerOriginMode == "Top" then
		return Vector2.new(vs.X * 0.5, 0)
	elseif TracerOriginMode == "Bottom" then
		return Vector2.new(vs.X * 0.5, vs.Y)
	elseif TracerOriginMode == "Mouse" then
		return UserInputService:GetMouseLocation()
	end
	return vs * 0.5
end

        -- 3) FIND DISPLAY NAMES

        -- 3.A) For “Enemies”: search for an Attachment named “Overhead” that has a child called “Name”,
        --     and return its Text or Value. If none, return nil.
local function findEnemyDisplayName(model)
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("Attachment") and desc.Name == "Overhead" then
			local nameObj = desc:FindFirstChild("Name")
			if nameObj then
				if nameObj:IsA("TextLabel") and nameObj.Text ~= "" then
					return nameObj.Text
				elseif nameObj:IsA("TextBox") and nameObj.Text ~= "" then
					return nameObj.Text
				elseif nameObj:IsA("StringValue") and nameObj.Value ~= "" then
					return nameObj.Value
				end
			end
		end
	end
	return nil
end

    -- 4) DEFINE CATEGORIES (match Teleport tab, but return raw objects; skip objects without valid names)
local categories = {
	{
		Name = "Players",
		FetchFunction = function()
			local list = {}
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player and plr.Character then
					local human = plr.Character:FindFirstChildWhichIsA("Humanoid")
					local hrp   = plr.Character:FindFirstChild("HumanoidRootPart")
					if human and hrp and human.Health > 0 then
						list[#list + 1] = plr.Character
					end
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(  0, 170, 255),
		OrderIndex   = 1,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = true
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
	{
		Name = "Collectibles",
		FetchFunction = function()
			local list, root = {}, Workspace:FindFirstChild("Collectibles")
			if not root then
				return list
			end
			for _, mdl in ipairs(root:GetDescendants()) do
				if mdl:IsA("Model") then
            -- Use mdl.Name as displayName (always non‐empty)
					list[#list + 1] = mdl
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(255, 200, 50),
		OrderIndex   = 2,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = false
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
	{
		Name = "Chests",
		FetchFunction = function()
			local list, root = {}, Workspace:FindFirstChild("Effects")
			if not root then
				return list
			end
			for _, mdl in ipairs(root:GetDescendants()) do
				if mdl:IsA("Model") and mdl.Name:lower():find("chest", 1, true) then
					list[#list + 1] = mdl
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(210, 110, 60),
		OrderIndex   = 3,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = false
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
	{
		Name = "Enemies",
		FetchFunction = function()
			local list, root = {}, Workspace:FindFirstChild("Enemies")
			if not root then
				return list
			end
			for _, mdl in ipairs(root:GetChildren()) do
				if mdl:IsA("Model") and mdl.Name ~= "Bosses" then
            -- Only include if findEnemyDisplayName != nil
					local display = findEnemyDisplayName(mdl)
					if display and display ~= "" then
						list[#list + 1] = mdl
					end
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(255, 60, 60),
		OrderIndex   = 4,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = true
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
	{
		Name = "Bosses",
		FetchFunction = function()
			local list = {}
			local root = Workspace:FindFirstChild("Enemies")
			if not root then
				return list
			end
			local bosses = root:FindFirstChild("Bosses")
			if not bosses then
				return list
			end
			for _, mdl in ipairs(bosses:GetChildren()) do
				if mdl:IsA("Model") then
                -- Boss displayName may also come from findEnemyDisplayName
					local display = findEnemyDisplayName(mdl) or mdl.Name
					if display and display ~= "" then
						list[#list + 1] = mdl
					end
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(170,  0, 255),
		OrderIndex   = 5,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = true
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
	{
		Name = "Quest Givers",
		FetchFunction = function()
			local list = {}
			local root = Workspace:FindFirstChild("QuestGivers")
			if not root then
				return list
			end
			for _, mdl in ipairs(root:GetChildren()) do
				if mdl:IsA("Model") then
                -- displayName = mdl.Name (always non‐empty)
					list[#list + 1] = mdl
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(100, 180, 255),
		OrderIndex   = 6,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = false
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
	{
		Name = "Spawns",
		FetchFunction = function()
			local list = {}
			local root = Workspace:FindFirstChild("StreamExclusions")
			if not root then
				return list
			end
			root = root:FindFirstChild("SpawnLocations")
			if not root then
				return list
			end
			for _, obj in ipairs(root:GetChildren()) do
				if obj:IsA("BasePart") then
					list[#list + 1] = obj  -- displayName = obj.Name
				elseif obj:IsA("Model") or obj:IsA("Folder") then
					for _, desc in ipairs(obj:GetDescendants()) do
						if desc:IsA("BasePart") then
							list[#list + 1] = desc  -- displayName = desc.Name
						end
					end
				end
			end
			return list
		end,
		DefaultColor = Color3.fromRGB(255, 255,  0),
		OrderIndex   = 7,
		Supports     = {
			tracer = true,
			name = true,
			box = true,
			health = false
		},
		Defaults     = {
			tracer = false,
			name = false,
			box = false,
			health = false
		},
	},
}
table.sort(categories, function(a, b)
	return a.OrderIndex < b.OrderIndex
end)

    -- 5) INITIALIZE ESP STATE TABLE
local states = {}
    -- states[cname] = {
    --     Color, tracerEnabled, nameEnabled, boxEnabled, healthEnabled, objects = {}
    -- }
for _, catDef in ipairs(categories) do
	local cname = catDef.Name
	states[cname] = {
		Color         = catDef.DefaultColor,
		tracerEnabled = catDef.Defaults.tracer,
		nameEnabled   = catDef.Defaults.name,
		boxEnabled    = catDef.Defaults.box,
		healthEnabled = catDef.Defaults.health,
		objects       = {},  -- [Instance] = { tracerLine, nameText, boxLines, healthBarBg, healthBarFg }
	}
end

    -- 6) BUILD ESP UI
ESPTab:CreateSection("Universal ESP Settings")
ESPTab:CreateDropdown({
	Name          = "Tracer Origin",
	Options       = {
		"Center",
		"Top",
		"Bottom",
		"Mouse"
	},
	CurrentOption = {
		TracerOriginMode
	},
	Flag          = "ESP_TracerOriginMode",
	Callback      = function(opt)
		TracerOriginMode = opt[1]
	end,
})

local TextSize = 14
ESPTab:CreateSlider({
	Name         = "Text Size",
	Range        = {
		8,
		48
	},
	Increment    = 1,
	Suffix       = "px",
	CurrentValue = TextSize,
	Flag         = "ESP_TextSize",
	Callback     = function(v)
		TextSize = v
		for _, catState in pairs(states) do
			for _, data in pairs(catState.objects) do
				if data.nameText then
					data.nameText.Size = TextSize
				end
			end
		end
	end,
})

local HealthBarThickness = 4
ESPTab:CreateSlider({
	Name         = "Health Bar Thickness",
	Range        = {
		3,
		10
	},
	Increment    = 1,
	Suffix       = "px",
	CurrentValue = HealthBarThickness,
	Flag         = "ESP_HealthBarThickness",
	Callback     = function(v)
		HealthBarThickness = v
-- Updated next frame in render loop
	end,
})

-- Create controls for each category
for _, catDef in ipairs(categories) do
	local cname    = catDef.Name
	local catState = states[cname]
	ESPTab:CreateSection(cname)
	ESPTab:CreateColorPicker({
		Name     = "Color",
		Color    = catDef.DefaultColor,
		Flag     = "ESP_" .. cname .. "_Color",
		Callback = function(newColor)
			catState.Color = newColor
		end,
	})
	if catDef.Supports.tracer then
		ESPTab:CreateToggle({
			Name         = "Tracers",
			CurrentValue = catState.tracerEnabled,
			Flag         = "ESP_" .. cname .. "_Tracer",
			Callback     = function(enabled)
				catState.tracerEnabled = enabled
				if not enabled then
					for _, data in pairs(catState.objects) do
						if data.tracerLine then
							pcall(data.tracerLine.Remove, data.tracerLine)
							data.tracerLine = nil
						end
					end
				end
			end,
		})
	end
	if catDef.Supports.name then
		ESPTab:CreateToggle({
			Name         = "Names",
			CurrentValue = catState.nameEnabled,
			Flag         = "ESP_" .. cname .. "_Name",
			Callback     = function(enabled)
				catState.nameEnabled = enabled
				if not enabled then
					for _, data in pairs(catState.objects) do
						if data.nameText then
							pcall(data.nameText.Remove, data.nameText)
							data.nameText = nil
						end
					end
				end
			end,
		})
	end
	if catDef.Supports.box then
		ESPTab:CreateToggle({
			Name         = "Boxes",
			CurrentValue = catState.boxEnabled,
			Flag         = "ESP_" .. cname .. "_Box",
			Callback     = function(enabled)
				catState.boxEnabled = enabled
				if not enabled then
					for _, data in pairs(catState.objects) do
						if data.boxLines then
							for _, ln in ipairs(data.boxLines) do
								pcall(ln.Remove, ln)
							end
							data.boxLines = nil
						end
					end
				end
			end,
		})
	end
	if catDef.Supports.health then
		ESPTab:CreateToggle({
			Name         = "Health Bars",
			CurrentValue = catState.healthEnabled,
			Flag         = "ESP_" .. cname .. "_Health",
			Callback     = function(enabled)
				catState.healthEnabled = enabled
				if not enabled then
					for _, data in pairs(catState.objects) do
						if data.healthBarBg then
							pcall(data.healthBarBg.Remove, data.healthBarBg)
							data.healthBarBg = nil
						end
						if data.healthBarFg then
							pcall(data.healthBarFg.Remove, data.healthBarFg)
							data.healthBarFg = nil
						end
					end
				end
			end,
		})
	end
end

-- 7) RENDER LOOP

RunService.RenderStepped:Connect(function()
	local cameraPos = camera.CFrame.Position
	local localHRP  = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	for _, catDef in ipairs(categories) do
		local cname      = catDef.Name
		local fetchFunc  = catDef.FetchFunction
		local catState   = states[cname]
		local color      = catState.Color
		local tracerOn   = catState.tracerEnabled
		local nameOn     = catState.nameEnabled
		local boxOn      = catState.boxEnabled
		local healthOn   = catState.healthEnabled
		local currentList = fetchFunc()
		local seenThisFrame = {}
		for _, obj in ipairs(currentList) do
        -- 7.A) Determine rootModel
			local rootModel = nil
			if cname == "Players" then
				rootModel = obj -- obj is a Character model
			else
				if obj:IsA("Model") then
					rootModel = obj
				elseif obj:IsA("BasePart") then
					if obj.Parent and obj.Parent:IsA("Model") then
						rootModel = obj.Parent
					else
						rootModel = obj
					end
				end
			end
			if rootModel then
				local rootPart = findPart(rootModel)
				if rootPart and rootPart:IsDescendantOf(Workspace) and (rootPart.Position - cameraPos).Magnitude <= 10000 then
                -- 7.B) Determine displayName (and skip if invalid or is the player)
					local displayName = nil
					if cname == "Players" then
						local plr = Players:GetPlayerFromCharacter(rootModel)
						if plr then
							displayName = plr.DisplayName or plr.Name
						end
					elseif cname == "Enemies" then
						displayName = findEnemyDisplayName(rootModel)
					else
						displayName = rootModel.Name
					end

                -- Only proceed if displayName is non‐nil, non‐empty, not your own name/displayName
					if not displayName or displayName == "" then
                    -- skip entirely
						continue
					end
					local meName    = player.Name
					local meDisplay = player.DisplayName or player.Name
					if displayName == meName or displayName == meDisplay then
                    -- skip yourself
						continue
					end

                -- 7.C) Now create or update data table for this object
					local data = catState.objects[rootModel]
					if not data then
						data = {
							tracerLine  = nil,
							nameText    = nil,
							boxLines    = nil,
							healthBarBg = nil,
							healthBarFg = nil,
						}
						catState.objects[rootModel] = data
					end

                -- Project rootPart to screen
					local screenPos, onScreen = worldToScreenPos(rootPart.Position)

                -- ===== TRACERS =====
					if tracerOn then
						if not data.tracerLine then
							local line = Drawing.new("Line")
							line.Thickness    = 1
							line.Transparency = 1
							line.Color        = color
							line.ZIndex       = 2
							data.tracerLine   = line
						end
						if onScreen then
							data.tracerLine.Visible = true
							local origin = getGlobalTracerOrigin()
							data.tracerLine.From  = origin
							data.tracerLine.To    = screenPos
							data.tracerLine.Color = color
						else
							data.tracerLine.Visible = false
						end
					elseif data.tracerLine then
						pcall(data.tracerLine.Remove, data.tracerLine)
						data.tracerLine = nil
					end

                -- ===== NAMES =====
					if nameOn then
						if not data.nameText then
							local txt = Drawing.new("Text")
							txt.Size         = TextSize
							txt.Center       = true
							txt.Outline      = true
							txt.Color        = color
							txt.Transparency = 1
							txt.Font         = 3 -- SourceSansBold
							txt.ZIndex       = 2
							data.nameText    = txt
						end
						if onScreen then
							data.nameText.Visible = true
							data.nameText.Text     = displayName
							data.nameText.Position = Vector2.new(
                        screenPos.X,
                        screenPos.Y - (TextSize + 4)
                        )
							data.nameText.Color    = color
						else
							data.nameText.Visible = false
						end
					elseif data.nameText then
						pcall(data.nameText.Remove, data.nameText)
						data.nameText = nil
					end

                -- ===== BOXES =====
					if boxOn then
						if not data.boxLines then
							data.boxLines = {}
							for i = 1, 4 do
								local ln = Drawing.new("Line")
								ln.Thickness    = 1
								ln.Transparency = 1
								ln.Color        = color
								ln.ZIndex       = 2
								data.boxLines[i] = ln
							end
						end
						local topLeft, bottomRight = getBounding2DCorners(rootModel)
						if topLeft and bottomRight then
							local minX, minY = topLeft.X, topLeft.Y
							local maxX, maxY = bottomRight.X, bottomRight.Y
							data.boxLines[1].From = Vector2.new(minX, minY)
							data.boxLines[1].To   = Vector2.new(maxX, minY)
							data.boxLines[2].From = Vector2.new(maxX, minY)
							data.boxLines[2].To   = Vector2.new(maxX, maxY)
							data.boxLines[3].From = Vector2.new(maxX, maxY)
							data.boxLines[3].To   = Vector2.new(minX, maxY)
							data.boxLines[4].From = Vector2.new(minX, maxY)
							data.boxLines[4].To   = Vector2.new(minX, minY)
							for i = 1, 4 do
								data.boxLines[i].Visible = true
								data.boxLines[i].Color   = color
							end
						else
							for i = 1, 4 do
								data.boxLines[i].Visible = false
							end
						end
					elseif data.boxLines then
						for _, ln in ipairs(data.boxLines) do
							pcall(ln.Remove, ln)
						end
						data.boxLines = nil
					end

                -- ===== HEALTH BARS =====
					if healthOn then
						local human = nil
						if cname == "Players" then
							human = rootModel:FindFirstChildWhichIsA("Humanoid")
						else
							if rootModel:IsA("Model") then
								human = rootModel:FindFirstChildWhichIsA("Humanoid")
							elseif rootModel:IsA("BasePart") then
								local parentModel = rootModel.Parent
								if parentModel and parentModel:IsA("Model") then
									human = parentModel:FindFirstChildWhichIsA("Humanoid")
								end
							end
						end
						if human and human.Health > 0 then
							local healthPct = math.clamp(human.Health / human.MaxHealth, 0, 1)
							local topLeft, bottomRight = getBounding2DCorners(rootModel)
							if topLeft and bottomRight then
								local minX, minY = topLeft.X, topLeft.Y
								local maxY       = bottomRight.Y
								local boxHeight  = maxY - minY
								local barColor
								if healthPct > 0.5 then
									barColor = Color3.new(0, 1, 0)
								elseif healthPct > 0.2 then
									barColor = Color3.new(1, 1, 0)
								else
									barColor = Color3.new(1, 0, 0)
								end
								if not data.healthBarBg then
									local bg = Drawing.new("Square")
									bg.Thickness    = 1
									bg.Filled       = false
									bg.Color        = Color3.new(0, 0, 0)
									bg.Transparency = 1
									bg.ZIndex       = 2
									data.healthBarBg = bg
								end
								if not data.healthBarFg then
									local fg = Drawing.new("Square")
									fg.Thickness    = 0
									fg.Filled       = true
									fg.Color        = barColor
									fg.Transparency = 1
									fg.ZIndex       = 2
									data.healthBarFg = fg
								end
								local barWidth  = HealthBarThickness
								local barX      = minX - barWidth - 2
								local barY      = minY
								local barHgt    = boxHeight
								data.healthBarBg.Position = Vector2.new(barX, barY)
								data.healthBarBg.Size     = Vector2.new(barWidth, barHgt)
								data.healthBarBg.Visible  = true
								local fillH = barHgt * healthPct
								local fillY = barY + (barHgt - fillH)
								data.healthBarFg.Position = Vector2.new(barX + 1, fillY)
								data.healthBarFg.Size     = Vector2.new(barWidth - 2, fillH)
								data.healthBarFg.Visible  = true
								data.healthBarBg.Color = Color3.new(0, 0, 0)
								data.healthBarFg.Color = barColor
							else
								if data.healthBarBg then
									data.healthBarBg.Visible = false
								end
								if data.healthBarFg then
									data.healthBarFg.Visible = false
								end
							end
						else
							if data.healthBarBg then
								data.healthBarBg.Visible = false
							end
							if data.healthBarFg then
								data.healthBarFg.Visible = false
							end
						end
					elseif data.healthBarBg or data.healthBarFg then
						if data.healthBarBg then
							pcall(data.healthBarBg.Remove, data.healthBarBg)
							data.healthBarBg = nil
						end
						if data.healthBarFg then
							pcall(data.healthBarFg.Remove, data.healthBarFg)
							data.healthBarFg = nil
						end
					end
					seenThisFrame[rootModel] = true
				end
			end
		end
		for existingObj, data in pairs(catState.objects) do
			if not seenThisFrame[existingObj] then
				if data.tracerLine then
					pcall(data.tracerLine.Remove, data.tracerLine)
				end
				if data.nameText then
					pcall(data.nameText.Remove, data.nameText)
				end
				if data.boxLines then
					for _, ln in ipairs(data.boxLines) do
						pcall(ln.Remove, ln)
					end
				end
				if data.healthBarBg then
					pcall(data.healthBarBg.Remove, data.healthBarBg)
				end
				if data.healthBarFg then
					pcall(data.healthBarFg.Remove, data.healthBarFg)
				end
				catState.objects[existingObj] = nil
			end
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

Rayfield:LoadConfiguration()