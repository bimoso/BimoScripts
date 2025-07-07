local l_Effect_0 = require(ReplicatedStorage:WaitForChild("Effect"))
local Util = require(ReplicatedStorage:WaitForChild("Util"))

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local playerGui = player:WaitForChild("PlayerGui")

local jetpackActive = false
local bodyVelocity
local jetpackEffect
local jetpackAnimation

-- Variable para controlar el reinicio del efecto
local resetEffectRunning = false

-- Cargar la animación del jetpack
local animStorage = ReplicatedStorage.Util.Anims.Storage["1"]
local skyJumpAnim = animStorage:FindFirstChild("SkyJumpJetpack")
if not skyJumpAnim then
    warn("La animación 'SkyJumpJetpack' no se encontró en ReplicatedStorage.Util.Anims.Storage['1']")
else
    jetpackAnimation = humanoid:LoadAnimation(skyJumpAnim)
    jetpackAnimation.Name = "SkyJumpJetpack"
    jetpackAnimation.Looped = true  -- Asegurar que la animación se reproduce en bucle
end

-- Función para reiniciar el efecto del jetpack cada segundo
local function resetEfectoJetpack()
    resetEffectRunning = true
    while jetpackActive do
        task.wait(1) -- Esperar 1 segundo

        if not jetpackActive then
            break
        end

        -- Destruir el efecto existente si existe
        local jetpackFolder = character:FindFirstChild("__DracoJetpack")
        if jetpackFolder then
            jetpackFolder:Destroy()
            print("Efecto del Jetpack Destruido para reinicio")
        end

        -- Crear nuevamente el folder y el efecto
        local l_Folder_0 = Instance.new("Folder")
        l_Folder_0.Name = "__DracoJetpack"
        l_Folder_0.Parent = character

        jetpackEffect = l_Effect_0.new("DracoRace.Jetpack"):play({
            Root = character:FindFirstChild("UpperTorso") or humanoidRootPart,
            Reference = l_Folder_0,
            Energy = 100,
            player = player
        })

        print("Efecto del Jetpack Reiniciado")
    end
    resetEffectRunning = false
end

-- Función para activar el jetpack
local function activarJetpack()
    if not jetpackActive and jetpackAnimation then
        jetpackActive = true

        -- Asegurar que cualquier BodyVelocity existente sea eliminado
        for _, child in ipairs(humanoidRootPart:GetChildren()) do
            if child:IsA("BodyVelocity") then
                child:Destroy()
            end
        end

        -- Crear nuevo BodyVelocity
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Name = "JetpackVelocity"
        bodyVelocity.Velocity = Vector3.new(0, 75, 0)
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocity.Parent = humanoidRootPart

        -- Reproducir la animación del jetpack
        jetpackAnimation:Play(0.1)

        -- Crear el folder y el efecto inicial
        local existingFolder = character:FindFirstChild("__DracoJetpack")
        if existingFolder then
            existingFolder:Destroy()
            print("Folder '__DracoJetpack' existente destruido antes de crear uno nuevo")
        end

        local l_Folder_0 = Instance.new("Folder")
        l_Folder_0.Name = "__DracoJetpack"
        l_Folder_0.Parent = character

        jetpackEffect = l_Effect_0.new("DracoRace.Jetpack"):play({
            Root = character:FindFirstChild("UpperTorso") or humanoidRootPart,
            Reference = l_Folder_0,
            Energy = 100,
            player = player
        })

        print("Jetpack Activado y Efecto Inicial Creado")

        -- Iniciar el reinicio periódico del efecto si no está ya corriendo
        if not resetEffectRunning then
            task.spawn(resetEfectoJetpack)
        end
    end
end

-- Función para desactivar el jetpack
local function desactivarJetpack()
    if jetpackActive then
        jetpackActive = false

        -- Eliminar inmediatamente todos los BodyVelocity
        for _, child in ipairs(humanoidRootPart:GetChildren()) do
            if child:IsA("BodyVelocity") then
                child:Destroy()
            end
        end
        bodyVelocity = nil

        -- Detener la animación del jetpack
        if jetpackAnimation then
            jetpackAnimation:Stop()
        end

        -- Destruir el folder del jetpack con una demora para evitar conflictos
        task.delay(0.1, function()
            for _, folder in ipairs(character:GetChildren()) do
                if folder.Name == "__DracoJetpack" then
                    folder:Destroy()
                    print("Efecto del Jetpack Destruido")
                end
            end
        end)

        print("Jetpack Desactivado")
    end
end

-- Variable para controlar el estado del espacio
local spacePressed = false

-- Variables para manejar las conexiones de eventos
local inputBeganConnection
local inputEndedConnection
local jetpackInfiniteEnabled = true

-- Función para conectar eventos del jetpack infinito
local function conectarEventosJetpack()
    if inputBeganConnection or inputEndedConnection then return end
    
    inputBeganConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.ButtonA then
            spacePressed = true
            if not jetpackActive then
                activarJetpack()
            end
        end
    end)

    inputEndedConnection = UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.ButtonA then
            spacePressed = false
            desactivarJetpack()
        end
    end)
end

-- Función para desconectar eventos del jetpack infinito
local function desconectarEventosJetpack()
    if inputBeganConnection then
        inputBeganConnection:Disconnect()
        inputBeganConnection = nil
    end
    if inputEndedConnection then
        inputEndedConnection:Disconnect()
        inputEndedConnection = nil
    end
    
    -- Asegurarse de que el jetpack se desactive al desconectar
    if jetpackActive then
        desactivarJetpack()
    end
end

-- Evento para alternar el jetpack infinito con la tecla H
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.H and not UserInputService:GetFocusedTextBox() then
        jetpackInfiniteEnabled = not jetpackInfiniteEnabled
        
        if jetpackInfiniteEnabled then
            conectarEventosJetpack()
            print("Jetpack Infinito Activado")
        else
            desconectarEventosJetpack()
            print("Jetpack Infinito Desactivado")
        end
    end
end)

-- Conectar eventos inicialmente
conectarEventosJetpack()

-- Manejo de controles táctiles
if UserInputService.TouchEnabled then
    local touchState = {
        UserInputState = Enum.UserInputState.None
    }
    local success, TouchGui = pcall(function()
        return playerGui:WaitForChild("TouchGui", 10)
    end)
    if success and TouchGui then
        local JumpControlFrame = TouchGui:FindFirstChild("TouchControlFrame")
        if JumpControlFrame then
            local JumpButton = JumpControlFrame:FindFirstChild("JumpButton")
            if JumpButton then
                JumpButton.MouseButton1Down:Connect(function(_, _)
                    if not jetpackActive then
                        touchState.UserInputState = Enum.UserInputState.Begin
                        activarJetpack()
                    end
                end)
                JumpButton.MouseButton1Up:Connect(function(_, _)
                    touchState.UserInputState = Enum.UserInputState.End
                    desactivarJetpack()
                end)
            end
        end
    end
end

-- Asegurarse de que el jetpack se desactive si el personaje muere o se reinicia
humanoid.Died:Connect(function()
    desactivarJetpack()
end)

-- Agregar una función de mantenimiento del jetpack
task.spawn(function()
    while task.wait() do
        if jetpackActive and not bodyVelocity or 
           (bodyVelocity and not bodyVelocity.Parent) then
            -- Recrear el BodyVelocity si se perdió
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Name = "JetpackVelocity"
            bodyVelocity.Velocity = Vector3.new(0, 75, 0)
            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            bodyVelocity.Parent = humanoidRootPart
        end
    end
end)