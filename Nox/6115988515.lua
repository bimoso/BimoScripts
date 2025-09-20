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
	Name = "Anime Saga | NoxHub",
	Theme = "Default",
	LoadingTitle = "Loading Anime Saga...",
	LoadingSubtitle = "NoxHub | Premium Scripts",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "NoxHub",
		FileName = "Anime Saga"
	}
})

-- // Tabs // --
local MainTab = Window:CreateTab("Main", "home")
local InputTab = Window:CreateTab("Ability", "square-arrow-down")
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
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local VirtualInputManager  = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- // References // --
local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local viewport = camera and camera.ViewportSize or Vector2.new(0, 0)
local hrp         = character:WaitForChild("HumanoidRootPart")
local humanoid    = character:WaitForChild("Humanoid")

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

MainTab:CreateParagraph({
	Title = "This is a WIP Update",
	Content = "This is just a progress update with everything I have been working on. Not everything will work and it is not polished. A full polished version will be our tommorrow."
})

-- ############## --
-- // MAIN TAB // --
-- ############## --

MainTab:CreateSection("No CD")

MainTab:CreateParagraph({
	Title = "WORK IN PROGRESS",
	Content = "No Jump CD is 100% working. However no attack cooldown and no ability cooldown are currently still activity being worked on. Likely update tommorrow."
})

local jumpScript = player.PlayerGui:FindFirstChild("JumpCooldown")
local env, originalCooldown, scriptExists = nil, 1, false
if jumpScript then
	env = (getsenv and getsenv(jumpScript))
    or (getscriptenvironment and getscriptenvironment(jumpScript))
	if env and type(env.Cooldown) == "number" then
		originalCooldown = env.Cooldown
		scriptExists = true
	else
		warn("[NoJump] found JumpCooldown but couldn’t access env.Cooldown")
	end
else
	warn("[NoJump] JumpCooldown script not detected; toggle will be a no-op")
end

MainTab:CreateToggle({
	Name         = "No Jump Cooldown",
	Flag         = "no_jump_cooldown",
	CurrentValue = false,
	Callback     = function(enabled)
		if not scriptExists then
			return
		end
		if enabled then
			env.Cooldown = 0
		else
			env.Cooldown = originalCooldown
		end
		Rayfield:Notify({
			Title    = "Jump Cooldown",
			Content  = enabled and "Removed!" or "Restored.",
			Duration = 3,
			Image    = enabled and "zap" or "refresh-cw"
		})
	end,
})

MainTab:CreateSection("Dungeon Helpers")

local autoFireHealing = false
local healingLoopConnection

local autoHealToggle = MainTab:CreateToggle({
	Name         = "Auto Use Heal Potion",
	Flag         = "AutoHealPrompt",
	CurrentValue = false,
	Callback     = function(state)
		autoFireHealing = state
		if autoFireHealing then
			healingLoopConnection = task.spawn(function()
				while autoFireHealing do
					local pfolder   = workspace:FindFirstChild("PlayerFodel")
					local pentry    = pfolder and pfolder:FindFirstChild(player.Name)
					local slotVal   = pentry and pentry:FindFirstChild("Onslot") and pentry.Onslot.Value
					local charValue = player:FindFirstChild("CharValue")
					local slotFolder = charValue and slotVal and charValue:FindFirstChild("Slot" .. slotVal)
					local hv = slotFolder and slotFolder:FindFirstChild("Health")    and slotFolder.Health.Value
					local mv = slotFolder and slotFolder:FindFirstChild("MaxHealth") and slotFolder.MaxHealth.Value
					if hv and mv and hv < mv then
						local potionFolder = workspace:FindFirstChild("Potion") or workspace:FindFirstChild("Poition")
						if potionFolder then
							for _, model in ipairs(potionFolder:GetChildren()) do
								if model:IsA("Model") and model.Name == "Healing" then
									for _, prompt in ipairs(model:GetDescendants()) do
										if prompt:IsA("ProximityPrompt") then
											fireproximityprompt(prompt)
										end
									end
								end
							end
						end
					end
					task.wait(0.5)
				end
			end)
		else
			autoFireHealing = false
			healingLoopConnection = nil
		end
	end,
})

local mouse  = player:GetMouse()

local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
if not eventsFolder then
end

local SkillRE = eventsFolder and eventsFolder:FindFirstChild("Skill")
if not SkillRE or not SkillRE:IsA("RemoteEvent") then
	SkillRE = nil
end

if SkillRE then
	local autoCycle = false
	MainTab:CreateToggle({
		Name         = "Auto-Cycle Skills",
		Flag         = "AutoCycleSkills",
		CurrentValue = false,
		Callback     = function(on)
			autoCycle = on
			if on then
				Rayfield:Notify({
					Title    = "Auto-Cycle ✔️",
					Content  = "Cycling Skill1→4 every 1s",
					Duration = 2,
					Image    = "check-circle",
				})
				spawn(function()
					local skills = {
						"Skill1",
						"Skill2",
						"Skill3",
						"Skill4"
					}
					local idx    = 1
					while autoCycle do
						local char = player.Character
						local hrp  = char and char:FindFirstChild("HumanoidRootPart")
						if hrp then
							local skillName = skills[idx]
							pcall(function()
								SkillRE:FireServer(
                skillName,
                hrp.CFrame,
                mouse.Hit.p,
                "OnSkill"
                )
							end)
							idx = idx % #skills + 1
						end
						task.wait(1)
					end
				end)
			else
				Rayfield:Notify({
					Title    = "Auto-Cycle ❌",
					Content  = "Stopped cycling",
					Duration = 2,
					Image    = "x",
				})
			end
		end,
	})
end

-- // AUTO DODGE // --
local dodgeDelay   = 0
local dodgeExpiry  = 0.5
local sampleCount  = 16

local dodgeMode = "Dash"
local DodgeDropdown = MainTab:CreateDropdown({
	Name            = "Dodge Mode",
	Options         = {
		"Teleport",
		"Dash"
	},
	CurrentOption   = {
		"Dash"
	},
	MultipleOptions = false,
	Flag            = "DodgeMode",
	Callback        = function(selection)
		dodgeMode = (type(selection) == "table" and selection[1]) or selection
	end,
})

local autoDodgeEnabled = false
MainTab:CreateToggle({
	Name         = "AutoDodge BETA",
	CurrentValue = false,
	Flag         = "AutoDodgeTeleport",
	Callback     = function(v)
		autoDodgeEnabled = v
	end,
})

local function refreshChar()
	local char = player.Character or player.CharacterAdded:Wait()
	hrp = char:WaitForChild("HumanoidRootPart")
end
refreshChar()
player.CharacterAdded:Connect(refreshChar)

local hitboxes = {}
local partEffect = Workspace:WaitForChild("PartEffect")
local function addHB(p)
	if p:IsA("BasePart") and p.Name:find("Hitbox") then
		hitboxes[p] = true
	end
end
local function remHB(p)
	hitboxes[p] = nil
end
for _, p in ipairs(partEffect:GetDescendants()) do
	addHB(p)
end
partEffect.DescendantAdded:Connect(addHB)
partEffect.DescendantRemoving:Connect(remHB)
local ignoreUntil = {}
local function closestMob()
	local folder = Workspace:FindFirstChild("Enemy")
        and Workspace.Enemy:FindFirstChild("Mob")
	if not folder then
		return
	end
	local best, dist = nil, math.huge
	for _, mdl in ipairs(folder:GetChildren()) do
		local mhrp = mdl:FindFirstChild("HumanoidRootPart")
		if mhrp then
			local d = (hrp.Position - mhrp.Position).Magnitude
			if d < dist then
				dist, best = d, mdl
			end
		end
	end
	return best
end
local rayParams = RaycastParams.new()
local filterList = {
	partEffect
}
if Workspace:FindFirstChild("PlayerFodel") then
	table.insert(filterList, Workspace.PlayerFodel)
end
if Workspace:FindFirstChild("Enemy") then
	table.insert(filterList, Workspace.Enemy)
end
rayParams.FilterDescendantsInstances = filterList
rayParams.FilterType = Enum.RaycastFilterType.Blacklist
local function isValid(cand)
	for hb in pairs(hitboxes) do
		local flat = Vector3.new(cand.X, hb.Position.Y, cand.Z)
		local loc  = hb.CFrame:PointToObjectSpace(flat)
		if math.abs(loc.X) <= hb.Size.X / 2 and math.abs(loc.Z) <= hb.Size.Z / 2 then
			return false
		end
	end
	local origin = cand + Vector3.new(0, 50, 0)
	return Workspace:Raycast(origin, Vector3.new(0, -100, 0), rayParams) ~= nil
end
local function doVirtualDash()
	local ok, vim = pcall(function()
		return VirtualInputManager
	end)
	if not ok then
		return
	end
	vim:SendKeyEvent(true, Enum.KeyCode.S, 0, Workspace)
	vim:SendKeyEvent(true, Enum.KeyCode.Q, 0, Workspace)
	task.wait(0.1)
	vim:SendKeyEvent(false, Enum.KeyCode.S, 0, Workspace)
	vim:SendKeyEvent(false, Enum.KeyCode.Q, 0, Workspace)
end
local function doDodge(hb)
	ignoreUntil[hb] = tick() + dodgeExpiry
	spawn(function()
		task.wait(dodgeDelay)
		if not autoDodgeEnabled then
			return
		end
		if dodgeMode == "Dash" then
			doVirtualDash()
			return
		end
		local mob = closestMob()
		if not mob then
			return
		end
		local target = mob.HumanoidRootPart.Position
		local radius = math.max(hb.Size.X, hb.Size.Z)
		local bestPos, bestDist
		for i = 0, sampleCount - 1 do
			local ang = (2 * math.pi / sampleCount) * i
			local cand = Vector3.new(
                    target.X + math.cos(ang) * radius,
                    hrp.Position.Y,
                    target.Z + math.sin(ang) * radius
                    )
			if isValid(cand) then
				local d = (cand - target).Magnitude
				if not bestPos or d < bestDist then
					bestPos, bestDist = cand, d
				end
			end
		end
		if bestPos then
			local origin = bestPos + Vector3.new(0, 50, 0)
			local res    = Workspace:Raycast(origin, Vector3.new(0, -100, 0), rayParams)
			if res then
				local groundY  = res.Position.Y + (hrp.Size.Y / 2)
				local currentY = hrp.Position.Y
				local clampedY = math.clamp(groundY, currentY, currentY + 3)
				bestPos = Vector3.new(bestPos.X, clampedY, bestPos.Z)
			end
			hrp.CFrame = CFrame.new(
                    bestPos,
                    Vector3.new(target.X, bestPos.Y, target.Z)
                    )
		end
	end)
end
RunService.Heartbeat:Connect(function()
	if not autoDodgeEnabled or not hrp then
		return
	end
	local pos = hrp.Position
	for hb in pairs(hitboxes) do
		if hb.Parent and (not ignoreUntil[hb] or tick() >= ignoreUntil[hb]) then
			local flat = Vector3.new(pos.X, hb.Position.Y, pos.Z)
			local loc  = hb.CFrame:PointToObjectSpace(flat)
			if math.abs(loc.X) <= hb.Size.X / 2 and math.abs(loc.Z) <= hb.Size.Z / 2 then
				doDodge(hb)
				break
			end
		end
	end
end)

        -- // REMOTE STORE // --
MainTab:CreateSection("Remote Store")
local itemOptions = {
	"Rare: Meat Bone",
	"Rare: Narutomaki",
	"Epic: Onigiri",
	"Epic: Kimbap",
	"Epic: Demon Blood",
	"Epic: Udon",
	"Legendary: Sushi",
	"Legendary: Green Bean",
	"Mythic: Takoyaki",
}
local materialOptions = {
	"Rare: Screws",
	"Rare: Milk",
	"Rare: Gear",
	"Epic: Battery",
	"Epic: Handheld",
	"Epic: Chip",
	"Epic: Bottle",
	"Legendary: Dice",
	"Legendary: Yoyo",
	"Legendary: Egg",
	"Mythic: Soup",
	"Mythic: Magnet",
	"Mythic: Key",
}
local selectDropdown
local storeDropdown = MainTab:CreateDropdown({
	Name            = "Gold Store",
	Options         = {
		"Items",
		"Materials"
	},
	CurrentOption   = {
		"Items"
	},
	MultipleOptions = false,
	Flag            = "gold_store",
	Callback        = function(selection)
		if selection[1] == "Items" then
			selectDropdown:Refresh(itemOptions)
			selectDropdown:Set({
				itemOptions[1]
			})
		else
			selectDropdown:Refresh(materialOptions)
			selectDropdown:Set({
				materialOptions[1]
			})
		end
	end,
})
selectDropdown = MainTab:CreateDropdown({
	Name            = "Select",
	Options         = itemOptions,
	CurrentOption   = {
		itemOptions[1]
	},
	MultipleOptions = false,
	Flag            = "gold_select",
	Callback        = function(selection)
	end,
})

local purchaseSlider = MainTab:CreateSlider({
	Name         = "Purchase Amount",
	Range        = {
		1,
		15
	},
	Increment    = 1,
	Suffix       = "",
	CurrentValue = 1,
	Flag         = "gold_amount",
	Callback     = function(val)
	end,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local eventFolder       = ReplicatedStorage:FindFirstChild("Event")
local goldShopEvent     = eventFolder and eventFolder:FindFirstChild("GoldShop")
MainTab:CreateButton({
	Name     = "Purchase",
	Callback = function()
		if not (goldShopEvent and goldShopEvent.FireServer) then
			return Rayfield:Notify({
				Title   = "Gold Shop",
				Content = "Cannot Purchase Here",
				Duration = 4,
				Image   = "alert-circle",
			})
		end
		local sel    = selectDropdown.CurrentOption[1]
		local amount = purchaseSlider.CurrentValue
		if not sel then
			return Rayfield:Notify({
				Title   = "Gold Shop",
				Content = "Please select an item/material first!",
				Duration = 3,
				Image   = "alert-circle",
			})
		end
		local nameOnly = sel:match("%:%s*(.+)$") or sel
		goldShopEvent:FireServer(nameOnly, tostring(amount))
		Rayfield:Notify({
			Title   = "Gold Shop",
			Content = string.format("Purchased %dx %s!", amount, nameOnly),
			Duration = 4,
			Image   = "check-circle",
		})
	end,
})

local function getStockLabel()
	local guiRoot   = player.PlayerGui:FindFirstChild("Window")
	local shopFrame = guiRoot
and guiRoot:FindFirstChild("GoldShop")
and guiRoot.GoldShop:FindFirstChild("Frame")
	return shopFrame and shopFrame:FindFirstChild("StockTime")
end

local initialLabel = getStockLabel()
local stockParagraph = MainTab:CreateParagraph({
	Title   = "Next Restock In",
	Content = (initialLabel and initialLabel.Text) or "N/A"
})

spawn(function()
	while true do
		if not initialLabel then
			initialLabel = getStockLabel()
		end
		local t = (initialLabel and initialLabel.Text) or "N/A"
		stockParagraph:Set({
			Title   = "Next Restock In",
			Content = t,
		})
		wait(5)
	end
end)

-- // REMOTE SUMMON // --
local eventFolder       = ReplicatedStorage:FindFirstChild("Event")
local summonEvent       = eventFolder and eventFolder:FindFirstChild("Summon")
MainTab:CreateSection("Remote Summon")

MainTab:CreateButton({
	Name     = "Summon 1",
	Callback = function()
		if not (summonEvent and summonEvent.FireServer) then
			return Rayfield:Notify({
				Title   = "Summon",
				Content = "Cannot Summon Here",
				Duration = 3,
				Image   = "alert-circle",
			})
		end
		summonEvent:FireServer(1)
		Rayfield:Notify({
			Title   = "Summon",
			Content = "1 summoned!",
			Duration = 3,
			Image   = "star",
		})
	end,
})

MainTab:CreateButton({
	Name     = "Summon 10",
	Callback = function()
		if not (summonEvent and summonEvent.FireServer) then
			return Rayfield:Notify({
				Title   = "Summon",
				Content = "Cannot Summon Here",
				Duration = 3,
				Image   = "alert-circle",
			})
		end
		summonEvent:FireServer(10)
		Rayfield:Notify({
			Title   = "Summon",
			Content = "10 summoned!",
			Duration = 3,
			Image   = "star",
		})
	end,
})

local rarityChances = {
	Mythic = 1,
	Legendary = 5
}
local translateName = {
	katakuri = "Mochi"
}
local shopParagraph = MainTab:CreateParagraph({
	Title   = "Current Summons",
	Content = "Loading…"
})

spawn(function()
	while true do
		local shopRaw = workspace:FindFirstChild("Shop")
		local shopData = {}
		if shopRaw then
			if shopRaw:IsA("ModuleScript") then
				shopData = require(shopRaw)
			elseif shopRaw:IsA("StringValue") then
				local ok, dec = pcall(HttpService.JSONDecode, HttpService, shopRaw.Value)
				if ok then
					shopData = dec
				end
			elseif shopRaw.Value ~= nil then
				shopData = shopRaw.Value
			end
		end
		local lines = {}
		for rarity, items in pairs(shopData) do
			if type(items) == "table" then
				local displayItems = {}
				for i, name in ipairs(items) do
					displayItems[i] = translateName[name:lower()] or name
				end
				local chance = rarityChances[rarity]
				local label  = rarity .. (chance and string.format(" [%d%%]", chance) or "")
				table.insert(lines, label .. ": " .. table.concat(displayItems, ", "))
			end
		end
		shopParagraph:Set({
			Title   = "Current Summons",
			Content = (#lines > 0 and table.concat(lines, "\n")) or "No stock available"
		})
		wait(30)
	end
end)

-- // REMOTE CRAFT // --
MainTab:CreateSection("Remote Craft")
local craftOptions = {
	"Pochita",
	"WeaponsZid",
	"Fan",
	"OkorunBall",
	"WeaponsFrieren",
}

local craftDropdown = MainTab:CreateDropdown({
	Name            = "Craft Item",
	Options         = craftOptions,
	CurrentOption   = {
		craftOptions[1]
	},
	MultipleOptions = false,
	Flag            = "craft_item",
	Callback        = function(selection)
	end,
})

local craftAmountSlider = MainTab:CreateSlider({
	Name         = "Craft Amount",
	Range        = {
		1,
		15
	},
	Increment    = 1,
	Suffix       = "",
	CurrentValue = 1,
	Flag         = "craft_amount",
	Callback     = function(value)
	end,
})

MainTab:CreateButton({
	Name     = "Craft",
	Callback = function()
		local item   = craftDropdown.CurrentOption[1]
		local amount = craftAmountSlider.CurrentValue
		if not item then
			Rayfield:Notify({
				Title   = "Craft",
				Content = "Please select an item first!",
				Duration = 3,
				Image   = "alert-circle",
			})
			return
		end
		local args = {
			tostring(amount),
			item
		}
		game:GetService("ReplicatedStorage")
:WaitForChild("Event")
:WaitForChild("Craft")
:FireServer(unpack(args))
		Rayfield:Notify({
			Title   = "Craft",
			Content = string.format("%dx %s crafted!", amount, item),
			Duration = 4,
			Image   = "check-circle",
		})
	end,
})

-- ############### --
-- // INPUT TAB // --
-- ############### --

local numberKeyMap = {
	["0"] = Enum.KeyCode.Zero,
	["1"] = Enum.KeyCode.One,
	["2"] = Enum.KeyCode.Two,
	["3"] = Enum.KeyCode.Three,
	["4"] = Enum.KeyCode.Four,
	["5"] = Enum.KeyCode.Five,
	["6"] = Enum.KeyCode.Six,
	["7"] = Enum.KeyCode.Seven,
	["8"] = Enum.KeyCode.Eight,
	["9"] = Enum.KeyCode.Nine,
}

-- MASTER TOGGLE
local globalEnabled = true
InputTab:CreateSection("Global Controls")
local globalInputs = InputTab:CreateToggle({
	Name         = "Global Inputs",
	Flag         = "GlobalAutoInputs",
	CurrentValue = true,
	Callback     = function(on)
		globalEnabled = on
	end,
})

InputTab:CreateSection("Timed Inputs")

for i = 1, 4 do
	local inputKey = Enum.KeyCode.E
	local interval  = 1
	local looping   = false
	InputTab:CreateInput({
		Name                    = "Input " .. i,
		PlaceholderText         = "e.g. E, Q, 1, F",
		RemoveTextAfterFocusLost = false,
		Callback                = function(text)
			local k = tostring(text):upper()
			local sel = numberKeyMap[k] or Enum.KeyCode[k]
			if sel then
				inputKey = sel
				Rayfield:Notify({
					Title   = "✅ Key Set",
					Content = "Input " .. i .. " → " .. sel.Name,
					Duration = 3,
					Image   = "check",
				})
			else
				Rayfield:Notify({
					Title   = "❌ Invalid Key",
					Content = "\"" .. text .. "\" not recognized",
					Duration = 3,
					Image   = "x",
				})
			end
		end,
	})

-- interval slider
	InputTab:CreateSlider({
		Name         = "Interval (" .. i .. ")",
		Range        = {
			0.1,
			200
		},
		Increment    = 0.1,
		Suffix       = "s",
		CurrentValue = 1,
		Flag         = "KeyPressInterval_" .. i,
		Callback     = function(v)
			interval = v
		end,
	})

-- per-key toggle
	InputTab:CreateToggle({
		Name         = "AutoKeyPresser " .. i,
		Flag         = "AutoKeyPresser_" .. i,
		CurrentValue = false,
		Callback     = function(state)
			looping = state
		end,
	})
	if i < 4 then
		InputTab:CreateDivider()
	end
	task.spawn(function()
		while true do
			if looping and globalEnabled then
				VirtualInputManager:SendKeyEvent(true,  inputKey, false, game)
				VirtualInputManager:SendKeyEvent(false, inputKey, false, game)
				task.wait(interval)
			else
				task.wait(0.1)
			end
		end
	end)
end

InputTab:CreateSection("Health Inputs")

local healthKey         = Enum.KeyCode.E
local healthThreshold   = 30
local healthCheckEnabled = false
local cooldownSeconds   = 5
local onCooldown        = false

InputTab:CreateInput({
	Name                    = "Health-Trigger Key",
	PlaceholderText         = "e.g. E, Q, 1, F",
	RemoveTextAfterFocusLost = false,
	Callback                = function(text)
		local k = tostring(text):upper()
		local sel = numberKeyMap[k] or Enum.KeyCode[k]
		if sel then
			healthKey = sel
			Rayfield:Notify({
				Title   = "✅ Health Key",
				Content = sel.Name .. " will fire ≤" .. healthThreshold .. "% HP",
				Duration = 3,
				Image   = "check",
			})
		else
			Rayfield:Notify({
				Title   = "❌ Invalid Key",
				Content = "\"" .. text .. "\" not valid",
				Duration = 3,
				Image   = "x",
			})
		end
	end,
})

InputTab:CreateSlider({
	Name         = "Health Threshold (%)",
	Range        = {
		1,
		100
	},
	Increment    = 1,
	Suffix       = "%",
	CurrentValue = 30,
	Flag         = "HealthKeyThreshold",
	Callback     = function(v)
		healthThreshold = v
	end,
})

InputTab:CreateToggle({
	Name         = "AutoHealthKey",
	Flag         = "HealthKeyToggle",
	CurrentValue = false,
	Callback     = function(state)
		healthCheckEnabled = state
		if state then
			Rayfield:Notify({
				Title   = "❤️ Health Monitor On",
				Content = "Key will press when HP ≤ " .. healthThreshold .. "%",
				Duration = 3,
				Image   = "heart",
			})
		end
	end,
})

task.spawn(function()
	while true do
		if healthCheckEnabled and globalEnabled then
			local char = player.Character or player.CharacterAdded:Wait()
			local hum  = char:FindFirstChildWhichIsA("Humanoid")
			if hum and hum.Health > 0 and not onCooldown then
				local pct = hum.Health / hum.MaxHealth * 100
				if pct <= healthThreshold then
					VirtualInputManager:SendKeyEvent(true,  healthKey, false, game)
					VirtualInputManager:SendKeyEvent(false, healthKey, false, game)
					Rayfield:Notify({
						Title   = "⚠️ Health Trigger",
						Content = math.floor(pct) .. "% → " .. healthKey.Name,
						Duration = 2,
						Image   = "alert",
					})
					onCooldown = true
					task.delay(cooldownSeconds, function()
						onCooldown = false
					end)
				end
			end
		end
		task.wait(0.5)
	end
end)

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

-- // NO RAGDOLL // --
local noRagdollEnabled = false
local noRagdollLoop

PlayerTab:CreateToggle({
	Name = "Quick Ragdoll",
	Flag = "QuickRagdoll",
	CurrentValue = false,
	Callback = function(state)
		noRagdollEnabled = state
		if state then
			noRagdollLoop = RunService.Heartbeat:Connect(function()
				local char = player.Character or player.CharacterAdded:Wait()
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					return
				end
				for _, obj in ipairs(char:GetDescendants()) do
					if obj:IsA("BallSocketConstraint") or obj:IsA("HingeConstraint") then
						obj:Destroy()
					elseif obj:IsA("Folder") and obj.Name:lower():find("ragdoll") then
						obj:Destroy()
					end
				end
				if humanoid:GetState() == Enum.HumanoidStateType.Physics or humanoid.PlatformStand then
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
					humanoid.PlatformStand = false
				end
			end)
		elseif noRagdollLoop then
			noRagdollLoop:Disconnect()
			noRagdollLoop = nil
		end
	end,
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

-- ############## --
-- // AUTO TAB // --
-- ############## --

AutoTab:CreateSection("Enter Dungeon")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function getJoinRoom()
	local evt = ReplicatedStorage:FindFirstChild("Event")
	if not evt then
		warn("❌ Folder 'Event' not found")
		return
	end
	local joinRm = evt:FindFirstChild("JoinRoom")
	if not joinRm then
		warn("❌ Remote 'JoinRoom' not found")
	end
	return joinRm
end

local locationMap = {
	["Leaf Village"]      = 1,
	["Marine Island"]     = 2,
	["Red Light District"] = 3,
	["West City"]         = 4,
}

local difficultyMap = {
	["Normal"]    = 1,
	["Hard"]      = 2,
	["Nightmare"] = 3,
}

local locationDropdown = AutoTab:CreateDropdown({
	Name            = "Location",
	Options         = {
		"Leaf Village",
		"Marine Island",
		"Red Light District",
		"West City"
	},
	CurrentOption   = {
		"Leaf Village"
	},
	MultipleOptions = false,
	Flag            = "LocationDropdown",
	Callback        = function(_)
	end,
})

local actDropdown = AutoTab:CreateDropdown({
	Name            = "Act",
	Options         = {
		"1",
		"2",
		"3",
		"4",
		"5"
	},
	CurrentOption   = {
		"1"
	},
	MultipleOptions = false,
	Flag            = "ActDropdown",
	Callback        = function(_)
	end,
})

local difficultyDropdown = AutoTab:CreateDropdown({
	Name            = "Difficulty",
	Options         = {
		"Normal",
		"Hard",
		"Nightmare"
	},
	CurrentOption   = {
		"Normal"
	},
	MultipleOptions = false,
	Flag            = "DifficultyDropdown",
	Callback        = function(_)
	end,
})

local function createPartyAndTeleport()
	local joinRm = getJoinRoom()
	if not joinRm then
		return
	end
	local locName = locationDropdown.CurrentOption[1]
	local actStr  = actDropdown.CurrentOption[1]
	local diffName = difficultyDropdown.CurrentOption[1]
	local locVal  = locationMap[locName]   or 1
	local actVal  = tonumber(actStr)        or 1
	local diffVal = difficultyMap[diffName] or 1
	joinRm:FireServer("Create", "Story", locVal, actVal, diffVal, false)
	task.delay(1, function()
		local j2 = getJoinRoom()
		if j2 then
			j2:FireServer("TeleGameplay", "Story", locVal, actVal, diffVal, false)
		end
	end)
end

AutoTab:CreateButton({
	Name     = "Enter",
	Callback = createPartyAndTeleport,
})

AutoTab:CreateSection("AutoFarm")

-- // AUTO M1 // --
local defaultX, defaultY = 0, viewport.Y
local targetX, targetY   = defaultX, defaultY
local clickInterval      = 0.5
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
	Flag = "clickPos",
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

AutoTab:CreateDivider()
local autoFarmEnabled = false
local healWhenLow = false
local healing = false
local healStartTime = 0
local farmConn

local detectionRadius = 2000
local orbitRadius = 11
local groundOffset = 3

AutoTab:CreateSlider({
	Name = "Orbit Radius",
	Range = {
		5,
		20
	},
	Increment = 0.1,
	CurrentValue = orbitRadius,
	Flag = "AutoFarmOrbitRadius",
	Callback = function(v)
		orbitRadius = v
	end,
})

AutoTab:CreateToggle({
	Name = "Heal When Low",
	CurrentValue = false,
	Flag = "HealWhenLowToggle",
	Callback = function(v)
		healWhenLow = v
	end,
})

local autoFarmToggle = AutoTab:CreateToggle({
	Name = "AutoFarm",
	CurrentValue = false,
	Flag = "AutoFarmCircleGrounded",
	Callback = function(state)
		autoFarmEnabled = state
		if state then
			startAutoFarm()
			autoHealToggle:Set(true)
			globalInputs:Set(true)
		else
			stopAutoFarm()
			autoHealToggle:Set(false)
			globalInputs:Set(false)
		end
	end,
})

local function findClosestTarget()
	local searchFolder
	if healing then
		searchFolder = workspace:FindFirstChild("Enemy") and workspace.Enemy:FindFirstChild("Crate")
	else
		searchFolder = workspace:FindFirstChild("Enemy") and workspace.Enemy:FindFirstChild("Mob")
	end
	if not searchFolder then
		return
	end
	local closest, shortest = nil, math.huge
	for _, mdl in ipairs(searchFolder:GetDescendants()) do
		if mdl:IsA("Model") and not Players:GetPlayerFromCharacter(mdl) then
			local root = mdl:FindFirstChild("HumanoidRootPart")
			local hum = mdl:FindFirstChildOfClass("Humanoid")
			if root and (not hum or (hum and hum.Health > 0)) then
				local dist = (hrp.Position - root.Position).Magnitude
				if dist < shortest and dist <= detectionRadius then
					closest, shortest = mdl, dist
				end
			end
		end
	end
	return closest
end

local theta = 0
local stepCooldown = 0.8
local orbitTweenSpeed = 150
local quarterCircle = math.pi / 2
local hrpTween = nil
local lastOrbitTime = 0
local isTweening = false

local function getNextOrbitPosition(targetRoot)
	theta = (theta + quarterCircle) % (2 * math.pi)
	local offsetX = math.cos(theta) * orbitRadius
	local offsetZ = math.sin(theta) * orbitRadius
	local groundedY = targetRoot.Position.Y - groundOffset
	return Vector3.new(
targetRoot.Position.X + offsetX,
groundedY,
targetRoot.Position.Z + offsetZ
)
end

local function simulateAttack()
	task.spawn(function()
		local virtualInput = game:GetService("VirtualInputManager")
		virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 0)
		task.wait(0.05)
		virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 0)
	end)
end

local function moveToPositionWithSpeed(targetPosition, lookAtPosition)
	if not hrp then
		return
	end
	local distance = (hrp.Position - targetPosition).Magnitude
	local tweenTime = distance / orbitTweenSpeed
	local goalCFrame = CFrame.new(targetPosition, lookAtPosition)
	local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
	if hrpTween then
		hrpTween:Cancel()
	end
	hrpTween = TweenService:Create(hrp, tweenInfo, {
		CFrame = goalCFrame
	})
	isTweening = true
	hrpTween:Play()
	hrpTween.Completed:Once(function()
		isTweening = false
		simulateAttack()
	end)
end

local function farmLoop()
	local now = tick()
	local healthPct = humanoid.Health / humanoid.MaxHealth

-- Healing Logic
	if healWhenLow and not healing and healthPct <= 0.5 then
		healing = true
		healStartTime = now
		print("🩹 Entering healing mode...")
	elseif healing and (healthPct >= 0.8 or (now - healStartTime) > 30) then
		healing = false
		print("💪 Exiting healing mode...")
	end
	if isTweening then
		return
	end
	local target = findClosestTarget()
	if not target then
		return
	end
	local targetRoot = target:FindFirstChild("HumanoidRootPart")
	if not targetRoot then
		return
	end
	if now - lastOrbitTime >= stepCooldown then
		lastOrbitTime = now
		local nextPos = getNextOrbitPosition(targetRoot)
		moveToPositionWithSpeed(nextPos, targetRoot.Position)
	end
end
function startAutoFarm()
	if farmConn then
		return
	end
	farmConn = RunService.Heartbeat:Connect(farmLoop)
end
function stopAutoFarm()
	if farmConn then
		farmConn:Disconnect()
		farmConn = nil
	end
end
AutoTab:CreateSection("Auto Dungeon")
AutoTab:CreateParagraph({
	Title = "Auto Dungeon Info",
	Content = "Make sure you set the correct dungeon in Enter Dungeon and have the correct AutoFarm settings on with an AutoM1 position saved."
})
local function getWinRemote()
	local evts   = ReplicatedStorage:FindFirstChild("Events")
	local winEvt = evts and evts:FindFirstChild("WinEvent")
	return winEvt and winEvt:FindFirstChild("Buttom")
end
local function getStartButton()
	local gui   = player.PlayerGui:FindFirstChild("RoomUi")
	local ready = gui      and gui:FindFirstChild("Ready")
	local frame = ready    and ready:FindFirstChild("Frame")
	return frame and frame:FindFirstChild("StartButton")
end
local finishOption = "Replay"
AutoTab:CreateDropdown({
	Name            = "Finish Option",
	Options         = {
		"Replay",
		"Next"
	},
	CurrentOption   = {
		finishOption
	},
	MultipleOptions = false,
	Flag            = "FinishOption",
	Callback        = function(opts)
		finishOption = opts[1]
	end,
})

local finishMap = {
	Replay = "RPlay",
	Next   = "NextLv",
}

local okorunEnabled = false
local okorunLoop

AutoTab:CreateToggle({
	Name         = "Auto Mission",
	Flag         = "autoMission",
	CurrentValue = false,
	Callback     = function(state)
		okorunEnabled = state
		if state then
			local lastMobTime = tick()
			okorunLoop = task.spawn(function()
				while okorunEnabled do
					if getStartButton() then
						autoFarmToggle:Set(true)
						lastMobTime = tick()
						sendToWebhook(webhookUrl, "[✅] Mission started!")
					else
						local npcOk = workspace:FindFirstChild("NPC")
            and workspace.NPC:FindFirstChild("Okorun")
						if npcOk then
							wait(5)
							createPartyAndTeleport()
							autoFarmToggle:Set(false)
							lastMobTime = tick()
						else
							local mobFolder = workspace:FindFirstChild("Enemy")
                and workspace.Enemy:FindFirstChild("Mob")
							local hasMobs = mobFolder and #mobFolder:GetChildren() > 0
							if hasMobs then
								autoFarmToggle:Set(true)
								lastMobTime = tick()
							else
								if tick() - lastMobTime >= 10 then
									local winRemote = getWinRemote()
									if winRemote then
										winRemote:FireServer(finishMap[finishOption] or "RPlay")
										sendToWebhook(webhookUrl, "[🏁] Mission finished!")
									else
										warn("Win button not found")
									end
									lastMobTime = tick()
								end
							end
						end
					end
					task.wait(1)
				end
			end)
		else
			okorunEnabled = false
			okorunLoop    = nil
			autoFarmToggle:Set(false)
		end
	end,
})

local autoStart = false
AutoTab:CreateToggle({
	Name = "Auto Start",
	CurrentValue = false,
	Flag = "AutoStart",
	Callback = function(value)
		autoStart = value
	end,
})

task.spawn(function()
	while true do
		if autoStart then
			local success, remote = pcall(function()
				local gui = player:WaitForChild("PlayerGui")
				local roomUi = gui:FindFirstChild("RoomUi")
				if not roomUi then
					return
				end
				local ready = roomUi:FindFirstChild("Ready")
				local frame = ready and ready:FindFirstChild("Frame")
				local startBtn = frame and frame:FindFirstChild("StartButton")
				local butom = startBtn and startBtn:FindFirstChild("Butom")
				local localScript = butom and butom:FindFirstChild("LocalScript")
				local remoteEvent = localScript and localScript:FindFirstChildOfClass("RemoteEvent")
				return remoteEvent
			end)
			if success and remote then
				pcall(function()
					remote:FireServer()
				end)
			end
		end
		task.wait(1)
	end
end)

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

                            -- // UNIVERSAL OBJECT + PLAYER + NPC ESP // --
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
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

                        -- Categories
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
	["Mobs"] = function()
		local list = {}
		for _, model in ipairs(workspace:GetDescendants()) do
			if model:IsA("Model") and not Players:GetPlayerFromCharacter(model) then
				if model:FindFirstChildOfClass("Humanoid") and findPart(model) then
					table.insert(list, model)
				end
			end
		end
		return list
	end,
	["Crates"] = function()
		local folder = workspace:FindFirstChild("Enemy") and workspace.Enemy:FindFirstChild("Crate")
		return folder and folder:GetChildren() or {}
	end,
	["Boss Doors"] = function()
		local root = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("TelePart")
		return root and root:GetChildren() or {}
	end,
	["Potions"] = function()
		local root = workspace:FindFirstChild("Poition")
		return root and root:GetChildren() or {}
	end,
	["Enemy Spawns"] = function()
		local root = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("SpawnPart")
		if not root then
			return {}
		end
		local list = {}
		for _, group in ipairs(root:GetChildren()) do
			for _, part in ipairs(group:GetChildren()) do
				table.insert(list, part)
			end
		end
		return list
	end,
}
local DEFAULT_COLORS = {
	["Players"] = Color3.fromRGB(0, 255, 0),
	["Mobs"] = Color3.fromRGB(255, 0, 255),
	["Crates"] = Color3.fromRGB(255, 128, 0),
	["Boss Doors"] = Color3.fromRGB(255, 0, 0),
	["Enemy Spawns"] = Color3.fromRGB(0, 255, 255),
	["Potions"] = Color3.fromRGB(128, 0, 255)
}
local CATEGORY_ORDER = {
	"Players",
	"Mobs",
	"Potions",
	"Crates",
	"Boss Doors",
	"Enemy Spawns",
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
								lbl.Text = displayName == "Enemy Spawns" and ("Spawn " .. part.Name) or obj.Name
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

MiscTab:CreateSection("Webhook")

local userWebhook = ""

MiscTab:CreateInput({
	Name = "Input Discord Webhook",
	Flag = "Webhook",
	PlaceholderText = "Paste full webhook URL here...",
	RemoveTextAfterFocusLost = false,
	Callback = function(input)
		userWebhook = input
	end
})

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

local playerName = player.Name
local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
local placeId = game.PlaceId
local unixTime = os.time()

local playerInfo = string.format([[
**Successfully Loaded NoxHub Logger**
> **Player:** %s
> **Game:** %s
> **Time:** <t:%d:R>
]], playerName, gameName, unixTime, placeId)

local ok, res = sendToWebhook(userWebhook, playerInfo)

Rayfield:Notify({
	Title = "NoxHub Loaded",
	Content = "Enjoy using our script!",
	Duration = 4,
	Image = "check"
})