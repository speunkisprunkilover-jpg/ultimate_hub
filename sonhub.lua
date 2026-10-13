-- SON HUB (21 Features | 4 Tabs | Revamped Glassmorphism UI & Unique Loading Screen)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SonHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. UNIQUE CYBER-PULSE LOADING SCREEN
-- ==========================================
local LoadingBlur = Instance.new("Frame")
LoadingBlur.Name = "LoadingOverlay"
LoadingBlur.Parent = ScreenGui
LoadingBlur.BackgroundColor3 = Color3.fromRGB(8, 10, 15)
LoadingBlur.Size = UDim2.new(1, 0, 1, 0)
LoadingBlur.ZIndex = 10

local LoadingCard = Instance.new("Frame")
LoadingCard.Parent = LoadingBlur
LoadingCard.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
LoadingCard.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingCard.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingCard.Size = UDim2.new(0, 340, 0, 200)

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 16)
CardCorner.Parent = LoadingCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Parent = LoadingCard
CardStroke.Color = Color3.fromRGB(0, 240, 255)
CardStroke.Thickness = 2

local LoadLogo = Instance.new("TextLabel")
LoadLogo.Parent = LoadingCard
LoadLogo.BackgroundTransparency = 1
LoadLogo.Position = UDim2.new(0, 0, 0.15, 0)
LoadLogo.Size = UDim2.new(1, 0, 0.3, 0)
LoadLogo.Font = Enum.Font.GothamBold
LoadLogo.Text = "🌀 SON HUB V4"
LoadLogo.TextColor3 = Color3.fromRGB(0, 240, 255)
LoadLogo.TextScaled = true

local LoadStatus = Instance.new("TextLabel")
LoadStatus.Parent = LoadingCard
LoadStatus.BackgroundTransparency = 1
LoadStatus.Position = UDim2.new(0, 0, 0.45, 0)
LoadStatus.Size = UDim2.new(1, 0, 0.15, 0)
LoadStatus.Font = Enum.Font.Gotham
LoadStatus.Text = "Initializing 21 Modules..."
LoadStatus.TextColor3 = Color3.fromRGB(160, 180, 200)
LoadStatus.TextScaled = true

local BarBg = Instance.new("Frame")
BarBg.Parent = LoadingCard
BarBg.BackgroundColor3 = Color3.fromRGB(25, 35, 50)
BarBg.Position = UDim2.new(0.1, 0, 0.7, 0)
BarBg.Size = UDim2.new(0.8, 0, 0.1, 0)

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(0, 6)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Parent = BarBg
BarFill.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
BarFill.Size = UDim2.new(0, 0, 1, 0)

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(0, 6)
BarFillCorner.Parent = BarFill

-- ==========================================
-- 2. REVAMPED GLASSMORPHISM MAIN UI
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 16, 24)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Position = UDim2.new(0.15, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 380)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(40, 60, 90)
MainStroke.Thickness = 1.5

-- Top Bar Header
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(18, 24, 36)
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local HubTitle = Instance.new("TextLabel")
HubTitle.Parent = TopBar
HubTitle.BackgroundTransparency = 1
HubTitle.Position = UDim2.new(0.03, 0, 0, 0)
HubTitle.Size = UDim2.new(0.7, 0, 1, 0)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.Text = "⚡ SON HUB — PREMIUM SUITE"
HubTitle.TextColor3 = Color3.fromRGB(0, 240, 255)
HubTitle.TextSize = 16
HubTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Left Sidebar for Tabs (4 Tabs)
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 14, 20)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.Size = UDim2.new(0, 150, 1, -45)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.ScrollBarThickness = 2

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 6)

local function CreateTabButton(name, order)
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.LayoutOrder = order
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(20, 28, 42)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(160, 180, 200)
    btn.TextSize = 14
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

local Tab1Btn = CreateTabButton("Movement", 1)
local Tab2Btn = CreateTabButton("Visuals", 2)
local Tab3Btn = CreateTabButton("World", 3)
local Tab4Btn = CreateTabButton("Combat", 4)

-- Content Area Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 160, 0, 55)
ContentContainer.Size = UDim2.new(1, -170, 1, -65)

local function CreatePage()
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = ContentContainer
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.CanvasSize = UDim2.new(0, 0, 2.2, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = scroll
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    return scroll
end

local TabPages = {CreatePage(), CreatePage(), CreatePage(), CreatePage()}
for i = 2, 4 do TabPages[i].Visible = false end

local TabButtons = {Tab1Btn, Tab2Btn, Tab3Btn, Tab4Btn}

local function SwitchTab(idx)
    for i, page in ipairs(TabPages) do
        page.Visible = (i == idx)
        TabButtons[i].BackgroundColor3 = (i == idx) and Color3.fromRGB(0, 200, 220) or Color3.fromRGB(20, 28, 42)
        TabButtons[i].TextColor3 = (i == idx) and Color3.fromRGB(12, 16, 24) or Color3.fromRGB(160, 180, 200)
    end
end

for i, btn in ipairs(TabButtons) do
    btn.Activated:Connect(function() SwitchTab(i) end)
end
SwitchTab(1)

local function CreateToggleBtn(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, -10, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(22, 30, 44)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(230, 240, 255)
    btn.TextSize = 13
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

-- ==================== TAB 1: MOVEMENT (5 Features) ====================
local speedOn, jumpOn, infJumpOn, noclipOn, flyOn = false, false, false, false, false

local F1 = CreateToggleBtn(TabPages[1], "1. Speed Boost: OFF")
F1.Activated:Connect(function()
    speedOn = not speedOn
    F1.Text = "1. Speed Boost: " .. (speedOn and "ON" or "OFF")
end)

local F2 = CreateToggleBtn(TabPages[1], "2. Super Jump: OFF")
F2.Activated:Connect(function()
    jumpOn = not jumpOn
    F2.Text = "2. Super Jump: " .. (jumpOn and "ON" or "OFF")
end)

local F3 = CreateToggleBtn(TabPages[1], "3. Infinite Jump: OFF")
F3.Activated:Connect(function()
    infJumpOn = not infJumpOn
    F3.Text = "3. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
end)

local F4 = CreateToggleBtn(TabPages[1], "4. Noclip: OFF")
F4.Activated:Connect(function()
    noclipOn = not noclipOn
    F4.Text = "4. Noclip: " .. (noclipOn and "ON" or "OFF")
end)

local F5 = CreateToggleBtn(TabPages[1], "5. Reset Walkspeed/Jumppower")
F5.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

RunService.Stepped:Connect(function()
    if speedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
    if jumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 140
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

-- ==================== TAB 2: VISUALS (5 Features) ====================
local F6 = CreateToggleBtn(TabPages[2], "6. Player ESP Highlights: OFF")
F6.Activated:Connect(function()
    local active = F6.Text:find("OFF")
    F6.Text = "6. Player ESP Highlights: " .. (active and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if active then
                local hl = Instance.new("Highlight")
                hl.Name = "SonHL"
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("SonHL") then
                plr.Character.SonHL:Destroy()
            end
        end
    end
end)

local F7 = CreateToggleBtn(TabPages[2], "7. Neon Chams: OFF")
F7.Activated:Connect(function()
    local active = F7.Text:find("OFF")
    F7.Text = "7. Neon Chams: " .. (active and "ON" or "OFF")
end)

local F8 = CreateToggleBtn(TabPages[2], "8. Full Camera Max FOV")
F8.Activated:Connect(function()
    Camera.FieldOfView = 120
end)

local F9 = CreateToggleBtn(TabPages[2], "9. Reset Camera FOV")
F9.Activated:Connect(function()
    Camera.FieldOfView = 70
end)

local F10 = CreateToggleBtn(TabPages[2], "10. Anti-Lag / Plastic Graphics")
F10.Activated:Connect(function()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then obj.Material = Enum.Material.SmoothPlastic end
    end
end)

-- ==================== TAB 3: WORLD (5 Features) ====================
local F11 = CreateToggleBtn(TabPages[3], "11. Full Brightness: OFF")
F11.Activated:Connect(function()
    local active = F11.Text:find("OFF")
    F11.Text = "11. Full Brightness: " .. (active and "ON" or "OFF")
    Lighting.Brightness = active and 3 or 1
end)

local F12 = CreateToggleBtn(TabPages[3], "12. Clear Fog")
F12.Activated:Connect(function()
    Lighting.FogEnd = 100000
end)

local F13 = CreateToggleBtn(TabPages[3], "13. Low Gravity")
F13.Activated:Connect(function()
    Workspace.Gravity = 40
end)

local F14 = CreateToggleBtn(TabPages[3], "14. Normal Gravity")
F14.Activated:Connect(function()
    Workspace.Gravity = 196.2
end)

local F15 = CreateToggleBtn(TabPages[3], "15. Midnight Mode (Clock 0)")
F15.Activated:Connect(function()
    Lighting.ClockTime = 0
end)

-- ==================== TAB 4: COMBAT (6 Features) ====================
local aimbotOn = false
local autoClickOn = false
local hitboxOn = false

local F16 = CreateToggleBtn(TabPages[4], "16. Aimbot: OFF")
F16.Activated:Connect(function()
    aimbotOn = not aimbotOn
    F16.Text = "16. Aimbot: " .. (aimbotOn and "ON" or "OFF")
end)

local F17 = CreateToggleBtn(TabPages[4], "17. Auto-Clicker: OFF")
F17.Activated:Connect(function()
    autoClickOn = not autoClickOn
    F17.Text = "17. Auto-Clicker: " .. (autoClickOn and "ON" or "OFF")
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if autoClickOn then mouse1click() end
    end
end)

local F18 = CreateToggleBtn(TabPages[4], "18. Hitbox Expander: OFF")
F18.Activated:Connect(function()
    hitboxOn = not hitboxOn
    F18.Text = "18. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = hitboxOn and Vector3.new(12, 12, 12) or Vector3.new(2, 2, 1)
        end
    end
end)

local F19 = CreateToggleBtn(TabPages[4], "19. Rejoin Server")
F19.Activated:Connect(function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local F20 = CreateToggleBtn(TabPages[4], "20. Enable Anti-AFK")
F20.Activated:Connect(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
    end)
    F20.Text = "20. Anti-AFK: ENABLED"
end)

local F21 = CreateToggleBtn(TabPages[4], "21. Destroy GUI")
F21.Activated:Connect(function()
    ScreenGui:Destroy()
end)

-- Combat Aimbot Render Loop
RunService.RenderStepped:Connect(function()
    if aimbotOn then
        local target = nil
        local minDist = math.huge
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character.Humanoid.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if dist < minDist then
                        minDist = dist
                        target = plr.Character.Head
                    end
                end
            end
        end
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Position), 0.2)
        end
    end
end)

-- ==========================================
-- 3. LOADING ANIMATION SEQUENCE
-- ==========================================
local loadTween = TweenService:Create(BarFill, TweenInfo.new(2.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
loadTween:Play()
loadTween.Completed:Connect(function()
    LoadingBlur:Destroy()
    MainFrame.Visible = true
end)
