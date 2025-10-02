local URL_REPLACEMENTS = {
	["https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/newneoxlib"] = "https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/neox/noxlib",
}
local function rewrite(url)
	if type(url) ~= "string" then
		return url
	end
	for original, replacement in pairs(URL_REPLACEMENTS) do
		if url:find(original, 1, true) then
			return replacement
		end
	end
	return url
end
do
	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	local origIndex = mt.__index
	local origNamecall = mt.__namecall
	mt.__index = function(self, key)
		if self == game and (key == "HttpGet" or key == "HttpGetAsync") then
			return function(_, url, ...)
				return origIndex(self, key)(self, rewrite(url), ...)
			end
		end
		return origIndex(self, key)
	end
	mt.__namecall = function(self, ...)
		local method = getnamecallmethod()
		if self == game and (method == "HttpGet" or method == "HttpGetAsync") then
			local args = table.pack(...)
			args[1] = rewrite(args[1])
			return origNamecall(self, table.unpack(args, 1, args.n))
		end
		return origNamecall(self, ...)
	end
	setreadonly(mt, true)
end
local function wrap(fn)
	return function(request, ...)
		local url = (typeof(request) == "table" and request.Url) or request
		local newUrl = rewrite(url)
		if typeof(request) == "table" then
			request.Url = newUrl
			return fn(request, ...)
		else
			return fn(newUrl, ...)
		end
	end
end
if syn and syn.request then
	syn.request = wrap(syn.request)
end
if http and http.request then
	http.request = wrap(http.request)
end
if request then
	request = wrap(request)
end
if http_request then
	http_request = wrap(http_request)
end

                ----------------------------------------------------------------------------------------------------------
local StarterGui = game:GetService("StarterGui")
local limit, count = 4, 0
local old
old = hookfunction(StarterGui.SetCore, function(self, name, data)
	if name == "SendNotification" and count < limit then
		count += 1
		return
	end
	return old(self, name, data)
end)

            ----------------------------------------------------------------------------------------------------------

            --== Fluent Patcher v1c (safe HideTab + robust window/notify/icon overrides) ==
getgenv().FLUENTPATCH = getgenv().FLUENTPATCH or {}
local P = getgenv().FLUENTPATCH

            -- Rules
P.skipTabs, P.renameTabs = P.skipTabs or {}, P.renameTabs or {}
P.hideByIdx, P.hideByText = P.hideByIdx or {}, P.hideByText or {}
P.renameByIdx, P.renameByText = P.renameByIdx or {}, P.renameByText or {}

            -- Window overrides applied at CreateWindow
P.windowOverrides = type(P.windowOverrides) == "table" and P.windowOverrides or {
	Title = nil,
	SubTitle = nil,
	Theme = nil,
	TabWidth = nil,
	Size = nil,
	Acrylic = nil,
	MinimizeKey = nil
}

            -- Tab icon overrides (Lucide name string)
P.tabIcons = P.tabIcons or {}

            -- Notification text overrides / mapper
P.notifyTitleOverride   = P.notifyTitleOverride
P.notifyContentOverride = P.notifyContentOverride
P.notifySubOverride     = P.notifySubOverride
P.notifyMapper          = P.notifyMapper

            -- Optional folder helpers (Interface/Save addons)
P.interfaceFolder = P.interfaceFolder
P.saveFolder      = P.saveFolder

            -- Helpers
function P.HideTab(n)
	P.skipTabs[n] = true
end
function P.RenameTab(a, b)
	P.renameTabs[a] = b
end
function P.Hide(x)
	P.hideByIdx[x] = true
end
function P.HideText(s)
	P.hideByText[s] = true
end
function P.Rename(i, s)
	P.renameByIdx[i] = s
end
function P.RenameText(a, b)
	P.renameByText[a] = b
end
function P.SetTabIcon(tab, icon)
	P.tabIcons[tab] = icon
end
function P.SetWindow(k, v)
	P.windowOverrides[k] = v
end
function P.SetInterfaceFolder(s)
	P.interfaceFolder = s
end
function P.SetSaveFolder(s)
	P.saveFolder = s
end

                                                    -- Internals
local __PATCH_OPTIONS
local function dummyOption(default)
	local o = {
		Value = default,
		Transparency = 0
	}
	function o:SetValue(v)
		self.Value = v
	end
	function o:SetValueRGB(v)
		self.Value = v
	end
	function o:GetState()
		return self.Value
	end
	function o:OnChanged()
	end
	function o:OnClick()
	end
	function o:SetTitle()
	end
	function o:SetDescription()
	end
	return o
end

                                                                            -- ultra-safe sink that absorbs any method/chain
local function sink()
	local self = {}
	return setmetatable(self, {
		__index = function()
			return function()
				return self
			end
		end
	})
end

                                                                        -- a fake “tab-like” object that exposes common Fluent adders
local function fakeTabLike()
	local f = sink()
	local function ret()
		return sink()
	end
	f.AddParagraph = ret;
	f.AddButton = ret;
	f.AddToggle = ret;
	f.AddSlider = ret
	f.AddDropdown = ret;
	f.AddColorpicker = ret;
	f.AddKeybind = ret;
	f.AddInput = ret
	f.AddSection = ret;
	f.CreateSection = ret
	return f
end
local function shouldHide(idx, title)
	return (idx and P.hideByIdx[idx]) or (title and P.hideByText[title])
end
local function applyRename(idx, title, opts)
	local new = (idx and P.renameByIdx[idx]) or (title and P.renameByText[title])
	if new and type(opts) == "table" and opts.Title ~= nil then
		opts.Title = new
	end
	return new or title
end
local function wrapTab(tab)
	local function wrapIdxFirst(m)
		if type(tab[m]) ~= "function" then
			return
		end
		local _orig = tab[m]
		tab[m] = function(t, idx, opts)
			opts = type(opts) == "table" and opts or {}
			applyRename(idx, opts.Title, opts)
			if shouldHide(idx, opts.Title) then
				if __PATCH_OPTIONS and idx then
					__PATCH_OPTIONS[idx] = __PATCH_OPTIONS[idx] or dummyOption(opts.Default)
				end
				return sink()
			end
			return _orig(t, idx, opts)
		end
	end
	local function wrapOptsOnly(m)
		if type(tab[m]) ~= "function" then
			return
		end
		local _orig = tab[m]
		tab[m] = function(t, opts)
			opts = type(opts) == "table" and opts or {}
			applyRename(nil, opts.Title, opts)
			if shouldHide(nil, opts.Title) then
				return sink()
			end
			return _orig(t, opts)
		end
	end
	wrapOptsOnly("AddParagraph");
	wrapOptsOnly("AddButton")
	wrapIdxFirst("AddToggle");
	wrapIdxFirst("AddSlider");
	wrapIdxFirst("AddDropdown")
	wrapIdxFirst("AddColorpicker");
	wrapIdxFirst("AddKeybind");
	wrapIdxFirst("AddInput")
                                                                    -- sections (if present) should return something tab-like; wrap them too
	for _, secAdder in ipairs({
		"AddSection",
		"CreateSection"
	}) do
		if type(tab[secAdder]) == "function" then
			local _orig = tab[secAdder]
			tab[secAdder] = function(t, ...)
				local gb = _orig(t, ...)
				return gb and wrapTab(gb) or fakeTabLike()
			end
		end
	end
	return tab
end

                                                            -- Patch loadstring
local _orig_loadstring = loadstring
loadstring = function(src)
	local f = _orig_loadstring(src)
	if type(f) ~= "function" then
		return f
	end
	return function(...)
		local lib = f(...)
		if type(lib) ~= "table" or type(lib.CreateWindow) ~= "function" then
			return lib
		end
		__PATCH_OPTIONS = lib.Options or __PATCH_OPTIONS

                                                                    -- Notifications override
		if type(lib.Notify) == "function" then
			local _notify = lib.Notify
			lib.Notify = function(self, cfg)
				cfg = cfg or {}
				local T = (P.notifyTitleOverride  ~= nil) and P.notifyTitleOverride  or cfg.Title
				local C = (P.notifyContentOverride ~= nil) and P.notifyContentOverride or cfg.Content
				local S = (P.notifySubOverride    ~= nil) and P.notifySubOverride     or cfg.SubContent
				local D = cfg.Duration
				if type(P.notifyMapper) == "function" then
					local t, c, s, d = P.notifyMapper(T, C, S, D);
					T = t or T;
					C = c or C;
					S = s or S;
					D = d or D
				end
				return _notify(self, {
					Title = T,
					Content = C,
					SubContent = S,
					Duration = D
				})
			end
		end

                                                                -- CreateWindow wrapper
		local _CreateWindow = lib.CreateWindow
		lib.CreateWindow = function(self, cfg)
			cfg = type(cfg) == "table" and cfg or {}
			for k, v in pairs(P.windowOverrides) do
				if v ~= nil then
					cfg[k] = v
				end
			end
			local window = _CreateWindow(self, cfg)

                                                                    -- AddTab wrapper: decide hide BEFORE real AddTab so no sidebar item gets created
			if type(window.AddTab) == "function" then
				local _AddTab = window.AddTab
				window.AddTab = function(win, tcfg)
					if type(tcfg) ~= "table" then
						tcfg = {
							Title = tostring(tcfg or "Tab"),
							Icon = ""
						}
					end
					local origTitle = tcfg.Title
					local mapped = P.renameTabs[origTitle] or origTitle
					if P.skipTabs[origTitle] or P.skipTabs[mapped] then
						return fakeTabLike()
					end
					tcfg.Title = mapped
					local forcedIcon = P.tabIcons[mapped];
					if forcedIcon ~= nil then
						tcfg.Icon = forcedIcon
					end
					local tab = _AddTab(win, tcfg)
					return wrapTab(tab)
				end
			end
			return window
		end

                                                                    -- Folder helpers (call after you attach addons)
		lib.__FluentPatchApplyFolders = function(SaveManager, InterfaceManager)
			if InterfaceManager and type(InterfaceManager.SetFolder) == "function" and P.interfaceFolder then
				pcall(function()
					InterfaceManager:SetFolder(P.interfaceFolder)
				end)
			end
			if SaveManager and type(SaveManager.SetFolder) == "function" and P.saveFolder then
				pcall(function()
					SaveManager:SetFolder(P.saveFolder)
				end)
			end
		end
		return lib
	end
end
FLUENTPATCH.SetWindow("Title", "99 Nights In The Forest")
FLUENTPATCH.SetWindow("SubTitle", "NoxHub | Premium Scripts")
FLUENTPATCH.HideTab(" Home")
FLUENTPATCH.HideText("Create Safe Zone")

                                                                ----------------------------------------------------------------------------------------------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/loading-screen", true))()

                                                                ----------------------------------------------------------------------------------------------------------
if not isfile("neoxkey.txt") then
	writefile("neoxkey.txt", "epic key")
end
local VALID_HOST = "neoxsoftworks.eu"
local VALID_PATH = "/api/validate-key"
local FORCED_BODY = '{"valid":true,"message":"Key valid for this HWID."}'
local oldRequest = request
request = function(tbl, ...)
	local url = tbl.Url or tbl.url or tbl[1] or tbl
	if type(url) == "string" and url:find(VALID_HOST, 1, true) and url:find(VALID_PATH, 1, true) then
		return {
			StatusCode = 200,
			Success = true,
			Body = FORCED_BODY
		}
	end
	return oldRequest(tbl, ...)
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/neox/99NITF.lua", true))()

                                                            ----------------------------------------------------------------------------------------------------------
do
	local cg = game:GetService("CoreGui")
	local NOX_IMG = "rbxthumb://type=Asset&id=114453540825869&w=150&h=150"
	local function patchMinimize()
		local gui = cg:FindFirstChild("NeoxHubMinimizeUI")
		if not gui then
			return
		end
		local tb = gui:FindFirstChildWhichIsA("TextButton", true)
		if tb then
			if tb.Text ~= "NOX" then
				tb.Text = "NOX"
			end
			tb.TextColor3 = Color3.new(1, 1, 1)
			tb.Font = Enum.Font.GothamBold
		end
		local ib = gui:FindFirstChildWhichIsA("ImageButton", true)
		if ib then
			if ib.Image ~= NOX_IMG then
				ib.Image = NOX_IMG
			end
			ib.ImageTransparency = 0
			ib.ScaleType = Enum.ScaleType.Fit
		end
	end
	patchMinimize()
	cg.DescendantAdded:Connect(function(i)
		if i.Name == "NeoxHubMinimizeUI" or i:IsA("TextButton") or i:IsA("ImageButton") then
			task.defer(patchMinimize)
		end
	end)
end

                                                                ----------------------------------------------------------------------------------------------------------
wait(8)
delfile("neoxkey.txt")