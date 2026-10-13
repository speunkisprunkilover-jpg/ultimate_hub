-- IDK HUB (12 Features | 3 Tabs | Custom Smooth Aimbot)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "IDKHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- MAIN FRAME
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.15, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0.7, 0, 0.6, 0)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
Title.Size = UDim2.new(1, 0, 0.12, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🎮 IDK HUB - COMBAT & UTILS"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Title

-- Tab Bar (3 Tabs)
local TabHolder = Instance.new("Frame")
TabHolder.Parent = MainFrame
TabHolder.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
TabHolder.Position = UDim2.new(0, 0, 0.12, 0)
TabHolder.Size = UDim2.new(1, 0, 0.1, 0)

local function CreateTabBtn(text, posScale)
    local btn = Instance.new("TextButton")
    btn.Parent = TabHolder
    btn.Position = UDim2.new(posScale, 0, 0, 0)
    btn.Size = UDim2.new(0.333, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.TextScaled = true
    return btn
end

local Tab1Btn = CreateTabBtn("1. Movement", 0)
local Tab2Btn = CreateTabBtn("2. Visuals", 0.333)
local Tab3Btn = CreateTabBtn("3. Combat", 0.666)

Tab1Btn.BackgroundColor3 = Color3.fromRGB(80, 80, 150)
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Pages Builder
local function CreatePage()
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = MainFrame
    scroll.Position = UDim2.new(0.03, 0, 0.25, 0)
    scroll.Size = UDim2.new(0.94, 0, 0.72, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.CanvasSize = UDim2.new(0, 0, 1.2, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = scroll
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    return scroll
end

local Tab1Page = CreatePage()
local Tab2Page = CreatePage()
local Tab3Page = CreatePage()

Tab2Page.Visible = false
Tab3Page.Visible = false

local allTabs = {
    {btn = Tab1Btn, page = Tab1Page},
    {btn = Tab2Btn, page = Tab2Page},
    {btn = Tab3Btn, page = Tab3Page}
}

for _, t in ipairs(allTabs) do
    t.btn.Activated:Connect(function()
        for _, other in ipairs(allTabs) do
            other.page.Visible = false
            other.btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            other.btn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        t.page.Visible = true
        t.btn.BackgroundColor3 = Color3.fromRGB(80, 80, 150)
        t.btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

local function CreateButton(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

-- ==================== TAB 1: MOVEMENT (4 Features) ====================
local speedOn, jumpOn, infJumpOn, noclipOn = false, false, false, false

local SpeedBtn = CreateButton(Tab1Page, "1. Speed Boost: OFF")
SpeedBtn.Activated:Connect(function()
    speedOn = not speedOn
    SpeedBtn.Text = "1. Speed Boost: " .. (speedOn and "ON" or "OFF")
end)

local JumpBtn = CreateButton(Tab1Page, "2. Super Jump: OFF")
JumpBtn.Activated:Connect(function()
    jumpOn = not jumpOn
    JumpBtn.Text = "2. Super Jump: " .. (jumpOn and "ON" or "OFF")
end)

local InfJumpBtn = CreateButton(Tab1Page, "3. Infinite Jump: OFF")
InfJumpBtn.Activated:Connect(function()
    infJumpOn = not infJumpOn
    InfJumpBtn.Text = "3. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
end)

local NoclipBtn = CreateButton(Tab1Page, "4. Noclip: OFF")
NoclipBtn.Activated:Connect(function()
    noclipOn = not noclipOn
    NoclipBtn.Text = "4. Noclip: " .. (noclipOn and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if speedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 80
    end
    if jumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 120
    end
    if noclipOn and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- ==================== TAB 2: VISUALS (4 Features) ====================
local espOn, chamsOn, fullBrightOn, fogOn = false, false, false, false

local EspBtn = CreateButton(Tab2Page, "5. Player ESP: OFF")
EspBtn.Activated:Connect(function()
    espOn = not espOn
    EspBtn.Text = "5. Player ESP: " .. (espOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espOn then
                local hl = Instance.new("Highlight")
                hl.Name = "IdkHighlight"
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("IdkHighlight") then
                plr.Character.IdkHighlight:Destroy()
            end
        end
    end
end)

local ChamsBtn = CreateButton(Tab2Page, "6. Neon Chams: OFF")
ChamsBtn.Activated:Connect(function()
    chamsOn = not chamsOn
    ChamsBtn.Text = "6. Neon Chams: " .. (chamsOn and "ON" or "OFF")
end)

local BrightBtn = CreateButton(Tab2Page, "7. Full Brightness: OFF")
BrightBtn.Activated:Connect(function()
    fullBrightOn = not fullBrightOn
    BrightBtn.Text = "7. Full Brightness: " .. (fullBrightOn and "ON" or "OFF")
    Lighting.Brightness = fullBrightOn and 3 or 1
end)

local FogBtn = CreateButton(Tab2Page, "8. Clear Fog: OFF")
FogBtn.Activated:Connect(function()
    fogOn = not fogOn
    FogBtn.Text = "8. Clear Fog: " .. (fogOn and "ON" or "OFF")
    Lighting.FogEnd = fogOn and 100000 or 1000
end)

-- ==================== TAB 3: COMBAT (4 Features w/ Smooth Aimbot) ====================
local aimbotOn = false
local smoothnessValue = 15 -- Default smoothness out of 1-50

local AimbotBtn = CreateButton(Tab3Page, "9. Aimbot: OFF")
AimbotBtn.Activated:Connect(function()
    aimbotOn = not aimbotOn
    AimbotBtn.Text = "9. Aimbot: " .. (aimbotOn and "ON" or "OFF")
    AimbotBtn.BackgroundColor3 = aimbotOn and Color3.fromRGB(80, 80, 150) or Color3.fromRGB(35, 35, 48)
end)

local SmoothBtn = CreateButton(Tab3Page, "10. Smoothness [1-50]: 15 (Tap to Cycle)")
SmoothBtn.Activated:Connect(function()
    smoothnessValue = smoothnessValue + 5
    if smoothnessValue > 50 then smoothnessValue = 5 end
    SmoothBtn.Text = "10. Smoothness [1-50]: " .. smoothnessValue .. " (Tap to Cycle)"
end)

local AutoClickBtn = CreateButton(Tab3Page, "11. Auto Clicker: OFF")
local autoClickOn = false
AutoClickBtn.Activated:Connect(function()
    autoClickOn = not autoClickOn
    AutoClickBtn.Text = "11. Auto Clicker: " .. (autoClickOn and "ON" or "OFF")
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if autoClickOn then mouse1click() end
    end
end)

local HitboxBtn = CreateButton(Tab3Page, "12. Hitbox Expander: OFF")
local hitboxOn = false
HitboxBtn.Activated:Connect(function()
    hitboxOn = not hitboxOn
    HitboxBtn.Text = "12. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = hitboxOn and Vector3.new(10, 10, 10) or Vector3.new(2, 2, 1)
        end
    end
end)

-- Aimbot Core Loop (Smoothness calculation factor)
RunService.RenderStepped:Connect(function()
    if aimbotOn then
        local closestTarget = nil
        local shortestDist = math.huge
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                local headPos = plr.Character.Head.Position
                local screenPoint, onScreen = Camera:WorldToViewportPoint(headPos)
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - mousePos).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closestTarget = plr.Character.Head
                    end
                end
            end
        end
        if closestTarget then
            local currentCFrame = Camera.CFrame
            local targetCFrame = CFrame.new(Camera.CFrame.Position, closestTarget.Position)
            -- Smooth interpolation based on smoothness slider value (1-50)
            local alpha = math.clamp(1 / smoothnessValue, 0.02, 1)
            Camera.CFrame = currentCFrame:Lerp(targetCFrame, alpha)
        end
    end
end)
