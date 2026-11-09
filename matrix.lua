-- [[ Matrix Hub - Green Theme & Mobile Animation ]] --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Configuration Settings
local Settings = {
    Noclip = false,
    CFrameSpeed = false,
    CFrameSpeedValue = 10,
    NormalSpeed = false,
    NormalSpeedValue = 16,
    JumpBoost = false,
    JumpBoostValue = 50,
}

-- UI Setup (Mobile Friendly ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- === 1. LOADING SCREEN === --
local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(0, 220, 0, 90)
LoadFrame.Position = UDim2.new(0.5, -110, 0.5, -45)
LoadFrame.BackgroundColor3 = Color3.fromRGB(10, 20, 10)
LoadFrame.BorderSizePixel = 0
LoadFrame.Parent = ScreenGui

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 10)
LoadCorner.Parent = LoadFrame

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Color = Color3.fromRGB(0, 255, 65)
LoadStroke.Thickness = 2
LoadStroke.Parent = LoadFrame

local LoadText = Instance.new("TextLabel")
LoadText.Size = UDim2.new(1, 0, 1, 0)
LoadText.BackgroundTransparency = 1
LoadText.Text = "Loading Matrix Hub..."
LoadText.TextColor3 = Color3.fromRGB(0, 255, 65)
LoadText.TextSize = 14
LoadText.Font = Enum.Font.SourceSansBold
LoadText.Parent = LoadFrame

-- Fade out loading screen after 1.5 seconds
task.delay(1.5, function()
    local tween = TweenService:Create(LoadFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
    local textTween = TweenService:Create(LoadText, TweenInfo.new(0.5), {TextTransparency = 1})
    local strokeTween = TweenService:Create(LoadStroke, TweenInfo.new(0.5), {Transparency = 1})
    tween:Play() textTween:Play() strokeTween:Play()
    tween.Completed:Connect(function()
        LoadFrame:Destroy()
    end)
end)

-- === 2. FLOATING INTERACTIVE BALL (Open/Close Toggle) === --
local BallButton = Instance.new("TextButton")
BallButton.Size = UDim2.new(0, 45, 0, 45)
BallButton.Position = UDim2.new(0, 15, 0.4, 0)
BallButton.BackgroundColor3 = Color3.fromRGB(0, 150, 40)
BallButton.Text = "🟢"
BallButton.TextSize = 20
BallButton.Active = true
BallButton.Draggable = true
BallButton.Parent = ScreenGui

local BallCorner = Instance.new("UICorner")
BallCorner.CornerRadius = UDim.new(1, 0)
BallCorner.Parent = BallButton

local BallStroke = Instance.new("UIStroke")
BallStroke.Color = Color3.fromRGB(0, 255, 65)
BallStroke.Thickness = 2
BallStroke.Parent = BallButton

-- === 3. MAIN MOD MENU WINDOW === --
local Outline = Instance.new("Frame")
Outline.Size = UDim2.new(0, 260, 0, 360)
Outline.Position = UDim2.new(0.5, -130, 0.5, -180)
Outline.BackgroundColor3 = Color3.fromRGB(0, 255, 65)
Outline.Active = true
Outline.Draggable = true
Outline.Visible = false -- Starts hidden until loaded / clicked
Outline.Parent = ScreenGui

local OutlineCorner = Instance.new("UICorner")
OutlineCorner.CornerRadius = UDim.new(0, 8)
OutlineCorner.Parent = Outline

local Main = Instance.new("Frame")
Main.Size = UDim2.new(1, -4, 1, -4)
Main.Position = UDim2.new(0, 2, 0, 2)
Main.BackgroundColor3 = Color3.fromRGB(10, 18, 10)
Main.Parent = Outline

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = Main

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 32)
Title.BackgroundTransparency = 1
Title.Text = "[ Matrix Hub ]"
Title.TextColor3 = Color3.fromRGB(0, 255, 65)
Title.TextSize = 15
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Main

-- Open / Close Animation Logic
local isOpen = false
BallButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then
        Outline.Visible = true
        Outline.Size = UDim2.new(0, 0, 0, 0)
        Outline.Position = UDim2.new(0.5, 0, 0.5, 0)
        local openTween = TweenService:Create(Outline, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 260, 0, 360),
            Position = UDim2.new(0.5, -130, 0.5, -180)
        })
        openTween:Play()
    else
        local closeTween = TweenService:Create(Outline, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
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
Scroll.Size = UDim2.new(1, -10, 1, -38)
Scroll.Position = UDim2.new(0, 5, 0, 35)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 520)
Scroll.ScrollBarThickness = 4
Scroll.Parent = Main

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- UI Toggle Creator Helper (Green Theme)
local function CreateToggle(text, callback)
    local state = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
    btn.Text = text .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(200, 255, 200)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and "ON" or "OFF")
        btn.TextColor3 = state and Color3.fromRGB(0, 255, 65) or Color3.fromRGB(200, 255, 200)
        callback(state)
    end)
    return btn
end

-- UI Slider Creator Helper (Green Theme)
local function CreateSlider(text, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 42)
    Frame.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
    Frame.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(0, 255, 65)
    Label.Font = Enum.Font.SourceSansBold
    Label.TextSize = 12
    Label.Parent = Frame

    local SliderBar = Instance.new("TextButton")
    SliderBar.Size = UDim2.new(0.9, 0, 0, 12)
    SliderBar.Position = UDim2.new(0.05, 0, 0, 24)
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

CreateToggle("CFrame Speed Boost", function(v) Settings.CFrameSpeed = v end)
CreateSlider("CFrame Speed", 0, 500, 10, function(v) Settings.CFrameSpeedValue = v end)

CreateToggle("Normal Speed Boost", function(v) Settings.NormalSpeed = v end)
CreateSlider("Normal Speed", 0, 500, 16, function(v) Settings.NormalSpeedValue = v end)

CreateToggle("Jump Boost", function(v) Settings.JumpBoost = v end)
CreateSlider("Jump Power", 9, 5000, 50, function(v) Settings.JumpBoostValue = v end)


-- --- FUNCTIONALITY LOOPS --- --

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

print("Matrix Hub Loaded Successfully!")
