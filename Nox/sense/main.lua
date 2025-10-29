-- Load utilities
local Maid = loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/sense/maid.lua"))()
local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/sense/signal.lua"))()

-- services
local runService = game:GetService("RunService");
local players = game:GetService("Players");
local workspace = game:GetService("Workspace");

-- variables
local localPlayer = players.LocalPlayer;
local camera = workspace.CurrentCamera;
local viewportSize = camera.ViewportSize;
local container = Instance.new("Folder",
	gethui and gethui() or game:GetService("CoreGui"));

-- locals
local floor = math.floor;
local round = math.round;
local atan2 = math.atan2;
local sin = math.sin;
local cos = math.cos;
local clear = table.clear;
local unpack = table.unpack;
local find = table.find;

-- methods
local wtvp = camera.WorldToViewportPoint;
local isA = workspace.IsA;
local getPivot = workspace.GetPivot;
local findFirstChild = workspace.FindFirstChild;
local findFirstChildOfClass = workspace.FindFirstChildOfClass;
local getChildren = workspace.GetChildren;
local toOrientation = CFrame.identity.ToOrientation;
local pointToObjectSpace = CFrame.identity.PointToObjectSpace;
local lerpColor = Color3.new().Lerp;
local min2 = Vector2.zero.Min;
local max2 = Vector2.zero.Max;
local lerp2 = Vector2.zero.Lerp;
local min3 = Vector3.zero.Min;
local max3 = Vector3.zero.Max;

-- constants
local HEALTH_BAR_OFFSET = Vector2.new(5, 0);
local HEALTH_TEXT_OFFSET = Vector2.new(3, 0);
local HEALTH_BAR_OUTLINE_OFFSET = Vector2.new(0, 1);
local NAME_OFFSET = Vector2.new(0, 2);
local DISTANCE_OFFSET = Vector2.new(0, 2);
local VERTICES = {
	Vector3.new(-1, -1, -1),
	Vector3.new(-1, 1, -1),
	Vector3.new(-1, 1, 1),
	Vector3.new(-1, -1, 1),
	Vector3.new(1, -1, -1),
	Vector3.new(1, 1, -1),
	Vector3.new(1, 1, 1),
	Vector3.new(1, -1, 1)
};

-- functions
local function isBodyPart(name)
	return name == "Head" or name:find("Torso") or name:find("Leg") or name:find("Arm");
end

local function getBoundingBox(parts)
	if not parts or #parts == 0 then
		return CFrame.new(), Vector3.new(4, 4, 4);
	end

	local min, max;
	for i = 1, #parts do
		local part = parts[i];
		if part and part.Parent then
			local cframe, size = part.CFrame, part.Size;
			min = min3(min or cframe.Position, (cframe - size*0.5).Position);
			max = max3(max or cframe.Position, (cframe + size*0.5).Position);
		end
	end

	if not min or not max then
		return CFrame.new(), Vector3.new(4, 4, 4);
	end

	local center = (min + max)*0.5;
	local front = Vector3.new(center.X, center.Y, max.Z);
	return CFrame.new(center, front), max - min;
end

local function worldToScreen(world)
	local screen, inBounds = wtvp(camera, world);
	return Vector2.new(screen.X, screen.Y), inBounds, screen.Z;
end

local function calculateCorners(cframe, size)
	local corners = {};
	for i = 1, #VERTICES do
		corners[i] = worldToScreen((cframe + size*0.5*VERTICES[i]).Position);
	end

	local min = min2(viewportSize, unpack(corners));
	local max = max2(Vector2.zero, unpack(corners));
	return {
		corners = corners,
		topLeft = Vector2.new(floor(min.X), floor(min.Y)),
		topRight = Vector2.new(floor(max.X), floor(min.Y)),
		bottomLeft = Vector2.new(floor(min.X), floor(max.Y)),
		bottomRight = Vector2.new(floor(max.X), floor(max.Y))
	};
end

local function rotateVector(vector, radians)
	local c, s = cos(radians), sin(radians);
	return Vector2.new(c*vector.X - s*vector.Y, s*vector.X + c*vector.Y);
end

-- esp object
local EspObject = {};
EspObject.__index = EspObject;

function EspObject.new(player, interface)
	local self = setmetatable({}, EspObject);
	self.player = assert(player, "Missing argument #1 (Player expected)");
	self.interface = assert(interface, "Missing argument #2 (table expected)");
	self.maid = Maid.new();
	self:Construct();
	return self;
end

function EspObject:Construct()
	self.charCache = {};
	self.childCount = 0;
	self.bin = {};
	self.drawings = {
		box3d = {
			{
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false })
			},
			{
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false })
			},
			{
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false })
			},
			{
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false })
			}
		},
		visible = {
			tracerOutline = self:create("Line", { Thickness = 3, Visible = false }),
			tracer = self:create("Line", { Thickness = 1, Visible = false }),
			boxFill = self:create("Square", { Filled = true, Visible = false }),
			boxOutline = self:create("Square", { Thickness = 3, Visible = false }),
			box = self:create("Square", { Thickness = 1, Visible = false }),
			healthBarOutline = self:create("Line", { Thickness = 3, Visible = false }),
			healthBar = self:create("Line", { Thickness = 1, Visible = false }),
			healthText = self:create("Text", { Center = true, Visible = false }),
			name = self:create("Text", { Text = self.player.Name, Center = true, Visible = false }),
			distance = self:create("Text", { Center = true, Visible = false }),
			weapon = self:create("Text", { Center = true, Visible = false }),
		},
		hidden = {
			arrowOutline = self:create("Triangle", { Thickness = 3, Visible = false }),
			arrow = self:create("Triangle", { Filled = true, Visible = false })
		}
	};

	self.renderConnection = runService.Heartbeat:Connect(function(deltaTime)
		self:Update(deltaTime);
		self:Render(deltaTime);
	end);
	
	self.maid:AddTask(self.renderConnection);
end

function EspObject:create(class, properties)
	local drawing = Drawing.new(class);
	for property, value in next, properties do
		drawing[property] = value;
	end
	self.bin[#self.bin + 1] = drawing;
	self.maid:AddTask(drawing);
	return drawing;
end

function EspObject:Destruct()
	if self.drawings then
		for _, drawings in pairs(self.drawings) do
			if type(drawings) == "table" then
				for _, drawing in pairs(drawings) do
					if type(drawing) == "table" then
						for _, line in pairs(drawing) do
							if line.Visible ~= nil then
								line.Visible = false;
							end
						end
					elseif drawing.Visible ~= nil then
						drawing.Visible = false;
					end
				end
			end
		end
	end
	
	self.maid:Cleanup();
	clear(self);
 end

function EspObject:Update()
	local interface = self.interface;

	self.options = interface.teamSettings[interface.isFriendly(self.player) and "friendly" or "enemy"];
	self.character = interface.getCharacter(self.player);
	self.health, self.maxHealth = interface.getHealth(self.character);
	self.weapon = interface.getWeapon(self.player);
	self.enabled = self.options.enabled and self.character and not
		(#interface.whitelist > 0 and not find(interface.whitelist, self.player.UserId));

	local head = self.enabled and findFirstChild(self.character, "Head");
	if not head then
		return;
	end

	local _, onScreen, depth = worldToScreen(head.Position);
	self.onScreen = onScreen;
	self.distance = depth;

	if interface.sharedSettings.limitDistance and depth > interface.sharedSettings.maxDistance then
		self.onScreen = false;
	end

	if self.onScreen then
		local cache = self.charCache;
		local children = getChildren(self.character);
		if not cache[1] or self.childCount ~= #children then
			clear(cache);

			for i = 1, #children do
				local part = children[i];
				if isA(part, "BasePart") and isBodyPart(part.Name) then
					cache[#cache + 1] = part;
				end
			end

			self.childCount = #children;
		end

		self.corners = calculateCorners(getBoundingBox(cache));
	elseif self.options.offScreenArrow then
		local _, yaw, roll = toOrientation(camera.CFrame);
		local flatCFrame = CFrame.Angles(0, yaw, roll) + camera.CFrame.Position;
		local objectSpace = pointToObjectSpace(flatCFrame, head.Position);
		local angle = atan2(objectSpace.Z, objectSpace.X);

		self.direction = Vector2.new(cos(angle), sin(angle));
	end
end

function EspObject:Render()
	local onScreen = self.onScreen or false;
	local enabled = self.enabled or false;
	local visible = self.drawings.visible;
	local hidden = self.drawings.hidden;
	local box3d = self.drawings.box3d;
	local interface = self.interface;
	local options = self.options;
	local corners = self.corners;

	visible.box.Visible = enabled and onScreen and options.box;
	visible.boxOutline.Visible = visible.box.Visible and options.boxOutline;
	if visible.box.Visible then
		local box = visible.box;
		box.Position = corners.topLeft;
		box.Size = corners.bottomRight - corners.topLeft;
		box.Color = options.boxColor[1];
		box.Transparency = options.boxColor[2];

		local boxOutline = visible.boxOutline;
		boxOutline.Position = box.Position;
		boxOutline.Size = box.Size;
		boxOutline.Color = options.boxOutlineColor[1];
		boxOutline.Transparency = options.boxOutlineColor[2];
	end

	visible.boxFill.Visible = enabled and onScreen and options.boxFill;
	if visible.boxFill.Visible then
		local boxFill = visible.boxFill;
		boxFill.Position = corners.topLeft;
		boxFill.Size = corners.bottomRight - corners.topLeft;
		boxFill.Color = options.boxFillColor[1];
		boxFill.Transparency = options.boxFillColor[2];
	end

	visible.healthBar.Visible = enabled and onScreen and options.healthBar;
	visible.healthBarOutline.Visible = visible.healthBar.Visible and options.healthBarOutline;
	if visible.healthBar.Visible then
		local barFrom = corners.topLeft - HEALTH_BAR_OFFSET;
		local barTo = corners.bottomLeft - HEALTH_BAR_OFFSET;

		local healthBar = visible.healthBar;
		healthBar.To = barTo;
		healthBar.From = lerp2(barTo, barFrom, self.health/self.maxHealth);
		healthBar.Color = lerpColor(options.dyingColor, options.healthyColor, self.health/self.maxHealth);

		local healthBarOutline = visible.healthBarOutline;
		healthBarOutline.To = barTo + HEALTH_BAR_OUTLINE_OFFSET;
		healthBarOutline.From = barFrom - HEALTH_BAR_OUTLINE_OFFSET;
		healthBarOutline.Color = options.healthBarOutlineColor[1];
		healthBarOutline.Transparency = options.healthBarOutlineColor[2];
	end

	visible.healthText.Visible = enabled and onScreen and options.healthText;
	if visible.healthText.Visible then
		local barFrom = corners.topLeft - HEALTH_BAR_OFFSET;
		local barTo = corners.bottomLeft - HEALTH_BAR_OFFSET;

		local healthText = visible.healthText;
		healthText.Text = round(self.health) .. "hp";
		healthText.Size = interface.sharedSettings.textSize;
		healthText.Font = interface.sharedSettings.textFont;
		healthText.Color = options.healthTextColor[1];
		healthText.Transparency = options.healthTextColor[2];
		healthText.Outline = options.healthTextOutline;
		healthText.OutlineColor = options.healthTextOutlineColor;
		local healthRatio = 0;
		if self.health and self.maxHealth and self.maxHealth > 0 then
		    healthRatio = math.max(0, math.min(1, self.health / self.maxHealth));
		end;
		healthText.Position = lerp2(barTo, barFrom, healthRatio) - Vector2.new(healthText.TextBounds.X/2, healthText.TextBounds.Y/2) - HEALTH_TEXT_OFFSET;
	end

	visible.name.Visible = enabled and onScreen and options.name;
	if visible.name.Visible then
		local name = visible.name;
		name.Size = interface.sharedSettings.textSize;
		name.Font = interface.sharedSettings.textFont;
		name.Color = options.nameColor[1];
		name.Transparency = options.nameColor[2];
		name.Outline = options.nameOutline;
		name.OutlineColor = options.nameOutlineColor;
		name.Position = (corners.topLeft + corners.topRight)*0.5 - Vector2.yAxis*name.TextBounds.Y - NAME_OFFSET;
	end

	visible.distance.Visible = enabled and onScreen and self.distance and options.distance;
	if visible.distance.Visible then
		local distance = visible.distance;
		distance.Text = round(self.distance) .. " studs";
		distance.Size = interface.sharedSettings.textSize;
		distance.Font = interface.sharedSettings.textFont;
		distance.Color = options.distanceColor[1];
		distance.Transparency = options.distanceColor[2];
		distance.Outline = options.distanceOutline;
		distance.OutlineColor = options.distanceOutlineColor;
		distance.Position = (corners.bottomLeft + corners.bottomRight)*0.5 + DISTANCE_OFFSET;
	end

	visible.weapon.Visible = enabled and onScreen and options.weapon;
	if visible.weapon.Visible then
		local weapon = visible.weapon;
		weapon.Text = self.weapon;
		weapon.Size = interface.sharedSettings.textSize;
		weapon.Font = interface.sharedSettings.textFont;
		weapon.Color = options.weaponColor[1];
		weapon.Transparency = options.weaponColor[2];
		weapon.Outline = options.weaponOutline;
		weapon.OutlineColor = options.weaponOutlineColor;
		weapon.Position =
			(corners.bottomLeft + corners.bottomRight)*0.5 +
			(visible.distance.Visible and DISTANCE_OFFSET + Vector2.yAxis*visible.distance.TextBounds.Y or Vector2.zero);
	end

	visible.tracer.Visible = enabled and onScreen and options.tracer;
	visible.tracerOutline.Visible = visible.tracer.Visible and options.tracerOutline;
	if visible.tracer.Visible then
		local tracer = visible.tracer;
		tracer.Color = options.tracerColor[1];
		tracer.Transparency = options.tracerColor[2];
		tracer.To = (corners.bottomLeft + corners.bottomRight)*0.5;
		tracer.From =
			options.tracerOrigin == "Middle" and viewportSize*0.5 or
			options.tracerOrigin == "Top" and viewportSize*Vector2.new(0.5, 0) or
			options.tracerOrigin == "Bottom" and viewportSize*Vector2.new(0.5, 1);

		local tracerOutline = visible.tracerOutline;
		tracerOutline.Color = options.tracerOutlineColor[1];
		tracerOutline.Transparency = options.tracerOutlineColor[2];
		tracerOutline.To = tracer.To;
		tracerOutline.From = tracer.From;
	end

	hidden.arrow.Visible = enabled and (not onScreen) and options.offScreenArrow;
	hidden.arrowOutline.Visible = hidden.arrow.Visible and options.offScreenArrowOutline;
	if hidden.arrow.Visible then
		local arrow = hidden.arrow;
		arrow.PointA = min2(max2(viewportSize*0.5 + self.direction*options.offScreenArrowRadius, Vector2.one*25), viewportSize - Vector2.one*25);
		arrow.PointB = arrow.PointA - rotateVector(self.direction, 0.45)*options.offScreenArrowSize;
		arrow.PointC = arrow.PointA - rotateVector(self.direction, -0.45)*options.offScreenArrowSize;
		arrow.Color = options.offScreenArrowColor[1];
		arrow.Transparency = options.offScreenArrowColor[2];

		local arrowOutline = hidden.arrowOutline;
		arrowOutline.PointA = arrow.PointA;
		arrowOutline.PointB = arrow.PointB;
		arrowOutline.PointC = arrow.PointC;
		arrowOutline.Color = options.offScreenArrowOutlineColor[1];
		arrowOutline.Transparency = options.offScreenArrowOutlineColor[2];
	end

	local box3dEnabled = enabled and onScreen and options.box3d;
	for i = 1, #box3d do
		local face = box3d[i];
		for i2 = 1, #face do
			local line = face[i2];
			line.Visible = box3dEnabled;
			line.Color = options.box3dColor[1];
			line.Transparency = options.box3dColor[2];
		end

		if box3dEnabled then
			local line1 = face[1];
			line1.From = corners.corners[i];
			line1.To = corners.corners[i == 4 and 1 or i+1];

			local line2 = face[2];
			line2.From = corners.corners[i == 4 and 1 or i+1];
			line2.To = corners.corners[i == 4 and 5 or i+5];

			local line3 = face[3];
			line3.From = corners.corners[i == 4 and 5 or i+5];
			line3.To = corners.corners[i == 4 and 8 or i+4];
		end
	end
end

-- cham object
local ChamObject = {};
ChamObject.__index = ChamObject;

function ChamObject.new(player, interface)
	local self = setmetatable({}, ChamObject);
	self.player = assert(player, "Missing argument #1 (Player expected)");
	self.interface = assert(interface, "Missing argument #2 (table expected)");
	self.maid = Maid.new();
	self:Construct();
	return self;
end

function ChamObject:Construct()
	self.highlight = Instance.new("Highlight", container);
	self.maid:AddTask(self.highlight);
	
	self.updateConnection = runService.Heartbeat:Connect(function()
		self:Update();
	end);
	
	self.maid:AddTask(self.updateConnection);
end

function ChamObject:Destruct()
	self.maid:Cleanup();
	clear(self);
end

function ChamObject:Update()
	local highlight = self.highlight;
	local interface = self.interface;
	local character = interface.getCharacter(self.player);
	local options = interface.teamSettings[interface.isFriendly(self.player) and "friendly" or "enemy"];
	local enabled = options.enabled and character and not
		(#interface.whitelist > 0 and not find(interface.whitelist, self.player.UserId));

	highlight.Enabled = enabled and options.chams;
	if highlight.Enabled then
		highlight.DepthMode = options.chamsVisibleOnly and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop;
		highlight.Adornee = character;
		highlight.FillColor = options.chamsFillColor[1];
		highlight.FillTransparency = options.chamsFillColor[2];
		highlight.OutlineColor = options.chamsOutlineColor[1];
		highlight.OutlineTransparency = options.chamsOutlineColor[2];
	end
end


local InstanceEspObject = {};
InstanceEspObject.__index = InstanceEspObject;

function InstanceEspObject.new(instance, interface, customOptions)
	local self = setmetatable({}, InstanceEspObject);
	self.instance = assert(instance, "Missing argument #1 (Instance expected)");
	self.interface = assert(interface, "Missing argument #2 (table expected)");
	self.customOptions = customOptions or {};
	self.maid = Maid.new();
	self:Construct();
	return self;
end

function InstanceEspObject:Construct()
	self.charCache = {};
	self.childCount = 0;
	self.bin = {};
	
	-- Create drawing objects with customizable options
	self.drawings = {
		box3d = {},
		visible = {
			tracerOutline = self:create("Line", { Thickness = 3, Visible = false }),
			tracer = self:create("Line", { Thickness = 1, Visible = false }),
			boxFill = self:create("Square", { Filled = true, Visible = false }),
			boxOutline = self:create("Square", { Thickness = 3, Visible = false }),
			box = self:create("Square", { Thickness = 1, Visible = false }),
			healthBarOutline = self:create("Line", { Thickness = 3, Visible = false }),
			healthBar = self:create("Line", { Thickness = 1, Visible = false }),
			healthText = self:create("Text", { Center = true, Visible = false }),
			name = self:create("Text", { Text = self.instance.Name, Center = true, Visible = false }),
			distance = self:create("Text", { Center = true, Visible = false }),
			customText = self:create("Text", { Center = true, Visible = false }),
		},
		hidden = {
			arrowOutline = self:create("Triangle", { Thickness = 3, Visible = false }),
			arrow = self:create("Triangle", { Filled = true, Visible = false })
		}
	};
	
	-- Create 3D box if enabled
	if self.customOptions.box3d then
		for i = 1, 4 do
			self.drawings.box3d[i] = {
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false }),
				self:create("Line", { Thickness = 1, Visible = false })
			};
		end
	end

	self.renderConnection = runService.Heartbeat:Connect(function(deltaTime)
		self:Update(deltaTime);
		self:Render(deltaTime);
	end);
	
	self.maid:AddTask(self.renderConnection);
end

function InstanceEspObject:create(class, properties)
	local drawing = Drawing.new(class);
	for property, value in next, properties do
		drawing[property] = value;
	end
	self.bin[#self.bin + 1] = drawing;
	self.maid:AddTask(drawing);
	return drawing;
end

function InstanceEspObject:Destruct()
	if self.drawings then
		for _, drawings in pairs(self.drawings) do
			if type(drawings) == "table" then
				for _, drawing in pairs(drawings) do
					if type(drawing) == "table" then
						for _, line in pairs(drawing) do
							if line.Visible ~= nil then
								line.Visible = false;
							end
						end
					elseif drawing.Visible ~= nil then
						drawing.Visible = false;
					end
				end
			end
		end
	end
	
	if self.interface and self.interface._instanceCache then
		local cache = self.interface._instanceCache;
		if cache[self.instance] then
			cache[self.instance] = nil;
		end
	end
	
	self.maid:Cleanup();
	clear(self);
 end

function InstanceEspObject:Update()
	if not self.instance or not self.instance.Parent then
		return self:Destruct();
	end
	
	local interface = self.interface;
	local options = interface.instanceSettings or interface.teamSettings.enemy;
	
	-- Override with custom options
	for key, value in pairs(self.customOptions) do
		options[key] = value;
	end
	
	self.options = options;
	self.enabled = options.enabled;
	
	local primaryPart = self.instance:FindFirstChild("HumanoidRootPart") or self.instance:FindFirstChild("Primary") or self.instance:FindFirstChildOfClass("BasePart");
	if not primaryPart then
		return;
	end
	
	local _, onScreen, depth = worldToScreen(primaryPart.Position);
	self.onScreen = onScreen;
	self.distance = depth;
	
	if interface.sharedSettings.limitDistance and depth > interface.sharedSettings.maxDistance then
		self.onScreen = false;
	end
	
	if self.onScreen then
		local cache = self.charCache;
		local children = getChildren(self.instance);
		if not cache[1] or self.childCount ~= #children then
			clear(cache);
			
			for i = 1, #children do
				local part = children[i];
				if isA(part, "BasePart") then
					cache[#cache + 1] = part;
				end
			end
			
			self.childCount = #children;
		end
		
		self.corners = calculateCorners(getBoundingBox(cache));
	elseif options.offScreenArrow then
		local _, yaw, roll = toOrientation(camera.CFrame);
		local flatCFrame = CFrame.Angles(0, yaw, roll) + camera.CFrame.Position;
		local objectSpace = pointToObjectSpace(flatCFrame, primaryPart.Position);
		local angle = atan2(objectSpace.Z, objectSpace.X);
		
		self.direction = Vector2.new(cos(angle), sin(angle));
	end
	
    if self.interface.getHealth then
        self.health, self.maxHealth = self.interface.getHealth(self.instance);
    else
        local humanoid = self.instance:FindFirstChildOfClass("Humanoid");
        if humanoid then
            self.health = humanoid.Health;
            self.maxHealth = humanoid.MaxHealth;
        else
            self.health = 100;
            self.maxHealth = 100;
        end
    end
end 


function InstanceEspObject:Render()
	if not self.drawings or not self.drawings.visible then
		return;
	end
	
	local onScreen = self.onScreen or false;
	local enabled = self.enabled or false;
	local visible = self.drawings.visible;
	local hidden = self.drawings.hidden;
	local box3d = self.drawings.box3d;
	local interface = self.interface;
	local options = self.options;
	local corners = self.corners;
	
	-- Early exit if not valid
	if not corners then
		for _, drawing in pairs(visible) do
			drawing.Visible = false;
		end
		for _, drawing in pairs(hidden) do
			drawing.Visible = false;
		end
		for _, face in pairs(box3d) do
			for _, line in pairs(face) do
				line.Visible = false;
			end
		end
		return;
	end
	
	visible.box.Visible = enabled and onScreen and options.box;
	visible.boxOutline.Visible = visible.box.Visible and options.boxOutline;
	if visible.box.Visible then
		local box = visible.box;
		box.Position = corners.topLeft;
		box.Size = corners.bottomRight - corners.topLeft;
		box.Color = options.boxColor[1];
		box.Transparency = options.boxColor[2];
		
		local boxOutline = visible.boxOutline;
		boxOutline.Position = box.Position;
		boxOutline.Size = box.Size;
		boxOutline.Color = options.boxOutlineColor[1];
		boxOutline.Transparency = options.boxOutlineColor[2];
	end
	
	visible.boxFill.Visible = enabled and onScreen and options.boxFill;
	if visible.boxFill.Visible then
		local boxFill = visible.boxFill;
		boxFill.Position = corners.topLeft;
		boxFill.Size = corners.bottomRight - corners.topLeft;
		boxFill.Color = options.boxFillColor[1];
		boxFill.Transparency = options.boxFillColor[2];
	end
		
	visible.healthBar.Visible = enabled and onScreen and options.healthBar and self.health ~= nil;
	visible.healthBarOutline.Visible = visible.healthBar.Visible and options.healthBarOutline;
	if visible.healthBar.Visible then
		local barFrom = corners.topLeft - HEALTH_BAR_OFFSET;
		local barTo = corners.bottomLeft - HEALTH_BAR_OFFSET;
		
		local healthRatio = 0;
		if self.health and self.maxHealth and self.maxHealth > 0 then
			healthRatio = math.max(0, math.min(1, self.health / self.maxHealth));
		end
		
		local healthBar = visible.healthBar;
		healthBar.To = Vector2.new(barTo.X, barTo.Y);
		healthBar.From = lerp2(barTo, barFrom, healthRatio);
		healthBar.Color = lerpColor(options.dyingColor, options.healthyColor, healthRatio);
		
		if visible.healthBarOutline.Visible then
			local healthBarOutline = visible.healthBarOutline;
			local outlineFrom = barFrom - HEALTH_BAR_OUTLINE_OFFSET;
			local outlineTo = barTo + HEALTH_BAR_OUTLINE_OFFSET;
			healthBarOutline.To = outlineTo;
			healthBarOutline.From = outlineFrom;
			healthBarOutline.Color = options.healthBarOutlineColor[1];
			healthBarOutline.Transparency = options.healthBarOutlineColor[2];
		end
	end
	
    visible.healthText.Visible = enabled and onScreen and options.healthText and self.health ~= nil;
	if visible.healthText.Visible then
		local barFrom = corners.topLeft - HEALTH_BAR_OFFSET;
		local barTo = corners.bottomLeft - HEALTH_BAR_OFFSET;
		
		local healthText = visible.healthText;
		healthText.Text = round(self.health) .. "hp";
		healthText.Size = interface.sharedSettings.textSize;
		healthText.Font = interface.sharedSettings.textFont;
		healthText.Color = options.healthTextColor[1];
		healthText.Transparency = options.healthTextColor[2];
		healthText.Outline = options.healthTextOutline;
		healthText.OutlineColor = options.healthTextOutlineColor;
		healthText.Position = lerp2(barTo, barFrom, self.health/self.maxHealth) - healthText.TextBounds*0.5 - HEALTH_TEXT_OFFSET;
	end
	
	visible.name.Visible = enabled and onScreen and options.name;
	if visible.name.Visible then
		local name = visible.name;
		name.Size = interface.sharedSettings.textSize;
		name.Font = interface.sharedSettings.textFont;
		name.Color = options.nameColor[1];
		name.Transparency = options.nameColor[2];
		name.Outline = options.nameOutline;
		name.OutlineColor = options.nameOutlineColor;
		name.Position = (corners.topLeft + corners.topRight)*0.5 - Vector2.yAxis*name.TextBounds.Y - NAME_OFFSET;
	end
	
	visible.distance.Visible = enabled and onScreen and self.distance and options.distance;
	if visible.distance.Visible then
		local distance = visible.distance;
		distance.Text = round(self.distance) .. " studs";
		distance.Size = interface.sharedSettings.textSize;
		distance.Font = interface.sharedSettings.textFont;
		distance.Color = options.distanceColor[1];
		distance.Transparency = options.distanceColor[2];
		distance.Outline = options.distanceOutline;
		distance.OutlineColor = options.distanceOutlineColor;
		distance.Position = (corners.bottomLeft + corners.bottomRight)*0.5 + DISTANCE_OFFSET;
	end
	
	visible.customText.Visible = enabled and onScreen and options.customText;
	if visible.customText.Visible then
		local customText = visible.customText;
		customText.Text = options.customTextValue or "";
		customText.Size = interface.sharedSettings.textSize;
		customText.Font = interface.sharedSettings.textFont;
		customText.Color = options.customTextColor[1];
		customText.Transparency = options.customTextColor[2];
		customText.Outline = options.customTextOutline;
		customText.OutlineColor = options.customTextOutlineColor;
		customText.Position = 
			(corners.bottomLeft + corners.bottomRight)*0.5 +
			(visible.distance.Visible and DISTANCE_OFFSET + Vector2.yAxis*visible.distance.TextBounds.Y or Vector2.zero);
	end
	
	visible.tracer.Visible = enabled and onScreen and options.tracer;
	visible.tracerOutline.Visible = visible.tracer.Visible and options.tracerOutline;
	if visible.tracer.Visible then
		local tracer = visible.tracer;
		tracer.Color = options.tracerColor[1];
		tracer.Transparency = options.tracerColor[2];
		tracer.To = (corners.bottomLeft + corners.bottomRight)*0.5;
		tracer.From =
			options.tracerOrigin == "Middle" and viewportSize*0.5 or
			options.tracerOrigin == "Top" and viewportSize*Vector2.new(0.5, 0) or
			options.tracerOrigin == "Bottom" and viewportSize*Vector2.new(0.5, 1);
		
		local tracerOutline = visible.tracerOutline;
		tracerOutline.Color = options.tracerOutlineColor[1];
		tracerOutline.Transparency = options.tracerOutlineColor[2];
		tracerOutline.To = tracer.To;
		tracerOutline.From = tracer.From;
	end
	
	hidden.arrow.Visible = enabled and (not onScreen) and options.offScreenArrow;
	hidden.arrowOutline.Visible = hidden.arrow.Visible and options.offScreenArrowOutline;
	if hidden.arrow.Visible then
		local arrow = hidden.arrow;
		arrow.PointA = min2(max2(viewportSize*0.5 + self.direction*options.offScreenArrowRadius, Vector2.one*25), viewportSize - Vector2.one*25);
		arrow.PointB = arrow.PointA - rotateVector(self.direction, 0.45)*options.offScreenArrowSize;
		arrow.PointC = arrow.PointA - rotateVector(self.direction, -0.45)*options.offScreenArrowSize;
		arrow.Color = options.offScreenArrowColor[1];
		arrow.Transparency = options.offScreenArrowColor[2];
		
		local arrowOutline = hidden.arrowOutline;
		arrowOutline.PointA = arrow.PointA;
		arrowOutline.PointB = arrow.PointB;
		arrowOutline.PointC = arrow.PointC;
		arrowOutline.Color = options.offScreenArrowOutlineColor[1];
		arrowOutline.Transparency = options.offScreenArrowOutlineColor[2];
	end
	
	local box3dEnabled = enabled and onScreen and options.box3d;
	for i = 1, #box3d do
		local face = box3d[i];
		for i2 = 1, #face do
			local line = face[i2];
			line.Visible = box3dEnabled;
			if box3dEnabled then
				line.Color = options.box3dColor[1];
				line.Transparency = options.box3dColor[2];
			end
		end
		
		if box3dEnabled then
			local line1 = face[1];
			line1.From = corners.corners[i];
			line1.To = corners.corners[i == 4 and 1 or i+1];
			
			local line2 = face[2];
			line2.From = corners.corners[i == 4 and 1 or i+1];
			line2.To = corners.corners[i == 4 and 5 or i+5];
			
			local line3 = face[3];
			line3.From = corners.corners[i == 4 and 5 or i+5];
			line3.To = corners.corners[i == 4 and 8 or i+4];
		end
	end
end

local InstanceObject = {};
InstanceObject.__index = InstanceObject;

function InstanceObject.new(instance, options)
	local self = setmetatable({}, InstanceObject);
	self.instance = assert(instance, "Missing argument #1 (Instance Expected)");
	self.options = assert(options, "Missing argument #2 (table expected)");
	self.maid = Maid.new();
	
	self.removedConnection = instance.AncestryChanged:Connect(function()
		if not instance.Parent then
			self:Destruct();
		end
	end);
	self.maid:AddTask(self.removedConnection);
	
	self:Construct();
	return self;
end

function InstanceObject:Construct()
	local options = self.options;
	options.enabled = options.enabled == nil and true or options.enabled;
	options.text = options.text or "{name}";
	options.textColor = options.textColor or { Color3.new(1,1,1), 1 };
	options.textOutline = options.textOutline == nil and true or options.textOutline;
	options.textOutlineColor = options.textOutlineColor or Color3.new();
	options.textSize = options.textSize or 13;
	options.textFont = options.textFont or 2;
	options.limitDistance = options.limitDistance or false;
	options.maxDistance = options.maxDistance or 150;

	self.text = Drawing.new("Text");
	self.text.Center = true;
	self.maid:AddTask(self.text);

	self.renderConnection = runService.Heartbeat:Connect(function(deltaTime)
		self:Render(deltaTime);
	end);
	
	self.maid:AddTask(self.renderConnection);
end

function InstanceObject:Destruct()
	if self.text then
		self.text.Visible = false;
	end
	
	self.maid:Cleanup();
	
	local cache = EspInterface._instanceCache;
	if cache and cache[self.instance] then
		cache[self.instance] = nil;
	end
	
	clear(self);
end

function InstanceObject:Render()
	local instance = self.instance;
	if not instance or not instance.Parent then
		return self:Destruct();
	end

	local text = self.text;
	local options = self.options;
	if not options.enabled then
		text.Visible = false;
		return;
	end

	local world = getPivot(instance).Position;
	local position, visible, depth = worldToScreen(world);
	if options.limitDistance and depth > options.maxDistance then
		visible = false;
	end

	text.Visible = visible;
	if text.Visible then
		text.Position = position;
		text.Color = options.textColor[1];
		text.Transparency = options.textColor[2];
		text.Outline = options.textOutline;
		text.OutlineColor = options.textOutlineColor;
		text.Size = options.textSize;
		text.Font = options.textFont;
		text.Text = options.text
			:gsub("{name}", instance.Name)
			:gsub("{distance}", round(depth))
			:gsub("{position}", tostring(world));
	end
end

-- interface
local EspInterface = {
	_hasLoaded = false,
	_objectCache = {},
	_instanceCache = {},
	whitelist = {},
	maid = Maid.new(),
	sharedSettings = {
		textSize = 13,
		textFont = 2,
		limitDistance = false,
		maxDistance = 150,
	},
	teamSettings = {
		enemy = {
			enabled = false,
			box = false,
			boxColor = { Color3.new(1,0,0), 1 },
			boxOutline = true,
			boxOutlineColor = { Color3.new(), 1 },
			boxFill = false,
			boxFillColor = { Color3.new(1,0,0), 0.5 },
			healthBar = false,
			healthyColor = Color3.new(0,1,0),
			dyingColor = Color3.new(1,0,0),
			healthBarOutline = true,
			healthBarOutlineColor = { Color3.new(), 0.5 },
			healthText = false,
			healthTextColor = { Color3.new(1,1,1), 1 },
			healthTextOutline = true,
			healthTextOutlineColor = Color3.new(),
			box3d = false,
			box3dColor = { Color3.new(1,0,0), 1 },
			name = false,
			nameColor = { Color3.new(1,1,1), 1 },
			nameOutline = true,
			nameOutlineColor = Color3.new(),
			weapon = false,
			weaponColor = { Color3.new(1,1,1), 1 },
			weaponOutline = true,
			weaponOutlineColor = Color3.new(),
			distance = false,
			distanceColor = { Color3.new(1,1,1), 1 },
			distanceOutline = true,
			distanceOutlineColor = Color3.new(),
			tracer = false,
			tracerOrigin = "Bottom",
			tracerColor = { Color3.new(1,0,0), 1 },
			tracerOutline = true,
			tracerOutlineColor = { Color3.new(), 1 },
			offScreenArrow = false,
			offScreenArrowColor = { Color3.new(1,1,1), 1 },
			offScreenArrowSize = 15,
			offScreenArrowRadius = 150,
			offScreenArrowOutline = true,
			offScreenArrowOutlineColor = { Color3.new(), 1 },
			chams = false,
			chamsVisibleOnly = false,
			chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
			chamsOutlineColor = { Color3.new(1,0,0), 0 },
		},
		friendly = {
			enabled = false,
			box = false,
			boxColor = { Color3.new(0,1,0), 1 },
			boxOutline = true,
			boxOutlineColor = { Color3.new(), 1 },
			boxFill = false,
			boxFillColor = { Color3.new(0,1,0), 0.5 },
			healthBar = false,
			healthyColor = Color3.new(0,1,0),
			dyingColor = Color3.new(1,0,0),
			healthBarOutline = true,
			healthBarOutlineColor = { Color3.new(), 0.5 },
			healthText = false,
			healthTextColor = { Color3.new(1,1,1), 1 },
			healthTextOutline = true,
			healthTextOutlineColor = Color3.new(),
			box3d = false,
			box3dColor = { Color3.new(0,1,0), 1 },
			name = false,
			nameColor = { Color3.new(1,1,1), 1 },
			nameOutline = true,
			nameOutlineColor = Color3.new(),
			weapon = false,
			weaponColor = { Color3.new(1,1,1), 1 },
			weaponOutline = true,
			weaponOutlineColor = Color3.new(),
			distance = false,
			distanceColor = { Color3.new(1,1,1), 1 },
			distanceOutline = true,
			distanceOutlineColor = Color3.new(),
			tracer = false,
			tracerOrigin = "Bottom",
			tracerColor = { Color3.new(0,1,0), 1 },
			tracerOutline = true,
			tracerOutlineColor = { Color3.new(), 1 },
			offScreenArrow = false,
			offScreenArrowColor = { Color3.new(1,1,1), 1 },
			offScreenArrowSize = 15,
			offScreenArrowRadius = 150,
			offScreenArrowOutline = true,
			offScreenArrowOutlineColor = { Color3.new(), 1 },
			chams = false,
			chamsVisibleOnly = false,
			chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
			chamsOutlineColor = { Color3.new(0,1,0), 0 }
		}
	},
	-- Settings for instances (NPCs, etc.)
	instanceSettings = {
		enabled = false,
		box = false,
		boxColor = { Color3.new(1,1,0), 1 },
		boxOutline = true,
		boxOutlineColor = { Color3.new(), 1 },
		boxFill = false,
		boxFillColor = { Color3.new(1,1,0), 0.5 },
		healthBar = false,
		healthyColor = Color3.new(0,1,0),
		dyingColor = Color3.new(1,0,0),
		healthBarOutline = true,
		healthBarOutlineColor = { Color3.new(), 0.5 },
		healthText = false,
		healthTextColor = { Color3.new(1,1,1), 1 },
		healthTextOutline = true,
		healthTextOutlineColor = Color3.new(),
		box3d = false,
		box3dColor = { Color3.new(1,1,0), 1 },
		name = false,
		nameColor = { Color3.new(1,1,1), 1 },
		nameOutline = true,
		nameOutlineColor = Color3.new(),
		customText = false,
		customTextValue = "",
		customTextColor = { Color3.new(1,1,1), 1 },
		customTextOutline = true,
		customTextOutlineColor = Color3.new(),
		distance = false,
		distanceColor = { Color3.new(1,1,1), 1 },
		distanceOutline = true,
		distanceOutlineColor = Color3.new(),
		tracer = false,
		tracerOrigin = "Bottom",
		tracerColor = { Color3.new(1,1,0), 1 },
		tracerOutline = true,
		tracerOutlineColor = { Color3.new(), 1 },
		offScreenArrow = false,
		offScreenArrowColor = { Color3.new(1,1,1), 1 },
		offScreenArrowSize = 15,
		offScreenArrowRadius = 150,
		offScreenArrowOutline = true,
		offScreenArrowOutlineColor = { Color3.new(), 1 },
		chams = false,
		chamsVisibleOnly = false,
		chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
		chamsOutlineColor = { Color3.new(1,1,0), 0 },
	}
};

function EspInterface.AddInstanceEsp(instance, customOptions)
	if not instance or not instance.Parent then
		warn("Cannot add ESP to invalid instance");
		return nil;
	end
	
	local cache = EspInterface._instanceCache;
	if cache[instance] then
		--warn("Instance ESP handler already exists for " .. instance.Name);
		return cache[instance];
	end
	
	cache[instance] = InstanceEspObject.new(instance, EspInterface, customOptions);
	return cache[instance];
end


function EspInterface.AddInstance(instance, options)
	if not instance or not instance.Parent then
		warn("Cannot add ESP to invalid instance");
		return nil;
	end
	
	local cache = EspInterface._instanceCache;
	if cache[instance] then
		--warn("Instance handler already exists for " .. instance.Name);
		return cache[instance];
	end
	
	cache[instance] = InstanceObject.new(instance, options);
	return cache[instance];
end

-- Remove instance ESP
function EspInterface.RemoveInstance(instance)
	local cache = EspInterface._instanceCache;
	local object = cache[instance];
	if object then
		object:Destruct();
		cache[instance] = nil;
		return true;
	end
	return false;
end

-- Clean up invalid instances
function EspInterface.CleanupInstances()
	local cache = EspInterface._instanceCache;
	local toRemove = {};
	
	for instance, object in pairs(cache) do
		if not instance or not instance.Parent then
			toRemove[#toRemove + 1] = instance;
		end
	end
	
	for i = 1, #toRemove do
		local instance = toRemove[i];
		EspInterface.RemoveInstance(instance);
	end
	
	return #toRemove;
end

-- Add multiple instances with same options
function EspInterface.AddInstances(instances, customOptions)
	local objects = {};
	for i, instance in pairs(instances) do
		local obj = EspInterface.AddInstanceEsp(instance, customOptions);
		if obj then
			objects[i] = obj;
		end
	end
	return objects;
end

-- Add all instances of a class
function EspInterface.AddInstancesByClass(className, customOptions)
	local instances = {};
	for i, v in pairs(workspace:GetDescendants()) do
		if v:IsA(className) then
			instances[#instances + 1] = v;
		end
	end
	return EspInterface.AddInstances(instances, customOptions);
end

function EspInterface.Load()
	assert(not EspInterface._hasLoaded, "Esp has already been loaded.");

	local function createObject(player)
		EspInterface._objectCache[player] = {
			EspObject.new(player, EspInterface),
			ChamObject.new(player, EspInterface)
		};
	end

	local function removeObject(player)
		local object = EspInterface._objectCache[player];
		if object then
			for i = 1, #object do
				object[i]:Destruct();
			end
			EspInterface._objectCache[player] = nil;
		end
	end

	for _, player in next, players:GetPlayers() do
		if player ~= localPlayer then
			createObject(player);
		end
	end

	EspInterface.playerAdded = players.PlayerAdded:Connect(createObject);
	EspInterface.playerRemoving = players.PlayerRemoving:Connect(removeObject);
	
	EspInterface.maid:AddTask(EspInterface.playerAdded);
	EspInterface.maid:AddTask(EspInterface.playerRemoving);
	
	-- Add periodic cleanup for instances
	EspInterface.cleanupConnection = runService.Heartbeat:Connect(function()
		-- Run cleanup every 10 seconds
		if tick() % 10 < 0.1 then
			EspInterface.CleanupInstances();
		end
	end);
	EspInterface.maid:AddTask(EspInterface.cleanupConnection);
	
	EspInterface._hasLoaded = true;
end

function EspInterface.Unload()
	assert(EspInterface._hasLoaded, "Esp has not been loaded yet.");

	-- Clean up all player objects
	for player, object in next, EspInterface._objectCache do
		if object then
			for i = 1, #object do
				object[i]:Destruct();
			end
		end
	end
	clear(EspInterface._objectCache);
	
	-- Clean up all instance objects
	for instance, object in next, EspInterface._instanceCache do
		if object then
			object:Destruct();
		end
	end
	clear(EspInterface._instanceCache);

	EspInterface.maid:Cleanup();
	EspInterface._hasLoaded = false;
end

function EspInterface.getWeapon(player)
	local character = player.Character;
	if not character then return "None"; end
	
	-- Check for held tools
	local tool = character:FindFirstChildOfClass("Tool");
	if tool then
		return tool.Name;
	end
	
	return "Unarmed";
end

function EspInterface.isFriendly(player)
	return player.Team and player.Team == localPlayer.Team;
end

function EspInterface.getCharacter(player)
	return player.Character;
end

function EspInterface.getHealth(character)
	local humanoid = character and findFirstChildOfClass(character, "Humanoid");
	if humanoid then
		return humanoid.Health, humanoid.MaxHealth;
	end
	return 100, 100;
end

-- Utility functions for easier configuration
function EspInterface.EnableEnemyEsp()
	EspInterface.teamSettings.enemy.enabled = true;
	EspInterface.teamSettings.enemy.box = true;
	EspInterface.teamSettings.enemy.name = true;
	EspInterface.teamSettings.enemy.distance = true;
	EspInterface.teamSettings.enemy.healthBar = true;
	EspInterface.teamSettings.enemy.weapon = true;
end

function EspInterface.EnableFriendlyEsp()
	EspInterface.teamSettings.friendly.enabled = true;
	EspInterface.teamSettings.friendly.box = true;
	EspInterface.teamSettings.friendly.name = true;
	EspInterface.teamSettings.friendly.distance = true;
	EspInterface.teamSettings.friendly.healthBar = true;
	EspInterface.teamSettings.friendly.weapon = true;
end

function EspInterface.EnableInstanceEsp()
	EspInterface.instanceSettings.enabled = true;
	EspInterface.instanceSettings.box = true;
	EspInterface.instanceSettings.name = true;
	EspInterface.instanceSettings.distance = true;
end

--[[-- Example usage for NPCs
function EspInterface.SetupNpcEsp(options)
	options = options or {};
	local npcOptions = {
		enabled = true,
		box = true,
		boxColor = { Color3.new(1, 0.5, 0), 1 },
		name = true,
		nameColor = { Color3.new(1, 1, 1), 1 },
		distance = true,
		healthBar = options.healthBar or false,
		customText = options.customText or false,
		customTextValue = options.customTextValue or "",
	};
	
	for key, value in pairs(options) do
		npcOptions[key] = value;
	end
	
	return npcOptions;
end]]
return EspInterface;