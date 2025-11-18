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
	Name = "Blade Ball | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Blade Ball...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "NoxHub",
		FileName = "BladeBall"
	}
})

-- // Tabs // --
local MainTab = Window:CreateTab("Main", "home")
local PlayerTab = Window:CreateTab("Player", "circle-user")
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

-- // WEBHOOK SENDER // --
local function sendToWebhook(webhookUrl, messageContent)
	local payload = {
		["content"] = messageContent,
		["username"] = "NoxHub Logger",
		["avatar_url"] = "https://media.discordapp.net/attachments/936776180026204241/1351880348728037517/Nox_hub_banner.png?ex=6814acaf&is=68135b2f&hm=6e7ff57031a094a0b58d38fe0857845b66af92f2a904f482efbb78054e9343ac&=&format=webp&quality=lossless&width=2638&height=1484"
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

local alertEnabled = false
local visualizePaths = false
local alertConnection
local pathConnection
local lastPositionMap = {}
local DrawingLines = {}
local maxTimeToHit = 0.2
local alwaysActivateRange = 25
local visualiserColor = Color3.fromRGB(255, 0, 0)
local visualiserLength = 15
local visualiserThickness = 3
local visualiserTransparency = 0.5
local BeamParts = {}

-- // BALL HANDLING // --
local function getBallObjects()
	local Balls = workspace:FindFirstChild("Balls")
	if not Balls then
		return {}
	end
	local valid = {}
	for _, obj in ipairs(Balls:GetChildren()) do
		if obj:IsA("BasePart") or obj:IsA("Model") then
			table.insert(valid, obj)
		end
	end
	return valid
end

local function getObjectPosition(obj)
	return obj:IsA("Model") and obj:GetPivot().Position or obj:IsA("BasePart") and obj.Position or nil
end

-- // THREAT DETECTION // --
local function isThreatening(obj, dt)
	if not humanoidRootPart then
		return false, false
	end
	local currentPos = getObjectPosition(obj)
	if not currentPos then
		return false, false
	end
	local lastPos = lastPositionMap[obj]
	lastPositionMap[obj] = currentPos
	if not lastPos then
		return false, false
	end
	local velocity = (currentPos - lastPos) / dt
	local speed = velocity.Magnitude
	if speed < 1 then
		return false, false
	end
	local toPlayer = humanoidRootPart.Position - currentPos
	local distance = toPlayer.Magnitude
	local dot = toPlayer.Unit:Dot(velocity.Unit)
	local timeToHit = distance / speed

                -- Return both "alwaysParryTrigger" and "normalTrigger"
	local alwaysParryTrigger = (distance <= alwaysActivateRange)
	local normalTrigger = (dot > 0.97 and timeToHit <= maxTimeToHit)
	return alwaysParryTrigger, normalTrigger
end

            -- // F KEY PRESS // --
local function simulateFKeyPress()
	local VirtualInputManager = game:GetService("VirtualInputManager")
	pcall(function()
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
		task.wait(0.01)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
	end)
end
local function startPathVisualizer()
	if pathConnection then
		pathConnection:Disconnect()
	end
	pathConnection = RunService.Heartbeat:Connect(function(dt)
		if not visualizePaths then
			return
		end
		local currentBalls = getBallObjects()
		local activeBallMap = {}
		for _, ball in ipairs(currentBalls) do
			activeBallMap[ball] = true
			local currentPos = getObjectPosition(ball)
			local lastPos = lastPositionMap[ball]
			lastPositionMap[ball] = currentPos
			if currentPos and lastPos then
				local velocity = (currentPos - lastPos) / dt
				if velocity.Magnitude < 1 then
					if BeamParts[ball] then
						BeamParts[ball].Attachment0.Parent.Transparency = 1
						BeamParts[ball].Attachment1.Parent.Transparency = 1
						BeamParts[ball].Beam.Transparency = NumberSequence.new(1)
					end
				else
					if not BeamParts[ball] then
						local a0 = Instance.new("Attachment")
						local a1 = Instance.new("Attachment")
						local part0 = Instance.new("Part")
						local part1 = Instance.new("Part")
						local beam = Instance.new("Beam")
						part0.Size = Vector3.new(0.2, 0.2, 0.2)
						part0.Anchored = true
						part0.CanCollide = false
						part0.Transparency = 1
						part0.Name = "BeamStart"
						part0.Parent = workspace
						part1.Size = Vector3.new(0.2, 0.2, 0.2)
						part1.Anchored = true
						part1.CanCollide = false
						part1.Transparency = 1
						part1.Name = "BeamEnd"
						part1.Parent = workspace
						a0.Parent = part0
						a1.Parent = part1
						beam.Attachment0 = a0
						beam.Attachment1 = a1
						beam.FaceCamera = true
						beam.Width0 = visualiserThickness
						beam.Width1 = visualiserThickness
						beam.Color = ColorSequence.new(visualiserColor)
						beam.Transparency = NumberSequence.new(visualiserTransparency)
						beam.Parent = part0
						BeamParts[ball] = {
							Attachment0 = a0,
							Attachment1 = a1,
							Beam = beam,
							Part0 = part0,
							Part1 = part1
						}
					end
					local dir = velocity.Unit * visualiserLength
					local beamData = BeamParts[ball]
					beamData.Part0.Position = currentPos
					beamData.Part1.Position = currentPos + dir
					beamData.Beam.Width0 = visualiserThickness
					beamData.Beam.Width1 = visualiserThickness
					beamData.Beam.Color = ColorSequence.new(visualiserColor)
					beamData.Beam.Transparency = NumberSequence.new(visualiserTransparency)
				end
			end
		end

            -- Remove beams for balls that no longer exist
		for ball, data in pairs(BeamParts) do
			if not activeBallMap[ball] then
				pcall(function()
					if data.Beam then
						data.Beam:Destroy()
					end
					if data.Part0 then
						data.Part0:Destroy()
					end
					if data.Part1 then
						data.Part1:Destroy()
					end
				end)
				BeamParts[ball] = nil
			end
		end
	end)
end

            -- // MAIN MONITOR LOOP // --
local function startMultiBallMonitor()
	if alertConnection then
		alertConnection:Disconnect()
	end
	alertConnection = RunService.Heartbeat:Connect(function(dt)
		if not alertEnabled then
			return
		end
		for _, ball in ipairs(getBallObjects()) do
			local ok, isThreat = pcall(function()
				return isThreatening(ball, dt)
			end)
			if ok and isThreat then
				simulateFKeyPress()
			end
		end
	end)
end

        -- // PATH VISUALIZER LOOP // --
local function clearVisualisers()
	for _, data in pairs(BeamParts) do
		pcall(function()
			if data.Beam then
				data.Beam:Destroy()
			end
			if data.Part0 then
				data.Part0:Destroy()
			end
			if data.Part1 then
				data.Part1:Destroy()
			end
		end)
	end
	BeamParts = {}
end
MainTab:CreateSection("Blade Ball")
MainTab:CreateParagraph({
	Title = "Blade Ball information:",
	Content = "You can use either AutoParry or PathVisualizer, not both. These settings may not be perfect straight away, you will need to configure them for your setup."
})
MainTab:CreateToggle({
	Name = "AutoParry",
	Flag = "AllBallThreatF",
	CurrentValue = false,
	Callback = function(state)
		alertEnabled = state
		lastPositionMap = {}
		if state then
			startMultiBallMonitor()
		elseif alertConnection then
			alertConnection:Disconnect()
			alertConnection = nil
		end
	end
})
MainTab:CreateSlider({
	Name = "Parry Delay",
	Range = {
		0.05,
		0.5
	},
	Increment = 0.001,
	Suffix = "s",
	CurrentValue = maxTimeToHit,
	Flag = "ImpactTimeSlider",
	Callback = function(value)
		maxTimeToHit = value
	end
})
MainTab:CreateSlider({
	Name = "Always Parry Range",
	Range = {
		5,
		50
	},
	Increment = 0.1,
	Suffix = " studs",
	CurrentValue = alwaysActivateRange,
	Flag = "AlwaysRangeSlider",
	Callback = function(value)
		alwaysActivateRange = value
	end
})

MainTab:CreateDivider()

MainTab:CreateToggle({
	Name = "Show Ball Paths",
	Flag = "BallPathViz",
	CurrentValue = false,
	Callback = function(state)
		visualizePaths = state
		lastPositionMap = {}
		if state then
			startPathVisualizer()
		else
			if pathConnection then
				pathConnection:Disconnect()
				pathConnection = nil
			end
			clearVisualisers()
		end
	end
})

MainTab:CreateSlider({
	Name = "Path Length",
	Range = {
		5,
		50
	},
	Increment = 1,
	CurrentValue = visualiserLength,
	Flag = "PathLengthSlider",
	Callback = function(value)
		visualiserLength = value
	end
})

MainTab:CreateSlider({
	Name = "Path Thickness",
	Range = {
		1,
		10
	},
	Increment = 1,
	CurrentValue = visualiserThickness,
	Flag = "PathThicknessSlider",
	Callback = function(value)
		visualiserThickness = value
	end
})

MainTab:CreateSlider({
	Name = "Path Transparency",
	Range = {
		0,
		1
	},
	Increment = 0.05,
	CurrentValue = visualiserTransparency,
	Flag = "PathTransparencySlider",
	Callback = function(value)
		visualiserTransparency = value
	end
})

MainTab:CreateColorPicker({
	Name = "Path Color",
	Color = visualiserColor,
	Flag = "PathColorPicker",
	Callback = function(newColor)
		visualiserColor = newColor
	end
})

MainTab:CreateDivider()

local showBallSpeed = false
local ballSpeedGui = nil
local ballSpeedConnection = nil

local function createBallSpeedGui()
	if ballSpeedGui then
		return
	end
	ballSpeedGui = Instance.new("ScreenGui")
	ballSpeedGui.Name = "BallSpeedDisplay"
	ballSpeedGui.ResetOnSpawn = false
	ballSpeedGui.IgnoreGuiInset = true
	ballSpeedGui.Parent = game:GetService("CoreGui")
	local label = Instance.new("TextLabel")
	label.Name = "SpeedLabel"
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0.5, -100, 0.1, 0)
	label.Size = UDim2.new(0, 200, 0, 40)
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextStrokeTransparency = 0
	label.Font = Enum.Font.GothamBold
	label.TextSize = 24
	label.Text = "Speed: N/A"
	label.Parent = ballSpeedGui
end

local function destroyBallSpeedGui()
	if ballSpeedGui then
		ballSpeedGui:Destroy()
		ballSpeedGui = nil
	end
end

local function startBallSpeedTracker()
	if ballSpeedConnection then
		ballSpeedConnection:Disconnect()
	end
	createBallSpeedGui()
	local smoothedSpeed = 0
	local smoothingFactor = 0.15
	ballSpeedConnection = RunService.Heartbeat:Connect(function(dt)
		if not showBallSpeed or not ballSpeedGui then
			return
		end
		local label = ballSpeedGui:FindFirstChild("SpeedLabel")
		local fastest = 0
		for _, ball in ipairs(getBallObjects()) do
			local posNow = getObjectPosition(ball)

            -- Skip if no valid position
			if not posNow then
				continue
			end
			local posLast = lastPositionMap[ball]
			lastPositionMap[ball] = posNow
			if posLast then
				local velocity = (posNow - posLast) / dt
				local speed = velocity.Magnitude
				if speed > fastest then
					fastest = speed
				end
			end
		end

            -- Smooth only if a real reading occurred
		if fastest > 0 then
			smoothedSpeed = smoothedSpeed + (fastest - smoothedSpeed) * smoothingFactor
		end
		if label then
			label.Text = string.format("Ball Speed: %.1f studs/s", smoothedSpeed)
		end
	end)
end
local function stopBallSpeedTracker()
	if ballSpeedConnection then
		ballSpeedConnection:Disconnect()
		ballSpeedConnection = nil
	end
	destroyBallSpeedGui()
end

MainTab:CreateToggle({
	Name = "Show Ball Speed",
	Flag = "BallSpeedToggle",
	CurrentValue = false,
	Callback = function(state)
		showBallSpeed = state
		if state then
			startBallSpeedTracker()
		else
			stopBallSpeedTracker()
		end
	end
})

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