local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local RayfieldLibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextColor = Color3.fromRGB(240, 240, 240),
			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),
			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
			SliderBackground = Color3.fromRGB(50, 138, 220),
			SliderProgress = Color3.fromRGB(50, 138, 220),
			SliderStroke = Color3.fromRGB(58, 163, 255),
			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
			DropdownSelected = Color3.fromRGB(40, 40, 40),
			DropdownUnselected = Color3.fromRGB(30, 30, 30),
			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Ocean = {
			TextColor = Color3.fromRGB(230, 240, 240),
			Background = Color3.fromRGB(20, 30, 30),
			Topbar = Color3.fromRGB(25, 40, 40),
			Shadow = Color3.fromRGB(15, 20, 20),
			NotificationBackground = Color3.fromRGB(25, 35, 35),
			NotificationActionsBackground = Color3.fromRGB(230, 240, 240),
			TabBackground = Color3.fromRGB(40, 60, 60),
			TabStroke = Color3.fromRGB(50, 70, 70),
			TabBackgroundSelected = Color3.fromRGB(100, 180, 180),
			TabTextColor = Color3.fromRGB(210, 230, 230),
			SelectedTabTextColor = Color3.fromRGB(20, 50, 50),
			ElementBackground = Color3.fromRGB(30, 50, 50),
			ElementBackgroundHover = Color3.fromRGB(40, 60, 60),
			SecondaryElementBackground = Color3.fromRGB(30, 45, 45),
			ElementStroke = Color3.fromRGB(45, 70, 70),
			SecondaryElementStroke = Color3.fromRGB(40, 65, 65),
			SliderBackground = Color3.fromRGB(0, 110, 110),
			SliderProgress = Color3.fromRGB(0, 140, 140),
			SliderStroke = Color3.fromRGB(0, 160, 160),
			ToggleBackground = Color3.fromRGB(30, 50, 50),
			ToggleEnabled = Color3.fromRGB(0, 130, 130),
			ToggleDisabled = Color3.fromRGB(70, 90, 90),
			ToggleEnabledStroke = Color3.fromRGB(0, 160, 160),
			ToggleDisabledStroke = Color3.fromRGB(85, 105, 105),
			ToggleEnabledOuterStroke = Color3.fromRGB(50, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(45, 65, 65),
			DropdownSelected = Color3.fromRGB(30, 60, 60),
			DropdownUnselected = Color3.fromRGB(25, 40, 40),
			InputBackground = Color3.fromRGB(30, 50, 50),
			InputStroke = Color3.fromRGB(50, 70, 70),
			PlaceholderColor = Color3.fromRGB(140, 160, 160)
		},
		AmberGlow = {
			TextColor = Color3.fromRGB(255, 245, 230),
			Background = Color3.fromRGB(45, 30, 20),
			Topbar = Color3.fromRGB(55, 40, 25),
			Shadow = Color3.fromRGB(35, 25, 15),
			NotificationBackground = Color3.fromRGB(50, 35, 25),
			NotificationActionsBackground = Color3.fromRGB(245, 230, 215),
			TabBackground = Color3.fromRGB(75, 50, 35),
			TabStroke = Color3.fromRGB(90, 60, 45),
			TabBackgroundSelected = Color3.fromRGB(230, 180, 100),
			TabTextColor = Color3.fromRGB(250, 220, 200),
			SelectedTabTextColor = Color3.fromRGB(50, 30, 10),
			ElementBackground = Color3.fromRGB(60, 45, 35),
			ElementBackgroundHover = Color3.fromRGB(70, 50, 40),
			SecondaryElementBackground = Color3.fromRGB(55, 40, 30),
			ElementStroke = Color3.fromRGB(85, 60, 45),
			SecondaryElementStroke = Color3.fromRGB(75, 50, 35),
			SliderBackground = Color3.fromRGB(220, 130, 60),
			SliderProgress = Color3.fromRGB(250, 150, 75),
			SliderStroke = Color3.fromRGB(255, 170, 85),
			ToggleBackground = Color3.fromRGB(55, 40, 30),
			ToggleEnabled = Color3.fromRGB(240, 130, 30),
			ToggleDisabled = Color3.fromRGB(90, 70, 60),
			ToggleEnabledStroke = Color3.fromRGB(255, 160, 50),
			ToggleDisabledStroke = Color3.fromRGB(110, 85, 75),
			ToggleEnabledOuterStroke = Color3.fromRGB(200, 100, 50),
			ToggleDisabledOuterStroke = Color3.fromRGB(75, 60, 55),
			DropdownSelected = Color3.fromRGB(70, 50, 40),
			DropdownUnselected = Color3.fromRGB(55, 40, 30),
			InputBackground = Color3.fromRGB(60, 45, 35),
			InputStroke = Color3.fromRGB(90, 65, 50),
			PlaceholderColor = Color3.fromRGB(190, 150, 130)
		},
		Light = {
			TextColor = Color3.fromRGB(40, 40, 40),
			Background = Color3.fromRGB(245, 245, 245),
			Topbar = Color3.fromRGB(230, 230, 230),
			Shadow = Color3.fromRGB(200, 200, 200),
			NotificationBackground = Color3.fromRGB(250, 250, 250),
			NotificationActionsBackground = Color3.fromRGB(240, 240, 240),
			TabBackground = Color3.fromRGB(235, 235, 235),
			TabStroke = Color3.fromRGB(215, 215, 215),
			TabBackgroundSelected = Color3.fromRGB(255, 255, 255),
			TabTextColor = Color3.fromRGB(80, 80, 80),
			SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
			ElementBackground = Color3.fromRGB(240, 240, 240),
			ElementBackgroundHover = Color3.fromRGB(225, 225, 225),
			SecondaryElementBackground = Color3.fromRGB(235, 235, 235),
			ElementStroke = Color3.fromRGB(210, 210, 210),
			SecondaryElementStroke = Color3.fromRGB(210, 210, 210),
			SliderBackground = Color3.fromRGB(150, 180, 220),
			SliderProgress = Color3.fromRGB(100, 150, 200),
			SliderStroke = Color3.fromRGB(120, 170, 220),
			ToggleBackground = Color3.fromRGB(220, 220, 220),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(150, 150, 150),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(170, 170, 170),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(180, 180, 180),
			DropdownSelected = Color3.fromRGB(230, 230, 230),
			DropdownUnselected = Color3.fromRGB(220, 220, 220),
			InputBackground = Color3.fromRGB(240, 240, 240),
			InputStroke = Color3.fromRGB(180, 180, 180),
			PlaceholderColor = Color3.fromRGB(140, 140, 140)
		},
		Amethyst = {
			TextColor = Color3.fromRGB(240, 240, 240),
			Background = Color3.fromRGB(30, 20, 40),
			Topbar = Color3.fromRGB(40, 25, 50),
			Shadow = Color3.fromRGB(20, 15, 30),
			NotificationBackground = Color3.fromRGB(35, 20, 40),
			NotificationActionsBackground = Color3.fromRGB(240, 240, 250),
			TabBackground = Color3.fromRGB(60, 40, 80),
			TabStroke = Color3.fromRGB(70, 45, 90),
			TabBackgroundSelected = Color3.fromRGB(180, 140, 200),
			TabTextColor = Color3.fromRGB(230, 230, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 20, 50),
			ElementBackground = Color3.fromRGB(45, 30, 60),
			ElementBackgroundHover = Color3.fromRGB(50, 35, 70),
			SecondaryElementBackground = Color3.fromRGB(40, 30, 55),
			ElementStroke = Color3.fromRGB(70, 50, 85),
			SecondaryElementStroke = Color3.fromRGB(65, 45, 80),
			SliderBackground = Color3.fromRGB(100, 60, 150),
			SliderProgress = Color3.fromRGB(130, 80, 180),
			SliderStroke = Color3.fromRGB(150, 100, 200),
			ToggleBackground = Color3.fromRGB(45, 30, 55),
			ToggleEnabled = Color3.fromRGB(120, 60, 150),
			ToggleDisabled = Color3.fromRGB(94, 47, 117),
			ToggleEnabledStroke = Color3.fromRGB(140, 80, 170),
			ToggleDisabledStroke = Color3.fromRGB(124, 71, 150),
			ToggleEnabledOuterStroke = Color3.fromRGB(90, 40, 120),
			ToggleDisabledOuterStroke = Color3.fromRGB(80, 50, 110),
			DropdownSelected = Color3.fromRGB(50, 35, 70),
			DropdownUnselected = Color3.fromRGB(35, 25, 50),
			InputBackground = Color3.fromRGB(45, 30, 60),
			InputStroke = Color3.fromRGB(80, 50, 110),
			PlaceholderColor = Color3.fromRGB(178, 150, 200)
		},
		Green = {
			TextColor = Color3.fromRGB(30, 60, 30),
			Background = Color3.fromRGB(235, 245, 235),
			Topbar = Color3.fromRGB(210, 230, 210),
			Shadow = Color3.fromRGB(200, 220, 200),
			NotificationBackground = Color3.fromRGB(240, 250, 240),
			NotificationActionsBackground = Color3.fromRGB(220, 235, 220),
			TabBackground = Color3.fromRGB(215, 235, 215),
			TabStroke = Color3.fromRGB(190, 210, 190),
			TabBackgroundSelected = Color3.fromRGB(245, 255, 245),
			TabTextColor = Color3.fromRGB(50, 80, 50),
			SelectedTabTextColor = Color3.fromRGB(20, 60, 20),
			ElementBackground = Color3.fromRGB(225, 240, 225),
			ElementBackgroundHover = Color3.fromRGB(210, 225, 210),
			SecondaryElementBackground = Color3.fromRGB(235, 245, 235),
			ElementStroke = Color3.fromRGB(180, 200, 180),
			SecondaryElementStroke = Color3.fromRGB(180, 200, 180),
			SliderBackground = Color3.fromRGB(90, 160, 90),
			SliderProgress = Color3.fromRGB(70, 130, 70),
			SliderStroke = Color3.fromRGB(100, 180, 100),
			ToggleBackground = Color3.fromRGB(215, 235, 215),
			ToggleEnabled = Color3.fromRGB(60, 130, 60),
			ToggleDisabled = Color3.fromRGB(150, 175, 150),
			ToggleEnabledStroke = Color3.fromRGB(80, 150, 80),
			ToggleDisabledStroke = Color3.fromRGB(130, 150, 130),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 160, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(160, 180, 160),
			DropdownSelected = Color3.fromRGB(225, 240, 225),
			DropdownUnselected = Color3.fromRGB(210, 225, 210),
			InputBackground = Color3.fromRGB(235, 245, 235),
			InputStroke = Color3.fromRGB(180, 200, 180),
			PlaceholderColor = Color3.fromRGB(120, 140, 120)
		},
		Bloom = {
			TextColor = Color3.fromRGB(60, 40, 50),
			Background = Color3.fromRGB(255, 240, 245),
			Topbar = Color3.fromRGB(250, 220, 225),
			Shadow = Color3.fromRGB(230, 190, 195),
			NotificationBackground = Color3.fromRGB(255, 235, 240),
			NotificationActionsBackground = Color3.fromRGB(245, 215, 225),
			TabBackground = Color3.fromRGB(240, 210, 220),
			TabStroke = Color3.fromRGB(230, 200, 210),
			TabBackgroundSelected = Color3.fromRGB(255, 225, 235),
			TabTextColor = Color3.fromRGB(80, 40, 60),
			SelectedTabTextColor = Color3.fromRGB(50, 30, 50),
			ElementBackground = Color3.fromRGB(255, 235, 240),
			ElementBackgroundHover = Color3.fromRGB(245, 220, 230),
			SecondaryElementBackground = Color3.fromRGB(255, 235, 240),
			ElementStroke = Color3.fromRGB(230, 200, 210),
			SecondaryElementStroke = Color3.fromRGB(230, 200, 210),
			SliderBackground = Color3.fromRGB(240, 130, 160),
			SliderProgress = Color3.fromRGB(250, 160, 180),
			SliderStroke = Color3.fromRGB(255, 180, 200),
			ToggleBackground = Color3.fromRGB(240, 210, 220),
			ToggleEnabled = Color3.fromRGB(255, 140, 170),
			ToggleDisabled = Color3.fromRGB(200, 180, 185),
			ToggleEnabledStroke = Color3.fromRGB(250, 160, 190),
			ToggleDisabledStroke = Color3.fromRGB(210, 180, 190),
			ToggleEnabledOuterStroke = Color3.fromRGB(220, 160, 180),
			ToggleDisabledOuterStroke = Color3.fromRGB(190, 170, 180),
			DropdownSelected = Color3.fromRGB(250, 220, 225),
			DropdownUnselected = Color3.fromRGB(240, 210, 220),
			InputBackground = Color3.fromRGB(255, 235, 240),
			InputStroke = Color3.fromRGB(220, 190, 200),
			PlaceholderColor = Color3.fromRGB(170, 130, 140)
		},
		DarkBlue = {
			TextColor = Color3.fromRGB(230, 230, 230),
			Background = Color3.fromRGB(20, 25, 30),
			Topbar = Color3.fromRGB(30, 35, 40),
			Shadow = Color3.fromRGB(15, 20, 25),
			NotificationBackground = Color3.fromRGB(25, 30, 35),
			NotificationActionsBackground = Color3.fromRGB(45, 50, 55),
			TabBackground = Color3.fromRGB(35, 40, 45),
			TabStroke = Color3.fromRGB(45, 50, 60),
			TabBackgroundSelected = Color3.fromRGB(40, 70, 100),
			TabTextColor = Color3.fromRGB(200, 200, 200),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
			ElementBackground = Color3.fromRGB(30, 35, 40),
			ElementBackgroundHover = Color3.fromRGB(40, 45, 50),
			SecondaryElementBackground = Color3.fromRGB(35, 40, 45),
			ElementStroke = Color3.fromRGB(45, 50, 60),
			SecondaryElementStroke = Color3.fromRGB(40, 45, 55),
			SliderBackground = Color3.fromRGB(0, 90, 180),
			SliderProgress = Color3.fromRGB(0, 120, 210),
			SliderStroke = Color3.fromRGB(0, 150, 240),
			ToggleBackground = Color3.fromRGB(35, 40, 45),
			ToggleEnabled = Color3.fromRGB(0, 120, 210),
			ToggleDisabled = Color3.fromRGB(70, 70, 80),
			ToggleEnabledStroke = Color3.fromRGB(0, 150, 240),
			ToggleDisabledStroke = Color3.fromRGB(75, 75, 85),
			ToggleEnabledOuterStroke = Color3.fromRGB(20, 100, 180),
			ToggleDisabledOuterStroke = Color3.fromRGB(55, 55, 65),
			DropdownSelected = Color3.fromRGB(30, 70, 90),
			DropdownUnselected = Color3.fromRGB(25, 30, 35),
			InputBackground = Color3.fromRGB(25, 30, 35),
			InputStroke = Color3.fromRGB(45, 50, 60),
			PlaceholderColor = Color3.fromRGB(150, 150, 160)
		},
		Serenity = {
			TextColor = Color3.fromRGB(50, 55, 60),
			Background = Color3.fromRGB(240, 245, 250),
			Topbar = Color3.fromRGB(215, 225, 235),
			Shadow = Color3.fromRGB(200, 210, 220),
			NotificationBackground = Color3.fromRGB(210, 220, 230),
			NotificationActionsBackground = Color3.fromRGB(225, 230, 240),
			TabBackground = Color3.fromRGB(200, 210, 220),
			TabStroke = Color3.fromRGB(180, 190, 200),
			TabBackgroundSelected = Color3.fromRGB(175, 185, 200),
			TabTextColor = Color3.fromRGB(50, 55, 60),
			SelectedTabTextColor = Color3.fromRGB(30, 35, 40),
			ElementBackground = Color3.fromRGB(210, 220, 230),
			ElementBackgroundHover = Color3.fromRGB(220, 230, 240),
			SecondaryElementBackground = Color3.fromRGB(200, 210, 220),
			ElementStroke = Color3.fromRGB(190, 200, 210),
			SecondaryElementStroke = Color3.fromRGB(180, 190, 200),
			SliderBackground = Color3.fromRGB(200, 220, 235),
			SliderProgress = Color3.fromRGB(70, 130, 180),
			SliderStroke = Color3.fromRGB(150, 180, 220),
			ToggleBackground = Color3.fromRGB(210, 220, 230),
			ToggleEnabled = Color3.fromRGB(70, 160, 210),
			ToggleDisabled = Color3.fromRGB(180, 180, 180),
			ToggleEnabledStroke = Color3.fromRGB(60, 150, 200),
			ToggleDisabledStroke = Color3.fromRGB(140, 140, 140),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 120, 140),
			ToggleDisabledOuterStroke = Color3.fromRGB(120, 120, 130),
			DropdownSelected = Color3.fromRGB(220, 230, 240),
			DropdownUnselected = Color3.fromRGB(200, 210, 220),
			InputBackground = Color3.fromRGB(220, 230, 240),
			InputStroke = Color3.fromRGB(180, 190, 200),
			PlaceholderColor = Color3.fromRGB(150, 150, 150)
		},
	}
}

local Window = Rayfield:CreateWindow({
	Name = "Dead Rails | NoxHub",
	Icon = 0,
	LoadingTitle = "Loading Dead Rails...",
	LoadingSubtitle = "NoxHub - Premium Scripts",
	Theme = "Amethyst",
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "NoxHub",
		FileName = "DeadRails"
	},

})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Mouse = LocalPlayer:GetMouse()

--------------------
-- // MAIN TAB // --
--------------------

local itemFolder = Workspace:FindFirstChild("RuntimeItems")
local itemDropdownList = {}
local itemLookup = {} -- [displayName] = {instances}
local selectedItemName = nil
local maxCollectAmount = 5

local MainTab = Window:CreateTab("Main", "home")
local CombatTab = Window:CreateTab("Combat", "angry")
local ESPTab = Window:CreateTab("Visuals", "glasses")
local MiscTab = Window:CreateTab("Misc", "menu")

MainTab:CreateSection("Movement")

local moveBoostEnabled = false
local moveBoostSliderValue = 100

local defaultWalkSpeed = 16
local defaultJumpPower = 50

-- Combined Movement Boost Toggle
MainTab:CreateToggle({
	Name = "Small Movement Boost (speed/jump)",
	Flag = "movementBoost",
	CurrentValue = false,
	Callback = function(state)
		moveBoostEnabled = state
		local char = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
		local humanoid = char:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid.UseJumpPower = true
			if moveBoostEnabled then
				local speedBoostPercent = moveBoostSliderValue * 0.1 / 100
				local jumpBoostPercent = moveBoostSliderValue * 0.4 / 100
				humanoid.WalkSpeed = defaultWalkSpeed * (1 + speedBoostPercent)
				humanoid.JumpPower = defaultJumpPower * (1 + jumpBoostPercent)
			else
				humanoid.WalkSpeed = defaultWalkSpeed
				humanoid.JumpPower = defaultJumpPower
			end
		end
	end
})

-- Movement Boost Slider
MainTab:CreateSlider({
	Name = "Boost Strength (%)",
	Flag = "boostStrength",
	Range = {
		0,
		100
	},
	Increment = 1,
	CurrentValue = moveBoostSliderValue, -- ✅ Reflect default 10% in UI
	Suffix = "%",
	Callback = function(value)
		moveBoostSliderValue = value

-- If boost is on, apply updated values immediately
		if moveBoostEnabled then
			local char = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
			local humanoid = char:FindFirstChildWhichIsA("Humanoid")
			if humanoid then
				local speedBoostPercent = moveBoostSliderValue * 0.1 / 100
				local jumpBoostPercent = moveBoostSliderValue * 0.4 / 100
				humanoid.WalkSpeed = defaultWalkSpeed * (1 + speedBoostPercent)
				humanoid.JumpPower = defaultJumpPower * (1 + jumpBoostPercent)
			end
		end
	end
})

MainTab:CreateSection("Toggles")

local transparencyEnabled = false

local function setBuildingTransparency(enabled)
	local folder = workspace:FindFirstChild("RandomBuildings")
	if not folder then
		return
	end
	for _, model in ipairs(folder:GetDescendants()) do
		if model:IsA("BasePart") then
			model.Transparency = enabled and 0.7 or 0
			model.CanCollide = not enabled
		elseif model:IsA("Decal") or model:IsA("Texture") then
			model.Transparency = enabled and 1 or 0
		end
	end
end

MainTab:CreateToggle({
	Name = "Transparent Buildings",
	Flag = "transBuild",
	CurrentValue = false,
	Callback = function(state)
		transparencyEnabled = state
		setBuildingTransparency(transparencyEnabled)
	end
})

--// STATE
local cameraUnlockEnabled = false
local cameraUnlockConn

--// UNLOCK FUNCTION
local function forceCameraUnlock()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	cameraUnlockConn = RunService.RenderStepped:Connect(function()
		if not cameraUnlockEnabled then
			return
		end
		if Camera.CameraType ~= Enum.CameraType.Custom then
			Camera.CameraType = Enum.CameraType.Custom
		end
		if Camera.CameraSubject ~= humanoid then
			Camera.CameraSubject = humanoid
		end
		LocalPlayer.CameraMode = Enum.CameraMode.Classic
		LocalPlayer.CameraMaxZoomDistance = 128
		LocalPlayer.CameraMinZoomDistance = 0.5
	end)
end

--// UNLOCK CAMERA // 00
if LocalPlayer.Character then
	forceCameraUnlock()
else
	LocalPlayer.CharacterAdded:Wait()
	forceCameraUnlock()
end

MainTab:CreateToggle({
	Name = "Unlock Camera",
	Flag = "unlockCam",
	CurrentValue = true,
	Callback = function(state)
		cameraUnlockEnabled = state
		if not state and cameraUnlockConn then
			cameraUnlockConn:Disconnect()
			cameraUnlockConn = nil
		elseif state and not cameraUnlockConn then
			forceCameraUnlock()
		end
	end
})

-- Fullbright Persistent Toggl
local originalLighting = {}
local fullbrightEnabled = false
local fullbrightConnection

MainTab:CreateToggle({
	Name = "Fullbright",
	Flag = "Fullbright",
	CurrentValue = false,
	Callback = function(state)
		fullbrightEnabled = state
		if state then
    -- Backup original values (once)
			originalLighting.Ambient = Lighting.Ambient
			originalLighting.OutdoorAmbient = Lighting.OutdoorAmbient
			originalLighting.Brightness = Lighting.Brightness
			originalLighting.ClockTime = Lighting.ClockTime
			originalLighting.GlobalShadows = Lighting.GlobalShadows

    -- Start enforcing fullbright settings
			if not fullbrightConnection then
				fullbrightConnection = RunService.RenderStepped:Connect(function()
					Lighting.Ambient = Color3.new(1, 1, 1)
					Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
					Lighting.Brightness = 1.5
					Lighting.ClockTime = 14
					Lighting.GlobalShadows = false
				end)
			end
		else
    -- Stop reapplying and restore original
			if fullbrightConnection then
				fullbrightConnection:Disconnect()
				fullbrightConnection = nil
			end
			for prop, value in pairs(originalLighting) do
				Lighting[prop] = value
			end
		end
	end
})

-- No Fog Toggle (now handles Atmosphere too)
MainTab:CreateToggle({
	Name = "No Fog",
	Flag = "noFog",
	CurrentValue = false,
	Callback = function(state)
		local lighting = game:GetService("Lighting")
		if state then
			lighting.FogEnd = 1e10
			lighting.FogStart = 1e10 - 1
			local atmosphere = lighting:FindFirstChildOfClass("Atmosphere")
			if atmosphere then
				atmosphere.Density = 0
				atmosphere.Haze = 0
			end
		else
			lighting.FogEnd = 1000
			lighting.FogStart = 0
			local atmosphere = lighting:FindFirstChildOfClass("Atmosphere")
			if atmosphere then
				atmosphere.Density = 0.3
				atmosphere.Haze = 1
			end
		end
	end
})

-- FOV Slider
MainTab:CreateSlider({
	Name = "Camera FOV",
	Flag = "camFOV",
	Range = {
		40,
		120
	},
	Increment = 1,
	Suffix = "°",
	CurrentValue = workspace.CurrentCamera.FieldOfView,
	Callback = function(value)
		workspace.CurrentCamera.FieldOfView = value
	end
})

-- No Clip
local noclipConn
MainTab:CreateToggle({
	Name = "No Clip",
	Flag = "noClip",
	CurrentValue = false,
	Callback = function(state)
		local char = Players.LocalPlayer.Character
		if state then
			noclipConn = RunService.Stepped:Connect(function()
				if char and char:FindFirstChild("HumanoidRootPart") then
					for _, part in pairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end
			end)
		else
			if noclipConn then
				noclipConn:Disconnect()
				noclipConn = nil
			end
		end
	end
})

----------------------
-- // COMBAT TAB // --
----------------------

-- // INSTA KILL AND FREEZE ON CLICK // --
local MobsFolder = workspace

local freezeMobsEnabled = false
local instaKillEnabled = false
local killRange = 50
local mobAddedConnection

local function isValidMob(mob)
	return mob:IsA("Model")
and mob:FindFirstChild("HumanoidRootPart")
and mob:FindFirstChildOfClass("Humanoid")
and not Players:GetPlayerFromCharacter(mob)
and not Players:FindFirstChild(mob.Name)
end

local function freezeMob(mob)
	local hrp = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum or hum.Health <= 0 then
		return
	end
	hrp.Anchored = true
	hum.WalkSpeed = 0
	hum.JumpPower = 0
	hum.PlatformStand = true
	hum.AutoRotate = false
end

local function unfreezeMob(mob)
	local hrp = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then
		return
	end
	hrp.Anchored = false
	hum.WalkSpeed = 16
	hum.JumpPower = 50
	hum.PlatformStand = false
	hum.AutoRotate = true
end

UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe or input.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return
	end
	local target = Mouse.Target
	if not target then
		return
	end
	local mob = target:FindFirstAncestorOfClass("Model")
	if not mob or not isValidMob(mob) then
		return
	end
	local mobHRP = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if not mobHRP or not hum then
		return
	end
	local dist = (hrp.Position - mobHRP.Position).Magnitude
	if dist > killRange then
		return
	end
	if freezeMobsEnabled then
		if mobHRP.Anchored or hum.WalkSpeed == 0 then
			unfreezeMob(mob)
		else
			freezeMob(mob)
		end
	end
	if instaKillEnabled then
		hum.Health = 0
	end
end)
CombatTab:CreateSection("InstaKill & Freeze")
CombatTab:CreateParagraph({
	Title = "Kill and Freeze Limitations",
	Content = "InstaKill and Freeze Mobs will only work on monument mobs (at structures), other mobs will show a false freeze and health. Don't have both on at the same time or InstaKill won't work properly."
})
local freezeToggle = CombatTab:CreateToggle({
	Name = "Freeze Mobs (on click)",
	Flag = "freezeMobs",
	CurrentValue = false,
	Callback = function(state)
		freezeMobsEnabled = state
		if not state then
			for _, mob in ipairs(MobsFolder:GetDescendants()) do
				if isValidMob(mob) then
					unfreezeMob(mob)
				end
			end
		end
	end
})
CombatTab:CreateKeybind({
	Name = "Toggle Freeze Mobs",
	Flag = "toggleFreezeMobs",
	CurrentKeybind = "V",
	HoldToInteract = false,
	Callback = function()
		freezeToggle:Set(not freezeToggle.CurrentValue)
	end
})
local killToggle = CombatTab:CreateToggle({
	Name = "InstaKill Mobs (on click)",
	Flag = "instaKill",
	CurrentValue = false,
	Callback = function(state)
		instaKillEnabled = state
	end
})
CombatTab:CreateKeybind({
	Name = "Toggle InstaKill Mobs",
	Flag = "toggleInstakill",
	CurrentKeybind = "B",
	HoldToInteract = false,
	Callback = function()
		killToggle:Set(not killToggle.CurrentValue)
	end
})
CombatTab:CreateSlider({
	Name = "Range",
	Flag = "killRange",
	Range = {
		0,
		250
	},
	Increment = 1,
	Suffix = " studs",
	CurrentValue = 50,
	Callback = function(val)
		killRange = val
	end
})

-- // AIMBOT // --
local function isValidMob(mob)
	return mob:IsA("Model")
and mob:FindFirstChild("HumanoidRootPart")
and mob:FindFirstChildOfClass("Humanoid")
and not Players:GetPlayerFromCharacter(mob)
and not Players:FindFirstChild(mob.Name)
end

local function getClosestMobFOV(range, fovRadius)
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return nil
	end
	local closest, shortestDist = nil, range or math.huge
	for _, mob in ipairs(workspace:GetDescendants()) do
		if isValidMob(mob) then
			local mobHRP = mob:FindFirstChild("HumanoidRootPart")
			if mobHRP then
				local screenPos, onScreen = Camera:WorldToViewportPoint(mobHRP.Position)
				local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
				local mob2D = Vector2.new(screenPos.X, screenPos.Y)
				local dist2D = (mousePos - mob2D).Magnitude
				local dist = (hrp.Position - mobHRP.Position).Magnitude
				if onScreen and dist2D <= fovRadius and dist < shortestDist then
					closest = mob
					shortestDist = dist
				end
			end
		end
	end
	return closest
end

local aimbotEnabled = false
local aimbotFOV = 60
local aimbotRange = 100
local aimbotTrackSpeed = 0.15

local function getClosestMobFOV(range, fovRadius)
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return nil
	end
	local closest, shortestDist = nil, range or math.huge
	for _, mob in ipairs(workspace:GetDescendants()) do
		if isValidMob(mob) then
			local hum = mob:FindFirstChildOfClass("Humanoid")
			local head = mob:FindFirstChild("Head") or mob:FindFirstChild("HumanoidRootPart")
			if hum and head and hum.Health > 0 and hum:GetState() ~= Enum.HumanoidStateType.Dead then
				local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
				local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
				local mob2D = Vector2.new(screenPos.X, screenPos.Y)
				local dist2D = (mousePos - mob2D).Magnitude
				local dist = (hrp.Position - head.Position).Magnitude
				if onScreen and dist2D <= fovRadius and dist < shortestDist then
					closest = head
					shortestDist = dist
				end
			end
		end
	end
	return closest
end

local aimbotFOVCircle
if Drawing then
	aimbotFOVCircle = Drawing.new("Circle")
	aimbotFOVCircle.Color = Color3.fromRGB(100, 200, 255)
	aimbotFOVCircle.Thickness = 2
	aimbotFOVCircle.Filled = false
	aimbotFOVCircle.Visible = false
end

UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == aimbotBind then
		aimbotEnabled = not aimbotEnabled
	end
end)

RunService.RenderStepped:Connect(function(dt)
	if aimbotFOVCircle then
		aimbotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
		aimbotFOVCircle.Radius = aimbotFOV
		aimbotFOVCircle.Visible = aimbotEnabled
	end
	if aimbotEnabled then
		local target = getClosestMobFOV(aimbotRange, aimbotFOV)
		if target then
			local current = Camera.CFrame.Position
			local targetPos = target.Position
			local newCFrame = CFrame.new(current, targetPos)
			Camera.CFrame = Camera.CFrame:Lerp(newCFrame, aimbotTrackSpeed)
		end
	end
end)

CombatTab:CreateSection("Aimbot")

local aimbotToggle = nil

aimbotToggle = CombatTab:CreateToggle({
	Name = "Aimbot",
	Flag = "Aimbot",
	CurrentValue = false,
	Set = true,
	Callback = function(val)
		aimbotEnabled = val
	end
})
CombatTab:CreateKeybind({
	Name = "Toggle Aimbot",
	Flag = "toggleAimbot",
	CurrentKeybind = "N",
	HoldToInteract = false,
	Callback = function()
		if aimbotToggle then
			aimbotToggle:Set(not aimbotEnabled)
		end
	end
})
CombatTab:CreateSlider({
	Name = "Aimbot FOV",
	Flag = "aimbotFOV",
	Range = {
		25,
		200
	},
	Increment = 1,
	CurrentValue = aimbotFOV,
	Callback = function(val)
		aimbotFOV = val
	end
})
CombatTab:CreateSlider({
	Name = "Aimbot Range",
	Flag = "aimbotRange",
	Range = {
		10,
		250
	},
	Increment = 1,
	CurrentValue = aimbotRange,
	Callback = function(val)
		aimbotRange = val
	end
})
CombatTab:CreateSlider({
	Name = "Tracking Speed",
	Flag = "trackingSpeed",
	Range = {
		1,
		100
	},
	Increment = 1,
	Suffix = "%",
	CurrentValue = math.floor(aimbotTrackSpeed * 100),
	Callback = function(val)
		aimbotTrackSpeed = math.clamp(val / 100, 0.01, 1)
	end
})

--// MOB AURA CONFIG
local meleeAuraEnabled = false
local meleeAuraRange = 20
local meleeAuraInterval = 0.3 -- seconds

--// Get Closest Valid Mob
local function getClosestMobInRange(range)
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local hrp = character and character:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return nil
	end
	local closest, shortestDist = nil, range or math.huge
	for _, mob in ipairs(workspace:GetDescendants()) do
		if isValidMob(mob) then
			local mobHRP = mob:FindFirstChild("HumanoidRootPart")
			if mobHRP then
				local dist = (hrp.Position - mobHRP.Position).Magnitude
				if dist < shortestDist and dist <= range then
					closest = mob
					shortestDist = dist
				end
			end
		end
	end
	return closest
end

--// Perform Melee Swing
local function swingAtClosestMobInRange()
	local mob = getClosestMobInRange(meleeAuraRange)
	if not mob then
		return
	end
	local charModel = workspace:FindFirstChild(LocalPlayer.Name)
	if not charModel then
		return
	end

    -- Find first tool with a SwingEvent
	local tool
	for _, obj in ipairs(charModel:GetChildren()) do
		if obj:IsA("Tool") and obj:FindFirstChild("SwingEvent") then
			tool = obj
			break
		end
	end
	if not tool then
		return
	end
	local hrp = charModel:FindFirstChild("HumanoidRootPart")
	local mobHRP = mob:FindFirstChild("HumanoidRootPart")
	if not hrp or not mobHRP then
		return
	end
	local direction = (mobHRP.Position - hrp.Position).Unit
	tool.SwingEvent:FireServer(direction)
end

    --// MOB AURA LOOP
task.spawn(function()
	while true do
		if meleeAuraEnabled then
			pcall(swingAtClosestMobInRange)
		end
		task.wait(meleeAuraInterval)
	end
end)

--// UI: MOB AURA
CombatTab:CreateSection("Mob Aura")

CombatTab:CreateParagraph({
	Title = "How to use Melee Aura",
	Content = "To use Melee Aura equip a weapon and stand close to a mob, it will automatically attack them."
})

CombatTab:CreateToggle({
	Name = "Melee Aura",
	Flag = "meleeAura",
	CurrentValue = false,
	Callback = function(state)
		meleeAuraEnabled = state
	end
})

--------------------
-- // ESP TAB // --
--------------------
-- Settings
local Settings = {
	PlayerESP = false,
	TrainESP = false,
	ItemESP = false,
	MobESP = false,
	OreESP = false,
	EnableBox = false,
	EnableHighlight = true,
	EnableTracer = false,
	ShowNames = false,
	ShowDistance = false,
	ShowHealth = false,
	Colors = {
		Player = Color3.fromRGB(0, 255, 255),
		Train = Color3.fromRGB(255, 255, 0),
		Item = Color3.fromRGB(255, 100, 100),
		Mob = Color3.fromRGB(255, 0, 255),
		Ore = Color3.fromRGB(255, 165, 0)
	}
}

local ESPObjects = {
	Player = {},
	Train = {},
	Item = {},
	Mob = {},
	Ore = {}
}

local function getAllValidMobs()
	local valid = {}
	for _, mob in ipairs(workspace:GetDescendants()) do
		if isValidMob(mob) then
			table.insert(valid, mob)
		end
	end
	return valid
end

local function destroyESP(esp)
	for _, obj in pairs(esp) do
		if typeof(obj) == "Instance" then
			obj:Destroy()
		elseif typeof(obj) == "table" or typeof(obj) == "userdata" then
			obj:Remove()
		end
	end
end

local function removeESP(category)
	for _, visuals in pairs(ESPObjects[category]) do
		destroyESP(visuals)
	end
	ESPObjects[category] = {}
end

local function get2DBoundingBox(model)
	if not model.PrimaryPart then
		local parts = model:GetDescendants()
		for _, p in pairs(parts) do
			if p:IsA("BasePart") then
				model.PrimaryPart = p
				break
			end
		end
	end
	if not model.PrimaryPart then
		return nil
	end
	local cf, size = model:GetBoundingBox()
	local corners = {}
	for x = -1, 1, 2 do
		for y = -1, 1, 2 do
			for z = -1, 1, 2 do
				table.insert(corners, cf.Position + (cf.RightVector * size.X / 2 * x) + (cf.UpVector * size.Y / 2 * y) + (cf.LookVector * size.Z / 2 * z))
			end
		end
	end
	local min, max = Vector2.new(math.huge, math.huge), Vector2.new(-math.huge, -math.huge)
	for _, corner in pairs(corners) do
		local screenPos, onScreen = Camera:WorldToViewportPoint(corner)
		if onScreen then
			local pos2D = Vector2.new(screenPos.X, screenPos.Y)
			min = Vector2.new(math.min(min.X, pos2D.X), math.min(min.Y, pos2D.Y))
			max = Vector2.new(math.max(max.X, pos2D.X), math.max(max.Y, pos2D.Y))
		end
	end
	return min, max
end

local function createESP(target, category)
	if ESPObjects[category][target] then
		for _, obj in pairs(ESPObjects[category][target]) do
			if typeof(obj) == "Instance" then
				obj:Destroy()
			elseif typeof(obj) == "table" or typeof(obj) == "userdata" then
				obj:Remove()
			end
		end
		ESPObjects[category][target] = nil
	end
	local color = Settings.Colors[category]
	local visuals = {}
	if Settings.EnableBox then
		local box = Drawing.new("Square")
		box.Color = color
		box.Thickness = 1
		box.Filled = false
		box.Visible = true
		visuals.Box = box
	end
	if Settings.EnableTracer then
		local line = Drawing.new("Line")
		line.Color = color
		line.Thickness = 1
		line.Visible = true
		visuals.Tracer = line
	end
	if Settings.EnableHighlight and target:IsA("Model") then
		local highlight = Instance.new("Highlight")
		highlight.FillColor = color
		highlight.FillTransparency = 0.5
		highlight.OutlineColor = Color3.new(0, 0, 0)
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = target
		highlight.Parent = game:GetService("CoreGui")
		visuals.Highlight = highlight
	end
	if Settings.ShowNames or Settings.ShowDistance then
		local text = Drawing.new("Text")
		text.Size = 16
		text.Center = true
		text.Outline = true
		text.Font = 2
		text.Color = Color3.fromRGB(255, 255, 255)
		text.Visible = true
		visuals.Label = text
	end
	if Settings.ShowHealth then
		local bar = Drawing.new("Square")
		bar.Thickness = 1
		bar.Filled = true
		bar.Visible = true
		visuals.HealthBar = bar
	end
	ESPObjects[category][target] = visuals
end

RunService.RenderStepped:Connect(function()
	for category, targets in pairs(ESPObjects) do
		for target, visuals in pairs(targets) do
			local shouldSkip = false
			if not target or not target.Parent then
				destroyESP(visuals)
				ESPObjects[category][target] = nil
				shouldSkip = true
			end
			local model = not shouldSkip and target:IsA("Model") and target or nil
			local part = not shouldSkip and (model and model.PrimaryPart or target) or nil
			if not part then
				if not shouldSkip then
					destroyESP(visuals)
					ESPObjects[category][target] = nil
				end
				shouldSkip = true
			end
			if not shouldSkip then
				local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
				local pos2D = Vector2.new(screenPos.X, screenPos.Y)
				if onScreen then
					if visuals.Box and model then
						local min, max = get2DBoundingBox(model)
						if min and max then
							visuals.Box.Position = min
							visuals.Box.Size = max - min
							visuals.Box.Visible = true
						else
							visuals.Box.Visible = false
						end
					end
					if visuals.Tracer then
						visuals.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
						visuals.Tracer.To = pos2D
						visuals.Tracer.Visible = true
					end
					if visuals.Label then
						local label = ""
						if Settings.ShowNames then
							label = target.Name
						end
						if Settings.ShowDistance then
							local dist = (Camera.CFrame.Position - part.Position).Magnitude
							label = label .. string.format(" [%.0fm]", dist)
						end
						visuals.Label.Text = label
						visuals.Label.Position = pos2D - Vector2.new(0, 45)
						visuals.Label.Visible = true
					end
					if visuals.HealthBar and target:FindFirstChild("Humanoid") then
						local hum = target:FindFirstChild("Humanoid")
						local hp = hum.Health
						local maxHp = hum.MaxHealth
						if hp <= 0 then
							destroyESP(visuals)
							ESPObjects[category][target] = nil
						else
							local ratio = math.clamp(hp / maxHp, 0, 1)
							local color = ratio > 0.6 and Color3.new(0, 1, 0) or (ratio > 0.3 and Color3.new(1, 1, 0) or Color3.new(1, 0, 0))
							visuals.HealthBar.Color = color
							visuals.HealthBar.Size = Vector2.new(4, 40 * ratio)
							visuals.HealthBar.Position = pos2D - Vector2.new(30, 20 - (20 * (1 - ratio)))
							visuals.HealthBar.Visible = true
						end
					elseif visuals.HealthBar then
						visuals.HealthBar.Visible = false
					end
				else
					if visuals.Box then
						visuals.Box.Visible = false
					end
					if visuals.Tracer then
						visuals.Tracer.Visible = false
					end
					if visuals.Label then
						visuals.Label.Visible = false
					end
					if visuals.HealthBar then
						visuals.HealthBar.Visible = false
					end
				end
			end
		end
	end
end)
local function loadESP()
	if Settings.PlayerESP then
		for _, plr in Players:GetPlayers() do
			if plr ~= LocalPlayer and plr.Character then
				createESP(plr.Character, "Player")
			end
			plr.CharacterAdded:Connect(function(c)
				repeat
					task.wait()
				until c:FindFirstChild("HumanoidRootPart")
				if Settings.PlayerESP then
					createESP(c, "Player")
				end
			end)
		end
	end
	if Settings.TrainESP then
		local train = workspace:FindFirstChild("Train")
		if train then
			createESP(train, "Train")
		end
	end
	if Settings.ItemESP then
		local folder = workspace:FindFirstChild("RuntimeItems")
		if folder then
			for _, obj in folder:GetChildren() do
				local part = obj:IsA("Model") and obj.PrimaryPart or obj
				if part then
					createESP(obj, "Item")
				end
			end
			folder.ChildAdded:Connect(function(obj)
				task.wait()
				local part = obj:IsA("Model") and obj.PrimaryPart or obj
				if part and Settings.ItemESP then
					createESP(obj, "Item")
				end
			end)
		end
	end
	if Settings.OreESP then
		local folder = workspace:FindFirstChild("Ore")
		if folder then
			for _, obj in folder:GetChildren() do
				local part = obj:IsA("Model") and obj.PrimaryPart or obj
				if part then
					createESP(obj, "Ore")
				end
			end
			folder.ChildAdded:Connect(function(obj)
				task.wait()
				local part = obj:IsA("Model") and obj.PrimaryPart or obj
				if part and Settings.OreESP then
					createESP(obj, "Ore")
				end
			end)
		end
	end
	if Settings.MobESP then
		for _, mob in ipairs(getAllValidMobs()) do
			local part = mob:IsA("Model") and mob.PrimaryPart or mob
			if part then
				createESP(mob, "Mob")
			end
		end
		workspace.DescendantAdded:Connect(function(obj)
			task.wait(1)
			if Settings.MobESP and isValidMob(obj) then
				createESP(obj, "Mob")
			end
		end)
	end
end
local function refreshAll()
	for cat in pairs(ESPObjects) do
		removeESP(cat)
	end
	loadESP()
end
ESPTab:CreateSection("Targets")
ESPTab:CreateToggle({
	Name = "Player ESP",
	Flag = "PlayerESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.PlayerESP = v
		if v then
			loadESP()
		else
			removeESP("Player")
		end
	end
})
ESPTab:CreateToggle({
	Name = "Train ESP",
	Flag = "TrainESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.TrainESP = v
		if v then
			loadESP()
		else
			removeESP("Train")
		end
	end
})
ESPTab:CreateToggle({
	Name = "Item ESP",
	Flag = "ItemESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.ItemESP = v
		if v then
			loadESP()
		else
			removeESP("Item")
		end
	end
})
ESPTab:CreateToggle({
	Name = "Mob ESP",
	Flag = "MobESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.MobESP = v
		if v then
			loadESP()
		else
			removeESP("Mob")
		end
	end
})
ESPTab:CreateToggle({
	Name = "Ore ESP",
	Flag = "OreESP",
	CurrentValue = false,
	Callback = function(v)
		Settings.OreESP = v
		if v then
			loadESP()
		else
			removeESP("Ore")
		end
	end
})
ESPTab:CreateSection("ESP Colors")
ESPTab:CreateColorPicker({
	Name = "Player ESP Color",
	Flag = "PlayerESPColor",
	Color = Settings.Colors.Player,
	Callback = function(newCol)
		Settings.Colors.Player = newCol
		removeESP("Player")
		if Settings.PlayerESP then
			loadESP()
		end
	end
})
ESPTab:CreateColorPicker({
	Name = "Train ESP Color",
	Flag = "TrainESPColor",
	Color = Settings.Colors.Train,
	Callback = function(newCol)
		Settings.Colors.Train = newCol
		removeESP("Train")
		if Settings.TrainESP then
			loadESP()
		end
	end
})
ESPTab:CreateColorPicker({
	Name = "Item ESP Color",
	Flag = "ItemESPColor",
	Color = Settings.Colors.Item,
	Callback = function(newCol)
		Settings.Colors.Item = newCol
		removeESP("Item")
		if Settings.ItemESP then
			loadESP()
		end
	end
})
ESPTab:CreateColorPicker({
	Name = "Mob ESP Color",
	Flag = "MobESPColor",
	Color = Settings.Colors.Mob,
	Callback = function(newCol)
		Settings.Colors.Mob = newCol
		removeESP("Mob")
		if Settings.MobESP then
			loadESP()
		end
	end
})
ESPTab:CreateColorPicker({
	Name = "Ore ESP Color",
	Flag = "OreESPColor",
	Color = Settings.Colors.Ore,
	Callback = function(newCol)
		Settings.Colors.Ore = newCol
		removeESP("Ore")
		if Settings.OreESP then
			loadESP()
		end
	end
})
ESPTab:CreateSection("ESP Settings")
ESPTab:CreateToggle({
	Name = "Show Box",
	Flag = "ESPShowBox",
	CurrentValue = false,
	Callback = function(v)
		Settings.EnableBox = v
		refreshAll()
	end
})
ESPTab:CreateToggle({
	Name = "Show Highlight",
	Flag = "ESPShowHighlight",
	CurrentValue = true,
	Callback = function(v)
		Settings.EnableHighlight = v
		refreshAll()
	end
})
ESPTab:CreateToggle({
	Name = "Show Tracers",
	Flag = "ESPShowTracers",
	CurrentValue = false,
	Callback = function(v)
		Settings.EnableTracer = v
		refreshAll()
	end
})
ESPTab:CreateSection("ESP Other")
ESPTab:CreateToggle({
	Name = "Show Names",
	Flag = "ESPShowNames",
	CurrentValue = true,
	Callback = function(v)
		Settings.ShowNames = v
		refreshAll()
	end
})
ESPTab:CreateToggle({
	Name = "Show Distance",
	Flag = "ESPShowDistance",
	CurrentValue = false,
	Callback = function(v)
		Settings.ShowDistance = v
		refreshAll()
	end
})
ESPTab:CreateToggle({
	Name = "Show Health",
	Flag = "ESPShowHealth",
	CurrentValue = true,
	Callback = function(v)
		Settings.ShowHealth = v
		refreshAll()
	end
})

MiscTab:CreateSection("Other Toggles")

local walkTrainConn
MiscTab:CreateToggle({
	Name = "Walk to Train",
	CurrentValue = false,
	Callback = function(state)
		local player = Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local humanoid = char:WaitForChild("Humanoid")
		local hrp = char:WaitForChild("HumanoidRootPart")
		if state then
			walkTrainConn = RunService.Heartbeat:Connect(function()
				local train = workspace:FindFirstChild("Train")
				if train and train.PrimaryPart and humanoid and hrp then
					local distance = (hrp.Position - train.PrimaryPart.Position).Magnitude
					if distance > 10 then
						humanoid:MoveTo(train.PrimaryPart.Position)
					else
						humanoid:MoveTo(hrp.Position) -- Stop moving
					end
				end
			end)
		else
			if walkTrainConn then
				walkTrainConn:Disconnect()
				walkTrainConn = nil
			end
		end
	end
})

local flyForwardEnabled = false
local flyConn

MiscTab:CreateToggle({
	Name = "Fly Forward (NoClip)",
	Flag = "FlyLookNoClip",
	CurrentValue = false,
	Callback = function(state)
		flyForwardEnabled = state
		if flyConn then
			flyConn:Disconnect()
			flyConn = nil
		end
		if state then
			flyConn = RunService.Heartbeat:Connect(function(dt)
				local player = Players.LocalPlayer
				local char = player.Character
				if not char then
					return
				end
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				local hrp = char:FindFirstChild("HumanoidRootPart")
				if not humanoid or not hrp then
					return
				end

            -- Disable collisions for all parts
				for _, part in ipairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end

            -- Move using camera direction
				local camLook = workspace.CurrentCamera.CFrame.LookVector
				local speed = humanoid.WalkSpeed
				hrp.CFrame = hrp.CFrame + (camLook * speed * dt)
			end)
		end
	end
})

MiscTab:CreateSection("Themes")

--// AMBIENT CONTROL
local ambientEnabled = false
local customAmbientColor = Color3.fromRGB(128, 128, 128)
local originalAmbient = Lighting.Ambient

-- Apply or reset ambient
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

local Dropdown = MiscTab:CreateDropdown({
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
	}, -- The default selected option
	MultipleOptions = false, -- Set to false since only one theme can be selected at a time
	Flag = "ThemeDropdown",
	Callback = function(Options)
-- Change the theme of the window
		Window.ModifyTheme(Options[1]) -- Access the first (and only) selected option
	end,
})

Rayfield:LoadConfiguration()