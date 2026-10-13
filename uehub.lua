-- UE HUB (15 Features | 5 Tabs | Advanced Combat FOV & Auto-Shoot)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UEHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- MAIN FRAME & 5 TABS LAYOUT
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
MainFrame.Position = UDim2.new(0.12, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0.76, 0, 0.7, 0)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 35, 50)
Title.Size = UDim2.new(1, 0, 0.12, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "⚡ UE HUB - ADVANCED EDITION"
Title.TextColor3 = Color3.fromRGB(0, 180, 255)
Title.TextScaled = true

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Title

-- Tab Holder (5 Tabs)
local TabHolder = Instance.new("Frame")
TabHolder.Parent = MainFrame
TabHolder.BackgroundColor3 = Color3.fromRGB(10, 14, 22)
TabHolder.Position = UDim2.new(0, 0, 0.12, 0)
TabHolder.Size = UDim2.new(1, 0, 0.1, 0)

local function CreateTabBtn(text, posScale)
    local btn = Instance.new("TextButton")
    btn.Parent = TabHolder
    btn.Position = UDim2.new(posScale, 0, 0, 0)
    btn.Size = UDim2.new(0.2, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(20, 28, 42)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(160, 180, 200)
    btn.TextScaled = true
    return btn
end

local Tab1Btn = CreateTabBtn("1. Move", 0)
local Tab2Btn = CreateTabBtn("2. Visuals", 0.2)
local Tab3Btn = CreateTabBtn("3. World", 0.4)
local Tab4Btn = CreateTabBtn("4. Misc", 0.6)
local Tab5Btn = CreateTabBtn("5. Combat", 0.8)

Tab1Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Pages Builder
local function CreatePage()
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = MainFrame
    scroll.Position = UDim2.new(0.03, 0, 0.24, 0)
    scroll.Size = UDim2.new(0.94, 0, 0.73, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.CanvasSize = UDim2.new(0, 0, 1.4, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = scroll
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    return scroll
end

local TabPages = {CreatePage(), CreatePage(), CreatePage(), CreatePage(), CreatePage()}
for i = 2, 5 do TabPages[i].Visible = false end

local TabButtons = {Tab1Btn, Tab2Btn, Tab3Btn, Tab4Btn, Tab5Btn}

local function SwitchTab(index)
    for i, page in ipairs(TabPages) do
        page.Visible = (i == index)
        TabButtons[i].BackgroundColor3 = (i == index) and Color3.fromRGB(0, 140, 220) or Color3.fromRGB(20, 28, 42)
        TabButtons[i].TextColor3 = (i == index) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 180, 200)
    end
end

for i, btn in ipairs(TabButtons) do
    btn.Activated:Connect(function() SwitchTab(i) end)
end

local function CreateButton(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(25, 34, 48)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

-- ==================== TAB 1: MOVEMENT (3 Features) ====================
local speedOn, jumpOn, infJumpOn = false, false, false

local SpeedBtn = CreateButton(TabPages[1], "1. Speed Boost: OFF")
SpeedBtn.Activated:Connect(function()
    speedOn = not speedOn
    SpeedBtn.Text = "1. Speed Boost: " .. (speedOn and "ON" or "OFF")
end)

local JumpBtn = CreateButton(TabPages[1], "2. Super Jump: OFF")
JumpBtn.Activated:Connect(function()
    jumpOn = not jumpOn
    JumpBtn.Text = "2. Super Jump: " .. (jumpOn and "ON" or "OFF")
end)

local InfJumpBtn = CreateButton(TabPages[1], "3. Infinite Jump: OFF")
InfJumpBtn.Activated:Connect(function()
    infJumpOn = not infJumpOn
    InfJumpBtn.Text = "3. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if speedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 85
    end
    if jumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 125
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- ==================== TAB 2: VISUALS (3 Features) ====================
local espOn, chamsOn, noclipOn = false, false, false

local EspBtn = CreateButton(TabPages[2], "4. Player ESP: OFF")
EspBtn.Activated:Connect(function()
    espOn = not espOn
    EspBtn.Text = "4. Player ESP: " .. (espOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espOn then
                local hl = Instance.new("Highlight")
                hl.Name = "UEHighlight"
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("UEHighlight") then
                plr.Character.UEHighlight:Destroy()
            end
        end
    end
end)

local ChamsBtn = CreateButton(TabPages[2], "5. Neon Chams: OFF")
ChamsBtn.Activated:Connect(function()
    chamsOn = not chamsOn
    ChamsBtn.Text = "5. Neon Chams: " .. (chamsOn and "ON" or "OFF")
end)

local NoclipBtn = CreateButton(TabPages[2], "6. Noclip: OFF")
NoclipBtn.Activated:Connect(function()
    noclipOn = not noclipOn
    NoclipBtn.Text = "6. Noclip: " .. (noclipOn and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if noclipOn and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- ==================== TAB 3: WORLD (3 Features) ====================
local brightOn, fogOn, gravOn = false, false, false

local BrightBtn = CreateButton(TabPages[3], "7. Full Brightness: OFF")
BrightBtn.Activated:Connect(function()
    brightOn = not brightOn
    BrightBtn.Text = "7. Full Brightness: " .. (brightOn and "ON" or "OFF")
    Lighting.Brightness = brightOn and 3 or 1
end)

local FogBtn = CreateButton(TabPages[3], "8. Clear Fog: OFF")
FogBtn.Activated:Connect(function()
    fogOn = not fogOn
    FogBtn.Text = "8. Clear Fog: " .. (fogOn and "ON" or "OFF")
    Lighting.FogEnd = fogOn and 100000 or 1000
end)

local GravBtn = CreateButton(TabPages[3], "9. Low Gravity: OFF")
GravBtn.Activated:Connect(function()
    gravOn = not gravOn
    GravBtn.Text = "9. Low Gravity: " .. (gravOn and "ON" or "OFF")
    Workspace.Gravity = gravOn and 45 or 196.2
end)

-- ==================== TAB 4: MISC (3 Features) ====================
local btoolsOn, antiAfkOn, lowGfxOn = false, false, false

local BtoolsBtn = CreateButton(TabPages[4], "10. Give Building Tools")
BtoolsBtn.Activated:Connect(function()
    for i = 1, 4 do Instance.new("HopperBin", LocalPlayer.Backpack).BinType = i end
end)

local AntiAfkBtn = CreateButton(TabPages[4], "11. Enable Anti-AFK")
AntiAfkBtn.Activated:Connect(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
    end)
    AntiAfkBtn.Text = "11. Anti-AFK: ENABLED"
end)

local LowGfxBtn = CreateButton(TabPages[4], "12. Low Graphics Mode")
LowGfxBtn.Activated:Connect(function()
    for _, item in pairs(Workspace:GetDescendants()) do
        if item:IsA("BasePart") then item.Material = Enum.Material.SmoothPlastic end
    end
end)

-- ==================== TAB 5: COMBAT (6 Features) ====================
-- Feature 13: Aimbot
-- Feature 14: FOV Slider (1-250)
-- Feature 15: Show FOV (Circle)
-- Feature 16 (Bonus integrated): Smoothness (1-50)
-- Feature 17: Auto Shoot
-- Feature 18: Auto Shoot Speed (1s / 10s / 15s)

local aimbotOn = false
local showFovOn = false
local fovRadius = 100      -- Range: 1 to 250
local smoothnessVal = 15   -- Range: 1 to 50
local autoShootOn = false
local autoShootSpeed = 1   -- Options: 1, 10, or 15 seconds

-- Drawing Object for FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 32
fovCircle.Radius = fovRadius
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(0, 180, 255)
fovCircle.Visible = false

local AimbotBtn = CreateButton(TabPages[5], "13. Aimbot: OFF")
AimbotBtn.Activated:Connect(function()
    aimbotOn = not aimbotOn
    AimbotBtn.Text = "13. Aimbot: " .. (aimbotOn and "ON" or "OFF")
end)

local FovSliderBtn = CreateButton(TabPages[5], "14. FOV Radius [1-250]: 100 (Tap to Cycle)")
FovSliderBtn.Activated:Connect(function()
    fovRadius = fovRadius + 25
    if fovRadius > 250 then fovRadius = 50 end
    fovCircle.Radius = fovRadius
    FovSliderBtn.Text = "14. FOV Radius [1-250]: " .. fovRadius .. " (Tap to Cycle)"
end)

local ShowFovBtn = CreateButton(TabPages[5], "15. Show FOV Circle: OFF")
ShowFovBtn.Activated:Connect(function()
    showFovOn = not showFovOn
    fovCircle.Visible = showFovOn
    ShowFovBtn.Text = "15. Show FOV Circle: " .. (showFovOn and "ON" or "OFF")
end)

local SmoothBtn = CreateButton(TabPages[5], "16. Smoothness [1-50]: 15 (Tap to Cycle)")
SmoothBtn.Activated:Connect(function()
    smoothnessVal = smoothnessVal + 10
    if smoothnessVal > 50 then smoothnessVal = 5 end
    SmoothBtn.Text = "16. Smoothness [1-50]: " .. smoothnessVal .. " (Tap to Cycle)"
end)

local AutoShootBtn = CreateButton(TabPages[5], "17. Auto Shoot: OFF")
AutoShootBtn.Activated:Connect(function()
    autoShootOn = not autoShootOn
    AutoShootBtn.Text = "17. Auto Shoot: " .. (autoShootOn and "ON" or "OFF")
end)

local AutoShootSpeedBtn = CreateButton(TabPages[5], "18. Auto Shoot Interval: 1s (Tap to Cycle)")
AutoShootSpeedBtn.Activated:Connect(function()
    if autoShootSpeed == 1 then
        autoShootSpeed = 10
    elseif autoShootSpeed == 10 then
        autoShootSpeed = 15
    else
        autoShootSpeed = 1
    end
    AutoShootSpeedBtn.Text = "18. Auto Shoot Interval: " .. autoShootSpeed .. "s (Tap to Cycle)"
end)

-- Main Combat Render Loop (Aimbot & FOV Tracking)
RunService.RenderStepped:Connect(function()
    local mousePos = UserInputService:GetMouseLocation()
    fovCircle.Position = mousePos

    local target = nil
    local shortestDist = fovRadius

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            local headPos = plr.Character.Head.Position
            local screenPt, onScreen = Camera:WorldToViewportPoint(headPos)
            if onScreen then
                local dist = (Vector2.new(screenPt.X, screenPt.Y) - mousePos).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    target = plr.Character.Head
                end
            end
        end
    end

    if aimbotOn and target then
        local currentCF = Camera.CFrame
        local targetCF = CFrame.new(Camera.CFrame.Position, target.Position)
        local alpha = math.clamp(1 / smoothnessVal, 0.02, 1)
        Camera.CFrame = currentCF:Lerp(targetCF, alpha)
    end
end)

-- Auto Shoot Loop based on selected speeds (1s, 10s, 15s)
task.spawn(function()
    while true do
        task.wait(autoShootSpeed)
        if autoShootOn then
            mouse1click()
        end
    end
end)
