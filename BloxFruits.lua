local Settings = {
    JoinTeam = "Pirates"; -- Pirates/Marines
    Translator = true; -- true/false
  }
  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Variable para controlar el estado de los atributos mejorados
local betterAttributesEnabled = false

-- Función para crear una ventana de alerta
local function createAlert(text)
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Eliminar cualquier alerta existente
    if playerGui:FindFirstChild("AlertGui") then
        playerGui.AlertGui:Destroy()
    end

    -- Crear ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AlertGui"
    screenGui.Parent = playerGui

    -- Crear TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 300, 0, 50)
    textLabel.Position = UDim2.new(1, -320, 1, -60) -- Más pegado a la derecha
    textLabel.AnchorPoint = Vector2.new(1, 1) -- Anclar en la esquina inferior derecha
    textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.BackgroundTransparency = 0.5
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Text = text
    textLabel.Parent = screenGui

    -- Destruir la alerta después de 2 segundos
    task.delay(1, function()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
    end)
end

-- Función para modificar los atributos de Bimosoo_0
local function modifyAttributes(isBetter)
    local characters = Workspace:FindFirstChild("Characters")
    local localPlayer = Players.LocalPlayer
    if characters then
        local playerCharacter = characters:FindFirstChild(localPlayer.Name)
        if playerCharacter then
            if isBetter then
                -- Modificar los atributos de Bimosoo_0 a mejores valores
                playerCharacter:SetAttribute("SpeedMultiplier", 13)
                playerCharacter:SetAttribute("DashLength", 145)
                playerCharacter:SetAttribute("DashSpeed", 1000)
                playerCharacter:SetAttribute("FlashstepCooldown", 1)
                playerCharacter:SetAttribute("SkyjumpBoost", 999)
                print("Atributos de " .. localPlayer.Name .. " mejorados")
                createAlert("Cambio a transformación")
            else
                -- Modificar los atributos de Bimosoo_0 a valores normales
                playerCharacter:SetAttribute("SpeedMultiplier", 1.85)
                playerCharacter:SetAttribute("DashLength", 100)
                playerCharacter:SetAttribute("DashSpeed", 1000)
                playerCharacter:SetAttribute("FlashstepCooldown", 1)
                playerCharacter:SetAttribute("SkyjumpBoost", 999)
                print("Atributos de " .. localPlayer.Name .. " modificados")
                createAlert("Cambio a jugador")
            end
        else
            warn(localPlayer.Name .. " no encontrado en Characters")
        end
    else
        warn("Characters no encontrado en Workspace")
    end
end

-- Función para activar/desactivar "Walk On Water"
local function toggleWalkOnWater(value)
    if value then
        task.spawn(function()
            local Map = Workspace:WaitForChild("Map", 9e9)
            while value do
                task.wait(0.1)
                Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 113, 1000)
            end
            Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 80, 1000)
        end)
    end
end

-- Variable para controlar el estado de "Walk On Water"
local walkOnWaterEnabled = true

-- Función para manejar la entrada del teclado
local function onKeyPress(input, gameProcessedEvent)
    if not gameProcessedEvent then
        if input.KeyCode == Enum.KeyCode.V then
            -- Cambiar el estado de los atributos mejorados al presionar "V"
            betterAttributesEnabled = not betterAttributesEnabled
            modifyAttributes(betterAttributesEnabled)
        end
    end
end

-- Conectar la función de entrada del teclado al evento
UserInputService.InputBegan:Connect(onKeyPress)

-- Llamar a la función para activar/desactivar "Walk On Water" inicialmente
toggleWalkOnWater(walkOnWaterEnabled)

-- Modificar los atributos inicialmente a valores normales
modifyAttributes(betterAttributesEnabled)

-- Bucle para actualizar los atributos de MSR_PAND cada 5 segundos
task.spawn(function()
    while true do
        task.wait(1)
        modifyAttributes(betterAttributesEnabled)
    end
end)
