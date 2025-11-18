local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")
local Players=game:GetService("Players")
local LP=Players.LocalPlayer

local function safeParent()
    local ok,ui=pcall(function() return gethui and gethui() end)
    if ok and ui then return ui end
    local cg=game:FindFirstChildOfClass("CoreGui")
    if cg then return cg end
    return LP:WaitForChild("PlayerGui")
end

local function tween(obj,t,props,es,ed)
    local ti=TweenInfo.new(t or 0.25,es or Enum.EasingStyle.Quad,ed or Enum.EasingDirection.Out)
    local tw=TweenService:Create(obj,ti,props)
    tw:Play()
    return tw
end

local function ShowKeyValidationOverlay(cfg)
    cfg=cfg or {}
    local fadeIn=cfg.fadeIn or 0.25
    local fadeOut=cfg.fadeOut or 0.25
    local duration=cfg.duration or 8
    local titleText=cfg.title or "NoxHub"
    local subText=cfg.subtitle or "Preparing environment…"
    local steps=cfg.steps or {{"Connecting to server",1.6},{"Validating key",2.4},{"Decrypting modules",2.0},{"Handshake complete",1.5}}

    local gui=Instance.new("ScreenGui")
    gui.Name="KeyValidateOverlay"; gui.IgnoreGuiInset=true; gui.ResetOnSpawn=false
    gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; gui.DisplayOrder=999999999; gui.Parent=safeParent()

    local cover=Instance.new("Frame")
    cover.Name="Cover"; cover.Size=UDim2.fromScale(1,1); cover.BackgroundColor3=Color3.new(0,0,0); cover.BackgroundTransparency=1
    cover.BorderSizePixel=0; cover.ZIndex=1000000; cover.Parent=gui

    local holder=Instance.new("Frame")
    holder.AnchorPoint=Vector2.new(0.5,0.5); holder.Position=UDim2.fromScale(0.5,0.5); holder.Size=UDim2.fromOffset(520,170)
    holder.BackgroundTransparency=1; holder.ZIndex=cover.ZIndex+1; holder.Parent=cover

    local title=Instance.new("TextLabel")
    title.BackgroundTransparency=1; title.Size=UDim2.new(1,0,0,40); title.Position=UDim2.fromOffset(0,0)
    title.Font=Enum.Font.GothamMedium; title.Text=titleText; title.TextColor3=Color3.new(1,1,1); title.TextTransparency=1
    title.TextScaled=true; title.ZIndex=holder.ZIndex+1; title.Parent=holder

    local subtitle=Instance.new("TextLabel")
    subtitle.BackgroundTransparency=1; subtitle.Size=UDim2.new(1,0,0,28); subtitle.Position=UDim2.fromOffset(0,46)
    subtitle.Font=Enum.Font.Gotham; subtitle.Text=subText; subtitle.TextColor3=Color3.new(1,1,1); subtitle.TextTransparency=1
    subtitle.TextScaled=true; subtitle.ZIndex=holder.ZIndex+1; subtitle.Parent=holder

    local barBG=Instance.new("Frame")
    barBG.Name="ProgressBG"; barBG.Size=UDim2.new(1,0,0,8); barBG.Position=UDim2.fromOffset(0,110)
    barBG.BackgroundColor3=Color3.fromRGB(40,40,40); barBG.BackgroundTransparency=0.15; barBG.BorderSizePixel=0
    barBG.ZIndex=holder.ZIndex+1; barBG.Parent=holder

    local barCorner=Instance.new("UICorner")
    barCorner.CornerRadius=UDim.new(0,4); barCorner.Parent=barBG

    local barFill=Instance.new("Frame")
    barFill.Name="ProgressFill"; barFill.Size=UDim2.new(0,0,1,0); barFill.Position=UDim2.fromOffset(0,0)
    barFill.BackgroundColor3=Color3.fromRGB(255,255,255); barFill.BorderSizePixel=0; barFill.ZIndex=barBG.ZIndex+1; barFill.Parent=barBG

    local barFillCorner=barCorner:Clone()
    barFillCorner.Parent=barFill

    local spinner=Instance.new("Frame")
    spinner.AnchorPoint=Vector2.new(0,0.5); spinner.Position=UDim2.fromOffset(0,85); spinner.Size=UDim2.fromOffset(36,2)
    spinner.BackgroundColor3=Color3.new(1,1,1); spinner.BorderSizePixel=0; spinner.Rotation=0; spinner.ZIndex=holder.ZIndex+2; spinner.Parent=holder

    local spinConn=RunService.RenderStepped:Connect(function(dt)
        spinner.Rotation=(spinner.Rotation+dt*360)%360
    end)

    tween(cover,fadeIn,{BackgroundTransparency=0})
    tween(title,fadeIn,{TextTransparency=0})
    tween(subtitle,fadeIn+0.1,{TextTransparency=0})
    tween(barFill,duration,{Size=UDim2.new(1,0,1,0)},Enum.EasingStyle.Sine,Enum.EasingDirection.Out)

    local alive=true
    task.spawn(function()
        for _,step in ipairs(steps) do
            if not alive then break end
            local base,t=step[1],tonumber(step[2]) or 1.5
            local elapsed,dot=0,0
            subtitle.Text=base.."…"
            while elapsed<t and alive do
                dot=(dot+1)%4
                subtitle.Text=base..string.rep(".",dot)
                task.wait(0.25)
                elapsed+=0.25
            end
        end
        if alive then
            subtitle.Text="Done"
            tween(subtitle,0.15,{TextTransparency=0.2})
        end
    end)

    local closed=false
    local function closeNow()
        if closed then return end
        closed=true; alive=false
        tween(title,fadeOut,{TextTransparency=1})
        tween(subtitle,fadeOut,{TextTransparency=1})
        tween(cover,fadeOut,{BackgroundTransparency=1}).Completed:Wait()
        if spinConn then pcall(function() spinConn:Disconnect() end) end
        gui:Destroy()
    end

    task.spawn(function()
        task.wait(duration)
        closeNow()
    end)

    local controller={}
    function controller:Close() closeNow() end
    function controller:IsOpen() return gui and gui.Parent~=nil and not closed end
    function controller:GetGui() return gui end
    return controller
end
local controller=ShowKeyValidationOverlay({
    duration=12,
    fadeIn=0.25,
    fadeOut=0.25,
    title="Connecting to NoxHub",
    subtitle="Validating key…",
    steps={
        {"Connecting to server",1.8},
        {"Validating key",2.4},
        {"Decrypting modules",2.0},
        {"Handshake complete",1.3},
    }
})