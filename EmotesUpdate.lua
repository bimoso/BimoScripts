--- Keybind to open for pc is "comma" -> " , "
--- Basado en el de Gi#7331
--- Modificado por Bimo

-- Configuración centralizada
local CONFIG = {
    GUI_NAME = "Emotes",
    NOTIFICATION_DURATION = 15,
    LOADING_DELAY = 1,
    KEYBIND = Enum.KeyCode.Comma,
    FAVORITE_OFF_ICON = "rbxassetid://10651060677",
    FAVORITE_ON_ICON = "rbxassetid://10651061109",
    FAVORITES_FILE = "FavoritedEmotes.txt",
    KEYBINDS_FILE = "EmoteKeybinds.json", -- se cambia extensión a .json
    COLORS = {
        NORMAL = Color3.fromRGB(0, 0, 0),
        CLOSE = Color3.fromRGB(0.5, 0, 0),
        TEXT = Color3.new(1, 1, 1),
        BACKGROUND = Color3.fromRGB(30, 30, 30),
        HIGHLIGHT = Color3.fromRGB(60, 60, 80), 
        FAVORITE_HIGHLIGHT = Color3.fromRGB(60, 40, 40), 
        KEYBIND_HIGHLIGHT = Color3.fromRGB(40, 70, 40),
        KEYBIND_TEXT = Color3.fromRGB(200, 255, 200)
    },
    UI = {
        OPACITY = 0.5,
        CORNER_RADIUS = UDim.new(1, 0)
    },
    ANIMATIONS = {
        HOVER_DURATION = 0.15,
        SCALE_HOVER = 1.05
    }
}

-- Servicios
local Services = {
    StarterGui = game:GetService("StarterGui"),
    CoreGui = game:GetService("CoreGui"),
    ContextActionService = game:GetService("ContextActionService"),
    HttpService = game:GetService("HttpService"),
    GuiService = game:GetService("GuiService"),
    MarketplaceService = game:GetService("MarketplaceService"),
    Players = game:GetService("Players"),
    UserInputService = game:GetService("UserInputService"),
    TweenService = game:GetService("TweenService"),
    RunService = game:GetService("RunService")
}

-- Enviar notificación inicial
Services.StarterGui:SetCore("SendNotification", {
    Title = "Tips!",
    Text = "Wait 1 - 15 seconds to show gui if it don't show try execute again",
    Duration = CONFIG.NOTIFICATION_DURATION
})

-- Destruir GUI existente si ya existe
if Services.CoreGui:FindFirstChild(CONFIG.GUI_NAME) then
    Services.CoreGui:FindFirstChild(CONFIG.GUI_NAME):Destroy()
end

wait(CONFIG.LOADING_DELAY)

-- Objetos de datos principales
local UIElements = {
    -- Pre-inicializa las claves necesarias para evitar errores
    ScreenGui = nil,
    BackFrame = nil,
    EmoteName = nil,
    Loading = nil,
    Frame = nil, 
    SortFrame = nil,
    Open = nil,
    SearchBar = nil,
    Corner = nil
}

local DataManager = {
    Emotes = {},
    LoadedEmotes = {},
    FavoritedEmotes = {},
    EmoteKeybinds = {}, -- Tabla para almacenar keybinds
    EmotesLoaded = false,
    CurrentSort = "recentfirst"
}

-- Eliminar sistemas duplicados y crear uno solo limpio
if _G.EmotesKeybindSystem then
    -- Desconectar eventos anteriores si existen
    if _G.EmotesKeybindSystem.MainConnection then
        _G.EmotesKeybindSystem.MainConnection:Disconnect()
    end
end

-- Inicializar un sistema único y limpio
_G.EmotesKeybindSystem = {
    Keybinds = {},
    MainConnection = nil,
    Version = 2 -- Para identificar la versión del sistema
}

-- Crear un espacio global en _G para mantener las keybinds entre recargas
if not _G.EmotesKeybindSystem then
    _G.EmotesKeybindSystem = {
        KeybindConnection = nil,
        Keybinds = {}
    }
end

-- Crear un espacio global único para keybinds, eliminando duplicidades previas
if not _G.EmotesKeybindSystemUnique then
    _G.EmotesKeybindSystemUnique = {
        MainConnection = nil,
        Keybinds = {},
        Active = false
    }
end

-- Funciones de utilidad
local Utility = {}

function Utility.SendNotification(title, text, duration)
    -- Comprueba si syn existe antes de usarlo de manera segura
    local hasSyn = type(_G.syn) == "table" and type(_G.syn.toast_notification) == "function"
    
    if hasSyn then
        -- Uso más seguro sin depender de ToastType
        _G.syn.toast_notification({
            Type = 1, -- 1 es generalmente Error en la mayoría de los exploits
            Title = title,
            Content = text
        })
    else
        Services.StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or CONFIG.NOTIFICATION_DURATION
        })
    end
end

function Utility.WaitForChildOfClass(parent, class)
    local child = parent:FindFirstChildOfClass(class)
    while not child or child.ClassName ~= class do
        child = parent.ChildAdded:Wait()
    end
    return child
end

function Utility.SafeHttpRequest(url, retryDelay)
    local success, response = pcall(function()
        return game:HttpGetAsync(url)
    end)
    
    if not success then
        task.wait(retryDelay or 10)
        return Utility.SafeHttpRequest(url, retryDelay)
    end
    
    return response
end

function Utility.LoadFavorites()
    if isfile(CONFIG.FAVORITES_FILE) then
        local success, data = pcall(function()
            return Services.HttpService:JSONDecode(readfile(CONFIG.FAVORITES_FILE))
        end)
        
        if success then
            return data
        end
    end
    
    return {}
end

-- Funciones de utilidad para keybinds simplificadas
-- Función mejorada para cargar keybinds con mejor depuración
function Utility.LoadKeybinds()
    print("📥 Iniciando carga de keybinds...")
    
    local keybinds = {}
    
    if isfile(CONFIG.KEYBINDS_FILE) then
        local fileContent = readfile(CONFIG.KEYBINDS_FILE)
        print("  • Contenido del archivo: " .. fileContent)
        
        local success, data = pcall(function()
            return Services.HttpService:JSONDecode(fileContent)
        end)
        
        if success and type(data) == "table" then
            print("  ✓ Keybinds cargados desde archivo")
            keybinds = data
        else
            print("  ✗ Error al decodificar archivo, creando nuevo")
            writefile(CONFIG.KEYBINDS_FILE, "{}")
        end
    else
        print("  ! Archivo no encontrado, creando nuevo")
        writefile(CONFIG.KEYBINDS_FILE, "{}")
    end
    
    _G.EmotesKeybindSystem.Keybinds = keybinds
    
    local count = 0
    for id, key in pairs(keybinds) do
        count = count + 1
        print("  • Keybind cargado: " .. id .. " → " .. key)
    end
    print("📊 Total de keybinds cargados: " .. count)
    
    return keybinds
end

-- Función mejorada para guardar keybinds (corregida)
function Utility.SaveKeybinds()
    print("💾 Guardando keybinds...")
    
    local keybindsToSave = {}
    
    for id, key in pairs(DataManager.EmoteKeybinds) do
        keybindsToSave[id] = key
        print("  • Guardando: " .. id .. " → " .. key)
    end
    
    _G.EmotesKeybindSystem.Keybinds = keybindsToSave
    
    local jsonData = Services.HttpService:JSONEncode(keybindsToSave)
    print("  • JSON a guardar: " .. jsonData)
    
    local success = pcall(function()
        writefile(CONFIG.KEYBINDS_FILE, jsonData)
    end)
    
    if success then
        print("  ✓ Keybinds guardados exitosamente")
        return true
    else
        print("  ✗ Error al guardar keybinds")
        return false
    end
end

-- Función de utilidad para depuración
function tableToArray(t)
    local array = {}
    for k, v in pairs(t) do
        table.insert(array, {key = k, value = v})
    end
    return array
end

function Utility.IsKeybindInUse(keyName)
    for id, existingKey in pairs(DataManager.EmoteKeybinds) do
        if existingKey == keyName then
            return true, id
        end
    end
    return false, nil
end

function Utility.GetEmoteNameById(id)
    for _, emote in pairs(DataManager.Emotes) do
        if emote.id == id then
            return emote.name
        end
    end
    return "Desconocido"
end

function Utility.GetEmoteById(id)
    for _, emote in pairs(DataManager.Emotes) do
        if emote.id == id then
            return emote
        end
    end
    return nil
end

function Utility.SaveFavorites()
    writefile(CONFIG.FAVORITES_FILE, Services.HttpService:JSONEncode(DataManager.FavoritedEmotes))
end

-- Gestor de emotes
local EmoteManager = {}

function EmoteManager.AddEmote(name, id, price)
    DataManager.LoadedEmotes[id] = false
    
    task.spawn(function()
        if not (name and id) then
            return
        end
        
        local success, date = pcall(function()
            local info = Services.MarketplaceService:GetProductInfo(id)
            local updated = info.Updated
            return DateTime.fromIsoDate(updated):ToUniversalTime()
        end)
        
        if not success then
            task.wait(10)
            EmoteManager.AddEmote(name, id, price)
            return
        end
        
        local unix = os.time({
            year = date.Year,
            month = date.Month,
            day = date.Day,
            hour = date.Hour,
            min = date.Minute,
            sec = date.Second
        })
        
        DataManager.LoadedEmotes[id] = true
        table.insert(DataManager.Emotes, {
            ["name"] = name,
            ["id"] = id,
            ["icon"] = "rbxthumb://type=Asset&id=".. id .."&w=150&h=150",
            ["price"] = price or 0,
            ["lastupdated"] = unix,
            ["sort"] = {}
        })
    end)
end

-- Mejorar PlayEmote para mostrar más información y garantizar la ejecución
function EmoteManager.PlayEmote(name, id)
    print("🎭 Ejecutando emote:", name, id)
    
    UIElements.BackFrame.Visible = false
    UIElements.Open.Text = "Open"
    UIElements.SearchBar.Text = ""
    
    local LocalPlayer = Services.Players.LocalPlayer
    if not LocalPlayer or not LocalPlayer.Character then
        print("⚠️ Error: Personaje no disponible")
        Utility.SendNotification("Error", "No se pudo ejecutar el emote - Personaje no disponible", 3)
        return false
    end
    
    local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not Humanoid then
        print("⚠️ Error: Humanoid no encontrado")
        Utility.SendNotification("Error", "No se pudo ejecutar el emote - Humanoid no encontrado", 3)
        return false
    end
    
    local Description = Humanoid:FindFirstChildOfClass("HumanoidDescription")
    if not Description then
        print("⚠️ Error: HumanoidDescription no encontrada, creando nueva")
        Description = Instance.new("HumanoidDescription")
        Description.Parent = Humanoid
    end
    
    if Humanoid.RigType == Enum.HumanoidRigType.R6 then
        print("⚠️ Error: El personaje es R6, se requiere R15")
        Utility.SendNotification("Error", "Necesitas usar un personaje R15 para los emotes", 3)
        return false
    end
    
    -- Intentar ejecutar el emote directamente
    local success1, error1 = pcall(function()
        Humanoid:PlayEmoteAndGetAnimTrackById(id)
    end)
    
    if success1 then
        print("✅ Emote ejecutado correctamente (método directo)")
        return true
    end
    
    print("⚠️ Método directo falló, intentando añadir el emote primero...")
    
    -- Intentar añadir el emote y luego ejecutarlo
    local success2, error2 = pcall(function()
        Description:AddEmote(name, id)
        Humanoid:PlayEmoteAndGetAnimTrackById(id)
    end)
    
    if success2 then
        print("✅ Emote ejecutado correctamente (método con AddEmote)")
        return true
    else
        print("❌ Error al ejecutar emote:", error2)
        Utility.SendNotification("Error", "No se pudo ejecutar el emote: " .. tostring(error2), 3)
        return false
    end
end

-- Modificar SortEmotes para simplificarlo (similar a Emotes.lua original)
function EmoteManager.SortEmotes()
    for i, Emote in pairs(DataManager.Emotes) do
        local EmoteButton = UIElements.Frame:FindFirstChild(Emote.id)
        if not EmoteButton then
            continue
        end
        
        local IsFavorited = table.find(DataManager.FavoritedEmotes, Emote.id)
        local HasKeybind = DataManager.EmoteKeybinds[Emote.id] ~= nil
        
        -- Simplificar la lógica de ordenamiento:
        -- Los favoritos van primero, luego los no favoritos
        if IsFavorited then
            EmoteButton.LayoutOrder = Emote.sort[DataManager.CurrentSort]
        else
            EmoteButton.LayoutOrder = Emote.sort[DataManager.CurrentSort] + #DataManager.Emotes
        end
        
        -- Colorear según si tiene keybind o es favorito
        if HasKeybind then
            EmoteButton.BackgroundColor3 = CONFIG.COLORS.KEYBIND_HIGHLIGHT
        elseif IsFavorited then
            EmoteButton.BackgroundColor3 = CONFIG.COLORS.FAVORITE_HIGHLIGHT
        else
            EmoteButton.BackgroundColor3 = CONFIG.COLORS.NORMAL
        end
        
        EmoteButton.BackgroundTransparency = IsFavorited and 0.7 or 0.5
        EmoteButton.number.Text = Emote.sort[DataManager.CurrentSort]
        
        -- Actualizar etiqueta de keybind
        local keybindLabel = EmoteButton:FindFirstChild("keybind")
        if keybindLabel then
            keybindLabel.Text = DataManager.EmoteKeybinds[Emote.id] or ""
            keybindLabel.Visible = HasKeybind
        end
    end
end

-- Nueva función para activar un emote mediante keybind
-- Función simplificada y mejorada para manejar pulsaciones de teclas
function EmoteManager.HandleKeybindPress(keyCode)
    local keyName = string.lower(tostring(keyCode):gsub("Enum.KeyCode.", ""))
    print("⌨️ Tecla presionada:", keyName)
    
    local keybinds = _G.EmotesKeybindSystem.Keybinds
    print("📋 Keybinds activas:")
    for id, key in pairs(keybinds) do
        print("  • " .. tostring(id) .. " → " .. string.lower(tostring(key)))
    end
    
    for id, key in pairs(keybinds) do
        if string.lower(tostring(key)) == keyName then
            print("  ✓ Coincidencia encontrada: " .. tostring(id) .. " → " .. string.lower(tostring(key)))
            for _, emote in pairs(DataManager.Emotes) do
                if string.lower("EMOTE_" .. tostring(emote.id)) == string.lower(tostring(id)) then  -- uso de identificador fijo
                    print("  🎮 Ejecutando emote: " .. emote.name .. " (ID: " .. tostring(emote.id) .. ")")
                    local success = EmoteManager.PlayEmote(emote.name, emote.id)
                    if success then
                        print("  ✅ Emote ejecutado correctamente")
                        return true
                    else
                        Utility.SendNotification("Error", "No se pudo ejecutar el emote: " .. emote.name, 2)
                        return false
                    end
                end
            end
            print("  ⚠️ Emote no encontrado con ID: " .. tostring(id))
        end
    end
    print("  ℹ️ No se encontró ninguna coincidencia para la tecla: " .. keyName)
    return false
end

function EmoteManager.LoadAllEmotes()
    local Cursor = ""
    local UnreleasedEmotes = {
        {name = "Arm Wave", id = 5915773155},
        {name = "Head Banging", id = 5915779725},
        {name = "Face Calisthenics", id = 9830731012}
    }
    
    -- Cargar emotes del catálogo
    while true do
        local Response = Utility.SafeHttpRequest("https://catalog.roblox.com/v1/search/items/details?Category=12&Subcategory=39&SortType=1&SortAggregation=&limit=30&IncludeNotForSale=true&cursor=".. Cursor)
        local Body = Services.HttpService:JSONDecode(Response)
        
        for i, v in pairs(Body.data) do
            EmoteManager.AddEmote(v.name, v.id, v.price)
        end
        
        if Body.nextPageCursor ~= nil then
            Cursor = Body.nextPageCursor
        else
            break
        end
    end
    
    -- Cargar emotes no publicados
    for _, emote in ipairs(UnreleasedEmotes) do
        EmoteManager.AddEmote(emote.name, emote.id)
    end
end

function EmoteManager.PrepareEmoteSorting()
    -- Corregido: usando tabla local para las funciones de ordenamiento
    local sortFunctions = {
        {name = "recentfirst", func = function(a, b) return a.lastupdated > b.lastupdated end},
        {name = "recentlast", func = function(a, b) return a.lastupdated < b.lastupdated end},
        {name = "alphabeticfirst", func = function(a, b) return a.name:lower() < b.name:lower() end},
        {name = "alphabeticlast", func = function(a, b) return a.name:lower() > b.name:lower() end},
        {name = "lowestprice", func = function(a, b) return a.price < b.price end},
        {name = "highestprice", func = function(a, b) return a.price > b.price end} -- Corregido el punto faltante
    }
    
    for _, sortData in ipairs(sortFunctions) do
        table.sort(DataManager.Emotes, sortData.func)
        for i, v in pairs(DataManager.Emotes) do
            v.sort[sortData.name] = i
        end
    end
end

-- Función específica para aplicar los keybinds guardados a los botones existentes
-- Función mejorada para aplicar keybinds a los botones existentes
function EmoteManager.ApplyKeybindsOnLoad()
    print("🔄 Aplicando keybinds guardados a los emotes...")
    
    -- Usar referencia directa del sistema global
    local keybinds = _G.EmotesKeybindSystem.Keybinds
    
    -- Sincronizar con DataManager para mayor consistencia
    DataManager.EmoteKeybinds = {}
    for id, key in pairs(keybinds) do
        DataManager.EmoteKeybinds[id] = key
    end
    
    local appliedCount = 0
    
    -- Recorrer todos los emotes y aplicar keybinds
    for id, key in pairs(keybinds) do
        local button = UIElements.Frame:FindFirstChild(id)
        if button then
            local keybindLabel = button:FindFirstChild("keybind")
            if keybindLabel then
                keybindLabel.Text = key
                keybindLabel.Visible = true
                
                -- Actualizar color y apariencia
                local isFavorite = button:GetAttribute("isFavorite")
                button.BackgroundColor3 = CONFIG.COLORS.KEYBIND_HIGHLIGHT
                button.BackgroundTransparency = isFavorite and 0.7 or 0.5
                
                appliedCount = appliedCount + 1
                print("  ✓ Aplicado: " .. id .. " → " .. key)
            end
        else
            print("  ⚠️ Botón no encontrado para ID: " .. id)
        end
    end
    
    print("📊 Total de keybinds aplicados: " .. appliedCount .. " de " .. #tableToArray(keybinds))
    
    -- Verificar que DataManager tenga las mismas keybinds
    local dmCount = 0
    for id, key in pairs(DataManager.EmoteKeybinds) do
        dmCount = dmCount + 1
    end
    print("📊 Keybinds en DataManager: " .. dmCount)
end

-- Constructor de UI
local UIBuilder = {}

function UIBuilder.SetupMainUI()
    -- Crear ScreenGui principal
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = CONFIG.GUI_NAME
    ScreenGui.DisplayOrder = 2
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Enabled = true
    
    -- Crear frame principal
    local BackFrame = Instance.new("Frame")
    BackFrame.Size = UDim2.new(0.9, 0, 0.5, 0)
    BackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    BackFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    BackFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
    BackFrame.BackgroundTransparency = 1
    BackFrame.BorderSizePixel = 0
    BackFrame.Parent = ScreenGui
    
    -- Botón de abrir/cerrar
    local Open = Instance.new("TextButton")
    Open.Name = "Open"
    Open.Parent = ScreenGui
    Open.Draggable = true
    Open.Size = UDim2.new(0.05, 0, 0.114, 0)
    Open.Position = UDim2.new(0.05, 0, 0.25, 0)
    Open.Text = "Close"
    Open.BackgroundColor3 = CONFIG.COLORS.NORMAL
    Open.TextColor3 = CONFIG.COLORS.TEXT
    Open.TextScaled = true
    Open.TextSize = 20
    Open.Visible = true
    Open.BackgroundTransparency = CONFIG.UI.OPACITY
    
    -- Añadir corner al botón
    local UICorner = Instance.new("UICorner")
    UICorner.Name = "UICorner"
    UICorner.Parent = Open
    UICorner.CornerRadius = CONFIG.UI.CORNER_RADIUS
    
    -- Etiqueta de nombre de emote
    local EmoteName = Instance.new("TextLabel")
    EmoteName.Name = "EmoteName"
    EmoteName.TextScaled = true
    EmoteName.AnchorPoint = Vector2.new(0.5, 0.5)
    EmoteName.Position = UDim2.new(-0.1, 0, 0.5, 0)
    EmoteName.Size = UDim2.new(0.2, 0, 0.2, 0)
    EmoteName.SizeConstraint = Enum.SizeConstraint.RelativeYY
    EmoteName.BackgroundColor3 = CONFIG.COLORS.BACKGROUND
    EmoteName.TextColor3 = CONFIG.COLORS.TEXT
    EmoteName.BorderSizePixel = 0
    EmoteName.Parent = BackFrame
    
    -- Añadir corner a la etiqueta
    local Corner = Instance.new("UICorner")
    Corner.Parent = EmoteName
    
    -- Indicador de carga
    local Loading = Instance.new("TextLabel", BackFrame)
    Loading.AnchorPoint = Vector2.new(0.5, 0.5)
    Loading.Text = "Loading..."
    Loading.TextColor3 = CONFIG.COLORS.TEXT
    Loading.BackgroundColor3 = CONFIG.COLORS.NORMAL
    Loading.TextScaled = true
    Loading.BackgroundTransparency = CONFIG.UI.OPACITY
    Loading.Size = UDim2.fromScale(0.2, 0.1)
    Loading.Position = UDim2.fromScale(0.5, 0.2)
    Corner:Clone().Parent = Loading
    
    -- Frame de desplazamiento para emotes
    local Frame = Instance.new("ScrollingFrame")
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Frame.ScrollingDirection = Enum.ScrollingDirection.Y
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.BackgroundTransparency = 1
    Frame.ScrollBarThickness = 5
    Frame.BorderSizePixel = 0
    Frame.Parent = BackFrame
    
    -- Configuración de grid
    local Grid = Instance.new("UIGridLayout")
    Grid.CellSize = UDim2.new(0.105, 0, 0, 0)
    Grid.CellPadding = UDim2.new(0.006, 0, 0.006, 0)
    Grid.SortOrder = Enum.SortOrder.LayoutOrder
    Grid.Parent = Frame
    
    -- Frame para ordenar
    local SortFrame = Instance.new("Frame")
    SortFrame.Visible = false
    SortFrame.BorderSizePixel = 0
    SortFrame.Position = UDim2.new(1, 5, -0.125, 0)
    SortFrame.Size = UDim2.new(0.2, 0, 0, 0)
    SortFrame.AutomaticSize = Enum.AutomaticSize.Y
    SortFrame.BackgroundTransparency = 1
    Corner:Clone().Parent = SortFrame
    SortFrame.Parent = BackFrame
    
    -- Lista de ordenación
    local SortList = Instance.new("UIListLayout")
    SortList.Padding = UDim.new(0.02, 0)
    SortList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SortList.VerticalAlignment = Enum.VerticalAlignment.Top
    SortList.SortOrder = Enum.SortOrder.LayoutOrder
    SortList.Parent = SortFrame
    
    -- Barra de búsqueda
    local SearchBar = Instance.new("TextBox")
    SearchBar.BorderSizePixel = 0
    SearchBar.AnchorPoint = Vector2.new(0.5, 0.5)
    SearchBar.Position = UDim2.new(0.5, 0, -0.075, 0)
    SearchBar.Size = UDim2.new(0.55, 0, 0.1, 0)
    SearchBar.TextScaled = true
    SearchBar.PlaceholderText = "Search"
    SearchBar.TextColor3 = CONFIG.COLORS.TEXT
    SearchBar.BackgroundColor3 = CONFIG.COLORS.NORMAL
    SearchBar.BackgroundTransparency = 0.3
    Corner:Clone().Parent = SearchBar
    SearchBar.Parent = BackFrame
    
    -- Botón de orden
    local SortButton = Instance.new("TextButton")
    SortButton.BorderSizePixel = 0
    SortButton.AnchorPoint = Vector2.new(0.5, 0.5)
    SortButton.Position = UDim2.new(0.925, -5, -0.075, 0)
    SortButton.Size = UDim2.new(0.15, 0, 0.1, 0)
    SortButton.TextScaled = true
    SortButton.TextColor3 = CONFIG.COLORS.TEXT
    SortButton.BackgroundColor3 = CONFIG.COLORS.NORMAL
    SortButton.BackgroundTransparency = 0.3
    SortButton.Text = "Sort"
    Corner:Clone().Parent = SortButton
    SortButton.Parent = BackFrame
    
    -- Botón de cerrar
    local CloseButton = Instance.new("TextButton")
    CloseButton.BorderSizePixel = 0
    CloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
    CloseButton.Position = UDim2.new(0.075, 0, -0.075, 0)
    CloseButton.Size = UDim2.new(0.15, 0, 0.1, 0)
    CloseButton.TextScaled = true
    CloseButton.TextColor3 = CONFIG.COLORS.TEXT
    CloseButton.BackgroundColor3 = CONFIG.COLORS.CLOSE
    CloseButton.BackgroundTransparency = 0.3
    CloseButton.Text = "Kill Gui"
    Corner:Clone().Parent = CloseButton
    CloseButton.Parent = BackFrame
    
    -- Guardar referencias a elementos UI importantes
    UIElements.ScreenGui = ScreenGui
    UIElements.BackFrame = BackFrame
    UIElements.EmoteName = EmoteName
    UIElements.Loading = Loading
    UIElements.Frame = Frame
    UIElements.SortFrame = SortFrame
    UIElements.Open = Open
    UIElements.SearchBar = SearchBar
    UIElements.Corner = Corner
    
    -- Eventos
    Frame.MouseLeave:Connect(function()
        EmoteName.Text = "Select an Emote"
    end)
    
    Open.MouseButton1Up:Connect(function()
        if Open.Text == "Open" then
            Open.Text = "Close"
            BackFrame.Visible = true
        else
            Open.Text = "Open"
            BackFrame.Visible = false
        end
    end)
    
    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local text = SearchBar.Text:lower()
        local buttons = Frame:GetChildren()
        
        if text ~= text:sub(1, 50) then
            SearchBar.Text = SearchBar.Text:sub(1, 50)
            text = SearchBar.Text:lower()
        end
        
        if text ~= "" then
            for _, button in pairs(buttons) do
                if button:IsA("GuiButton") then
                    local name = button:GetAttribute("name"):lower()
                    button.Visible = name:match(text) ~= nil
                end
            end
        else
            for _, button in pairs(buttons) do
                if button:IsA("GuiButton") then
                    button.Visible = true
                end
            end
        end
    end)
    
    SortButton.MouseButton1Click:Connect(function()
        SortFrame.Visible = not SortFrame.Visible
        Open.Text = "Open"
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    return ScreenGui
end

function UIBuilder.CreateSortButton(parent, order, text, sort)
    local CreatedSort = Instance.new("TextButton")
    CreatedSort.SizeConstraint = Enum.SizeConstraint.RelativeXX
    CreatedSort.Size = UDim2.new(1, 0, 0.2, 0)
    CreatedSort.BackgroundColor3 = CONFIG.COLORS.BACKGROUND
    CreatedSort.LayoutOrder = order
    CreatedSort.TextColor3 = CONFIG.COLORS.TEXT
    CreatedSort.Text = text
    CreatedSort.TextScaled = true
    CreatedSort.BorderSizePixel = 0
    UIElements.Corner:Clone().Parent = CreatedSort
    CreatedSort.Parent = parent
    
    CreatedSort.MouseButton1Click:Connect(function()
        UIElements.SortFrame.Visible = false
        UIElements.Open.Text = "Open"
        DataManager.CurrentSort = sort
        EmoteManager.SortEmotes()
    end)
    
    return CreatedSort
end

-- Modificar la función CreateEmoteButton para simplificar el manejo de keybinds
function UIBuilder.CreateEmoteButton(emote, description)
    local EmoteButton = Instance.new("ImageButton")
    local IsFavorited = table.find(DataManager.FavoritedEmotes, emote.id)
    local HasKeybind = DataManager.EmoteKeybinds[emote.id] ~= nil
    
    -- Configuración inicial
    if IsFavorited then
        EmoteButton.LayoutOrder = emote.sort[DataManager.CurrentSort]
        EmoteButton.BackgroundTransparency = 0.7
    else
        EmoteButton.LayoutOrder = emote.sort[DataManager.CurrentSort] + #DataManager.Emotes
        EmoteButton.BackgroundTransparency = 0.5
    end
    
    -- Colorear basado en si tiene keybind
    if HasKeybind then
        EmoteButton.BackgroundColor3 = CONFIG.COLORS.KEYBIND_HIGHLIGHT
    elseif IsFavorited then 
        EmoteButton.BackgroundColor3 = CONFIG.COLORS.FAVORITE_HIGHLIGHT
    else
        EmoteButton.BackgroundColor3 = CONFIG.COLORS.NORMAL
    end
    
    EmoteButton.Name = "EMOTE_" .. tostring(emote.id)  -- antes: EmoteButton.Name = emote.id
    EmoteButton:SetAttribute("name", emote.name)
    EmoteButton:SetAttribute("isFavorite", IsFavorited)
    UIElements.Corner:Clone().Parent = EmoteButton
    EmoteButton.Image = emote.icon
    EmoteButton.BorderSizePixel = 0
    
    -- Restringir proporción
    local Ratio = Instance.new("UIAspectRatioConstraint")
    Ratio.AspectType = Enum.AspectType.ScaleWithParentSize
    Ratio.Parent = EmoteButton
    
    -- Número del emote
    local EmoteNumber = Instance.new("TextLabel")
    EmoteNumber.Name = "number"
    EmoteNumber.TextScaled = true
    EmoteNumber.BackgroundTransparency = 1
    EmoteNumber.TextColor3 = CONFIG.COLORS.TEXT
    EmoteNumber.BorderSizePixel = 0
    EmoteNumber.AnchorPoint = Vector2.new(0.5, 0.5)
    EmoteNumber.Size = UDim2.new(0.2, 0, 0.2, 0)
    EmoteNumber.Position = UDim2.new(0.1, 0, 0.9, 0)
    EmoteNumber.Text = emote.sort[DataManager.CurrentSort]
    EmoteNumber.TextXAlignment = Enum.TextXAlignment.Center
    EmoteNumber.TextYAlignment = Enum.TextYAlignment.Center
    EmoteNumber.Parent = EmoteButton
    
    -- Etiqueta de keybind (nueva)
    local KeybindLabel = Instance.new("TextLabel")
    KeybindLabel.Name = "keybind"
    KeybindLabel.TextScaled = true
    KeybindLabel.BackgroundTransparency = 0.7
    KeybindLabel.BackgroundColor3 = CONFIG.COLORS.NORMAL
    KeybindLabel.TextColor3 = CONFIG.COLORS.KEYBIND_TEXT
    KeybindLabel.BorderSizePixel = 0
    KeybindLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    KeybindLabel.Size = UDim2.new(0.4, 0, 0.2, 0)
    KeybindLabel.Position = UDim2.new(0.5, 0, 0.13, 0)
    KeybindLabel.Text = DataManager.EmoteKeybinds[emote.id] or ""
    KeybindLabel.Visible = HasKeybind
    UIElements.Corner:Clone().Parent = KeybindLabel
    KeybindLabel.Parent = EmoteButton
    
    -- Botón para asignar keybind (nuevo)
    local SetKeybind = Instance.new("TextButton")
    SetKeybind.Name = "setKeybind"
    SetKeybind.Text = "🔑"
    SetKeybind.TextScaled = true
    SetKeybind.TextColor3 = CONFIG.COLORS.TEXT
    SetKeybind.BackgroundTransparency = 0.7
    SetKeybind.BackgroundColor3 = CONFIG.COLORS.NORMAL
    SetKeybind.BorderSizePixel = 0
    SetKeybind.AnchorPoint = Vector2.new(0.5, 0.5)
    SetKeybind.Size = UDim2.new(0.2, 0, 0.2, 0)
    SetKeybind.Position = UDim2.new(0.9, 0, 0.1, 0)
    UIElements.Corner:Clone().Parent = SetKeybind
    SetKeybind.Parent = EmoteButton
    
    -- Botón de favoritos
    local Favorite = Instance.new("ImageButton")
    Favorite.Name = "favorite"
    Favorite.Image = IsFavorited and CONFIG.FAVORITE_ON_ICON or CONFIG.FAVORITE_OFF_ICON
    Favorite.AnchorPoint = Vector2.new(0.5, 0.5)
    Favorite.Size = UDim2.new(0.2, 0, 0.2, 0)
    Favorite.Position = UDim2.new(0.9, 0, 0.9, 0)
    Favorite.BorderSizePixel = 0
    Favorite.BackgroundTransparency = 1
    Favorite.Parent = EmoteButton
    
    -- Eventos de animación para hover
    EmoteButton.MouseEnter:Connect(function()
        UIElements.EmoteName.Text = emote.name
        
        -- Animar al pasar el mouse por encima (hover)
        local hoverInfo = TweenInfo.new(
            CONFIG.ANIMATIONS.HOVER_DURATION,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )
        
        local hoverTween = Services.TweenService:Create(EmoteButton, hoverInfo, {
            BackgroundTransparency = 0.3,
            Size = UDim2.new(EmoteButton.Size.X.Scale * CONFIG.ANIMATIONS.SCALE_HOVER, 0, 
                           EmoteButton.Size.Y.Scale * CONFIG.ANIMATIONS.SCALE_HOVER, 0)
        })
        
        hoverTween:Play()
    end)
    
    EmoteButton.MouseLeave:Connect(function()
        -- Animar al salir del hover
        local leaveInfo = TweenInfo.new(
            CONFIG.ANIMATIONS.HOVER_DURATION,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )
        
        local leaveTween = Services.TweenService:Create(EmoteButton, leaveInfo, {
            BackgroundTransparency = IsFavorited and 0.7 or 0.5,
            Size = UDim2.new(EmoteButton.Size.X.Scale / CONFIG.ANIMATIONS.SCALE_HOVER, 0, 
                           EmoteButton.Size.Y.Scale / CONFIG.ANIMATIONS.SCALE_HOVER, 0)
        })
        
        leaveTween:Play()
    end)
    
    -- Eventos del botón
    EmoteButton.MouseButton1Click:Connect(function()
        EmoteManager.PlayEmote(emote.name, emote.id)
    end)
    
    -- Evento para asignar/remover keybind simplificado y más robusto
    -- Función de SetKeybind mejorada (parte del CreateEmoteButton)
    SetKeybind.MouseButton1Click:Connect(function()
        -- Si ya tiene un keybind, eliminarlo
        if DataManager.EmoteKeybinds["EMOTE_" .. tostring(emote.id)] then
            print("🔄 Eliminando keybind de emote:", emote.name)
            DataManager.EmoteKeybinds["EMOTE_" .. tostring(emote.id)] = nil
            _G.EmotesKeybindSystem.Keybinds["EMOTE_" .. tostring(emote.id)] = nil
            KeybindLabel.Text = ""
            KeybindLabel.Visible = false
            
            -- Actualizar apariencia del botón
            if IsFavorited then
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.FAVORITE_HIGHLIGHT
            else
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.NORMAL
            end
            
            Utility.SendNotification("Keybind Eliminado", "Se quitó el atajo para: " .. emote.name, 2)
            Utility.SaveKeybinds()
            return
        end
        
        -- Modo de asignación de keybind
        SetKeybind.Text = "..."
        SetKeybind.BackgroundColor3 = CONFIG.COLORS.HIGHLIGHT
        SetKeybind.BackgroundTransparency = 0.3
        
        Utility.SendNotification("Asignando Keybind", "Presiona una tecla para asignarla a: " .. emote.name, 5)
        
        -- Esperar input de teclado
        local connection
        connection = Services.UserInputService.InputBegan:Connect(function(input, isProcessed)
            if isProcessed then return end
            
            if input.UserInputType == Enum.UserInputType.Keyboard then
                -- Desconectar para no seguir capturando
                if connection then connection:Disconnect() end
                
                -- Obtener nombre de tecla
                local keyName = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                print("🔑 Tecla seleccionada:", keyName, "para emote:", emote.name)
                
                -- Verificar si ya está en uso
                local isUsed, existingId = Utility.IsKeybindInUse(keyName)
                
                if isUsed and existingId ~= emote.id then
                    local existingName = Utility.GetEmoteNameById(existingId)
                    Utility.SendNotification("Keybind En Uso", 
                        "'" .. keyName .. "' ya está asignado a: " .. existingName, 3)
                    
                    -- Restaurar apariencia
                    SetKeybind.Text = "🔑"
                    SetKeybind.BackgroundColor3 = CONFIG.COLORS.NORMAL
                    SetKeybind.BackgroundTransparency = 0.7
                    return
                end
                
                -- Asignar keybind (parte actualizada para usar el sistema global)
                DataManager.EmoteKeybinds["EMOTE_" .. tostring(emote.id)] = keyName  -- identificador fijo
                _G.EmotesKeybindSystem.Keybinds["EMOTE_" .. tostring(emote.id)] = keyName
                KeybindLabel.Text = keyName
                KeybindLabel.Visible = true
                
                -- Restaurar apariencia y actualizar color
                SetKeybind.Text = "🔑"
                SetKeybind.BackgroundColor3 = CONFIG.COLORS.NORMAL
                SetKeybind.BackgroundTransparency = 0.7
                
                -- Cambiar color del botón para indicar que tiene keybind
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.KEYBIND_HIGHLIGHT
                
                -- Notificar y guardar
                Utility.SendNotification("Keybind Asignado", "'" .. keyName .. "' → " .. emote.name, 3)
                
                -- Guardar inmediatamente
                Utility.SaveKeybinds()
            end
        end)
        
        -- Cancelar asignación con clic
        local cancelConnection
        cancelConnection = SetKeybind.MouseButton1Click:Connect(function()
            if connection then connection:Disconnect() end
            if cancelConnection then cancelConnection:Disconnect() end
            
            SetKeybind.Text = "🔑"
            SetKeybind.BackgroundColor3 = CONFIG.COLORS.NORMAL
            SetKeybind.BackgroundTransparency = 0.7
            
            Utility.SendNotification("Cancelado", "Asignación de keybind cancelada", 2)
        end)
    end)
    
    -- Evento de favorito
    Favorite.MouseButton1Click:Connect(function()
        local index = table.find(DataManager.FavoritedEmotes, emote.id)
        
        -- Sonido de favorito
        local favSound = Instance.new("Sound")
        favSound.SoundId = index and "rbxassetid://6042047830" or "rbxassetid://6026984224"
        favSound.Volume = 0.5
        favSound.Parent = UIElements.ScreenGui
        favSound:Play()
        game.Debris:AddItem(favSound, 1)
        
        if index then
            -- Eliminar de favoritos
            table.remove(DataManager.FavoritedEmotes, index)
            Favorite.Image = CONFIG.FAVORITE_OFF_ICON
            EmoteButton.LayoutOrder = emote.sort[DataManager.CurrentSort] + #DataManager.Emotes
            EmoteButton:SetAttribute("isFavorite", false)
            
            -- Mantener color de keybind si lo tiene
            if DataManager.EmoteKeybinds[emote.id] then
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.KEYBIND_HIGHLIGHT
            else
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.NORMAL
            end
            
            EmoteButton.BackgroundTransparency = 0.5
        else
            -- Agregar a favoritos
            table.insert(DataManager.FavoritedEmotes, emote.id)
            Favorite.Image = CONFIG.FAVORITE_ON_ICON
            EmoteButton.LayoutOrder = emote.sort[DataManager.CurrentSort]
            EmoteButton:SetAttribute("isFavorite", true)
            
            -- Mantener color de keybind si lo tiene
            if DataManager.EmoteKeybinds[emote.id] then
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.KEYBIND_HIGHLIGHT
            else
                EmoteButton.BackgroundColor3 = CONFIG.COLORS.FAVORITE_HIGHLIGHT
            end
            
            EmoteButton.BackgroundTransparency = 0.7
        end
        
        Utility.SaveFavorites()
    end)
    
    -- Añadir emote a la descripción si se proporciona
    if description then
        description:AddEmote(emote.name, emote.id)
    end
    
    EmoteButton.Parent = UIElements.Frame
    return EmoteButton
end

function UIBuilder.CreateRandomButton()
    local random = Instance.new("TextButton")
    local Ratio = Instance.new("UIAspectRatioConstraint")
    Ratio.AspectType = Enum.AspectType.ScaleWithParentSize
    Ratio.Parent = random
    
    random.LayoutOrder = 0
    random.TextColor3 = CONFIG.COLORS.TEXT
    random.BorderSizePixel = 0
    random.BackgroundTransparency = 0.5
    random.BackgroundColor3 = CONFIG.COLORS.NORMAL
    random.TextScaled = true
    random.Text = "Random"
    random:SetAttribute("name", "")
    UIElements.Corner:Clone().Parent = random
    
    random.MouseButton1Click:Connect(function()
        local randomemote = DataManager.Emotes[math.random(1, #DataManager.Emotes)]
        EmoteManager.PlayEmote(randomemote.name, randomemote.id)
    end)
    
    random.MouseEnter:Connect(function()
        UIElements.EmoteName.Text = "Random"
    end)
    
    random.Parent = UIElements.Frame
    return random
end

function UIBuilder.CreateFillerButtons()
    local Ratio = Instance.new("UIAspectRatioConstraint")
    Ratio.AspectType = Enum.AspectType.ScaleWithParentSize
    
    for i = 1, 9 do
        local EmoteButton = Instance.new("Frame")
        EmoteButton.LayoutOrder = 2147483647
        EmoteButton.Name = "filler"
        EmoteButton.BackgroundTransparency = 1
        EmoteButton.BorderSizePixel = 0
        Ratio:Clone().Parent = EmoteButton
        EmoteButton.Visible = true
        EmoteButton.Parent = UIElements.Frame
        
        EmoteButton.MouseEnter:Connect(function()
            UIElements.EmoteName.Text = "Select an Emote"
        end)
    end
end

-- Gestor de eventos
local EventManager = {}

-- Simplificar y mejorar el sistema de eventos de keybinds
function EventManager.SetupEvents()
    local LocalPlayer = Services.Players.LocalPlayer
    
    -- Configurar acción de tecla para abrir menú
    Services.ContextActionService:BindCoreActionAtPriority(
        "Emote Menu",
        function(name, state, input)
            if state == Enum.UserInputState.Begin then
                UIElements.BackFrame.Visible = not UIElements.BackFrame.Visible
                UIElements.Open.Text = "Open"
            end
        end,
        true,
        2001,
        CONFIG.KEYBIND
    )
    
    -- Detectar pulsaciones de teclas para keybinds
    Services.UserInputService.InputBegan:Connect(function(input, processed)
        -- No procesar si la entrada ya fue manejada o no es del teclado
        if processed or input.UserInputType ~= Enum.UserInputType.Keyboard then
            return
        end
        
        -- No activar keybinds si el menú de emotes está abierto
        if UIElements.BackFrame.Visible then
            return
        end
        
        -- Intenta activar un emote con esta tecla
        EmoteManager.HandleKeybindPress(input.KeyCode)
    end)
    
    -- Sistema de keybinds global (versión más simple y directa)
    local keybindConnection
    keybindConnection = Services.UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        
        if input.UserInputType == Enum.UserInputType.Keyboard then
            -- Verificar si el menú está cerrado
            if UIElements.BackFrame.Visible then return end
            
            -- Intentar activar emote por keybind
            EmoteManager.HandleKeybindPress(input.KeyCode)
        end
    end)
    
    -- Asegurarse de que la conexión se limpie si se destruye la GUI
    UIElements.ScreenGui.AncestryChanged:Connect(function(_, parent)
        if not parent and keybindConnection then
            keybindConnection:Disconnect()
        end
    end)
    
    -- Eventos para cerrar el menú
    local inputconnect
    UIElements.ScreenGui:GetPropertyChangedSignal("Enabled"):Connect(function()
        if UIElements.BackFrame.Visible == false then
            UIElements.EmoteName.Text = "Select an Emote"
            UIElements.SearchBar.Text = ""
            UIElements.SortFrame.Visible = false
            Services.GuiService:SetEmotesMenuOpen(false)
            
            inputconnect = Services.UserInputService.InputBegan:Connect(function(input, processed)
                if not processed then
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        UIElements.BackFrame.Visible = false
                        UIElements.Open.Text = "Open"
                    end
                end
            end)
        else
            if inputconnect then
                inputconnect:Disconnect()
            end
        end
    end)
    
    -- Sincronizar con menú de emotes integrado
    Services.GuiService.EmotesMenuOpenChanged:Connect(function(isopen)
        if isopen then
            UIElements.BackFrame.Visible = false
            UIElements.Open.Text = "Open"
        end
    end)
    
    Services.GuiService.MenuOpened:Connect(function()
        UIElements.BackFrame.Visible = false
        UIElements.Open.Text = "Open"
    end)
    
    -- Manejar nuevos personajes
    function EventManager.CharacterAdded(Character)
        -- Limpiar frame
        for _, child in pairs(UIElements.Frame:GetChildren()) do
            if not child:IsA("UIGridLayout") then
                child:Destroy()
            end
        end
        
        local Humanoid = Utility.WaitForChildOfClass(Character, "Humanoid")
        local Description = Humanoid:WaitForChild("HumanoidDescription", 5) or Instance.new("HumanoidDescription", Humanoid)
        
        -- Crear botón aleatorio
        UIBuilder.CreateRandomButton()
        
        -- Crear botones para cada emote
        for _, Emote in pairs(DataManager.Emotes) do
            UIBuilder.CreateEmoteButton(Emote, Description)
        end
        
        -- Crear botones de relleno para alineación
        UIBuilder.CreateFillerButtons()
    end
    
    -- Conectar evento de nuevo personaje
    if LocalPlayer.Character then
        EventManager.CharacterAdded(LocalPlayer.Character)
    end
    
    LocalPlayer.CharacterAdded:Connect(EventManager.CharacterAdded)
    
    -- Verificar emotes al abrir la interfaz
    UIElements.BackFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if UIElements.BackFrame.Visible then
            -- Verificar si hay emotes cargados
            local hasEmotes = false
            for _, child in pairs(UIElements.Frame:GetChildren()) do
                if child:IsA("ImageButton") or child:IsA("TextButton") then
                    hasEmotes = true
                    break
                end
            end
            
            -- Si no hay emotes visibles pero deberían estar cargados, recargar todo
            if not hasEmotes and DataManager.EmotesLoaded then
                -- Notificar recarga
                Utility.SendNotification("Recargando", "Actualizando lista de emotes...", 3)
                
                -- Recrear todos los componentes
                if LocalPlayer.Character then
                    EventManager.CharacterAdded(LocalPlayer.Character)
                end
            end
        end
    end)
end

-- Sistema unificado de manejo de keybinds
function EventManager.SetupKeybindSystem()
    print("🔄 Configurando sistema de keybinds...")
    
    -- Desconectar conexión previa si existe
    if _G.EmotesKeybindSystemUnique.MainConnection then
        _G.EmotesKeybindSystemUnique.MainConnection:Disconnect()
        _G.EmotesKeybindSystemUnique.MainConnection = nil
        print("  • Conexión previa eliminada")
    end
    
    -- Crear una nueva conexión principal
    _G.EmotesKeybindSystemUnique.MainConnection = Services.UserInputService.InputBegan:Connect(function(input, processed)
        -- No procesar si ya fue manejado por otro sistema
        if processed then return end
        
        -- Solo manejar entradas de teclado
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
        
        -- No activar si el menú está abierto
        if UIElements.BackFrame.Visible then return end
        
        -- Intentar activar el emote correspondiente
        local success = EmoteManager.HandleKeybindPress(input.KeyCode)
        if success then
            print("  ✓ Keybind ejecutado correctamente")
        else
            print("  ℹ️ No se encontró keybind para esta tecla")
        end
    end)
    
    _G.EmotesKeybindSystemUnique.Active = true
    print("✅ Sistema de keybinds activado")
    
    -- Añadir limpieza cuando se destruya la GUI
    UIElements.ScreenGui.AncestryChanged:Connect(function(_, parent)
        if not parent and _G.EmotesKeybindSystemUnique.MainConnection then
            _G.EmotesKeybindSystemUnique.MainConnection:Disconnect()
            _G.EmotesKeybindSystemUnique.MainConnection = nil
            print("❌ Sistema de keybinds desactivado por destrucción de GUI")
        end
    end)
end

-- Inicialización simplificada
-- Mejorar la inicialización para asegurar que las keybinds persistan
local function Initialize()
    -- Crear interfaz
    local ScreenGui = UIBuilder.SetupMainUI()
    
    -- Determinar el parent correcto para el ScreenGui
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    
    -- Proteger GUI si es posible (versión corregida y más segura)
    local hasSyn = type(_G.syn) == "table"
    local hasSynProtect = hasSyn and type(_G.syn.protect_gui) == "function"
    
    if hasSyn and hasSynProtect then
        _G.syn.protect_gui(ScreenGui)
        ScreenGui.Parent = Services.CoreGui
    else
        -- Simplemente asignar al CoreGui si no hay métodos especiales disponibles
        ScreenGui.Parent = Services.CoreGui
    end
    
    -- Crear los botones de ordenación después de configurar UIElements
    for _, option in ipairs({
        {order = 1, text = "Recently Updated First", sort = "recentfirst"},
        {order = 2, text = "Recently Updated Last", sort = "recentlast"},
        {order = 3, text = "Alphabetically First", sort = "alphabeticfirst"},
        {order = 4, text = "Alphabetically Last", sort = "alphabeticlast"},
        {order = 5, text = "Highest Price", sort = "highestprice"},
        {order = 6, text = "Lowest Price", sort = "lowestprice"}
    }) do
        UIBuilder.CreateSortButton(UIElements.SortFrame, option.order, option.text, option.sort)
    end
    
    -- Cargar favoritos y keybinds
    print("📂 Cargando datos guardados...")
    DataManager.FavoritedEmotes = Utility.LoadFavorites()
    DataManager.EmoteKeybinds = Utility.LoadKeybinds()
    
    -- Sincronizar con sistema global
    _G.EmotesKeybindSystemUnique.Keybinds = DataManager.EmoteKeybinds
    
    -- Verificar formato antiguo de favoritos
    local UpdatedFavorites = {}
    for _, name in pairs(DataManager.FavoritedEmotes) do
        if typeof(name) == "string" then
            for _, emote in pairs(DataManager.Emotes) do
                if emote.name == name then
                    table.insert(UpdatedFavorites, emote.id)
                    break
                end
            end
        end
    end
    
    if #UpdatedFavorites ~= 0 then
        DataManager.FavoritedEmotes = UpdatedFavorites
        Utility.SaveFavorites()
    end
    
    -- Cargar emotes y configurar eventos
    EmoteManager.LoadAllEmotes()
    
    -- Esperar a que se carguen todos los emotes
    while true do
        local allLoaded = true
        for _, loaded in pairs(DataManager.LoadedEmotes) do
            if not loaded then
                allLoaded = false
                break
            end
        end
        
        if allLoaded then break end
        task.wait()
    end
    
    -- Marcar que los emotes están cargados
    DataManager.EmotesLoaded = true
    
    -- Eliminar indicador de carga
    UIElements.Loading:Destroy()
    
    -- Preparar orden de emotes
    EmoteManager.PrepareEmoteSorting()
    
    -- Configurar eventos antes de aplicar estilos
    EventManager.SetupEvents()
    
    -- Aplicar el orden guardado solo a emotes nuevos, respetando el orden existente
    task.spawn(function()
        task.wait(0.5) -- Pequeño retraso para asegurar que todos los botones se han creado
        EmoteManager.SortEmotes() -- Versión corregida que respeta el orden existente
    end)
    
    -- Mostrar GUI
    task.wait(1)
    ScreenGui.Enabled = true
    
    -- Notificar al usuario
    Utility.SendNotification("Done!", "Emotes gui is here!", 10)
    
    -- Eliminar GUI contextual
    local localPlayer = Services.Players.LocalPlayer
    if localPlayer and localPlayer.PlayerGui:FindFirstChild("ContextActionGui") then
        localPlayer.PlayerGui.ContextActionGui:Destroy()
    end
    
    -- Notificar al usuario sobre los keybinds
    Utility.SendNotification("Keybinds", "Usa el botón 🔑 para asignar teclas a tus emotes favoritos", 10)
    
    -- Reproducidr sonido de bienvenida
    local welcomeSound = Instance.new("Sound")
    welcomeSound.SoundId = "rbxassetid://6026984224"
    welcomeSound.Volume = 0.5
    welcomeSound.Parent = UIElements.ScreenGui
    welcomeSound:Play()
    game.Debris:AddItem(welcomeSound, 2)
    
    -- Después de cargar los emotes y crear los botones, aplicar los keybinds guardados
    task.spawn(function()
        task.wait(1) -- Esperar un poco más para asegurar que todos los botones se han creado
        print("🔄 Aplicando keybinds guardados...")
        EmoteManager.ApplyKeybindsOnLoad()
        
        -- Configurar el sistema de detección de teclas para keybinds
        print("⌨️ Configurando sistema de detección de keybinds...")
        Services.UserInputService.InputBegan:Connect(function(input, processed)
            if processed or input.UserInputType ~= Enum.UserInputType.Keyboard then
                return
            end
            
            -- No activar keybinds si el menú de emotes está abierto
            if UIElements.BackFrame.Visible then
                return
            end
            
            -- Intenta activar un emote con esta tecla
            EmoteManager.HandleKeybindPress(input.KeyCode)
        end)
    end)
    
    -- Notificar al usuario sobre los keybinds con instrucciones más claras
    task.spawn(function()
        task.wait(3) -- Esperar un poco para no sobrecargar con notificaciones
        Utility.SendNotification("Keybinds de Emotes", 
            "Presiona las teclas asignadas para activar emotes rápidamente", 10)
        
        -- Comprobar si hay keybinds cargados
        local keybindCount = 0
        for _ in pairs(DataManager.EmoteKeybinds) do
            keybindCount = keybindCount + 1
        end
        
        if keybindCount > 0 then
            Utility.SendNotification("Keybinds Cargados", 
                "Se han cargado " .. keybindCount .. " keybinds guardados", 5)
        end
    end)
    
    -- Configurar eventos y aplicar keybinds después de un tiempo
    task.spawn(function()
        task.wait(1.5) -- Tiempo suficiente para que se creen todos los botones
        
        -- Aplicar los keybinds a los botones
        print("🔄 Aplicando keybinds a los botones...")
        EmoteManager.ApplyKeybindsOnLoad()
        
        -- Configurar el sistema de eventos sin duplicación
        EventManager.SetupEvents()
        
        -- Verificar keybinds después de 2 segundos para asegurar que siguen aplicados
        task.wait(2)
        local keybindCount = 0
        for _ in pairs(DataManager.EmoteKeybinds) do
            keybindCount = keybindCount + 1
        end
        
        -- Re-aplicar si es necesario
        if keybindCount > 0 then
            print("🔍 Verificando si los keybinds siguen aplicados...")
            EmoteManager.ApplyKeybindsOnLoad()
            
            Utility.SendNotification("Keybinds Listos", 
                "Presiona las teclas asignadas para activar los " .. keybindCount .. " emotes con keybind", 5)
        end
    end)
    
    -- Configurar el sistema de keybinds unificado después de cargar todo
    task.spawn(function()
        task.wait(1.5) -- Esperar a que todo esté listo
        
        -- Configurar el sistema de keybinds unificado
        EventManager.SetupKeybindSystem()
        
        -- Aplicar keybinds a los botones
        EmoteManager.ApplyKeybindsOnLoad()
        
        -- Verificar y notificar sobre keybinds cargados
        local keybindCount = 0
        for _ in pairs(_G.EmotesKeybindSystemUnique.Keybinds) do
            keybindCount = keybindCount + 1
        end
        
        if keybindCount > 0 then
            print("📊 Se cargaron " .. keybindCount .. " keybinds")
            Utility.SendNotification("Keybinds Activos", 
                "Presiona las teclas asignadas para activar tus " .. keybindCount .. " emotes", 5)
            
            -- Mostrar en consola los keybinds cargados
            print("📋 Lista de keybinds activos:")
            for id, key in pairs(_G.EmotesKeybindSystemUnique.Keybinds) do
                local emoteName = "Desconocido"
                for _, emote in pairs(DataManager.Emotes) do
                    if emote.id == id then
                        emoteName = emote.name
                        break
                    end
                end
                print("  • " .. key .. " -> " .. emoteName .. " (ID: " .. id .. ")")
            end
        end
    end)
end

-- Iniciar el script
Initialize()