local NotificationLibrary = {
    _notifications = {},
    _theme = {
        background = "rbxassetid://140507605612025",
        primaryColor = Color3.fromRGB(20, 20, 20),
        successColor = Color3.fromRGB(0, 200, 120),
        errorColor = Color3.fromRGB(255, 60, 60),
        warningColor = Color3.fromRGB(255, 200, 60),
        textColor = Color3.fromRGB(75, 75, 75),
        cornerRadius = UDim.new(0, 8),
        iconSize = UDim2.new(0, 24, 0, 24),
        font = Enum.Font.GothamBold,
        closeIcon = "rbxassetid://6031094677",
        mobileScale = 0.9,
        closeButtonSize = UDim2.new(0, 22, 0, 22),
        showStroke = true,
        useBackgroundColor = true,
        backgroundTransparency = 0.05,
        progressBarColor = Color3.fromRGB(255, 255, 255),
        progressBarTransparency = 0.3,
        progressBarHeight = 3
    },
    _settings = {
        duration = 5,
        position = "BottomRight",
        maxNotifications = 5,
        spacing = 10,
        fadeTime = 0.3,
        slideDistance = 20
    },
    _icons = {
        info = "rbxassetid://9405926389",
        success = "rbxassetid://11157772247",
        error = "rbxassetid://9734956085",
        warning = "rbxassetid://85147473315465"
    }
}

function NotificationLibrary:_isMobile()
    return game:GetService("UserInputService").TouchEnabled
end

function NotificationLibrary:_init()
    if not self._container then
        self._container = Instance.new("ScreenGui")
        self._container.Name = "NotificationLibrary"
        self._container.ResetOnSpawn = false
        self._container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        self._container.Parent = game:GetService("CoreGui")
        
        if self:_isMobile() then
            self._container.Enabled = false
            local mobileUI = Instance.new("ScreenGui")
            mobileUI.Name = "NotificationLibraryMobile"
            mobileUI.ResetOnSpawn = false
            mobileUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            mobileUI.Parent = game:GetService("CoreGui")
            self._mobileContainer = mobileUI
        end
    end
end

function NotificationLibrary:_getNotificationSize()
    if self:_isMobile() then
        return UDim2.new(0.9, 0, 0, 90 * self._theme.mobileScale)
    else
        return UDim2.new(0, 320, 0, 80)
    end
end

function NotificationLibrary:_createNotificationFrame()
    local notification = Instance.new("Frame")
    notification.BackgroundColor3 = self._theme.primaryColor
    notification.BackgroundTransparency = self._theme.useBackgroundColor and 0.2 or 1
    notification.Size = self:_getNotificationSize()
    notification.ClipsDescendants = true
    notification.ZIndex = 100
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = self._theme.cornerRadius
    uiCorner.Parent = notification
    
    if self._theme.showStroke then
        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = Color3.fromRGB(100, 100, 100)
        uiStroke.Thickness = 1
        uiStroke.Parent = notification
    end
    
    local bgImage = Instance.new("ImageLabel")
    bgImage.Name = "Background"
    bgImage.Image = self._theme.background
    bgImage.Size = UDim2.new(1, 0, 1, 0)
    bgImage.BackgroundTransparency = 1
    bgImage.ScaleType = Enum.ScaleType.Crop
    bgImage.ImageTransparency = self._theme.backgroundTransparency
    bgImage.ZIndex = 101
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = self._theme.cornerRadius
    bgCorner.Parent = bgImage
    
    bgImage.Parent = notification
    
    return notification
end

function NotificationLibrary:_createContent(parent)
    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, -20, 1, -20)
    content.Position = UDim2.new(0, 10, 0, 10)
    content.ZIndex = 102
    content.Parent = parent
    
    local iconFrame = Instance.new("Frame")
    iconFrame.BackgroundTransparency = 1
    iconFrame.Size = UDim2.new(0, 40, 1, 0)
    iconFrame.ZIndex = 103
    iconFrame.Parent = content
    
    local icon = Instance.new("ImageLabel")
    icon.Size = self._theme.iconSize
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.Position = UDim2.new(0.5, 0, 0.5, 0)
    icon.BackgroundTransparency = 1
    icon.ZIndex = 104
    icon.Parent = iconFrame
    
    local textFrame = Instance.new("Frame")
    textFrame.BackgroundTransparency = 1
    textFrame.Position = UDim2.new(0, 50, 0, 0)
    textFrame.Size = UDim2.new(1, -50, 1, 0)
    textFrame.ZIndex = 103
    textFrame.Parent = content
    
    local title = Instance.new("TextLabel")
    title.Font = self._theme.font
    title.TextColor3 = self._theme.textColor
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -30, 0, 24)
    title.Text = "Title"
    title.ZIndex = 104
    title.Parent = textFrame
    
    local message = Instance.new("TextLabel")
    message.Font = Enum.Font.Gotham
    message.TextColor3 = self._theme.textColor
    message.TextSize = 14
    message.TextXAlignment = Enum.TextXAlignment.Left
    message.BackgroundTransparency = 1
    message.Size = UDim2.new(1, 0, 1, -24)
    message.Position = UDim2.new(0, 0, 0, 24)
    message.TextWrapped = true
    message.Text = "Message"
    message.ZIndex = 104
    message.Parent = textFrame
    
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Image = self._theme.closeIcon
    closeBtn.Size = self._theme.closeButtonSize
    closeBtn.Position = UDim2.new(1, -25, 0, 10)
    closeBtn.BackgroundTransparency = 1
    closeBtn.ZIndex = 105
    closeBtn.Parent = content
    
    local progressBarContainer = Instance.new("Frame")
    progressBarContainer.Name = "ProgressBarContainer"
    progressBarContainer.Size = UDim2.new(1, 0, 0, self._theme.progressBarHeight)
    progressBarContainer.Position = UDim2.new(0, 0, 1, -self._theme.progressBarHeight)
    progressBarContainer.BackgroundTransparency = 1
    progressBarContainer.ClipsDescendants = true
    progressBarContainer.ZIndex = 104
    progressBarContainer.Parent = parent
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = self._theme.cornerRadius
    containerCorner.Parent = progressBarContainer
    
    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.BackgroundColor3 = self._theme.progressBarColor
    progressBar.BackgroundTransparency = self._theme.progressBarTransparency
    progressBar.BorderSizePixel = 0
    progressBar.ZIndex = 105
    progressBar.Parent = progressBarContainer
    
    return {
        frame = parent,
        icon = icon,
        title = title,
        message = message,
        closeBtn = closeBtn,
        progressBar = progressBar,
        progressBarContainer = progressBarContainer
    }
end

function NotificationLibrary:_calculatePosition(index)
    local isMobile = self:_isMobile()
    local position = self._settings.position
    local spacing = self._settings.spacing
    local height = isMobile and (90 * self._theme.mobileScale) or 80
    
    if position == "BottomCenter" then
        return UDim2.new(0.5, 0, 1, -20 - (index-1)*(height + spacing))
    else -- BottomRight
        if isMobile then
            return UDim2.new(1, -20, 1, -20 - (index-1)*(height + spacing))
        else
            return UDim2.new(1, -20, 1, -20 - (index-1)*(height + spacing))
        end
    end
end

-- Анимация появления
function NotificationLibrary:_animateIn(notification)
    local startPos = notification.frame.Position
    notification.frame.Position = startPos + UDim2.new(0, 0, 0, self._settings.slideDistance)
    notification.frame.BackgroundTransparency = 1
    notification.frame.Background.ImageTransparency = 1
    
    local tweenIn = game:GetService("TweenService"):Create(
        notification.frame,
        TweenInfo.new(self._settings.fadeTime, Enum.EasingStyle.Quint),
        {
            Position = startPos,
            BackgroundTransparency = self._theme.useBackgroundColor and 0.2 or 1
        }
    )
    
    local tweenBgIn = game:GetService("TweenService"):Create(
        notification.frame.Background,
        TweenInfo.new(self._settings.fadeTime, Enum.EasingStyle.Quint),
        {
            ImageTransparency = self._theme.backgroundTransparency
        }
    )
    
    tweenIn:Play()
    tweenBgIn:Play()
end

function NotificationLibrary:_animateOut(notification, callback)
    local tweenOut = game:GetService("TweenService"):Create(
        notification.frame,
        TweenInfo.new(self._settings.fadeTime, Enum.EasingStyle.Quint),
        {
            Position = notification.frame.Position + UDim2.new(0, 0, 0, self._settings.slideDistance),
            BackgroundTransparency = 1
        }
    )
    
    local tweenBgOut = game:GetService("TweenService"):Create(
        notification.frame.Background,
        TweenInfo.new(self._settings.fadeTime, Enum.EasingStyle.Quint),
        {
            ImageTransparency = 1
        }
    )
    
    tweenOut:Play()
    tweenBgOut:Play()
    
    tweenOut.Completed:Connect(function()
        notification.frame:Destroy()
        if callback then callback() end
    end)
end

function NotificationLibrary:_updatePositions()
    for i, notif in ipairs(self._notifications) do
        notif.frame.Position = self:_calculatePosition(i)
    end
end

function NotificationLibrary:Notify(options)
    self:_init()
    
    options = options or {}
    local title = options.Title or "Notification"
    local message = options.Message or ""
    local duration = options.Duration or self._settings.duration
    local notificationType = options.Type or "info"
    local callback = options.Callback
    
    local container = self:_isMobile() and self._mobileContainer or self._container
    
    if #self._notifications >= self._settings.maxNotifications then
        local oldest = table.remove(self._notifications, 1)
        self:_animateOut(oldest)
    end
    
    local frame = self:_createNotificationFrame()
    frame.AnchorPoint = Vector2.new(
        self._settings.position == "BottomCenter" and 0.5 or 1,
        1
    )
    frame.Position = self:_calculatePosition(#self._notifications + 1)
    frame.Parent = container
    
    local notification = self:_createContent(frame)
    notification.title.Text = title
    notification.message.Text = message
    notification.icon.Image = self._icons[notificationType:lower()] or self._icons.info
    
    if notificationType == "success" then
        frame.BackgroundColor3 = self._theme.successColor
        notification.progressBar.BackgroundColor3 = self._theme.successColor
    elseif notificationType == "error" then
        frame.BackgroundColor3 = self._theme.errorColor
        notification.progressBar.BackgroundColor3 = self._theme.errorColor
    elseif notificationType == "warning" then
        frame.BackgroundColor3 = self._theme.warningColor
        notification.progressBar.BackgroundColor3 = self._theme.warningColor
    end
    
    self:_animateIn(notification)
    table.insert(self._notifications, notification)
    
    notification.closeBtn.MouseButton1Click:Connect(function()
        self:_animateOut(notification, function()
            for i, v in ipairs(self._notifications) do
                if v == notification then
                    table.remove(self._notifications, i)
                    break
                end
            end
            self:_updatePositions()
            if callback then callback() end
        end)
    end)
    
    if duration > 0 then
        local progressTween = game:GetService("TweenService"):Create(
            notification.progressBar,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {Size = UDim2.new(0, 0, 1, 0)}
        )
        progressTween:Play()
    else
        notification.progressBarContainer.Visible = false
    end
    
    if duration > 0 then
        task.delay(duration, function()
            if notification.frame and notification.frame.Parent then
                self:_animateOut(notification, function()
                    for i, v in ipairs(self._notifications) do
                        if v == notification then
                            table.remove(self._notifications, i)
                            break
                        end
                    end
                    self:_updatePositions()
                    if callback then callback() end
                end)
            end
        end)
    end
    
    return {
        Close = function()
            if notification.frame and notification.frame.Parent then
                self:_animateOut(notification, function()
                    for i, v in ipairs(self._notifications) do
                        if v == notification then
                            table.remove(self._notifications, i)
                            break
                        end
                    end
                    self:_updatePositions()
                    if callback then callback() end
                end)
            end
        end,
        Update = function(newOptions)
            if notification.frame and notification.frame.Parent then
                newOptions = newOptions or {}
                if newOptions.Title then notification.title.Text = newOptions.Title end
                if newOptions.Message then notification.message.Text = newOptions.Message end
                if newOptions.Type then
                    notification.icon.Image = self._icons[newOptions.Type:lower()] or self._icons.info
                    local color = self._theme.primaryColor
                    local progressColor = self._theme.progressBarColor
                    if newOptions.Type == "success" then 
                        color = self._theme.successColor
                        progressColor = self._theme.successColor
                    elseif newOptions.Type == "error" then 
                        color = self._theme.errorColor
                        progressColor = self._theme.errorColor
                    elseif newOptions.Type == "warning" then 
                        color = self._theme.warningColor
                        progressColor = self._theme.warningColor
                    end
                    notification.frame.BackgroundColor3 = color
                    notification.progressBar.BackgroundColor3 = progressColor
                end
            end
        end
    }
end

function NotificationLibrary:SetTheme(themeOptions)
    for key, value in pairs(themeOptions) do
        if self._theme[key] ~= nil then
            self._theme[key] = value
        end
    end
end

function NotificationLibrary:SetSettings(settings)
    for key, value in pairs(settings) do
        if self._settings[key] ~= nil then
            self._settings[key] = value
        end
    end
end

function NotificationLibrary:SetBackgroundVisibility(visible)
    self._theme.useBackgroundColor = visible
end

function NotificationLibrary:SetStrokeVisibility(visible)
    self._theme.showStroke = visible
end

function NotificationLibrary:SetBackgroundTransparency(transparency)
    self._theme.backgroundTransparency = transparency
end

function NotificationLibrary:SetProgressBarColor(color)
    self._theme.progressBarColor = color
end

function NotificationLibrary:SetProgressBarTransparency(transparency)
    self._theme.progressBarTransparency = transparency
end

function NotificationLibrary:SetProgressBarHeight(height)
    self._theme.progressBarHeight = height
end
NotificationLibrary:_init()

return NotificationLibrary