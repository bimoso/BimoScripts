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

-- =========== --
-- // SETUP // --
-- =========== --

-- // SERVICES // --
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Mouse = LocalPlayer:GetMouse()
local VIM = game:GetService("VirtualInputManager")
local mouse = LocalPlayer:GetMouse()

-- // UI Setup // --
local Window = Rayfield:CreateWindow({
	Name = "Beaks | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Beaks...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "NoxHub",
		FileName = "Beaks"
	}
})

-- // GUI TABS // --
local MainTab = Window:CreateTab("Main", "home")
local PlayerTab = Window:CreateTab("Player", "circle-user")
local CombatTab = Window:CreateTab("Combat", "angry")
local ESPTab = Window:CreateTab("Visuals", "glasses")
local MiscTab = Window:CreateTab("Misc", "menu")

-- ============== --
-- // MAIN TAB // --
-- ============== --

-- // AUTO FARM // --
local autoFarmEnabled = false
local hoverWhileFarming = true
local shootDelay = 1
local switchDelay = 0.5
local silentAimEnabled = false
local silentAimToggle

MainTab:CreateSection("AutoBird Farm")

MainTab:CreateParagraph({
	Title = "AutoBird Requirement",
	Content = "You must have your gun out for this to work"
})

MainTab:CreateToggle({
	Name = "Enable Auto Farm",
	CurrentValue = false,
	Callback = function(state)
		autoFarmEnabled = state
	end
})

MainTab:CreateSlider({
	Name = "Shoot Delay",
	Range = {
		0.1,
		2
	},
	Increment = 0.1,
	CurrentValue = 0.5,
	Suffix = " sec",
	Callback = function(val)
		shootDelay = val
	end
})

MainTab:CreateSlider({
	Name = "Time Between Birds",
	Range = {
		0.1,
		2
	},
	Increment = 0.1,
	CurrentValue = 0.5,
	Suffix = " sec",
	Callback = function(val)
		switchDelay = val
	end
})

local cameraTurnSpeed = 0.25

MainTab:CreateSlider({
	Name = "Camera Turn Speed",
	Range = {
		0.05,
		1
	},
	Increment = 0.05,
	CurrentValue = 0.15,
	Suffix = " sec",
	Callback = function(val)
		cameraTurnSpeed = val
	end
})

local hoverPlatform = Instance.new("Part")
hoverPlatform.Name = "AutoFarmPlatform"
hoverPlatform.Anchored = true
hoverPlatform.CanCollide = true
hoverPlatform.Transparency = 1
hoverPlatform.Size = Vector3.new(10, 1, 10)
hoverPlatform.Material = Enum.Material.ForceField
hoverPlatform.Parent = workspace

task.spawn(function()
	while true do
		if autoFarmEnabled then
			silentAimEnabled = true
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local gun = getEquippedTool()
			local cam = workspace.CurrentCamera
			if gun and hrp then
				local targetRoot = getClosestClientBirdRoot()
				local serverId = targetRoot and getServerBirdIdMatchingClientRoot(targetRoot)
				if targetRoot and serverId then
					local above = targetRoot.Position + Vector3.new(0, 100, 0)
					hoverPlatform.Position = above - Vector3.new(0, hoverPlatform.Size.Y / 2, 0)
					local fromCF = cam.CFrame
					local toCF = CFrame.new(fromCF.Position, targetRoot.Position)
					if cameraTurnSpeed <= 0 then
						cam.CFrame = toCF
					else
						local tween = TweenService:Create(cam, TweenInfo.new(cameraTurnSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							CFrame = toCF
						})
						tween:Play()
						tween.Completed:Wait()
					end
					local pos = targetRoot.Position
					shootEvent:FireServer("BulletFired", gun, pos, ammoType)
					task.wait(0.05)
					shootEvent:FireServer("BirdHit", gun, pos, serverId, ammoType)
					print("[AutoFarm] Hit bird:", serverId)
					task.wait(shootDelay + switchDelay)
				else
					task.wait(0.1)
				end
			else
				task.wait(1)
			end
		else
			task.wait(0.2)
		end
	end
end)

-- // REMOTE AND AUTO SELL // --
local autoSellEnabled = false
local autoSellInterval = 30

local function autoSellLoop()
	while autoSellEnabled do
		local args = {
			"All"
		}
		game:GetService("ReplicatedStorage")
    :WaitForChild("Util")
    :WaitForChild("Net")
    :WaitForChild("RF/SellInventory")
    :InvokeServer(unpack(args))
		print("[Inventory] Auto-sold all items.")
		task.wait(autoSellInterval)
	end
end

MainTab:CreateSection("Remote Sell")

MainTab:CreateButton({
	Name = "Sell Holding",
	Callback = function()
		local args = {
			"Selected"
		}
		game:GetService("ReplicatedStorage")
:WaitForChild("Util")
:WaitForChild("Net")
:WaitForChild("RF/SellInventory")
:InvokeServer(unpack(args))
	end
})

MainTab:CreateButton({
	Name = "Sell All",
	Callback = function()
		local args = {
			"All"
		}
		game:GetService("ReplicatedStorage")
:WaitForChild("Util")
:WaitForChild("Net")
:WaitForChild("RF/SellInventory")
:InvokeServer(unpack(args))
	end
})

MainTab:CreateDivider()

MainTab:CreateToggle({
	Name = "Auto Sell",
	CurrentValue = false,
	Callback = function(Value)
		autoSellEnabled = Value
		if Value then
			task.spawn(autoSellLoop)
		end
	end
})

MainTab:CreateSlider({
	Name = "Sell Interval",
	Range = {
		5,
		120
	},
	Increment = 10,
	Suffix = "s",
	CurrentValue = autoSellInterval,
	Callback = function(Value)
		autoSellInterval = Value
	end
})

MainTab:CreateSection("Utils")

-- // FULLBRIGHT // --
local fullbrightEffects = {}
local fullbrightEnabled = false

MainTab:CreateToggle({
	Name = "Fullbright",
	Flag = "Fullbright",
	CurrentValue = false,
	Callback = function(state)
		fullbrightEnabled = state
		if state then
			local color = Instance.new("ColorCorrectionEffect")
			color.Brightness = 0.2
			color.Contrast = 0.3
			color.Saturation = 0.1
			color.Name = "FullbrightColor"
			color.Parent = Lighting
			table.insert(fullbrightEffects, color)
			local rays = Instance.new("SunRaysEffect")
			rays.Intensity = 0.05
			rays.Spread = 0.1
			rays.Name = "FullbrightRays"
			rays.Parent = Lighting
			table.insert(fullbrightEffects, rays)
		else
			for _, effect in ipairs(fullbrightEffects) do
				if effect and effect.Parent then
					effect:Destroy()
				end
			end
			fullbrightEffects = {}
		end
	end
})

-- // NO WEATHER // --
MainTab:CreateToggle({
	Name = "No Weather",
	CurrentValue = false,
	Callback = function(state)
		if state then
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Rain") then
					obj.Enabled = false
				end
			end
		else
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Rain") then
					obj.Enabled = true
				end
			end
		end
	end
})

-- // NO FOG // --
MainTab:CreateToggle({
	Name = "No Fog",
	CurrentValue = false,
	Callback = function(state)
		if state then
			Lighting.FogStart = 100000
			Lighting.FogEnd = 100000
			local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
			if atmosphere then
				atmosphere.Density = 0
			end
		else
			Lighting.FogStart = 0
			Lighting.FogEnd = 1000
			local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
			if atmosphere then
				atmosphere.Density = 0.3
			end
		end
	end
})

-- // ANTI AFK // --
local antiAfkEnabled = false

MainTab:CreateToggle({
	Name = "Anti-AFK",
	CurrentValue = false,
	Flag = "AntiAfkToggle",
	Callback = function(state)
		antiAfkEnabled = state
		if antiAfkEnabled then
			task.spawn(function()
				while antiAfkEnabled do
					VIM:SendKeyEvent(true, Enum.KeyCode.A, false, game)
					task.wait(0.2)
					VIM:SendKeyEvent(false, Enum.KeyCode.A, false, game)
					task.wait(0.5)
					VIM:SendKeyEvent(true, Enum.KeyCode.D, false, game)
					task.wait(0.2)
					VIM:SendKeyEvent(false, Enum.KeyCode.D, false, game)
					task.wait(300)
				end
			end)
		end
	end
})

-- // NO CLIP // --
local noclipConn = nil
local noclipEnabled = false

MainTab:CreateToggle({
	Name = "No Clip",
	Flag = "noClip",
	CurrentValue = false,
	Callback = function(state)
		noclipEnabled = state
		if noclipEnabled and not noclipConn then
			noclipConn = RunService.Stepped:Connect(function()
				local char = LocalPlayer.Character
				if char then
					for _, part in pairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end
			end)
		elseif not noclipEnabled and noclipConn then
			noclipConn:Disconnect()
			noclipConn = nil
			local char = LocalPlayer.Character
			if char then
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = true
					end
				end
			end
		end
	end
})

-- // RESPAWN // --
MainTab:CreateButton({
	Name = "Respawn",
	Callback = function()
		local char = LocalPlayer.Character
		if char then
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.Health = 0
			else
				char:BreakJoints()
			end
		end
	end
})

-- ================ --
-- // PLAYER TAB // --
-- ================ --

-- // TELEPORTS // --
PlayerTab:CreateSection("Teleports")

local teleportLocations = {
	["Darth"] = CFrame.new(524.107, 158.468, 100.49),
	["Jerry Camper"] = CFrame.new(527.25, 137.836, -113.41),
	["Neil Bird Collector"] = CFrame.new(515.973, 154.073, 45.844),
	["Ronald"] = CFrame.new(114.228, 123.75, -107.278),
	["Rowan"] = CFrame.new(553.948, 158.713, 95.353),
	["Scar Dartsmith [DARTS]"] = CFrame.new(-1337.225, 20.377, -1624.109),
	["Black Bird Collector"] = CFrame.new(-1365.01, 19.999, -1637.774),
	["Gustav"] = CFrame.new(-1082.67, 32.245, -1431.217),
	["Thorn [GUNS]"] = CFrame.new(-1336.156, 20.084, -1637.885),
	["Axel"] = CFrame.new(-99.932, 253.77, 632.148),
	["Flint [GUNS]"] = CFrame.new(103.373, 238.221, 381.466),
	["Needle [DARTS]"] = CFrame.new(72.339, 229.785, 381.752),
	["Wink"] = CFrame.new(100.367, 242.561, 359.679),
	["Col.Amos [GUNS]"] = CFrame.new(-64.418, 123.697, -342.306),
	["Donald"] = CFrame.new(-314.504, 156.901, -474.476),
	["Longshot [DARTS]"] = CFrame.new(-76.348, 124.325, -371.054),
	["Lotus Bird Collector"] = CFrame.new(-54.37, 124.646, -369.612),
}

local locationOptions = {}
for name in pairs(teleportLocations) do
	table.insert(locationOptions, name)
end

local selectedLocationName = nil

PlayerTab:CreateDropdown({
	Name = "Select Location",
	Options = locationOptions,
	CurrentOption = "",
	MultipleOptions = false,
	Callback = function(optionTable)
		selectedLocationName = optionTable[1]
	end
})

PlayerTab:CreateButton({
	Name = "Teleport",
	Callback = function()
		if not selectedLocationName then
			warn("[Teleport] No location selected.")
			return
		end
		local cf = teleportLocations[selectedLocationName]
		if not cf then
			warn("[Teleport] Invalid location:", selectedLocationName)
			return
		end
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = cf
			print("[Teleport] Teleported to:", selectedLocationName)
		end
	end
})

local clickTeleportEnabled = false
local vKeyDown = false

PlayerTab:CreateToggle({
	Name = "Click Teleport (V + Click)",
	CurrentValue = false,
	Callback = function(state)
		clickTeleportEnabled = state
		print("[Click Teleport] Toggled:", state)
	end
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.V then
		vKeyDown = true
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.V then
		vKeyDown = false
	end
end)

mouse.Button1Down:Connect(function()
	if clickTeleportEnabled and vKeyDown then
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp then
			local targetPos = mouse.Hit.Position
			hrp.CFrame = CFrame.new(targetPos + Vector3.new(0, 5, 0))
			print("[Click Teleport] Teleported to:", targetPos)
		end
	end
end)

PlayerTab:CreateSection("Movement")

-- // FAST WALK // --
local walkSpeedEnabled = false
local walkSpeedValue = 16

PlayerTab:CreateToggle({
	Name = "Enable WalkSpeed",
	CurrentValue = false,
	Callback = function(state)
		walkSpeedEnabled = state
		if not state then
			LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end
})

PlayerTab:CreateKeybind({
	Name = "Toggle WalkSpeed",
	CurrentKeybind = "F",
	HoldToInteract = false,
	Callback = function()
		walkSpeedEnabled = not walkSpeedEnabled
		if not walkSpeedEnabled then
			LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end
})

PlayerTab:CreateSlider({
	Name = "WalkSpeed",
	Range = {
		16,
		100
	},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(val)
		walkSpeedValue = val
	end
})

RunService.RenderStepped:Connect(function()
	if walkSpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeedValue
	end
end)

-- // FLIGHT // --
local flying = false
local flySpeed = 2
local flyKeyDown = {}

PlayerTab:CreateToggle({
	Name = "Enable Flight",
	CurrentValue = false,
	Callback = function(state)
		flying = state
	end
})

PlayerTab:CreateKeybind({
	Name = "Toggle Flight",
	CurrentKeybind = "G",
	HoldToInteract = false,
	Callback = function()
		flying = not flying
	end
})

PlayerTab:CreateSlider({
	Name = "Flight Speed",
	Range = {
		1,
		10
	},
	Increment = 1,
	CurrentValue = 2,
	Callback = function(val)
		flySpeed = val
	end
})

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
	if flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = LocalPlayer.Character.HumanoidRootPart
		local moveDir = Vector3.zero
		if flyKeyDown[Enum.KeyCode.W] then
			moveDir += Camera.CFrame.LookVector
		end
		if flyKeyDown[Enum.KeyCode.S] then
			moveDir -= Camera.CFrame.LookVector
		end
		if flyKeyDown[Enum.KeyCode.A] then
			moveDir -= Camera.CFrame.RightVector
		end
		if flyKeyDown[Enum.KeyCode.D] then
			moveDir += Camera.CFrame.RightVector
		end
		if flyKeyDown[Enum.KeyCode.Space] then
			moveDir += Vector3.new(0, 1, 0)
		end
		if flyKeyDown[Enum.KeyCode.LeftShift] then
			moveDir -= Vector3.new(0, 1, 0)
		end
		hrp.Velocity = moveDir.Unit * (moveDir.Magnitude > 0 and flySpeed * 20 or 0)
	end
end)

                    -- // JUMP HEIGHT // --
local jumpEnabled = false
local jumpPower = 50
PlayerTab:CreateToggle({
	Name = "Enable Jump Height",
	CurrentValue = false,
	Callback = function(state)
		jumpEnabled = state
		if not state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.UseJumpPower = false
		end
	end
})
PlayerTab:CreateKeybind({
	Name = "Jump Height Bind",
	CurrentKeybind = "J",
	HoldToInteract = false,
	Callback = function()
		jumpEnabled = not jumpEnabled
	end
})
PlayerTab:CreateSlider({
	Name = "Jump Height",
	Range = {
		50,
		300
	},
	Increment = 10,
	CurrentValue = 50,
	Callback = function(val)
		jumpPower = val
	end
})
RunService.RenderStepped:Connect(function()
	if jumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		local humanoid = LocalPlayer.Character.Humanoid
		humanoid.UseJumpPower = true
		humanoid.JumpPower = jumpPower
	end
end)

    -- // INFINITE JUMP // --
local infiniteJumpEnabled = false
PlayerTab:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Callback = function(state)
		infiniteJumpEnabled = state
	end
})

UserInputService.JumpRequest:Connect(function()
	if infiniteJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- ================ --
-- // COMBAT TAB // --
-- ================ --

-- // AIMBOT // --
local aimbotEnabled = false
local aimbotFOV = 100
local trackingSpeed = 0.1
local useBirdFilter = false
local selectedBirdTypes = {}
local AvailableBirdTypes = {
	"Crow",
	"Woodpecker",
	"Parrot",
	"Goldflinch",
	"Bulbul",
	"Sparrow",
	"Pidgeon",
	"Hummingbird"
}
local dropoffOffset = 1
local horizontalOffset = 2.5
local aimbotMaxRange = 500

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.Transparency = 1
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Visible = false

RunService.RenderStepped:Connect(function()
	local pos = UserInputService:GetMouseLocation()
	fovCircle.Position = Vector2.new(pos.X, pos.Y)
	fovCircle.Radius = aimbotFOV
	fovCircle.Visible = aimbotEnabled
end)

local function getAllBirdRootParts()
	local folders = {
		workspace.Regions.Beakwoods:FindFirstChild("ClientBirds"),
		workspace.Regions.Deadlands:FindFirstChild("ClientBirds"),
		workspace.Regions["Mount Beaks"]:FindFirstChild("ClientBirds"),
		workspace.Regions["Quill Lake"]:FindFirstChild("ClientBirds")
	}
	local parts = {}
	for _, folder in ipairs(folders) do
		if folder then
			for _, bird in ipairs(folder:GetChildren()) do
				if bird:IsA("Model") then
					local birdName = bird:GetAttribute("BirdName")
					if useBirdFilter and birdName and not table.find(selectedBirdTypes, birdName) then
						continue
					end
					local torso = bird:FindFirstChild("Torso")
					local rootPart = torso and torso:FindFirstChild("RootPart")
					if rootPart then
						table.insert(parts, rootPart)
					end
				end
			end
		end
	end
	return parts
end

local function getClosestBirdRoot()
	local mousePos = UserInputService:GetMouseLocation()
	local closest, shortestDist = nil, aimbotFOV
	for _, root in ipairs(getAllBirdRootParts()) do
		local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)
		if onScreen then
			local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
			local worldDist = (Camera.CFrame.Position - root.Position).Magnitude
			if worldDist > aimbotMaxRange then
				continue
			end
			if dist < shortestDist then
				closest = root
				shortestDist = dist
			end
		end
	end
	return closest
end

RunService.RenderStepped:Connect(function(dt)
	if not aimbotEnabled then
		return
	end
	local target = getClosestBirdRoot()
	if target then
		local camCF = Camera.CFrame
		local adjustedPos = target.Position
		adjustedPos += Vector3.new(horizontalOffset, dropoffOffset, 0)
		local lookAt = CFrame.new(camCF.Position, adjustedPos)
		if trackingSpeed <= 0 then
			Camera.CFrame = lookAt
		elseif trackingSpeed >= 1 then
			Camera.CFrame = camCF:Lerp(lookAt, 1)
		else
			Camera.CFrame = camCF:Lerp(lookAt, trackingSpeed)
		end
	end
end)

-- // TP BIRDS // --
CombatTab:CreateSection("OP")
local teleportBirdsEnabled = false

local function teleportBirds()
	local character = game.Players.LocalPlayer.Character
	if not character or not character:FindFirstChild("HumanoidRootPart") then
		return
	end
	local hrp = character.HumanoidRootPart
	local targetPos = hrp.Position + hrp.CFrame.RightVector * 6 + Vector3.new(0, 5, 0)
	local regions = workspace:FindFirstChild("Regions")
	if not regions then
		return
	end
	for _, map in ipairs(regions:GetChildren()) do
		local clientBirds = map:FindFirstChild("ClientBirds")
		if clientBirds then
			for _, bird in ipairs(clientBirds:GetChildren()) do
				if bird:IsA("Model") then
					for _, part in ipairs(bird:GetDescendants()) do
						if part:IsA("BasePart") then
							part.Anchored = true
							part.CanCollide = false
						end
					end
					local root = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
					if root then
						bird:PivotTo(CFrame.new(targetPos))
					end
				end
			end
		end
	end
end

silentAimToggle = CombatTab:CreateToggle({
	Name = "Enable Silent Aim",
	CurrentValue = false,
	Callback = function(state)
		silentAimEnabled = state
	end
})

CombatTab:CreateToggle({
	Name = "TP All Birds to You",
	CurrentValue = false,
	Callback = function(Value)
		teleportBirdsEnabled = Value
		if Value then
			task.spawn(function()
				while teleportBirdsEnabled do
					teleportBirds()
					task.wait(1)
				end
			end)
		end
	end
})

-- // AIMBOT AND SILENT AIM // --
CombatTab:CreateSection("Aimbot")

local aimbotToggle

aimbotToggle = CombatTab:CreateToggle({
	Name = "Enable Aimbot",
	CurrentValue = false,
	Callback = function(state)
		aimbotEnabled = state
	end
})

CombatTab:CreateKeybind({
	Name = "Toggle Aimbot",
	CurrentKeybind = "E",
	HoldToInteract = false,
	Callback = function()
		aimbotEnabled = not aimbotEnabled
		if aimbotToggle then
			aimbotToggle:Set(aimbotEnabled)
		end
	end
})

local rs = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer
local cam = workspace.CurrentCamera

local ammoType = "Dart"
local shootEvent = rs:WaitForChild("Util"):WaitForChild("Net"):WaitForChild("RE/GunShootEvent")

local BirdRegions = {
	workspace.Regions.Beakwoods.ClientBirds,
	workspace.Regions.Deadlands.ClientBirds,
	workspace.Regions["Mount Beaks"].ClientBirds,
	workspace.Regions["Quill Lake"].ClientBirds
}

local function getEquippedTool()
	local plrChar = workspace:FindFirstChild(lp.Name)
	if not plrChar then
		return nil
	end
	for _, child in ipairs(plrChar:GetChildren()) do
		if child:IsA("Tool") then
			return child
		end
	end
	return nil
end

local function getClosestClientBirdRoot()
	local closestRoot, closestDist = nil, math.huge
	local mousePos = UserInputService:GetMouseLocation()
	for _, folder in pairs(BirdRegions) do
		for _, bird in ipairs(folder:GetChildren()) do
			local torso = bird:FindFirstChild("Torso")
			local root = torso and torso:FindFirstChild("RootPart")
			if root then
				local screenPos, onScreen = cam:WorldToViewportPoint(root.Position)
				if onScreen then
					local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
					if dist < closestDist then
						closestDist = dist
						closestRoot = root
					end
				end
			end
		end
	end
	return closestRoot
end

local function getServerBirdIdMatchingClientRoot(root)
	local serverFolder = workspace.Regions.Beakwoods:FindFirstChild("ServerBirds")
	if not serverFolder then
		return nil
	end
	local clientBirdModel = root and root.Parent and root.Parent.Parent
	if not clientBirdModel then
		return nil
	end
	local targetId = clientBirdModel:GetAttribute("Id")
	if not targetId then
		return nil
	end
	for _, part in ipairs(serverFolder:GetChildren()) do
		if part:IsA("BasePart") and part.Name == targetId then
			return part.Name
		end
	end
	return nil
end
local function fireSilentBirdHit()
	if not silentAimEnabled then
		return
	end
	local gun = getEquippedTool()
	if not gun then
		return
	end
	local targetRoot = getClosestClientBirdRoot()
	if not targetRoot then
		return
	end
	local serverBirdId = getServerBirdIdMatchingClientRoot(targetRoot)
	if not serverBirdId then
		return
	end
	local position = targetRoot.Position
	shootEvent:FireServer("BulletFired", gun, position, ammoType)
	task.delay(0.05, function()
		shootEvent:FireServer("BirdHit", gun, position, serverBirdId, ammoType)
	end)
end
UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.UserInputType == Enum.UserInputType.MouseButton1 then
		fireSilentBirdHit()
	end
end)

            -- // AIMBOT SETTINGS // --
CombatTab:CreateDivider()
CombatTab:CreateSlider({
	Name = "FOV Radius",
	Range = {
		10,
		250
	},
	Increment = 5,
	CurrentValue = aimbotFOV,
	Callback = function(val)
		aimbotFOV = val
	end
})
CombatTab:CreateSlider({
	Name = "Tracking Speed",
	Range = {
		0,
		0.5
	},
	Increment = 0.01,
	CurrentValue = trackingSpeed,
	Callback = function(val)
		trackingSpeed = val
	end
})
CombatTab:CreateSlider({
	Name = "Aimbot Range",
	Range = {
		100,
		3000
	},
	Increment = 50,
	CurrentValue = aimbotMaxRange,
	Suffix = " studs",
	Callback = function(val)
		aimbotMaxRange = val
	end
})

CombatTab:CreateSection("Aimbot Allowed Birds [NOT READY]")

CombatTab:CreateToggle({
	Name = "Enable Bird Filter",
	CurrentValue = false,
	Callback = function(state)
		useBirdFilter = state
	end
})

CombatTab:CreateDropdown({
	Name = "Allowed Birds",
	Options = AvailableBirdTypes,
	CurrentOption = {},
	MultipleOptions = true,
	Callback = function(opt)
		selectedBirdTypes = opt
	end
})

-- ============= --
-- // ESP TAB // --
-- ============= --

-- // ESP // --
local Settings = {
	BeakwoodESP     = false,
	DeadlandsESP    = false,
	MountBeaksESP   = false,
	QuillLakeESP    = false,
	EnableBox       = false,
	EnableTracer    = false,
	ShowNames       = true,
	ShowDistance    = false,
	Colors = {
		Beakwood   = Color3.fromRGB(255, 100, 100),
		Deadlands  = Color3.fromRGB(100, 255, 100),
		MountBeaks = Color3.fromRGB(100, 100, 255),
		QuillLake  = Color3.fromRGB(255, 255, 100),
	}
}

local LimitSettings = {
	Enabled = false,
	AllowedTypes = {},
	MaxDistance = 1000
}

local ESPObjects = {
	Beakwood   = {},
	Deadlands  = {},
	MountBeaks = {},
	QuillLake  = {}
}

local function destroyESP(visuals)
	for _, obj in pairs(visuals) do
		pcall(function()
			obj:Destroy()
		end)
		pcall(function()
			obj:Remove()
		end)
	end
end

local function removeESP(category)
	for model, visuals in pairs(ESPObjects[category]) do
		destroyESP(visuals)
		ESPObjects[category][model] = nil
	end
end

local function get2DBoundingBox(model)
	local cf, size = model:GetBoundingBox()
	local corners = {}
	for x = -1, 1, 2 do
		for y = -1, 1, 2 do
			for z = -1, 1, 2 do
				table.insert(corners, cf.Position
            + cf.RightVector * (size.X / 2) * x
            + cf.UpVector    * (size.Y / 2) * y
            + cf.LookVector  * (size.Z / 2) * z)
			end
		end
	end
	local min2d = Vector2.new(math.huge, math.huge)
	local max2d = Vector2.new(-math.huge, -math.huge)
	for _, corner in ipairs(corners) do
		local pos, onscreen = Camera:WorldToViewportPoint(corner)
		if onscreen then
			local v2 = Vector2.new(pos.X, pos.Y)
			min2d = Vector2.new(math.min(min2d.X, v2.X), math.min(min2d.Y, v2.Y))
			max2d = Vector2.new(math.max(max2d.X, v2.X), math.max(max2d.Y, v2.Y))
		end
	end
	if min2d.X < max2d.X and min2d.Y < max2d.Y then
		return min2d, max2d
	end
	return nil
end

local function isAllowedBird(model)
	if not LimitSettings.Enabled then
		return true
	end
	local birdName = model:GetAttribute("BirdName")
	if not birdName then
		return false
	end
	for _, allowed in ipairs(LimitSettings.AllowedTypes) do
		if birdName == allowed then
			return true
		end
	end
	return false
end
local function isInRange(model)
	if not LimitSettings.Enabled then
		return true
	end
	local cf = model:GetBoundingBox()
	local distance = (Camera.CFrame.Position - cf.Position).Magnitude
	return distance <= LimitSettings.MaxDistance
end
local function createESP(model, category)
	if ESPObjects[category][model] then
		destroyESP(ESPObjects[category][model])
	end
	if not isAllowedBird(model) or not isInRange(model) then
		return
	end
	local color   = Settings.Colors[category]
	local visuals = {}
	if Settings.EnableBox then
		local box = Drawing.new("Square")
		box.Color     = color
		box.Thickness = 1
		box.Filled    = false
		visuals.Box   = box
	end
	if Settings.EnableTracer then
		local line       = Drawing.new("Line")
		line.Color       = color
		line.Thickness   = 1
		visuals.Tracer   = line
	end
	if Settings.ShowNames or Settings.ShowDistance then
		local txt     = Drawing.new("Text")
		txt.Size      = 16
		txt.Color     = color
		txt.Center    = true
		txt.Outline   = true
		visuals.Label = txt
	end
	ESPObjects[category][model] = visuals
end
local function loadESP()
	removeESP("Beakwood")
	removeESP("Deadlands")
	removeESP("MountBeaks")
	removeESP("QuillLake")
	local regions = {
		Beakwood   = workspace.Regions.Beakwoods.ClientBirds,
		Deadlands  = workspace.Regions.Deadlands.ClientBirds,
		MountBeaks = workspace.Regions["Mount Beaks"].ClientBirds,
		QuillLake  = workspace.Regions["Quill Lake"].ClientBirds
	}
	for category, folder in pairs(regions) do
		if Settings[category .. "ESP"] and folder then
			for _, model in ipairs(folder:GetChildren()) do
				if model:IsA("Model") then
					createESP(model, category)
				end
			end
			folder.ChildAdded:Connect(function(model)
				task.wait()
				if model:IsA("Model") then
					createESP(model, category)
				end
			end)
		end
	end
end

RunService.RenderStepped:Connect(function()
	for category, targets in pairs(ESPObjects) do
		for model, visuals in pairs(targets) do
			if not model or not model.Parent then
				destroyESP(visuals)
				ESPObjects[category][model] = nil
				continue
			end
			local bboxCFrame, _ = model:GetBoundingBox()
			local screenPos, onScreen = Camera:WorldToViewportPoint(bboxCFrame.Position)
			local pos2d = Vector2.new(screenPos.X, screenPos.Y)
			if visuals.Box then
				local min2d, max2d = get2DBoundingBox(model)
				if min2d and max2d then
					visuals.Box.Position = min2d
					visuals.Box.Size     = max2d - min2d
					visuals.Box.Visible  = onScreen
				else
					visuals.Box.Visible = false
				end
			end
			if visuals.Tracer then
				visuals.Tracer.From    = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
				visuals.Tracer.To      = pos2d
				visuals.Tracer.Visible = onScreen
			end
			if visuals.Label then
				local text = ""
				if Settings.ShowNames then
					text = model:GetAttribute("BirdName") or model.Name
				end
				if Settings.ShowDistance then
					local distance = (Camera.CFrame.Position - bboxCFrame.Position).Magnitude
					text = text .. string.format(" [%.0fm]", distance)
				end
				visuals.Label.Text     = text
				visuals.Label.Position = pos2d - Vector2.new(0, 50)
				visuals.Label.Visible  = onScreen
			end
		end
	end
end)

ESPTab:CreateSection("Bird ESP")
ESPTab:CreateToggle({
	Name = "Beakwood Bird ESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.BeakwoodESP = v
		loadESP()
	end
})
ESPTab:CreateToggle({
	Name = "Deadlands Bird ESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.DeadlandsESP = v
		loadESP()
	end
})
ESPTab:CreateToggle({
	Name = "Mount Beaks Bird ESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.MountBeaksESP = v
		loadESP()
	end
})
ESPTab:CreateToggle({
	Name = "Quill Lake Bird ESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.QuillLakeESP = v
		loadESP()
	end
})

ESPTab:CreateSection("ESP Settings")
ESPTab:CreateToggle({
	Name = "Show Box",
	CurrentValue = false,
	Callback = function(v)
		Settings.EnableBox = v
		loadESP()
	end
})
ESPTab:CreateToggle({
	Name = "Show Tracers",
	CurrentValue = false,
	Callback = function(v)
		Settings.EnableTracer = v
		loadESP()
	end
})
ESPTab:CreateToggle({
	Name = "Show Names",
	CurrentValue = true,
	Callback = function(v)
		Settings.ShowNames = v
		loadESP()
	end
})
ESPTab:CreateToggle({
	Name = "Show Distance",
	CurrentValue = false,
	Callback = function(v)
		Settings.ShowDistance = v
		loadESP()
	end
})

local allowedBirdDropdown

ESPTab:CreateSection("Limit Birds [NOT READY]")

local AvailableBirdTypes =

ESPTab:CreateDropdown({
	Name = "Allowed Bird Types",
	Options = AvailableBirdTypes,
	CurrentOption = {},
	MultipleOptions = true,
	Callback = function(opts)
		LimitSettings.AllowedTypes = opts
		loadESP()
	end
})

ESPTab:CreateToggle({
	Name = "Enable Limits",
	CurrentValue = false,
	Callback = function(v)
		LimitSettings.Enabled = v
		loadESP()
	end
})

ESPTab:CreateSlider({
	Name = "Max Display Distance (m)",
	Range = {
		100,
		3000
	},
	Increment = 50,
	CurrentValue = LimitSettings.MaxDistance,
	Callback = function(val)
		LimitSettings.MaxDistance = val
		loadESP()
	end
})

ESPTab:CreateButton({
	Name = "Refresh Limits",
	Callback = function()
		loadESP()
	end
})

-- ============== --
-- // MISC TAB // --
-- ============== --

-- // AMBIENT // --
MiscTab:CreateSection("Themes")

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