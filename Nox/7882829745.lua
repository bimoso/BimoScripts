--discord.gg/boronide, code generated using luamin.js™



-- =============== --
-- ==== SETUP ==== --
-- =============== --

-- == SERVICES == --
local Services = {
	Workspace = game:GetService("Workspace"),
	Lighting = game:GetService("Lighting"),
	RunService = game:GetService("RunService"),
	TweenService = game:GetService("TweenService"),
	Debris = game:GetService("Debris"),
	Players = game:GetService("Players"),
	UserInputService = game:GetService("UserInputService"),
	VirtualInputManager = game:GetService("VirtualInputManager"),
	ContextActionService = game:GetService("ContextActionService"),
	GuiService = game:GetService("GuiService"),
	StarterGui = game:GetService("StarterGui"),
	ReplicatedStorage = game:GetService("ReplicatedStorage"),
	MarketplaceService = game:GetService("MarketplaceService"),
	TeleportService = game:GetService("TeleportService"),
	SoundService = game:GetService("SoundService"),
	CollectionService = game:GetService("CollectionService"),
	HttpService = game:GetService("HttpService"),
	PathfindingService = game:GetService("PathfindingService"),
}

-- == REFERENCES == --
local References = {
	player = Services.Players.LocalPlayer,
	character = nil,
	humanoid = nil,
	humanoidRootPart = nil,
	camera = Services.Workspace.CurrentCamera,
	gameName = "Anime Eternal"
}

local ToServer = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("To_Server")

-- == OBSIDIAN UI SETUP == --
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
	Title = "NoxHub",
	Footer = References.gameName,
	Icon = 123543418857967,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Main = Window:AddTab("Main", "menu"),
	Player = Window:AddTab("Player", "circle-user"),
	ESP = Window:AddTab("ESP", "eye"),
	Auto = Window:AddTab("Auto", "bot"),
	Misc = Window:AddTab("Misc", "archive"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- ========================== --
-- ==== HELPER FUNCTIONS ==== --
-- ========================== --

-- ========================== --

-- ================== --
-- ==== MAIN TAB ==== --
-- ================== --

-- == CODES ==
local CodesGroupbox = Tabs.Main:AddRightGroupbox("Codes", "gift")

local ALL_CODES = {
	"BugsUpdate15",
	"2BugsUpdate15",
	"Update15",
	"195KLikes",
	"200KLikes",
	"420KFav",
	"425KFav",
	"Update15Delay",
	"51kPlayers",
	"52kPlayers",
	"53kPlayers",
	"Update14P3",
	"185KLikes",
	"190KLikes",
	"410KFav",
	"415KFav",
	"Ultra50KRecord",
	"Supa49kRecord",
	"SupaRecord48k",
	"NewRecord47k",
	"?Record46K?!",
	"Record45K?!",
	"44KRecord??",
	"?43KRecord?",
	"Update14P2",
	"175KLikes",
	"180KLikes",
	"400KFav",
	"405KFav",
	"?42K?",
	"SomeQuickFix1a",
	"SomeQuickFix2",
	"?41KRecord?",
	"40KRecord?",
	"39KRecordCcu",
	"Update14",
	"170KLikes",
	"50MVisits",
	"395KFav",
	"390KFav",
	"DungeonQuickFix",
	"Update13P3",
	"165KLikes",
	"375KFav",
	"380KFav",
	"385KFav",
	"1GhoulKeyNoMore",
	"IWantKey",
	"Online36K",
	"37KPlayersOn",
	"38KRecord",
	"Update13P2",
	"365KFav",
	"370KFav",
	"50K",
	"160KLikes",
	"35KCCU",
	"Shutdown123",
	"Update13",
	"155KLikes",
	"350KFav",
	"360KFav",
	"40MVisits",
	"DungeonFall1",
	"Update12.5",
	"31KPlayers",
	"32KPlayers",
	"33KPlayers",
	"150KLikes",
	"Update12.2",
	"35MVisits",
	"140KLikes",
	"340KFav",
	"29KPlayers",
	"30kOnline",
	"Update12.2Late",
	"PotionFix1",
	"25KPlayers",
	"26KPlayers",
	"27KPlayers",
	"28KPlayers",
	"BugFixSome",
	"Update12",
}

CodesGroupbox:AddButton({
	Text = "Redeem All Codes",
	Tooltip = "Redeems every known code with a 0.1s delay.",
	Func = function()
		task.spawn(function()
			for _, code in ipairs(ALL_CODES) do
				ToServer:FireServer({
					Action = "_Redeem_Code",
					Text   = code
				})
				task.wait(0.1)
			end
		end)
	end
})

-- == ROLLS == --
local RollGroupbox = Tabs.Main:AddRightGroupbox("Rolls", "dices")

-- === GACHA ROLLS (non-star) ===
local gachaValues = {
	"Dragon Race",
	"Saiyan Evolution",
	"Swords",
	"Pirate Crew",
	"Demon Fruits"
}
local gachaMap = {
	["Dragon Race"]      = "Dragon_Race",
	["Saiyan Evolution"] = "Saiyan_Evolution",
	["Swords"]           = "Swords",
	["Pirate Crew"]      = "Pirate_Crew",
	["Demon Fruits"]     = "Demon_Fruits",
}

-- Multi-select
RollGroupbox:AddDropdown("Gacha_Roll_Select", {
	Text = "Select Gacha",
	Values = gachaValues,
	Default = 1,
	Multi = true,
	Searchable = true,
})

local rollingGacha = false
RollGroupbox:AddToggle("Gacha_Roll_Continuous", {
	Text = "Auto Roll",
	Default = false,
	Callback = function(on)
		rollingGacha = false
		if not on then
			return
		end
		rollingGacha = true
		task.spawn(function()
			while rollingGacha do
				local sel = (Options.Gacha_Roll_Select and Options.Gacha_Roll_Select.Value) or {}
				local any = false

        -- Iterate in dropdown order for deterministic behavior
				for _, label in ipairs(gachaValues) do
					if not rollingGacha then
						break
					end
					if sel[label] then
						any = true
						local gname = gachaMap[label]
						if gname then
							local args = {
								{
									Open_Amount = 1,
									Action = "_Gacha_Activate",
									Name = gname
								}
							}
							ToServer:FireServer(unpack(args))
							task.wait(0.5)
						end
					end
				end
				if not any then
					task.wait(0.25)
				end
			end
		end)
	end
})

RollGroupbox:AddDivider()

-- === STAR ROLLS (single select) ===
local starValues = {}
for i = 1, 19 do
	starValues[#starValues + 1] = ("1x Star %d"):format(i)
	starValues[#starValues + 1] = ("5x Star %d"):format(i)
end

RollGroupbox:AddDropdown("Star_Roll_Select", {
	Text = "Select Star",
	Values = starValues,
	Default = "1x Star 1",
	Multi = false,           -- single select
	Searchable = true,
})

local rollingStars = false
RollGroupbox:AddToggle("Star_Roll_Continuous", {
	Text = "Auto Roll",
	Default = false,
	Callback = function(on)
		rollingStars = false
		if not on then
			return
		end
		rollingStars = true
		task.spawn(function()
			while rollingStars do
				local label = Options.Star_Roll_Select and Options.Star_Roll_Select.Value
				if type(label) ~= "string" or label == "" then
					task.wait(0.25)
				else
            -- label like "1x Star N" or "5x Star N"
					local amountStr, idxStr = label:match("^(%d+)x%s+Star%s+(%d+)$")
					local amount = tonumber(amountStr) or 1
					local idx    = tonumber(idxStr) or 1
					if idx < 1 then
						idx = 1
					end
					if idx > 19 then
						idx = 19
					end
					if amount ~= 5 then
						amount = 1
					end -- only 1 or 5 supported
					local args = {
						{
							Open_Amount = amount,
							Action = "_Stars",
							Name = ("Star_%d"):format(idx)
						}
					}
					ToServer:FireServer(unpack(args))
					task.wait(0.5)
				end
			end
		end)
	end
})

        -- == TELEPORTS ==
local TeleportsGroupbox = Tabs.Main:AddLeftGroupbox("Teleports", "move-3d")

        -- ---------- Monsters helpers ----------
local function tpMonstersList()
	local f = workspace.Debris and workspace.Debris:FindFirstChild("Monsters")
	if not f then
		return {}
	end
	local seen, list = {}, {}
	for _, m in ipairs(f:GetChildren()) do
		if m:IsA("Model") then
			local h = m:FindFirstChildOfClass("Humanoid")
			if not (h and h.Health <= 0) then
				local t = m:GetAttribute("Title")
				if type(t) ~= "string" or t == "" then
					local sv = m:FindFirstChild("Title")
					t = (sv and sv:IsA("StringValue") and sv.Value ~= "" and sv.Value) or m.Name
				end
				if t and not seen[t] then
					seen[t] = true;
					list[#list + 1] = t
				end
			end
		end
	end
	table.sort(list)
	return list
end
local function tpClosestMonsterOf(title)
	local f = workspace.Debris and workspace.Debris:FindFirstChild("Monsters");
	if not f then
		return nil
	end
	local root = References and References.humanoidRootPart;
	if not root then
		return nil
	end
	local r, best, bestD = root.Position, nil, math.huge
	for _, m in ipairs(f:GetChildren()) do
		if m:IsA("Model") then
			local h = m:FindFirstChildOfClass("Humanoid")
			if not (h and h.Health <= 0) then
				local t = m:GetAttribute("Title")
				if type(t) ~= "string" or t == "" then
					local sv = m:FindFirstChild("Title")
					t = (sv and sv:IsA("StringValue") and sv.Value ~= "" and sv.Value) or m.Name
				end
				if t == title then
					local ok, cf = pcall(m.GetPivot, m);
					cf = ok and cf or nil
					local p = (cf and cf.Position) or (m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart"))
					p = typeof(p) == "Vector3" and p or (p and p.Position)
					if p then
						local dx, dy, dz = p.X - r.X, p.Y - r.Y, p.Z - r.Z
						local d = dx * dx + dy * dy + dz * dz
						if d < bestD then
							best, bestD = p, d
						end
					end
				end
			end
		end
	end
	return best
end

                    -- ---------- Players helpers ----------
local function tpPlayersList()
	local t = {}
	for _, pl in ipairs(Services.Players:GetPlayers()) do
		if pl ~= References.player then
			t[#t + 1] = pl.Name
		end
	end
	table.sort(t)
	return t
end
local function tpPlayerPos(name)
	local pl = name and Services.Players:FindFirstChild(name)
	if not pl or not pl.Character then
		return nil
	end
	local ok, cf = pcall(pl.Character.GetPivot, pl.Character)
	if ok and typeof(cf) == "CFrame" then
		return cf.Position
	end
	local hrp = pl.Character:FindFirstChild("HumanoidRootPart") or pl.Character:FindFirstChildWhichIsA("BasePart")
	return hrp and hrp.Position or nil
end

                        -- ---------- Island Locations helpers ----------
local function modelPivotPos(m)
	if not (m and m:IsA("Model")) then
		return nil
	end
	local ok, cf = pcall(m.GetPivot, m)
	if ok and typeof(cf) == "CFrame" then
		return cf.Position
	end
	local pp = m.PrimaryPart or m:FindFirstChild("HumanoidRootPart") or m:FindFirstChildWhichIsA("BasePart")
	return pp and pp.Position or nil
end

                            -- Unique list of child Model names (direct children of each island Model)
local function tpIslandNames()
	local islandsFolder = workspace:FindFirstChild("Islands")
	if not islandsFolder then
		return {}
	end
	local seen, values = {}, {}
	for _, island in ipairs(islandsFolder:GetChildren()) do
		if island:IsA("Model") then
			for _, child in ipairs(island:GetChildren()) do
				if child:IsA("Model") then
					local n = child.Name
					if not seen[n] then
						seen[n] = true;
						values[#values + 1] = n
					end
				end
			end
		end
	end
	table.sort(values)
	return values
end

                                -- Find nearest Model (by name) across all islands' direct children
local function tpIslandNearestPos(childName)
	local islandsFolder = workspace:FindFirstChild("Islands");
	if not islandsFolder then
		return nil
	end
	local root = References and References.humanoidRootPart;
	if not root then
		return nil
	end
	local r, best, bestD = root.Position, nil, math.huge
	for _, island in ipairs(islandsFolder:GetChildren()) do
		if island:IsA("Model") then
			local child = island:FindFirstChild(childName)
			if child and child:IsA("Model") then
				local p = modelPivotPos(child)
				if p then
					local dx, dy, dz = p.X - r.X, p.Y - r.Y, p.Z - r.Z
					local d = dx * dx + dy * dy + dz * dz
					if d < bestD then
						best, bestD = p, d
					end
				end
			end
		end
	end
	return best
end

                                        -- ---------- UI + behavior ----------
local categories = {
	"Players",
	"Monsters",
	"Island Locations"
}
local currentCat = "Players"
local ddCat = TeleportsGroupbox:AddDropdown("TP_Category", {
	Text = "Category",
	Values = categories,
	Default = currentCat,
	Searchable = false,
	Tooltip = "Choose what to teleport to",
})
local currentItems = tpPlayersList()
local currentTarget = currentItems[1] or ""
local ddItem = TeleportsGroupbox:AddDropdown("TP_Target", {
	Text = "Target",
	Values = currentItems,
	Default = currentTarget,
	Searchable = true,
	Tooltip = "Pick a specific player, monster type, or island location",
})
ddItem:OnChanged(function(v)
	currentTarget = v
end)
local function refreshTargets()
	if currentCat == "Players" then
		currentItems = tpPlayersList()
	elseif currentCat == "Monsters" then
		currentItems = tpMonstersList()
	else -- Island Locations
		currentItems = tpIslandNames()
	end
	ddItem:SetValues(currentItems)
	if not table.find(currentItems, currentTarget) then
		currentTarget = currentItems[1] or ""
		if currentTarget ~= "" then
			ddItem:SetValue(currentTarget)
		end
	end
end
ddCat:OnChanged(function(v)
	currentCat = v or "Players"
	refreshTargets()
end)
TeleportsGroupbox:AddButton({
	Text = "Teleport",
	Func = function()
		local root = References and References.humanoidRootPart
		if not root then
			return Library:Notify("No character.", 3)
		end
		if currentTarget == "" then
			return Library:Notify("Pick a target.", 3)
		end
		local p
		if currentCat == "Players" then
			p = tpPlayerPos(currentTarget)
		elseif currentCat == "Monsters" then
			p = tpClosestMonsterOf(currentTarget)
		else
			p = tpIslandNearestPos(currentTarget)
		end
		if p then
			root.CFrame = CFrame.new(p + Vector3.new(0, 3, 0))
		else
			Library:Notify("Target not found.", 3)
		end
	end
})
TeleportsGroupbox:AddButton({
	Text = "Refresh",
	Func = function()
		refreshTargets()
		Library:Notify(currentCat .. " list refreshed.", 2)
	end
})

                                    -- prime initial list
refreshTargets()

                                    -- ==================== --
                                    -- ==== PLAYER TAB ==== --
                                    -- ==================== --
local UIS = Services.UserInputService
local KC = Enum.KeyCode
local L = Services.Lighting

                                    -- == FLIGHT == --
local FlightGroup = Tabs.Player:AddLeftGroupbox("Flight", "move-3d")
FlightGroup:AddToggle("FlightEnabled", {
	Text = "Flight",
	Default = false,
}):AddKeyPicker("FlightKey", {
	Default = "F",
	SyncToggleState = true,
	Mode = "Toggle",
	Text = "Flight Key",
})
FlightGroup:AddSlider("FlightSpeed", {
	Text = "Flight Speed",
	Default = 50,
	Min = 10,
	Max = 300,
	Rounding = 0,
})
local flightConn
local function startFlight()
	if flightConn then
		return
	end
	flightConn = Services.RunService.RenderStepped:Connect(function()
		local root, cam = References.humanoidRootPart, References.camera
		if not root or not cam then
			return
		end
		local cframe = cam.CFrame
		local look, right, up = cframe.LookVector, cframe.RightVector, cframe.UpVector
		local dir = Vector3.zero
		if UIS:IsKeyDown(KC.W) then
			dir += look
		end
		if UIS:IsKeyDown(KC.S) then
			dir -= look
		end
		if UIS:IsKeyDown(KC.A) then
			dir -= right
		end
		if UIS:IsKeyDown(KC.D) then
			dir += right
		end
		if UIS:IsKeyDown(KC.Space) then
			dir += up
		end
		if UIS:IsKeyDown(KC.LeftShift) or UIS:IsKeyDown(KC.LeftControl) then
			dir -= up
		end
		if References.humanoid and UIS.TouchEnabled then
			local md = References.humanoid.MoveDirection
			if md.Magnitude > 0 then
				dir += (look * md.Z * -1) + (right * md.X)
			end
		end
		if dir.Magnitude > 0 then
			root.AssemblyAngularVelocity = Vector3.zero
			root.AssemblyLinearVelocity = dir.Unit * Options.FlightSpeed.Value
		else
			root.AssemblyAngularVelocity = Vector3.zero
			root.AssemblyLinearVelocity = Vector3.new(0, 2.2, 0)
		end
	end)
end
local function stopFlight()
	if flightConn then
		flightConn:Disconnect()
		flightConn = nil
		local root = References.humanoidRootPart
		if root then
			root.AssemblyAngularVelocity = Vector3.zero
			root.AssemblyLinearVelocity = Vector3.zero
		end
	end
end
Toggles.FlightEnabled:OnChanged(function()
	if Toggles.FlightEnabled.Value then
		startFlight()
	else
		stopFlight()
	end
end)

                                                        -- == SPEED == --
local SpeedGroup = Tabs.Player:AddLeftGroupbox("Speed", "move")
SpeedGroup:AddToggle("SpeedEnabled", {
	Text = "Speed",
	Default = false,
}):AddKeyPicker("SpeedKey", {
	Default = "G",
	SyncToggleState = true,
	Mode = "Toggle",
	Text = "Speed Key",
})
SpeedGroup:AddSlider("SpeedValue", {
	Text = "Speed Value",
	Default = 30,
	Min = 16,
	Max = 300,
	Rounding = 0,
})
local speedConn
local function startSpeed()
	if speedConn then
		return
	end
	speedConn = Services.RunService.Heartbeat:Connect(function()
		local hum = References.humanoid
		if hum then
			hum.WalkSpeed = Options.SpeedValue.Value
		end
	end)
end
local function stopSpeed()
	if speedConn then
		speedConn:Disconnect()
		speedConn = nil
	end
	local hum = References.humanoid
	if hum then
		hum.WalkSpeed = 16
	end
end
Toggles.SpeedEnabled:OnChanged(function()
	if Toggles.SpeedEnabled.Value then
		startSpeed()
	else
		stopSpeed()
	end
end)

                                                -- == JUMP POWER == --
local JumpGroup = Tabs.Player:AddLeftGroupbox("Jump", "move-vertical")
JumpGroup:AddToggle("JumpPower", {
	Text = "Jump Power",
	Default = false,
})
JumpGroup:AddSlider("JumpHeight", {
	Text = "Jump Height",
	Default = 50,
	Min = 16,
	Max = 200,
	Rounding = 0,
})
JumpGroup:AddToggle("InfiniteJump", {
	Text = "Infinite Jump",
	Default = false,
})
local function applyJumpHeight()
	local h = References.humanoid
	if not h then
		return
	end
	local v = Options.JumpHeight.Value
	if h.UseJumpPower ~= nil then
		h.UseJumpPower = true
		h.JumpPower = v
	end
	if h.JumpHeight ~= nil then
		h.JumpHeight = v * 0.4
	end
end
local jumpConn
local function startJumpMod()
	if jumpConn then
		return
	end
	applyJumpHeight()
	jumpConn = Services.RunService.Heartbeat:Connect(applyJumpHeight)
end
local function stopJumpMod()
	if jumpConn then
		jumpConn:Disconnect();
		jumpConn = nil
	end
	local h = References.humanoid
	if h then
		if h.UseJumpPower ~= nil then
			h.UseJumpPower = true;
			h.JumpPower = 50
		end
		if h.JumpHeight ~= nil then
			h.JumpHeight = 7.2
		end
	end
end
local ijConn
local function startInfiniteJump()
	if ijConn then
		return
	end
	ijConn = UIS.JumpRequest:Connect(function()
		local h = References.humanoid
		if h then
			h:ChangeState(Enum.HumanoidStateType.Jumping)
			h.Jump = true
		end
	end)
end
local function stopInfiniteJump()
	if ijConn then
		ijConn:Disconnect();
		ijConn = nil
	end
end
Toggles.JumpPower:OnChanged(function()
	if Toggles.JumpPower.Value then
		startJumpMod()
	else
		stopJumpMod()
	end
end)
Options.JumpHeight:OnChanged(function()
	if Toggles.JumpPower.Value then
		applyJumpHeight()
	end
end)
Toggles.InfiniteJump:OnChanged(function()
	if Toggles.InfiniteJump.Value then
		startInfiniteJump()
	else
		stopInfiniteJump()
	end
end)

                                                    -- == PLAYER UTILS == --
local UtilsGroup = Tabs.Player:AddRightGroupbox("Utils", "lightbulb")

                                                    -- == NO CLIP == --
UtilsGroup:AddToggle("NoclipEnabled", {
	Text = "Noclip",
	Default = false,
	Tooltip = "Walk through walls",
}):AddKeyPicker("NoclipKey", {
	Default = "N",
	SyncToggleState = true,
	Mode = "Toggle",
	Text = "Noclip Key",
})
local noclipConn
local function startNoclip()
	if noclipConn then
		return
	end
	noclipConn = Services.RunService.Stepped:Connect(function()
		local char = References.character
		if not char then
			return
		end
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end)
end
local function stopNoclip()
	if noclipConn then
		noclipConn:Disconnect();
		noclipConn = nil
	end
end
Toggles.NoclipEnabled:OnChanged(function()
	if Toggles.NoclipEnabled.Value then
		startNoclip()
	else
		stopNoclip()
	end
end)

                                                    -- == PERFORMANCE MODE == --
UtilsGroup:AddToggle("PerformanceMode", {
	Text = "Performance Mode",
	Default = false,
	Tooltip = "Reduce visual effects locally for better FPS",
})
local originals = nil
local function snapshot()
	if originals then
		return
	end
	originals = {
		QualityLevel  = settings().Rendering.QualityLevel,
		GlobalShadows = L.GlobalShadows,
		Ambient       = L.Ambient,
		Brightness    = L.Brightness,
		FogEnd        = L.FogEnd,
		FogStart      = L.FogStart,
		Effects = {},
		Terrain = {},
	}
	for _, inst in ipairs(L:GetDescendants()) do
		if inst:IsA("BloomEffect") or inst:IsA("ColorCorrectionEffect")
                                                            or inst:IsA("SunRaysEffect") or inst:IsA("DepthOfFieldEffect")
                                                            or inst:IsA("BlurEffect") then
			originals.Effects[inst] = inst.Enabled
		end
	end
	local terr = Services.Workspace:FindFirstChildOfClass("Terrain")
	if terr then
		originals.Terrain.WaterWaveSize     = terr.WaterWaveSize
		originals.Terrain.WaterReflectance  = terr.WaterReflectance
		originals.Terrain.WaterTransparency = terr.WaterTransparency
		local ok, dec = pcall(function()
			return terr.Decoration
		end)
		if ok and type(dec) == "boolean" then
			originals.Terrain.Decoration = dec
		end
	end
end
local function perfOn()
	snapshot()
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	L.GlobalShadows = false
	L.Ambient       = Color3.new(0.3, 0.3, 0.3)
	L.Brightness    = 1
	L.FogEnd        = 1e10
	L.FogStart      = 1e10
	for inst in pairs(originals.Effects) do
		if inst and inst.Parent then
			inst.Enabled = false
		end
	end
	local terr = Services.Workspace:FindFirstChildOfClass("Terrain")
	if terr then
		terr.WaterWaveSize     = 0
		terr.WaterReflectance  = 0
		terr.WaterTransparency = 1
		if originals.Terrain.Decoration ~= nil then
			pcall(function()
				terr.Decoration = false
			end)
		end
	end
	for _, d in ipairs(Services.Workspace:GetDescendants()) do
		if d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Beam") or d:IsA("Smoke") or d:IsA("Fire") then
			if d.Enabled then
				d:SetAttribute("PerfWasEnabled", true);
				d.Enabled = false
			end
		end
	end
end
local function perfOff()
	if not originals then
		return
	end
	settings().Rendering.QualityLevel = originals.QualityLevel
	L.GlobalShadows = originals.GlobalShadows
	L.Ambient       = originals.Ambient
	L.Brightness    = originals.Brightness
	L.FogEnd        = originals.FogEnd
	L.FogStart      = originals.FogStart
	for inst, was in pairs(originals.Effects) do
		if inst and inst.Parent then
			inst.Enabled = was
		end
	end
	local terr = Services.Workspace:FindFirstChildOfClass("Terrain")
	if terr then
		terr.WaterWaveSize     = originals.Terrain.WaterWaveSize or terr.WaterWaveSize
		terr.WaterReflectance  = originals.Terrain.WaterReflectance or terr.WaterReflectance
		terr.WaterTransparency = originals.Terrain.WaterTransparency or terr.WaterTransparency
		if originals.Terrain.Decoration ~= nil then
			pcall(function()
				terr.Decoration = originals.Terrain.Decoration
			end)
		end
	end
	for _, d in ipairs(Services.Workspace:GetDescendants()) do
		if d:GetAttribute("PerfWasEnabled") then
			d:SetAttribute("PerfWasEnabled", nil)
			if d.Enabled ~= nil then
				d.Enabled = true
			end
		end
	end
	originals = nil
end
Toggles.PerformanceMode:OnChanged(function()
	if Toggles.PerformanceMode.Value then
		perfOn()
	else
		perfOff()
	end
end)

                                                                -- == CHAT LOGGER == --
local function setChatUI(on)
	if join then
		join.Visible = not on
	end
	if chat then
		chat.Visible = on
	end
	if shade2 and shade3 and selectChat and selectJoin then
		local i = table.find(shade3, selectChat);
		if i then
			table.remove(shade3, i)
		end
		i = table.find(shade2, selectJoin);
		if i then
			table.remove(shade2, i)
		end
		if not table.find(shade2, selectChat) then
			table.insert(shade2, selectChat)
		end
		if not table.find(shade3, selectJoin) then
			table.insert(shade3, selectJoin)
		end
	end
	if selectJoin and currentShade3 then
		selectJoin.BackgroundColor3 = currentShade3
	end
	if selectChat and currentShade2 then
		selectChat.BackgroundColor3 = currentShade2
	end
	if logs and logs.TweenPosition then
		if on then
			logs:TweenPosition(UDim2.new(0, 0, 1, -265), "InOut", "Quart", 0.3, true)
		else
			logs:TweenPosition(UDim2.new(0, 0, 1, 0), "InOut", "Quart", 0.3, true)
		end
	end
end
UtilsGroup:AddToggle("ChatLogger", {
	Text = "Chat Logger",
	Default = false,
	Callback = function(v)
		setChatUI(v)
	end
})

                                                                                            -- == REMOVE KILLBRICKS == --
local killParts = {}
local function setKillBricks(enabled)
	if not enabled then
		for _, part in ipairs(killParts) do
			if part and part.Parent then
				part.CanTouch = true
				part.CanCollide = true
				part.Transparency = 0
			end
		end
		table.clear(killParts)
		return
	end
	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			local name = v.Name:lower()
			if name:find("kill") or name:find("lava") or name:find("damage") then
				v.CanTouch = false
				v.CanCollide = false
				v.Transparency = 0.5
				table.insert(killParts, v)
			end
		end
	end
end
UtilsGroup:AddToggle("RemoveKillBricks", {
	Text = "Remove KillBricks",
	Default = false,
	Tooltip = "Disable bricks that cause death/damage",
	Callback = function(v)
		setKillBricks(v)
	end
})

                                                                                        -- == MOD REACTS == --
local modSettings = {
	notify = false,
	leave = false
}
local function isStaff(plr)
	local ok, lvl = pcall(function()
		return plr:GetAttribute("AdminLevel")
	end)
	if ok and type(lvl) == "number" and lvl > 0 then
		return true
	end
	local a = plr:GetAttribute("IsAdmin") or plr:GetAttribute("Moderator") or plr:GetAttribute("Staff")
	if a == true then
		return true
	end
	return false
end
local function reactToStaff(plr)
	if not (modSettings.notify or modSettings.leave) then
		return
	end
	if not plr or plr == References.player then
		return
	end
	if not isStaff(plr) then
		return
	end
	if modSettings.notify then
		Library:Notify("Moderator joined: " .. plr.Name, 6)
	end
	if modSettings.leave then
		task.defer(function()
			local lp = References.player
			if lp and lp.Parent then
				Services.TeleportService:Teleport(game.PlaceId, lp)
			end
		end)
	end
end
local modConn = Services.Players.PlayerAdded:Connect(reactToStaff)
local function sweepExisting()
	if not (modSettings.notify or modSettings.leave) then
		return
	end
	for _, plr in ipairs(Services.Players:GetPlayers()) do
		reactToStaff(plr)
	end
end
UtilsGroup:AddToggle("ModNotifierToggle", {
	Text = "Mod Notifier",
	Default = false,
	Tooltip = "Notify when a moderator/staff joins",
	Callback = function(v)
		modSettings.notify = v
		if v then
			sweepExisting()
		end
	end
})
UtilsGroup:AddToggle("LeaveOnModToggle", {
	Text = "Leave If Mod Joins",
	Default = false,
	Tooltip = "Auto-leave the server if a moderator/staff joins",
	Callback = function(v)
		modSettings.leave = v
		if v then
			sweepExisting()
		end
	end
})

                                                                                                -- == QUICK RESET == --
UtilsGroup:AddButton({
	Text = "Quick Reset",
	Func = function()
		References.humanoid.Health = 0
	end,
})

                                                                                            -- == VISUAL PLAYER UTILS == --
local VisualsGroup = Tabs.Player:AddRightGroupbox("Visuals", "glasses")

                                                                                            -- == UNLIMITED CAM DISTANCE == --
VisualsGroup:AddToggle("InfiniteCamera", {
	Text = "Infinite Camera Max",
	Default = false,
})
local origCamMax
Toggles.InfiniteCamera:OnChanged(function()
	local plr = References.player
	if not plr then
		return
	end
	if Toggles.InfiniteCamera.Value then
		origCamMax = origCamMax or plr.CameraMaxZoomDistance
		plr.CameraMaxZoomDistance = 1e10
	else
		plr.CameraMaxZoomDistance = origCamMax or 128
		origCamMax = nil
	end
end)

                                                                                            -- == FULLBRIGHT == --
VisualsGroup:AddToggle("Fullbright", {
	Text = "Fullbright",
	Default = false,
	Tooltip = "Forces bright ambient lighting",
})
local fbConn, fbSaved
local function fbOn()
	if fbConn then
		return
	end
	fbSaved = fbSaved or {
		B = L.Brightness,
		GS = L.GlobalShadows,
		A = L.Ambient
	}
	fbConn = Services.RunService.RenderStepped:Connect(function()
		L.Brightness = 2
		L.GlobalShadows = false
		L.Ambient = Color3.new(1, 1, 1)
	end)
end
local function fbOff()
	if fbConn then
		fbConn:Disconnect();
		fbConn = nil
	end
	if fbSaved then
		L.Brightness = fbSaved.B
		L.GlobalShadows = fbSaved.GS
		L.Ambient = fbSaved.A
		fbSaved = nil
	end
end
Toggles.Fullbright:OnChanged(function()
	if Toggles.Fullbright.Value then
		fbOn()
	else
		fbOff()
	end
end)

                                                                                        -- == NO FOG == --
VisualsGroup:AddToggle("NoFog", {
	Text = "No Fog",
	Default = false,
	Tooltip = "Disables fog/atmospheric effects",
})
local nfConn, nfSaved
local function nfDisable(inst)
	if not nfSaved then
		return
	end
	if inst:IsA("BloomEffect") or inst:IsA("SunRaysEffect") or inst:IsA("DepthOfFieldEffect") or inst:IsA("ColorCorrectionEffect") or inst:IsA("BlurEffect") then
		if inst.Enabled then
			inst:SetAttribute("NFWasEnabled", true);
			inst.Enabled = false
		end
	elseif inst:IsA("Atmosphere") then
		if nfSaved.Atmo[inst] == nil then
			nfSaved.Atmo[inst] = {
				D = inst.Density,
				H = inst.Haze,
				O = inst.Offset,
				G = inst.Glare
			}
		end
		inst.Density = 0;
		inst.Haze = 0;
		inst.Glare = 0
	end
end
local function nfOn()
	if nfSaved then
		return
	end
	nfSaved = {
		FogEnd   = L.FogEnd,
		FogStart = L.FogStart,
		FogColor = L.FogColor,
		Atmo     = {},
	}
	L.FogEnd, L.FogStart = 1e10, 1e10
	for _, d in ipairs(L:GetDescendants()) do
		nfDisable(d)
	end
	nfConn = L.DescendantAdded:Connect(nfDisable)
end
local function nfOff()
	if not nfSaved then
		return
	end
	if nfConn then
		nfConn:Disconnect();
		nfConn = nil
	end
	L.FogEnd, L.FogStart, L.FogColor = nfSaved.FogEnd, nfSaved.FogStart, nfSaved.FogColor
	for _, d in ipairs(L:GetDescendants()) do
		if d:GetAttribute("NFWasEnabled") then
			d:SetAttribute("NFWasEnabled", nil)
			if d.Enabled ~= nil then
				d.Enabled = true
			end
		end
	end
	for atmo, vals in pairs(nfSaved.Atmo) do
		if atmo and atmo.Parent then
			atmo.Density, atmo.Haze, atmo.Offset, atmo.Glare = vals.D, vals.H, vals.O, vals.G
		end
	end
	nfSaved = nil
end
Toggles.NoFog:OnChanged(function()
	if Toggles.NoFog.Value then
		nfOn()
	else
		nfOff()
	end
end)

                                                                                                        -- == XRAY ==
VisualsGroup:AddToggle("XRay", {
	Text = "X-Ray",
	Default = false,
	Tooltip = "See through walls.",
})
local function setXRay(enabled)
	for _, v in ipairs(Services.Workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			if not v.Parent:FindFirstChildOfClass("Humanoid")
                                                                                                                and not (v.Parent.Parent and v.Parent.Parent:FindFirstChildOfClass("Humanoid")) then
				v.LocalTransparencyModifier = enabled and 0.5 or 0
			end
		end
	end
end
Toggles.XRay:OnChanged(function()
	setXRay(Toggles.XRay.Value)
end)

                                                                                                -- == FOV SLIDER == --
VisualsGroup:AddSlider("CameraFOV", {
	Text = "Camera FOV",
	Default = 70,
	Min = 40,
	Max = 120,
	Rounding = 0,
})
Options.CameraFOV:OnChanged(function()
	local cam = References.camera or Services.Workspace.CurrentCamera
	if cam then
		cam.FieldOfView = Options.CameraFOV.Value
	end
end)
do
	local cam = References.camera or Services.Workspace.CurrentCamera
	if cam then
		cam.FieldOfView = Options.CameraFOV.Value
	end
end

                                                                                                    -- ================= --
                                                                                                    -- ==== ESP TAB ==== --
                                                                                                    -- ================= --
local SENSE
local SENSE_URL = "https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/sense/main.lua"
local function getSENSE()
	if type(SENSE) == "table" then
		return SENSE
	end
	local ok, mod = pcall(function()
		return loadstring(game:HttpGet(SENSE_URL))()
	end)
	if ok and type(mod) == "table" then
		SENSE = mod
	end
	return SENSE
end
local function ensureLoaded()
	local m = getSENSE()
	if not m then
		return false
	end
	if not m._hasLoaded and m.Load then
		pcall(m.Load)
	end
	return true
end
local function playerOn()
	return Toggles.PESP_Enable and Toggles.PESP_Enable.Value
end
local function monsterOn()
	return Toggles.MESP_Enable and Toggles.MESP_Enable.Value
end
local function anyOn()
	return playerOn() or monsterOn()
end
local function maybeUnload()
	if anyOn() then
		return
	end
	local m = SENSE
	if m and m._hasLoaded and m.Unload then
		pcall(m.Unload)
	end
end

                                                                                                                -- ===== Universal =====
local Uni = Tabs.ESP:AddLeftGroupbox("Universal", "settings")
Uni:AddSlider  ("ESP_TextSize",     {
	Text = "Text Size",
	Default = 13,
	Min = 10,
	Max = 28,
	Rounding = 0
})
Uni:AddDropdown("ESP_TracerOrigin", {
	Text = "Tracer Origin",
	Values = {
		"Bottom",
		"Middle",
		"Top"
	},
	Default = "Bottom"
})
Uni:AddToggle  ("ESP_LimitRange",   {
	Text = "Limit Range",
	Default = false
})
Uni:AddSlider  ("ESP_MaxRange",     {
	Text = "Range (studs)",
	Default = 150,
	Min = 50,
	Max = 2000,
	Rounding = 0
})
local function pushShared()
	if not anyOn() then
		return
	end
	if not ensureLoaded() then
		return
	end
	local m = SENSE
	m.sharedSettings.textSize      = Options.ESP_TextSize.Value
	m.sharedSettings.limitDistance = Toggles.ESP_LimitRange.Value
	m.sharedSettings.maxDistance   = Options.ESP_MaxRange.Value
	local o = Options.ESP_TracerOrigin.Value
	m.teamSettings.enemy.tracerOrigin    = o
	m.teamSettings.friendly.tracerOrigin = o
	m.instanceSettings.tracerOrigin      = o
end
Options.ESP_TextSize:OnChanged(pushShared)
Options.ESP_TracerOrigin:OnChanged(pushShared)
Toggles.ESP_LimitRange:OnChanged(pushShared)
Options.ESP_MaxRange:OnChanged(pushShared)

                                                                                                                    -- ===== Player ESP =====
local PlayerEspGroupbox = Tabs.ESP:AddRightGroupbox("Player ESP", "users")
PlayerEspGroupbox:AddToggle  ("PESP_Enable", {
	Text = "Enable Player ESP",
	Default = false
})
PlayerEspGroupbox:AddDropdown("PESP_Side",   {
	Text = "Apply To",
	Values = {
		"Enemy",
		"Friendly",
		"Both"
	},
	Default = "Enemy"
})
PlayerEspGroupbox:AddToggle("PESP_Box", {
	Text = "Boxes",
	Default = true
})
                                                                                                                    :AddColorPicker("PESP_BoxColor", {
	Default = Color3.fromRGB(255, 60, 60),
	Title = "Box Color"
})
PlayerEspGroupbox:AddToggle("PESP_BoxOutline", {
	Text = "Box Outline",
	Default = true
})
PlayerEspGroupbox:AddToggle("PESP_BoxFill", {
	Text = "Box Fill",
	Default = false
})
PlayerEspGroupbox:AddSlider("PESP_BoxFillAlpha", {
	Text = "Fill Alpha",
	Default = 35,
	Min = 0,
	Max = 100,
	Rounding = 0
})
PlayerEspGroupbox:AddToggle("PESP_Name", {
	Text = "Names",
	Default = true
})
                                                                                                                    :AddColorPicker("PESP_NameColor", {
	Default = Color3.new(1, 1, 1),
	Title = "Name Color"
})
PlayerEspGroupbox:AddToggle("PESP_Distance", {
	Text = "Distance",
	Default = true
})
                                                                                                                    :AddColorPicker("PESP_DistColor", {
	Default = Color3.new(1, 1, 1),
	Title = "Distance Color"
})
PlayerEspGroupbox:AddToggle("PESP_HealthBar", {
	Text = "Health Bar",
	Default = true
})
PlayerEspGroupbox:AddToggle("PESP_Weapon",    {
	Text = "Weapon",
	Default = false
})
PlayerEspGroupbox:AddToggle("PESP_Tracer",    {
	Text = "Tracer",
	Default = true
})
                                                                                                                    :AddColorPicker("PESP_TracerColor", {
	Default = Color3.fromRGB(255, 60, 60),
	Title = "Tracer Color"
})
PlayerEspGroupbox:AddToggle("PESP_Chams",     {
	Text = "Chams",
	Default = false
})
local function sideKeys()
	local v = Options.PESP_Side.Value
	if v == "Both" then
		return {
			"enemy",
			"friendly"
		}
	end
	return {
		v:lower()
	}
end
local function setTeams(k, val)
	local m = SENSE
	for _, s in ipairs(sideKeys()) do
		m.teamSettings[s][k] = val
	end
end
local function colorTuple(opt, a)
	return {
		Options[opt].Value,
		a or 1
	}
end
local function applyPlayerLive()
	if not playerOn() then
		return
	end
	if not ensureLoaded() then
		return
	end
	local m = SENSE
	setTeams("enabled", true)
	setTeams("box",            Toggles.PESP_Box.Value)
	setTeams("boxOutline",     Toggles.PESP_BoxOutline.Value)
	setTeams("boxFill",        Toggles.PESP_BoxFill.Value)
	setTeams("boxColor",       colorTuple("PESP_BoxColor", 1))
	setTeams("boxOutlineColor", {
		Color3.new(),
		1
	})
	setTeams("boxFillColor",   {
		Options.PESP_BoxColor.Value,
		(Options.PESP_BoxFillAlpha.Value or 0) / 100
	})
	setTeams("name",           Toggles.PESP_Name.Value)
	setTeams("nameColor",      colorTuple("PESP_NameColor"))
	setTeams("distance",       Toggles.PESP_Distance.Value)
	setTeams("distanceColor",  colorTuple("PESP_DistColor"))
	setTeams("healthBar",      Toggles.PESP_HealthBar.Value)
	setTeams("weapon",         Toggles.PESP_Weapon.Value)
	setTeams("tracer",         Toggles.PESP_Tracer.Value)
	setTeams("tracerColor",    colorTuple("PESP_TracerColor"))
	setTeams("tracerOutline",  true)
	setTeams("chams",          Toggles.PESP_Chams.Value)
	pushShared()
end
Toggles.PESP_Enable:OnChanged(function()
	if Toggles.PESP_Enable.Value then
		if ensureLoaded() then
			local m = SENSE
			local side = Options.PESP_Side.Value
			m.teamSettings.enemy.enabled    = (side == "Enemy"   or side == "Both")
			m.teamSettings.friendly.enabled = (side == "Friendly" or side == "Both")
			applyPlayerLive()
		end
	else
		if SENSE then
			SENSE.teamSettings.enemy.enabled    = false
			SENSE.teamSettings.friendly.enabled = false
		end
		maybeUnload()
	end
end)
for _, idx in ipairs({
	"PESP_Side",
	"PESP_Box",
	"PESP_BoxOutline",
	"PESP_BoxFill",
	"PESP_Name",
	"PESP_Distance",
	"PESP_HealthBar",
	"PESP_Weapon",
	"PESP_Tracer",
	"PESP_Chams"
}) do
	(Toggles[idx] or Options[idx]):OnChanged(function()
		applyPlayerLive()
	end)
end
Options.PESP_BoxColor:OnChanged(applyPlayerLive)
Options.PESP_BoxFillAlpha:OnChanged(applyPlayerLive)
Options.PESP_NameColor:OnChanged(applyPlayerLive)
Options.PESP_DistColor:OnChanged(applyPlayerLive)
Options.PESP_TracerColor:OnChanged(applyPlayerLive)

                                                                                                                -- ===== MONSTER ESP =====
local MonsterESPGroupbox = Tabs.ESP:AddLeftGroupbox("Monster ESP", "user-cog")
MonsterESPGroupbox:AddToggle("MESP_Enable", {
	Text = "Enable Monster ESP",
	Default = false
})
MonsterESPGroupbox:AddToggle("MESP_Box", {
	Text = "Boxes",
	Default = true
})
                                                                                                                :AddColorPicker("MESP_BoxColor", {
	Default = Color3.fromRGB(255, 255, 0),
	Title = "Box Color"
})
MonsterESPGroupbox:AddToggle("MESP_BoxOutline", {
	Text = "Box Outline",
	Default = true
})
MonsterESPGroupbox:AddToggle("MESP_BoxFill", {
	Text = "Box Fill",
	Default = false
})
MonsterESPGroupbox:AddSlider("MESP_BoxFillAlpha", {
	Text = "Fill Alpha",
	Default = 25,
	Min = 0,
	Max = 100,
	Rounding = 0
})
MonsterESPGroupbox:AddToggle("MESP_Name", {
	Text = "Names",
	Default = true
})
                                                                                                                :AddColorPicker("MESP_NameColor", {
	Default = Color3.new(1, 1, 1),
	Title = "Name Color"
})
MonsterESPGroupbox:AddToggle("MESP_Distance", {
	Text = "Distance",
	Default = true
})
                                                                                                                :AddColorPicker("MESP_DistColor", {
	Default = Color3.new(1, 1, 1),
	Title = "Distance Color"
})
MonsterESPGroupbox:AddToggle("MESP_Tracer", {
	Text = "Tracer",
	Default = false
})
                                                                                                                :AddColorPicker("MESP_TracerColor", {
	Default = Color3.fromRGB(255, 255, 0),
	Title = "Tracer Color"
})
local function monsterFolder()
	return workspace:FindFirstChild("Debris") and workspace.Debris:FindFirstChild("Monsters")
end
local monsterAddConn, monsterRemConn
local function clearMonsters()
	if not SENSE then
		return
	end
	local f = monsterFolder();
	if not f then
		return
	end
	for _, inst in ipairs(f:GetChildren()) do
		SENSE.RemoveInstance(inst)
	end
end
local function scanMonsters()
	if not ensureLoaded() then
		return
	end
	local f = monsterFolder();
	if not f then
		return
	end
	local list = f:GetChildren()
	if #list > 0 then
		SENSE.AddInstances(list)
	end
end
local function watchMonsters(on)
	if on then
		local f = monsterFolder();
		if not f then
			return
		end
		if not monsterAddConn then
			monsterAddConn = f.ChildAdded:Connect(function(i)
				if monsterOn() and ensureLoaded() then
					SENSE.AddInstances({
						i
					})
				end
			end)
		end
		if not monsterRemConn then
			monsterRemConn = f.ChildRemoved:Connect(function(i)
				if SENSE then
					SENSE.RemoveInstance(i)
				end
			end)
		end
		scanMonsters()
	else
		if monsterAddConn then
			monsterAddConn:Disconnect();
			monsterAddConn = nil
		end
		if monsterRemConn then
			monsterRemConn:Disconnect();
			monsterRemConn = nil
		end
		clearMonsters()
	end
end
local function applyMonsterLive()
	if not monsterOn() then
		return
	end
	if not ensureLoaded() then
		return
	end
	local IS = SENSE.instanceSettings
	IS.enabled         = true
	IS.box             = Toggles.MESP_Box.Value
	IS.boxOutline      = Toggles.MESP_BoxOutline.Value
	IS.boxFill         = Toggles.MESP_BoxFill.Value
	IS.boxColor        = {
		Options.MESP_BoxColor.Value,
		1
	}
	IS.boxOutlineColor = {
		Color3.new(),
		1
	}
	IS.boxFillColor    = {
		Options.MESP_BoxColor.Value,
		(Options.MESP_BoxFillAlpha.Value or 0) / 100
	}
	IS.name            = Toggles.MESP_Name.Value
	IS.nameColor       = {
		Options.MESP_NameColor.Value,
		1
	}
	IS.distance        = Toggles.MESP_Distance.Value
	IS.distanceColor   = {
		Options.MESP_DistColor.Value,
		1
	}
	IS.tracer          = Toggles.MESP_Tracer.Value
	IS.tracerColor     = {
		Options.MESP_TracerColor.Value,
		1
	}
	pushShared()
end
Toggles.MESP_Enable:OnChanged(function()
	if Toggles.MESP_Enable.Value then
		if ensureLoaded() then
			SENSE.instanceSettings.enabled = true
			applyMonsterLive()
			watchMonsters(true)
		end
	else
		watchMonsters(false)
		if SENSE then
			SENSE.instanceSettings.enabled = false
		end
		maybeUnload()
	end
end)
for _, idx in ipairs({
	"MESP_Box",
	"MESP_BoxOutline",
	"MESP_BoxFill",
	"MESP_Name",
	"MESP_Distance",
	"MESP_Tracer"
}) do
	(Toggles[idx] or Options[idx]):OnChanged(applyMonsterLive)
end
Options.MESP_BoxColor:OnChanged(applyMonsterLive)
Options.MESP_BoxFillAlpha:OnChanged(applyMonsterLive)
Options.MESP_NameColor:OnChanged(applyMonsterLive)
Options.MESP_DistColor:OnChanged(applyMonsterLive)
Options.MESP_TracerColor:OnChanged(applyMonsterLive)
pushShared()

                                                                                                                                        -- ================== --
                                                                                                                                        -- ==== AUTO TAB ==== --
                                                                                                                                        -- ================== --

                                                                                                                                        -- ==== QUEST AUTO ACCEPT / COMPLETE ====
local QuestGroupbox = Tabs.Auto:AddLeftGroupbox("Auto Quest", "scroll")
local QA_running, QC_running, RU_running = false, false, false
local function run_every_60s(running_ref, work)
	task.spawn(function()
		while running_ref() do
			local t0 = os.clock()
			work()
			local elapsed = os.clock() - t0
			local wait_left = 60 - elapsed
			if wait_left > 0 then
				local t = wait_left
				while running_ref() and t > 0 do
					local slice = math.min(t, 0.1)
					task.wait(slice)
					t -= slice
				end
			end
		end
	end)
end

                                                                                                                                -- === Auto Accept ===
QuestGroupbox:AddToggle("QA_Enable", {
	Text = "Auto Accept Quests",
	Default = false,
	Callback = function(on)
		QA_running = false
		if not on then
			return
		end
		QA_running = true
		local perIdDelay  = 0.02
		run_every_60s(function()
			return QA_running
		end, function()
			for id = 1, 50 do
				if not QA_running then
					break
				end
				ToServer:FireServer({
					Id = tostring(id),
					Type = "Accept",
					Action = "_Quest"
				})
				task.wait(perIdDelay)
			end
		end)
	end
})

                                                                                                                                -- === Auto Complete ===
QuestGroupbox:AddToggle("QC_Enable", {
	Text = "Auto Complete Quests",
	Default = false,
	Callback = function(on)
		QC_running = false
		if not on then
			return
		end
		QC_running = true
		local perIdDelay  = 0.02
		run_every_60s(function()
			return QC_running
		end, function()
			for id = 1, 50 do
				if not QC_running then
					break
				end
				ToServer:FireServer({
					Id = tostring(id),
					Type = "Complete",
					Action = "_Quest"
				})
				task.wait(perIdDelay)
			end
		end)
	end
})

                                                                                                                                -- === Auto Rank Up ===
QuestGroupbox:AddToggle("RU_Enable", {
	Text = "Auto Rank Up",
	Default = false,
	Callback = function(on)
		RU_running = false
		if not on then
			return
		end
		RU_running = true
		run_every_30s(function()
			return RU_running
		end, function()
			local args = {
				{
					Upgrading_Name = "Rank",
					Action = "_Upgrades",
					Upgrade_Name = "Rank_Up"
				}
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("To_Server"):FireServer(unpack(args))
		end)
	end
})

                                                                                                                            -- == AUTOFARM MONSTERS ==
local _att = {
	on        = false,
	conn      = nil,
	offY      = -10,
	lastDest  = nil,
	lastIssue = 0,
	recalcCD  = 0.01,
	tgt       = nil,
	lostAt    = nil,
	tgtHum        = nil,
	tgtDiedConn   = nil,
	tgtAncConn    = nil,
	tgtHrpConn    = nil,
}
local HYSTERESIS   = 0.5
local GRACE_SEC    = 0.8
local MIN_SAFE_Y   = math.max((workspace.FallenPartsDestroyHeight or -500) + 50, -100)
local function monstersFolder()
	local d = workspace:FindFirstChild("Debris")
	return d and d:FindFirstChild("Monsters") or nil
end
local function isVec3(v)
	return typeof(v) == "Vector3" and v.X == v.X and v.Y == v.Y and v.Z == v.Z
end
local function hrpOf(m)
	return m and m:IsA("Model") and m:FindFirstChild("HumanoidRootPart") or nil
end
local function alive(m)
	if not (m and m:IsA("Model") and m.Parent) then
		return false
	end
	local h = m:FindFirstChildOfClass("Humanoid")
	local hrp = hrpOf(m)
	return h and h.Health > 0 and hrp and hrp:IsA("BasePart") and isVec3(hrp.Position)
end
local function trulyDead(m)
	if not (m and m:IsA("Model")) then
		return true
	end
	local h = m:FindFirstChildOfClass("Humanoid")
	return (not h) or h.Health <= 0
end
local function titleOf(m)
	local ok, t = pcall(function()
		return m:GetAttribute("Title")
	end)
	return ok and typeof(t) == "string" and t ~= "" and t or nil
end
local function d2(a, b)
	local dx, dy, dz = a.X - b.X, a.Y - b.Y, a.Z - b.Z
	return dx * dx + dy * dy + dz * dz
end
local function desiredHoverPoint(m, offY)
	local hrp = hrpOf(m);
	if not hrp then
		return nil
	end
	local p = hrp.Position + Vector3.new(0, offY or 0, 0)
	if not isVec3(p) then
		return nil
	end
	if p.Y < MIN_SAFE_Y then
		p = Vector3.new(p.X, MIN_SAFE_Y, p.Z)
	end
	return p
end
local function clampSafe(dest, lastDest)
	if not dest then
		return lastDest
	end
	if dest.Y < MIN_SAFE_Y then
		dest = Vector3.new(dest.X, MIN_SAFE_Y, dest.Z)
	end
	return dest
end
local function clearWatch()
	if _att.tgtDiedConn then
		_att.tgtDiedConn:Disconnect();
		_att.tgtDiedConn = nil
	end
	if _att.tgtAncConn  then
		_att.tgtAncConn:Disconnect();
		_att.tgtAncConn  = nil
	end
	if _att.tgtHrpConn  then
		_att.tgtHrpConn:Disconnect();
		_att.tgtHrpConn  = nil
	end
	_att.tgtHum = nil
end
local function forceImmediateRecalc()
	_att.lastIssue = 0
end
local function watchTarget(m)
	clearWatch()
	if not (m and m:IsA("Model")) then
		return
	end
	local h = m:FindFirstChildOfClass("Humanoid");
	if not h then
		return
	end
	_att.tgtHum = h
	_att.tgtDiedConn = h.Died:Connect(function()
		_att.tgt = nil
		_att.lostAt = nil
		forceImmediateRecalc()
	end)
	_att.tgtAncConn = m.AncestryChanged:Connect(function(_, parent)
		if not parent then
			_att.tgt = nil
			_att.lostAt = nil
			forceImmediateRecalc()
		end
	end)
	local hrp = hrpOf(m)
	if hrp then
		_att.tgtHrpConn = hrp:GetPropertyChangedSignal("Parent"):Connect(function()
			if not hrp.Parent then
				_att.tgt = nil
				_att.lostAt = nil
				forceImmediateRecalc()
			end
		end)
	end
end
local function chooseTarget(rootPos, selectedSet, current)
	local now = os.clock()
	local f = monstersFolder();
	if not f then
		return current
	end
	if current and trulyDead(current) then
		current = nil
		_att.lostAt = nil
	end
	local curAlive = alive(current)
	local curD2 = math.huge
	if curAlive then
		local hp = hrpOf(current)
		curD2 = hp and d2(hp.Position, rootPos) or math.huge
		_att.lostAt = nil
	elseif current then
		_att.lostAt = _att.lostAt or now
		if now - _att.lostAt <= GRACE_SEC then
			return current
		else
			current, _att.lostAt = nil, nil
		end
	end
	local haveSel = false
	for _, v in pairs(selectedSet) do
		if v then
			haveSel = true
			break
		end
	end
	local best, bestD2
	for _, m in ipairs(f:GetChildren()) do
		if m:IsA("Model") and alive(m) then
			local okSel = not haveSel
			if not okSel then
				local t = titleOf(m);
				okSel = t and selectedSet[t] or false
			end
			if okSel or m == current then
				local hp = hrpOf(m)
				if hp then
					local d2m = d2(hp.Position, rootPos)
					if not bestD2 or d2m < bestD2 then
						best, bestD2 = m, d2m
					end
				end
			end
		end
	end
	if current and curD2 < math.huge then
		local needBetter = best and best ~= current and (bestD2 + HYSTERESIS * HYSTERESIS) < curD2
		return needBetter and best or current
	end
	return best or current
end
local AP = {
	root = nil,
	att0 = nil,
	ap = nil,
	goalPart = nil,
	att1 = nil
}
local function ensureAP(root)
	if not root then
		return
	end
	if not (AP.att0 and AP.att0.Parent == root) then
		if AP.att0 then
			pcall(function()
				AP.att0:Destroy()
			end)
		end
		local a0 = Instance.new("Attachment")
		a0.Name = "AFM_Att0"
		a0.Parent = root
		AP.att0 = a0
	end
	if not (AP.goalPart and AP.goalPart.Parent) then
		if AP.goalPart then
			pcall(function()
				AP.goalPart:Destroy()
			end)
		end
		local p = Instance.new("Part")
		p.Name = "AFM_Goal"
		p.Size = Vector3.new(0.2, 0.2, 0.2)
		p.Transparency = 1
		p.Anchored = true
		p.CanCollide = false
		p.CanQuery = false
		p.CanTouch = false
		p.Parent = workspace
		AP.goalPart = p
		local a1 = Instance.new("Attachment")
		a1.Name = "AFM_Att1"
		a1.Parent = p
		AP.att1 = a1
	elseif not (AP.att1 and AP.att1.Parent == AP.goalPart) then
		if AP.att1 then
			pcall(function()
				AP.att1:Destroy()
			end)
		end
		local a1 = Instance.new("Attachment")
		a1.Name = "AFM_Att1"
		a1.Parent = AP.goalPart
		AP.att1 = a1
	end
	if not (AP.ap and AP.ap.Parent == root) then
		if AP.ap then
			pcall(function()
				AP.ap:Destroy()
			end)
		end
		local ap = Instance.new("AlignPosition")
		ap.Name = "AFM_AP"
		ap.Attachment0 = AP.att0
		ap.Attachment1 = AP.att1
		ap.ApplyAtCenterOfMass = true
		ap.Responsiveness = 200
		ap.MaxForce = 1e9
		ap.RigidityEnabled = false
		ap.Parent = root
		AP.ap = ap
	end
	AP.root = root
end
local function moveTo(dest)
	if not (AP.goalPart and isVec3(dest)) then
		return
	end
	AP.goalPart.CFrame = CFrame.new(dest)
	_att.lastDest = dest
end

                                                                                                                                        -- =========================
                                                                                                                                        -- AutoQuest integration
                                                                                                                                        -- =========================
local AutoQuest = {
	on = false,
	conn = nil,
	target = nil,         -- parsed monster name, e.g. "Usup"
	lastState = "idle",   -- "idle" | "ok" | "missing" | "parsefail"
}
local function tryFindQuestTitle()
	local pg = Services.Players.LocalPlayer:FindFirstChild("PlayerGui")
	if not pg then
		return nil
	end
	local qs = pg:FindFirstChild("Quests_Screen")
	if not qs then
		return nil
	end
	local side = qs:FindFirstChild("Quest_Side_Menu")
	if not side then
		return nil
	end
	local quests = side:FindFirstChild("Quests")
	if not quests then
		return nil
	end
	local main = quests:FindFirstChild("Main")
	if not main then
		return nil
	end
	local list = main:FindFirstChild("List")
	if not list then
		return nil
	end
	local first = list:FindFirstChild("1")
	if not first then
		return nil
	end
	return first:FindFirstChild("Title")
end
local function parseQuestMonster(text)
	if type(text) ~= "string" or text == "" then
		return nil
	end
	local name = text:match("^%s*Defeat%s+(.+)$") or text
	name = name:gsub("%s*%b()", ""):gsub("%s+$", "")
	if name == "" then
		return nil
	end
	return name
end
local function setAutoQuestTarget(newName, state)
	AutoQuest.target = newName
	AutoQuest.lastState = state
end
local function maybeNotifyOnce(state, detail)
	AutoQuest._lastNotified = AutoQuest._lastNotified or ""
	if state ~= AutoQuest._lastNotified then
		AutoQuest._lastNotified = state
		if Library and Library.Notify then
			if state == "ok" and newName and detail then
				Library:Notify(("AutoQuest: targeting '%s'"):format(detail), 3)
			elseif state == "missing" then
				Library:Notify("AutoQuest: quest UI not found – using manual selection.", 4)
			elseif state == "parsefail" then
				Library:Notify("AutoQuest: couldn't parse quest target – using manual selection.", 4)
			end
		end
	end
end
local function scanQuestTarget()
	local titleObj = tryFindQuestTitle()
	if not titleObj then
		setAutoQuestTarget(nil, "missing")
		maybeNotifyOnce("missing")
		return
	end
	local txt = titleObj.Text or titleObj.Value
	local name = parseQuestMonster(txt)
	if not name then
		setAutoQuestTarget(nil, "parsefail")
		maybeNotifyOnce("parsefail")
		return
	end
	local prev = AutoQuest.target
	setAutoQuestTarget(name, "ok")
	if prev ~= name then
		maybeNotifyOnce("ok", name)
	end
end
local function startAutoQuest()
	if AutoQuest.conn then
		return
	end
	scanQuestTarget()
	AutoQuest.conn = Services.RunService.Heartbeat:Connect(function(dt)
                                                                                                                                                            -- rescan every ~3 seconds
		AutoQuest._acc = (AutoQuest._acc or 0) + dt
		if AutoQuest._acc >= 3 then
			AutoQuest._acc = 0
			scanQuestTarget()
		end
	end)
end
local function stopAutoQuest()
	if AutoQuest.conn then
		AutoQuest.conn:Disconnect();
		AutoQuest.conn = nil
	end
	setAutoQuestTarget(nil, "idle")
	AutoQuest._lastNotified = ""
end

                                                                                                                                                    -- =========================
local function startAttach()
	if _att.conn then
		return
	end
	local acc = 0
	_att.conn = Services.RunService.Heartbeat:Connect(function(dt)
		if not _att.on then
			return
		end
		local root = References.humanoidRootPart
		if not (root and isVec3(root.Position)) then
			return
		end
		acc += dt;
		if acc < _att.recalcCD then
			return
		end
		acc = 0
		ensureAP(root)

                                                                                                                                                                    -- Build the selected set with overrides:
                                                                                                                                                                    -- Priority: AllMonsters > AutoQuest > Manual selection
		local selectedSet = {}
		if Toggles.Attach_AllMonsters and Toggles.Attach_AllMonsters.Value then
                                                                                                                                                                        -- leave selectedSet empty so chooseTarget treats it as "no filter" (all monsters)
		elseif Toggles.Attach_AutoQuest and Toggles.Attach_AutoQuest.Value and AutoQuest.target then
			selectedSet[AutoQuest.target] = true
		else
			local selVal = Options.Attach_MonsterGroups and Options.Attach_MonsterGroups.Value or {}
			for k, v in pairs(selVal) do
				if v then
					selectedSet[k] = true
				end
			end
		end
		local prev = _att.tgt
		_att.tgt = chooseTarget(root.Position, selectedSet, _att.tgt)
		if _att.tgt ~= prev then
			watchTarget(_att.tgt)
		end
		local dest = desiredHoverPoint(_att.tgt, _att.offY)
		dest = clampSafe(dest or _att.lastDest, _att.lastDest)
		if not dest then
			return
		end
		moveTo(dest)
	end)
end
local function stopAttach()
	_att.on = false
	if _att.conn then
		_att.conn:Disconnect();
		_att.conn = nil
	end
	_att.tgt, _att.lostAt = nil, nil
	clearWatch()
	if AP.ap then
		pcall(function()
			AP.ap:Destroy()
		end);
		AP.ap = nil
	end
	if AP.att0 then
		pcall(function()
			AP.att0:Destroy()
		end);
		AP.att0 = nil
	end
	if AP.att1 then
		pcall(function()
			AP.att1:Destroy()
		end);
		AP.att1 = nil
	end
	if AP.goalPart then
		pcall(function()
			AP.goalPart:Destroy()
		end);
		AP.goalPart = nil
	end
	AP.root = nil
	_att.lastDest = nil
end
_G.stopAttach = stopAttach
local AutoFarmMonsterGroupbox = Tabs.Auto:AddRightGroupbox("AutoFarm Monsters", "skull")
AutoFarmMonsterGroupbox:AddLabel("If you want to go underground, make sure you turn on NoClip in the Player tab. To start killing the mobs, turn on KillAura+.", true)
local function monsterGroupValues()
	local f = monstersFolder();
	if not f then
		return {}
	end
	local seen, out = {}, {}
	for _, m in ipairs(f:GetChildren()) do
		if m:IsA("Model") and alive(m) then
			local t = titleOf(m)
			if t and not seen[t] then
				seen[t] = true;
				out[#out + 1] = t
			end
		end
	end
	table.sort(out);
	return out
end
AutoFarmMonsterGroupbox:AddDropdown("Attach_MonsterGroups", {
	Text = "Monster Types",
	Values = monsterGroupValues(),
	Default = 1,
	Multi = true,
	Searchable = true,
})
AutoFarmMonsterGroupbox:AddButton("Refresh Monsters", function()
	Options.Attach_MonsterGroups:SetValues(monsterGroupValues())
end)
AutoFarmMonsterGroupbox:AddSlider("Attach_OffY", {
	Text = "Vertical Offset",
	Min = -50,
	Max = 50,
	Rounding = 0,
	Default = _att.offY,
	Callback = function(v)
		_att.offY = v
	end,
})
AutoFarmMonsterGroupbox:AddLabel("AutoQuest will override the selected mob to always be the mob from your current quest. All Monsters overrides everything and targets any mob.", true)
AutoFarmMonsterGroupbox:AddToggle("Attach_AutoQuest", {
	Text = "AutoQuest",
	Default = false,
	Callback = function(on)
		AutoQuest.on = on
		if on then
			startAutoQuest()
		else
			stopAutoQuest()
		end
	end
})

                                                                                                                                                                                    -- NEW: All-monsters override (highest priority)
AutoFarmMonsterGroupbox:AddToggle("Attach_AllMonsters", {
	Text = "All Monsters",
	Default = false,
	Tooltip = "When enabled, ignores your selections and targets any monster.",
})
AutoFarmMonsterGroupbox:AddToggle("Attach_Monsters", {
	Text = "AutoFarm Monsters",
	Default = false,
	Callback = function(on)
		if on then
			_att.on = true
			startAttach()
		else
			stopAttach()
		end
	end
})

                                                                                                                                                                                -- ==== KILL AURA ====
local KillAuraGroupbox = Tabs.Auto:AddLeftGroupbox("KillAura+", "sword")
local KAconn
KillAuraGroupbox:AddToggle("ATC_Enable", {
	Text = "KillAura+",
	Default = false,
	Callback = function(on)
		if KAconn then
			if KAconn.Connected then
				KAconn:Disconnect()
			end
			KAconn = nil
		end
		if not on then
			return
		end
		local acc = 0
		KAconn = Services.RunService.Heartbeat:Connect(function(dt)
			acc += dt
			if acc < 0.01 then
				return
			end
			acc = 0
			local debris = workspace:FindFirstChild("Debris");
			if not debris then
				return
			end
			local folder = debris:FindFirstChild("Monsters");
			if not folder then
				return
			end
			local r = References.humanoidRootPart.Position
			local best, bestD2
			for _, m in ipairs(folder:GetChildren()) do
				if m:IsA("Model") then
					local pos
					local ok, cf = pcall(m.GetPivot, m)
					if ok and typeof(cf) == "CFrame" then
						pos = cf.Position
					else
						local bp = m:FindFirstChild("HumanoidRootPart") or m:FindFirstChildWhichIsA("BasePart")
						pos = bp and bp.Position
					end
					if pos then
						local dx, dy, dz = pos.X - r.X, pos.Y - r.Y, pos.Z - r.Z
						local d2 = dx * dx + dy * dy + dz * dz
						if not bestD2 or d2 < bestD2 then
							best, bestD2 = m, d2
						end
					end
				end
			end
			if best then
				ToServer:FireServer({
					Id = best.Name,
					Action = "_Mouse_Click"
				})
			end
		end)
	end
})

                                                                                                                                                                                                -- === POTIONS ===
local PotionsGroupbox = Tabs.Auto:AddLeftGroupbox("Potions", "flask-conical")
local InventoryRemote = Services.ReplicatedStorage:WaitForChild("Events"):WaitForChild("Inventory")
local function getInventoryList()
	local pg   = References.player and References.player:FindFirstChild("PlayerGui");
	if not pg then
		return nil
	end
	local inv  = pg:FindFirstChild("Inventory_1");
	if not inv  then
		return nil
	end
	local hub  = inv:FindFirstChild("Hub");
	if not hub  then
		return nil
	end
	local res  = hub:FindFirstChild("Resources");
	if not res  then
		return nil
	end
	local lfrm = res:FindFirstChild("List_Frame");
	if not lfrm then
		return nil
	end
	local list = lfrm:FindFirstChild("List");
	return list
end
local function parseAmount(val)
	local s = tostring(val or "")
	local cleaned = s:gsub("%D+", "")
	if cleaned == "" then
		return nil
	end
	return tonumber(cleaned)
end
local potionIndexMap = {}
local function collectPotions()
	table.clear(potionIndexMap)
	local out, list = {}, getInventoryList()
	if not list then
		return out
	end
	for _, slot in ipairs(list:GetChildren()) do
		if slot:IsA("Frame") or slot:IsA("ImageButton") or slot:IsA("ImageLabel") then
			local idx = slot.Name
			local inside = slot:FindFirstChild("Inside")
			if inside then
				local title  = inside:FindFirstChild("Title")
				local amount = inside:FindFirstChild("Amount")
				local name   = title and (title.Text or title.Value) or ""
				local amtStr = amount and (amount.Text or amount.Value) or "0"
				if typeof(name) == "string" and name:lower():find("potion") then
					local num = parseAmount(amtStr) or 0
					local label = string.format("%dx %s", num, name)
					potionIndexMap[label] = idx
					table.insert(out, label)
				end
			end
		end
	end
	table.sort(out)
	return out
end
local potionDD = PotionsGroupbox:AddDropdown("Potion_Select", {
	Text = "Select Potions",
	Values = {},
	Default = 1,
	Multi = true,
	Searchable = true,
	Tooltip = "Select which potions to auto-use",
})
PotionsGroupbox:AddSlider("Potion_IntervalMin", {
	Text = "Interval (minutes)",
	Default = 15,
	Min = 1,
	Max = 20,
	Rounding = 0,
	Suffix = "m",
	Tooltip = "How often to use selected potions",
})
PotionsGroupbox:AddSlider("Potion_Amount", {
	Text = "Amount per use",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 0,
	Tooltip = "How many to use each time",
})
local function refreshPotions()
	local vals = collectPotions()
	potionDD:SetValues(vals)
	Library:Notify(#vals > 0 and ("Found %d potions."):format(#vals) or "No potions found.", 2)
end
PotionsGroupbox:AddButton("Refresh", refreshPotions)
refreshPotions()
local potionsRunning = false
local function waitInterruptible(seconds, check)
	local t = seconds
	while t > 0 and check() do
		local slice = math.min(0.1, t)
		task.wait(slice)
		t -= slice
	end
end
PotionsGroupbox:AddToggle("Potion_AutoUse", {
	Text = "AutoUse Selected Potions",
	Default = false,
	Callback = function(on)
		potionsRunning = false
		if not on then
			return
		end
		potionsRunning = true
		task.spawn(function()
			while potionsRunning do
				local sel = (Options.Potion_Select and Options.Potion_Select.Value) or {}
				local intervalMin = (Options.Potion_IntervalMin and Options.Potion_IntervalMin.Value) or 15
				local amountEach  = (Options.Potion_Amount and Options.Potion_Amount.Value) or 1
				local labels = potionDD and potionDD.Values or {}
				local chosen = {}
				for _, label in ipairs(labels) do
					if sel[label] then
						table.insert(chosen, label)
					end
				end
				if #chosen == 0 then
					waitInterruptible(1.0, function()
						return potionsRunning
					end)
				else
					for _, label in ipairs(chosen) do
						if not potionsRunning then
							break
						end
						local idx = potionIndexMap[label]
						if idx then
							local args = {
								{
									Selected = {
										tostring(idx)
									},
									Action   = "Use",
									Amount   = amountEach
								}
							}
							InventoryRemote:FireServer(unpack(args))
							task.wait(0.2)
						end
					end
					waitInterruptible((intervalMin or 15) * 60, function()
						return potionsRunning
					end)
				end
			end
		end)
	end
})
PotionsGroupbox:AddButton({
	Text = "Pause/Unpause All Potions",
	Func = function()
		local names = {
			"Luck_Potion",
			"Exp_Potion",
			"Damage_Potion",
			"Drop_Potion",
			"Coins_Potion",
			"Energy_Potion",
		}
		for _, n in ipairs(names) do
			ToServer:FireServer({
				Action = "_Pause_Buff",
				Name   = n
			})
			task.wait(0.3)
		end
		if Library and Library.Notify then
			Library:Notify("Paused all potion buffs.", 3)
		end
	end
})

                                                                                                                                                                                                        -- ==== AUTO DUNGEON JOIN ====
local DungeonGroupbox = Tabs.Auto:AddRightGroupbox("Auto Dungeon Join", "shield")
local DUNGEON_DISPLAY = {
	"Dungeon Easy",
	"Dungeon Medium",
	"Dungeon Hard",
	"Dungeon Insane",
	"Dungeon Crazy",
	"Dungeon Nightmare",
	"Leaf Raid",
}
local DISPLAY_TO_REMOTE = {
	["Dungeon Easy"]      = "Dungeon_Easy",
	["Dungeon Medium"]    = "Dungeon_Medium",
	["Dungeon Hard"]      = "Dungeon_Hard",
	["Dungeon Insane"]    = "Dungeon_Insane",
	["Dungeon Crazy"]     = "Dungeon_Crazy",
	["Dungeon Nightmare"] = "Dungeon_Nightmare",
	["Leaf Raid"]         = "Leaf_Raid",
}

                                                                                                                                                                                                        -- Multi-select which dungeon types to auto-join
DungeonGroupbox:AddDropdown("Dungeon_Join_List", {
	Text = "Dungeons to Auto-Join",
	Values = DUNGEON_DISPLAY,
	Default = 1,
	Multi = true,
	Searchable = true,
})

                                                                                                                                                                                                        -- helper: get the current dungeon announcement label (if exists)
local function getDungeonLabel()
	local pg = Services.Players.LocalPlayer:FindFirstChild("PlayerGui")
	if not pg then
		return nil
	end
	local d = pg:FindFirstChild("Dungeon")
	if not d then
		return nil
	end
	local note = d:FindFirstChild("Dungeon_Notification")
	if not note then
		return nil
	end
	return note:FindFirstChild("TextLabel")
end

                                                                                                                                                                                                                -- helper: parse rich text and extract the dungeon name before " is starting"
local function extractDungeonName()
	local lbl = getDungeonLabel()
	if not (lbl and (lbl.Text or lbl.ContentText)) then
		return nil
	end

                                                                                                                                                                                                                    -- strip rich text tags
	local raw = lbl.ContentText or lbl.Text or ""
	local clean = tostring(raw):gsub("<.->", "") -- remove <font ...> etc.

                                                                                                                                                                                                                    -- e.g. "Dungeon Hard is starting! Ready to dive in?"
	local name = clean:match("^%s*(.-)%s+is starting")
	if not name then
		return nil
	end
	name = name:gsub("^%s+", ""):gsub("%s+$", "") -- trim

                                                                                                                                                                                                                        -- only accept known values
	if DISPLAY_TO_REMOTE[name] then
		return name
	end
	return nil
end
local DungeonJoinRunning = false
DungeonGroupbox:AddToggle("Dungeon_Join_Enable", {
	Text = "Auto-Join Selected Dungeons",
	Default = false,
	Callback = function(on)
		DungeonJoinRunning = false
		if not on then
			return
		end
		DungeonJoinRunning = true
		task.spawn(function()
			local cooldown = {}
			while DungeonJoinRunning do
				local picked = (Options.Dungeon_Join_List and Options.Dungeon_Join_List.Value) or {}
				local name = extractDungeonName()
				if name and picked[name] then
					local remoteName = DISPLAY_TO_REMOTE[name]
					local now = os.clock()
					if remoteName and (not cooldown[remoteName] or (now - cooldown[remoteName] > 5)) then
						ToServer:FireServer({
							Action = "_Enter_Dungeon",
							Name   = remoteName
						})
						cooldown[remoteName] = now
						local wakeAt = os.clock() + 180
						while DungeonJoinRunning and os.clock() < wakeAt do
							task.wait(0.1)
						end
					end
				end
				task.wait(2.0)
			end
		end)
	end
})

                                                                                                                                                                                                                -- ================== --
                                                                                                                                                                                                                -- ==== MISC TAB ==== --
                                                                                                                                                                                                                -- ================== --

                                                                                                                                                                                                                -- == SERVER PANEL == --
local ServerGroupbox = Tabs.Misc:AddLeftGroupbox("Server Panel", "server")
local PID, JID, LP = game.PlaceId, game.JobId, References.player
ServerGroupbox:AddButton({
	Text = "Rejoin Server",
	Func = function()
		if PID and JID and LP then
			Services.TeleportService:TeleportToPlaceInstance(PID, JID, LP)
		else
			Library:Notify("Rejoin failed: missing ids", 4)
		end
	end
})
local function fetch(cursor)
	local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100%s")
                                                                                                                                                                                                            :format(PID, cursor and ("&cursor=" .. Services.HttpService:UrlEncode(cursor)) or "")
	local ok, res = pcall(function()
		return Services.HttpService:JSONDecode(game:HttpGet(url))
	end)
	return ok and res or nil
end
ServerGroupbox:AddButton({
	Text = "Join Random Server",
	Func = function()
		local cursor = nil
		for _ = 1, 5 do
			local res = fetch(cursor)
			if not res or not res.data then
				break
			end
			local candidates = {}
			for _, sv in ipairs(res.data) do
				if sv.id ~= JID and sv.playing < sv.maxPlayers then
					table.insert(candidates, sv)
				end
			end
			if #candidates > 0 then
				local pick = candidates[math.random(1, #candidates)]
				return Services.TeleportService:TeleportToPlaceInstance(PID, pick.id, LP)
			end
			cursor = res.nextPageCursor
			if not cursor then
				break
			end
		end
		Library:Notify("Couldn't find an available server.", 5)
	end
})
ServerGroupbox:AddButton({
	Text = "Join Lowest Server",
	Func = function()
		local cursor, best, count = nil, nil, math.huge
		for _ = 1, 6 do
			local res = fetch(cursor);
			if not res or not res.data then
				break
			end
			for _, sv in ipairs(res.data) do
				if sv.id ~= JID and sv.playing < sv.maxPlayers and sv.playing < count then
					best, count = sv, sv.playing
				end
			end
			cursor = res.nextPageCursor;
			if not cursor then
				break
			end
		end
		if best then
			Services.TeleportService:TeleportToPlaceInstance(PID, best.id, LP)
		else
			Library:Notify("No suitable server with fewer players.", 5)
		end
	end
})
ServerGroupbox:AddButton({
	Text = "Copy Join Script",
	Func = function()
		local s = ("local TS=game:GetService('TeleportService')\nTS:TeleportToPlaceInstance(%d,%q,game.Players.LocalPlayer)\n"):format(PID, JID)
		if setclipboard then
			pcall(setclipboard, s)
			Library:Notify("Copied current-server join snippet.", 4)
		else
			Library:Notify("Clipboard not available.", 4)
		end
	end
})

                                                                                                                                                                                                            -- == ENVIROMENT == --
local EnviromentGroup = Tabs.Misc:AddRightGroupbox("Environment", "trees")
local ambientOn, ambientColor = false, Color3.fromRGB(128, 128, 128)
local ambientOrig = Services.Lighting and Services.Lighting.Ambient or Color3.new()
local timeLocked, timeValue, timeConn = false, (Services.Lighting and Services.Lighting.ClockTime or 12), nil
local function applyAmbient()
	if Services.Lighting then
		Services.Lighting.Ambient = ambientOn and ambientColor or ambientOrig
	end
end
EnviromentGroup:AddToggle("ENV_Ambient", {
	Text = "Custom Ambient",
	Default = false,
	Callback = function(v)
		ambientOn = v;
		applyAmbient()
	end
})
EnviromentGroup:AddLabel("Ambient Color"):AddColorPicker("ENV_AmbientColor", {
	Default = ambientColor,
	Title = "Ambient Color",
	Callback = function(c)
		ambientColor = c;
		if ambientOn then
			applyAmbient()
		end
	end
})
EnviromentGroup:AddToggle("ENV_TimeLock", {
	Text = "Custom Time of Day",
	Default = false,
	Callback = function(on)
		timeLocked = on
		if on then
			if Services.Lighting then
				Services.Lighting.ClockTime = timeValue
			end
			if not timeConn then
				timeConn = Services.RunService.RenderStepped:Connect(function()
					if Services.Lighting then
						Services.Lighting.ClockTime = timeValue
					end
				end)
			end
			Library:Notify("Time of Day locked.", 3)
		else
			if timeConn then
				timeConn:Disconnect();
				timeConn = nil
			end
			Library:Notify("Time of Day unlocked.", 3)
		end
	end
})
EnviromentGroup:AddSlider("ENV_Time", {
	Text = "Time of Day",
	Default = timeValue,
	Min = 0,
	Max = 24,
	Rounding = 2,
	Suffix = "h",
	Callback = function(v)
		timeValue = v;
		if timeLocked and L then
			L.ClockTime = v
		end
	end
})
function stopEnvironment()
	if timeConn then
		timeConn:Disconnect();
		timeConn = nil
	end
	if Services.Lighting then
		Services.Lighting.Ambient = ambientOrig
	end
end

                                                                                                                                                                                                                                -- == SPECTATE ==
local SpectateGroupbox = Tabs.Misc:AddLeftGroupbox("Spectate", "view")
local spectateConn, spectating
local dd = SpectateGroupbox:AddDropdown("SpectateTarget", {
	Values = {},
	Default = nil,
	Multi = false,
	Text = "Select Player"
})
SpectateGroupbox:AddButton({
	Text = "Refresh Players",
	Func = function()
		local t = {}
		for _, pl in ipairs(Services.Players:GetPlayers()) do
			if pl ~= References.player then
				t[#t + 1] = pl.Name
			end
		end
		dd:SetValues(t)
	end
})
local tg = SpectateGroupbox:AddToggle("SpectateEnabled", {
	Text = "Spectate Player",
	Default = false
})
local function stopSpectate()
	if spectateConn then
		spectateConn:Disconnect();
		spectateConn = nil
	end
	spectating = nil
	if References.humanoid then
		References.camera.CameraSubject = References.humanoid
	end
end
local function startSpectate(target)
	stopSpectate()
	spectating = target
	if not spectating then
		return
	end
	spectateConn = Services.RunService.RenderStepped:Connect(function()
		local char = spectating.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			References.camera.CameraSubject = hum
		else
			stopSpectate()
			tg:SetValue(false)
		end
	end)
end
tg:OnChanged(function()
	if tg.Value then
		local name = dd.Value
		local target = name and Services.Players:FindFirstChild(name)
		if target then
			startSpectate(target)
		else
			Library:Notify("Select a player to spectate.", 3)
			tg:SetValue(false)
		end
	else
		stopSpectate()
	end
end)
dd:OnChanged(function(name)
	if tg.Value then
		local target = name and Services.Players:FindFirstChild(name)
		if target then
			startSpectate(target)
		end
	end
end)
Services.Players.PlayerAdded:Connect(function()
	local t = {}
	for _, pl in ipairs(Services.Players:GetPlayers()) do
		if pl ~= References.player then
			t[#t + 1] = pl.Name
		end
	end
	dd:SetValues(t)
end)
Services.Players.PlayerRemoving:Connect(function(leaver)
	local t = {}
	for _, pl in ipairs(Services.Players:GetPlayers()) do
		if pl ~= References.player and pl ~= leaver then
			t[#t + 1] = pl.Name
		end
	end
	dd:SetValues(t)
	if spectating == leaver then
		tg:SetValue(false)
	end
end)
do
	local t = {}
	for _, pl in ipairs(Services.Players:GetPlayers()) do
		if pl ~= References.player then
			t[#t + 1] = pl.Name
		end
	end
	dd:SetValues(t)
end

                                                                                                                                                                                                                                    -- ========================== --
                                                                                                                                                                                                                                    -- ==== UI SETTINGS TABS ==== --
                                                                                                                                                                                                                                    -- ========================== --
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = {
		"Left",
		"Right"
	},
	Default = "Right",
	Text = "Notification Side",
	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = {
		"50%",
		"75%",
		"100%",
		"125%",
		"150%",
		"175%",
		"200%"
	},
	Default = "100%",
	Text = "DPI Scale",
	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)
		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
                                                                                                                                                                                                                    :AddKeyPicker("MenuKeybind", {
	Default = "RightShift",
	NoUI = true,
	Text = "Menu keybind"
})
MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({
	"MenuKeybind"
})
ThemeManager:SetFolder("NoxHub")
SaveManager:SetFolder("NoxHub/" .. References.gameName)
SaveManager:SetSubFolder(References.gameName)
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
ThemeManager:ApplyTheme("Ubuntu")

                                                                                                                                                                                                                -- ======================== --
                                                                                                                                                                                                                -- ==== INITIALISATION ==== --
                                                                                                                                                                                                                -- ======================== --

                                                                                                                                                                                                                -- ==== UNLOADER ==== --
local UnloadHandlers = {}
table.insert(UnloadHandlers, stopFlight)
table.insert(UnloadHandlers, stopSpeed)
table.insert(UnloadHandlers, stopJumpMod)
table.insert(UnloadHandlers, stopInfiniteJump)
table.insert(UnloadHandlers, stopNoclip)
table.insert(UnloadHandlers, stopEnvironment)
table.insert(UnloadHandlers, stopSpectate)
table.insert(UnloadHandlers, stopAutoQuest)
table.insert(UnloadHandlers, stopAttach)
table.insert(UnloadHandlers, function()
	if SENSE then
		if SENSE._hasLoaded and SENSE.Unload then
			pcall(SENSE.Unload)
		end
		if SENSE.teamSettings then
			SENSE.teamSettings.enemy.enabled    = false
			SENSE.teamSettings.friendly.enabled = false
		end
		if SENSE.instanceSettings then
			SENSE.instanceSettings.enabled = false
		end
	end
end)
table.insert(UnloadHandlers, function()
	if KAconn then
		KAconn:Disconnect();
		KAconn = nil
	end
end)
Library:OnUnload(function()
	for i = 1, #UnloadHandlers do
		local fn = UnloadHandlers[i]
		if typeof(fn) == "function" then
			pcall(fn)
		end
	end
end)

                                                                                                                                                                                                        -- ==== INIT ==== --
local function setupReferences(char)
	References.character = char or References.player.Character
	References.humanoid = References.character and References.character:FindFirstChildOfClass("Humanoid") or nil
	References.humanoidRootPart = References.character and References.character:FindFirstChild("HumanoidRootPart") or nil
	References.camera = Services.Workspace.CurrentCamera
end
setupReferences(References.player.Character or References.player.CharacterAdded:Wait())
References.player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid", 5)
	char:WaitForChild("HumanoidRootPart", 5)
	setupReferences(char)
	if Toggles.FlightEnabled and Toggles.FlightEnabled.Value then
		task.spawn(function()
			task.wait(0.25)
			startFlight()
		end)
	end
	if Toggles.SpeedEnabled and Toggles.SpeedEnabled.Value then
		task.spawn(function()
			task.wait(0.25)
			startSpeed()
		end)
	end
	if Toggles.JumpPower and Toggles.JumpPower.Value then
		task.spawn(function()
			task.wait(0.25)
			if startJumpMod then
				startJumpMod()
			end
		end)
	end
	if Toggles.InfiniteJump and Toggles.InfiniteJump.Value then
		task.spawn(function()
			task.wait(0.25)
			if startInfiniteJump then
				startInfiniteJump()
			end
		end)
	end
end)
References.player.CharacterRemoving:Connect(function()
	stopFlight()
	if stopSpeed then
		stopSpeed()
	end
	if stopJumpMod then
		stopJumpMod()
	end
	if stopInfiniteJump then
		stopInfiniteJump()
	end
	setupReferences(nil)
end)
Services.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	References.camera = Services.Workspace.CurrentCamera
end)