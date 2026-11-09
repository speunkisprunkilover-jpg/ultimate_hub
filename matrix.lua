-- [[ Matrix Hub - 30x Cooler Animations & Ultimate Features ]] --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Configuration Settings
local Settings = {
    Noclip = false,
    NoGravity = false,
    InfJump = false,
    Aimbot = false,
    AimbotFOV = 100,
    Invisible = false,
    Tiny = false,
    GuiScale = 260, -- Base width scale
    CFrameSpeed = false,
    CFrameSpeedValue = 10,
    NormalSpeed = false,
    NormalSpeedValue = 16,
    JumpBoost = false,
    JumpBoostValue = 50,
}

-- UI Setup (Mobile Friendly ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixHubUltimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- === 1. 30x COOLER LOADING SCREEN === --
local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(0, 0, 0, 0)
LoadFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(5, 15, 5)
LoadFrame.BorderSizePixel = 0
LoadFrame.Parent = ScreenGui

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 12)
LoadCorner.Parent = LoadFrame

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Color = Color3.fromRGB(0, 255, 65)
LoadStroke.Thickness = 3
LoadStroke.Parent = LoadFrame

local LoadText = Instance.new("TextLabel")
LoadText.Size = UDim2.new(1, 0, 1, 0)
LoadText.BackgroundTransparency = 1
LoadText.Text = "⚡ INITIALIZING MATRIX... ⚡"
LoadText.TextColor3 = Color3.fromRGB(0, 255, 65)
LoadText.TextSize = 15
LoadText.Font = Enum.Font.SourceSansBold
LoadText.TextTransparency = 1
LoadText.Parent = LoadFrame

-- Epic Load In Animation
local loadInSize = TweenService:Create(LoadFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 260, 0, 100),
    Position = UDim2.new(0.5, -130, 0.5, -50)
})
local loadInText = TweenService:Create(LoadText, TweenInfo.new(0.4), {TextTransparency = 0})
loadInSize:Play() loadInText:Play()

task.delay(1.8, function()
    local loadOutSize = TweenService:Create(LoadFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    local loadOutText = TweenService:Create(LoadText, TweenInfo.new(0.3), {TextTransparency = 1})
    local loadOutStroke = TweenService:Create(LoadStroke, TweenInfo.new(0.3), {Transparency = 1})
    loadOutSize:Play() loadOutText:Play() loadOutStroke:Play()
    loadOutSize.Completed:Connect(function() LoadFrame:Destroy() end)
end)

-- === 2. INTERACTIVE FLOATING BALL (Pulse Animation) === --
local BallButton = Instance.new("TextButton")
BallButton.Size = UDim2.new(0, 50, 0, 50)
BallButton.Position = UDim2.new(0, 15, 0.4, 0)
BallButton.BackgroundColor3 = Color3.fromRGB(0, 180, 50)
BallButton.Text = "⚡"
BallButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BallButton.TextSize = 22
BallButton.Font = Enum.Font.SourceSansBold
BallButton.Active = true
BallButton.Draggable = true
BallButton.Parent = ScreenGui

local BallCorner = Instance.new("UICorner")
BallCorner.CornerRadius = UDim.new(1, 0)
BallCorner.Parent = BallButton

local BallStroke = Instance.new("UIStroke")
BallStroke.Color = Color3.fromRGB(0, 255, 65)
BallStroke.Thickness = 2.5
BallStroke.Parent = BallButton

-- Pulsing animation for the ball
task.spawn(function()
    while true do
        TweenService:Create(BallButton, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 54, 0, 54)}):Play()
        task.wait(0.8)
        TweenService:Create(BallButton, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 50, 0, 50)}):Play()
        task.wait(0.8)
    end
end)

-- === 3. MAIN MOD MENU WINDOW === --
local Outline = Instance.new("Frame")
Outline.Size = UDim2.new(0, 0, 0, 0)
Outline.Position = UDim2.new(0.5, 0, 0.5, 0)
Outline.BackgroundColor3 = Color3.fromRGB(0, 255, 65)
Outline.Active = true
Outline.Draggable = true
Outline.Visible = false
Outline.Parent = ScreenGui

local OutlineCorner = Instance.new("UICorner")
OutlineCorner.CornerRadius = UDim.new(0, 10)
OutlineCorner.Parent = Outline

local Main = Instance.new("Frame")
Main.Size = UDim2.new(1, -4, 1, -4)
Main.Position = UDim2.new(0, 2, 0, 2)
Main.BackgroundColor3 = Color3.fromRGB(8, 15, 8)
Main.Parent = Outline

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = Main

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "⚡ MATRIX HUB ULTIMATE ⚡"
Title.TextColor3 = Color3.fromRGB(0, 255, 65)
Title.TextSize = 14
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Main

-- Open / Close 30x Cooler Animations
local isOpen = false
BallButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then
        Outline.Visible = true
        -- Spring bounce open
        local openTween = TweenService:Create(Outline, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, Settings.GuiScale, 0, 400),
            Position = UDim2.new(0.5, -Settings.GuiScale/2, 0.5, -200)
        })
        openTween:Play()
        -- Glow pulse effect on click
        TweenService:Create(BallButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 255, 100)}):Play()
        task.wait(0.1)
        TweenService:Create(BallButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 180, 50)}):Play()
    else
        local closeTween = TweenService:Create(Outline, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        closeTween.Completed:Connect(function()
            if not isOpen then Outline.Visible = false end
        end)
    end
end)

-- Scroll Canvas
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -40)
Scroll.Position = UDim2.new(0, 5, 0, 38)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 800)
Scroll.ScrollBarThickness = 4
Scroll.Parent = Main

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

-- Helper: Animated Toggle Button
local function CreateToggle(text, callback)
    local state = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
    btn.Text = text .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(200, 255, 200)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and "ON" | "OFF")
        
        -- Color transition animation on toggle
        local targetColor = state and Color3.fromRGB(0, 255, 65) or Color3.fromRGB(200, 255, 200)
        local targetBg = state and Color3.fromRGB(20, 50, 20) or Color3.fromRGB(15, 30, 15)
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = targetColor, BackgroundColor3 = targetBg}):Play()
        
        callback(state)
    end)
    return btn
end

-- Helper: Slider Creator
local function CreateSlider(text, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
    Frame.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 22)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(0, 255, 65)
    Label.Font = Enum.Font.SourceSansBold
    Label.TextSize = 12
    Label.Parent = Frame

    local SliderBar = Instance.new("TextButton")
    SliderBar.Size = UDim2.new(0.9, 0, 0, 12)
    SliderBar.Position = UDim2.new(0.05, 0, 0, 26)
    SliderBar.BackgroundColor3 = Color3.fromRGB(5, 10, 5)
    SliderBar.Text = ""
    SliderBar.Parent = Frame

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 65)
    Fill.BorderSizePixel = 0
    Fill.Parent = SliderBar

    local dragging = false
    local function update(input)
        local delta = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * delta)
        Fill.Size = UDim2.new(delta, 0, 1, 0)
        Label.Text = text .. ": " .. value
        callback(value)
    end

    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
end

-- --- FEATURES SETUP --- --
CreateToggle("Noclip", function(v) Settings.Noclip = v end)
CreateToggle("No Gravity", function(v) Settings.NoGravity = v end)
CreateToggle("Infinite Jump", function(v) Settings.InfJump = v end)

CreateToggle("Aimbot", function(v) Settings.Aimbot = v end)
CreateSlider("Aimbot FOV", 0, 250, 100, function(v) Settings.AimbotFOV = v end)

CreateToggle("Invisible (Local)", function(v) Settings.Invisible = v end)
CreateToggle("Tiny Avatar", function(v) Settings.Tiny = v end)

CreateSlider("GUI Size", 1, 500, 260, function(v)
    Settings.GuiScale = v
    if isOpen then
        Outline.Size = UDim2.new(0, v, 0, 400)
        Outline.Position = UDim2.new(0.5, -v/2, 0.5, -200)
    end
end)

CreateToggle("CFrame Speed Boost", function(v) Settings.CFrameSpeed = v end)
CreateSlider("CFrame Speed", 0, 500, 10, function(v) Settings.CFrameSpeedValue = v end)

CreateToggle("Normal Speed Boost", function(v) Settings.NormalSpeed = v end)
CreateSlider("Normal Speed", 0, 500, 16, function(v) Settings.NormalSpeedValue = v end)

CreateToggle("Jump Boost", function(v) Settings.JumpBoost = v end)
CreateSlider("Jump Power", 9, 5000, 50, function(v) Settings.JumpBoostValue = v end)


-- --- FOV CIRCLE VISUAL FOR AIMBOT --- --
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(0, 255, 65)
FOVCircle.Thickness = 1
FOVCircle.NumSides = 64
FOVCircle.Radius = Settings.AimbotFOV
FOVCircle.Filled = false
FOVCircle.Visible = false

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = Settings.AimbotFOV
    FOVCircle.Visible = Settings.Aimbot
end)

local function GetClosestTarget()
    local closest = nil
    local shortestDist = Settings.AimbotFOV
    local mouseLoc = UserInputService:GetMouseLocation()

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - mouseLoc).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    closest = plr.Character.HumanoidRootPart
                end
            end
        end
    end
    return closest
end


-- --- FUNCTIONALITY LOOPS --- --

-- Aimbot Loop
RunService.RenderStepped:Connect(function()
    if Settings.Aimbot then
        local target = GetClosestTarget()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)

-- Noclip Loop
RunService.Stepped:Connect(function()
    if Settings.Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- No Gravity Loop
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character.HumanoidRootPart
        if Settings.NoGravity then
            root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 0, root.AssemblyLinearVelocity.Z)
        end
    end
end)

-- Infinite Jump Hook
UserInputService.JumpRequest:Connect(function()
    if Settings.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Local Invisibility Loop (Makes your own character transparent to you, visible to others)
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                if Settings.Invisible then
                    part.Transparency = 1
                else
                    if part.Name ~= "HumanoidRootPart" then
                        part.Transparency = 0
                    end
                end
            end
        end
    end
end)

-- Tiny Avatar Loop
RunService.RenderStepped:Connect(function()
    if Settings.Tiny and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        pcall(function()
            hum.BodyDepthScale:FindFirstChildOfClass("NumberValue").Value = 0.3
            hum.BodyWidthScale:FindFirstChildOfClass("NumberValue").Value = 0.3
            hum.BodyHeightScale:FindFirstChildOfClass("NumberValue").Value = 0.3
            hum.HeadScale:FindFirstChildOfClass("NumberValue").Value = 0.3
        end)
    end
end)

-- CFrame Speed Loop
RunService.RenderStepped:Connect(function()
    if Settings.CFrameSpeed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + (hum.MoveDirection * (Settings.CFrameSpeedValue / 10))
        end
    end
end)

-- Normal Speed & Jump Boost Loop
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        
        if Settings.NormalSpeed then
            hum.WalkSpeed = Settings.NormalSpeedValue
        else
            hum.WalkSpeed = 16
        end

        hum.UseJumpPower = true
        if Settings.JumpBoost then
            hum.JumpPower = Settings.JumpBoostValue
        else
            hum.JumpPower = 50
        end
    end
end)

print("Matrix Hub Ultimate Loaded Successfully!")
