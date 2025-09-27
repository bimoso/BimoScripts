--== Rayfield Patcher v1 (tabs/sections hide+rename, controls, window+notifications) ==
getgenv().RFPATCH = getgenv().RFPATCH or {}
local P = getgenv().RFPATCH

-- Tab/Control rules
P.skipTabs      = P.skipTabs      or {}   -- e.g. P.skipTabs["Debug"]=true
P.renameTabs    = P.renameTabs    or {}   -- e.g. P.renameTabs["Main"]="Home"
P.hideByIdx     = P.hideByIdx     or {}   -- Flag -> true
P.hideByText    = P.hideByText    or {}   -- Name -> true
P.renameByIdx   = P.renameByIdx   or {}   -- Flag -> NewName
P.renameByText  = P.renameByText  or {}   -- Name -> NewName

-- Sections (Rayfield's "groupboxes")
P.hideSections  = P.hideSections  or {}   -- Section title -> true
P.renameSections = P.renameSections or {}   -- old -> new

-- Window overrides
P.windowTitleOverride        = P.windowTitleOverride        or nil  -- cfg.Name
P.windowIconOverride         = P.windowIconOverride         or nil  -- number|string
P.windowThemeOverride        = P.windowThemeOverride        or nil  -- cfg.Theme
P.windowLoadingTitleOverride = P.windowLoadingTitleOverride or nil  -- cfg.LoadingTitle
P.windowLoadingSubOverride   = P.windowLoadingSubOverride   or nil  -- cfg.LoadingSubtitle

-- Config save overrides (Rayfield's ConfigurationSaving)
P.configFolderOverride = P.configFolderOverride or nil
P.configFileOverride   = P.configFileOverride   or nil

-- Tab icon overrides
P.tabIcons = P.tabIcons or {}                 -- key = tab name (after rename), value = icon (number|string)

-- Notification overrides (Title/Content/Description)
P.notifyTitleMap     = P.notifyTitleMap     or {} -- exact string -> replacement
P.notifyContentMap   = P.notifyContentMap   or {} -- exact string -> replacement
P._notifyTitleFn     = P._notifyTitleFn     or nil -- function(title) -> title
P._notifyContentFn   = P._notifyContentFn   or nil -- function(content) -> content

-- Helpers
function P.HideTab(name)
	P.skipTabs[name] = true
end
function P.RenameTab(old, new)
	P.renameTabs[old] = new
end
function P.Hide(idOrText)
	P.hideByIdx[idOrText] = true
end
function P.HideText(text)
	P.hideByText[text] = true
end
function P.Rename(id, newText)
	P.renameByIdx[id] = newText
end
function P.RenameText(old, newText)
	P.renameByText[old] = newText
end
function P.HideSection(title)
	P.hideSections[title] = true
end
function P.RenameSection(old, new)
	P.renameSections[old] = new
end
function P.SetTitle(s)
	P.windowTitleOverride = s
end
function P.SetIcon(v)
	P.windowIconOverride = v
end
function P.SetTheme(s)
	P.windowThemeOverride = s
end
function P.SetLoadingTitle(s)
	P.windowLoadingTitleOverride = s
end
function P.SetLoadingSubtitle(s)
	P.windowLoadingSubOverride = s
end
function P.SetTabIcon(tabName, icon)
	P.tabIcons[tabName] = icon
end
function P.SetConfigFolder(name)
	P.configFolderOverride = name
end
function P.SetConfigFile(name)
	P.configFileOverride = name
end
function P.NotifyTitle(from, to)
	P.notifyTitleMap[from] = to
end
function P.NotifyContent(from, to)
	P.notifyContentMap[from] = to
end
function P.NotifyTitleFn(fn)
	P._notifyTitleFn = fn
end
function P.NotifyContentFn(fn)
	P._notifyContentFn = fn
end

                                                                                -- ---------- internals ----------
local function dummyElem(kind)
	local self = {}
	return setmetatable(self, {
		__tostring = function()
			return "<Hidden:" .. (kind or "Element") .. ">"
		end,
		__index = function(_, _)
			return function()
				return self
			end
		end
	})
end
local function makeFakeTab()
	local T = {}
	local function ret()
		return dummyElem("Element")
	end
	function T:CreateSection(...)
		return dummyElem("Section")
	end
	function T:CreateButton(...)
		return ret()
	end
	function T:CreateToggle(...)
		return ret()
	end
	function T:CreateSlider(...)
		return ret()
	end
	function T:CreateDropdown(...)
		return ret()
	end
	function T:CreateInput(...)
		return ret()
	end
	function T:CreateLabel(...)
		return ret()
	end
	function T:CreateParagraph(...)
		return ret()
	end
	function T:CreateKeybind(...)
		return ret()
	end
	function T:CreateColorPicker(...)
		return ret()
	end
                                                                                                                    -- (you can add any other CreateX Rayfield supports; returning a dummy avoids nil errors)
	return T
end
local function patchTabElements(tab)
	local function wrap(name, isSection)
		if type(tab[name]) ~= "function" then
			return
		end
		local _f = tab[name]
		tab[name] = function(t, arg1, ...)
			if isSection then
				local title = arg1
				local mapped = (type(title) == "string" and (P.renameSections[title] or title)) or title
				local hide = (type(title) == "string") and (P.hideSections[title] or P.hideSections[mapped] or P.hideByText[title]) or false
				if hide then
					return dummyElem("Section")
				end
				return _f(t, mapped, ...)
			else
				local opts = arg1
				if type(opts) ~= "table" then
                                                                                                                                -- label/paragraph can allow string shorthand → treat it like Name
					local nameStr = (type(opts) == "string") and opts or nil
					if nameStr then
						if P.hideByText[nameStr] then
							return dummyElem(name)
						end
						local rn = P.renameByText[nameStr]
						if rn then
							return _f(t, rn, ...)
						end
					end
					return _f(t, arg1, ...)
				end
				local nameStr = opts.Name
				local flagStr = opts.Flag
                                                                                                                                    -- rename first
				if flagStr and P.renameByIdx[flagStr] then
					opts.Name = P.renameByIdx[flagStr]
				elseif nameStr and P.renameByText[nameStr] then
					opts.Name = P.renameByText[nameStr]
				end
                                                                                                                                    -- hide?
				if (flagStr and P.hideByIdx[flagStr]) or (nameStr and P.hideByText[nameStr]) then
					return dummyElem(name)
				end
				return _f(t, opts, ...)
			end
		end
	end
	wrap("CreateSection", true)
	wrap("CreateButton");
	wrap("CreateToggle");
	wrap("CreateSlider")
	wrap("CreateDropdown");
	wrap("CreateInput");
	wrap("CreateLabel")
	wrap("CreateParagraph");
	wrap("CreateKeybind");
	wrap("CreateColorPicker")
	return tab
end

                                                                                                                    -- hook loadstring to patch Rayfield after it loads
local _orig_loadstring = loadstring
loadstring = function(src)
	local compiled = _orig_loadstring(src)
	if type(compiled) ~= "function" then
		return compiled
	end
	return function(...)
		local lib = compiled(...)
                                                                                                                        -- guard: is this Rayfield-like?
		if type(lib) ~= "table" or type(lib.CreateWindow) ~= "function" then
			return lib
		end

                                                                                                                            -- Patch notifications: Title/Content or Title/Description variants
		if type(lib.Notify) == "function" then
			local _Notify = lib.Notify
			lib.Notify = function(self, info, ...)
				if type(info) == "table" then
					local title = rawget(info, "Title")
					local content = rawget(info, "Content") or rawget(info, "Description")
					if title and P.notifyTitleMap[title] then
						info.Title = P.notifyTitleMap[title]
					end
					if content then
						local replaced = P.notifyContentMap[content]
						if replaced then
							if info.Content ~= nil then
								info.Content = replaced
							else
								info.Description = replaced
							end
						end
					end
					if P._notifyTitleFn and info.Title then
						info.Title = P._notifyTitleFn(info.Title)
					end
					if P._notifyContentFn and (info.Content or info.Description) then
						local cur = info.Content or info.Description
						local new = P._notifyContentFn(cur)
						if info.Content ~= nil then
							info.Content = new
						else
							info.Description = new
						end
					end
					return _Notify(self, info, ...)
				else
					local content = tostring(info)
					if P.notifyContentMap[content] then
						content = P.notifyContentMap[content]
					end
					if P._notifyContentFn then
						content = P._notifyContentFn(content)
					end
					return _Notify(self, content, ...)
				end
			end
		end

                                                                                                                                                -- Patch CreateWindow
		local _CreateWindow = lib.CreateWindow
		lib.CreateWindow = function(self, cfg)
			if type(cfg) == "table" then
				if P.windowTitleOverride        ~= nil then
					cfg.Name           = P.windowTitleOverride
				end
				if P.windowIconOverride         ~= nil then
					cfg.Icon           = P.windowIconOverride
				end
				if P.windowThemeOverride        ~= nil then
					cfg.Theme          = P.windowThemeOverride
				end
				if P.windowLoadingTitleOverride ~= nil then
					cfg.LoadingTitle   = P.windowLoadingTitleOverride
				end
				if P.windowLoadingSubOverride   ~= nil then
					cfg.LoadingSubtitle = P.windowLoadingSubOverride
				end
				if type(cfg.ConfigurationSaving) == "table" then
					if P.configFolderOverride ~= nil then
						cfg.ConfigurationSaving.FolderName = P.configFolderOverride
					end
					if P.configFileOverride   ~= nil then
						cfg.ConfigurationSaving.FileName   = P.configFileOverride
					end
				end
			end
			local window = _CreateWindow(self, cfg)

                                                                                                                                                                            -- Wrap CreateTab to hide/rename before real creation; also override icon
			local _CreateTab = window.CreateTab
			if type(_CreateTab) == "function" then
				window.CreateTab = function(win, name, icon, ...)
					local mapped = P.renameTabs[name] or name
					local hidden = P.skipTabs[name] or P.skipTabs[mapped]
					if hidden then
						return makeFakeTab()
					end
					local forcedIcon = P.tabIcons[mapped]
					local realTab = (forcedIcon ~= nil)
                                                                                                                                                                                and _CreateTab(win, mapped, forcedIcon, ...)
                                                                                                                                                                                or  _CreateTab(win, mapped, icon, ...)
					return patchTabElements(realTab)
				end
			end
			return window
		end
		return lib
	end
end
                                                                                                                                                            --============================== end patch =====================================
RFPATCH.SetTitle("Eat the World")
RFPATCH.SetConfigFolder("NoxHub/EatTheWorld")
RFPATCH.SetConfigFile("EatTheWorld")
RFPATCH.SetLoadingTitle("Loading NoxHub...")
RFPATCH.SetLoadingSubtitle("Eat the World")
RFPATCH.RenameTab("Blocks", "Main")
RFPATCH.NotifyTitle("Luminary HUB", "NoxHub Loaded")
RFPATCH.NotifyContent("Thanks for using the Luminary HUB script!", "Welcome to NoxHub, enjoy the script!")
loadstring(game:HttpGet('https://raw.githubusercontent.com/whodunitwww/noxhelpers/refs/heads/main/eat-the-world.lua'))()