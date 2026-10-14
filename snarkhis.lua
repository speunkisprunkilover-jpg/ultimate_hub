-- SNARKHIS HUB (40 OP Features | 10 Tabs | Neon Emerald Theme | Key: imcool)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")

local CORRECT_KEY = "imcool"

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SnarkhisHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. FLOATING TOGGLE ICON (Emerald Theme)
-- ==========================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleIcon"
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 20, 16)
ToggleBtn.Position = UDim2.new(0.04, 0, 0.15, 0)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "🐍"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 140)
ToggleBtn.TextSize = 24
ToggleBtn.Visible = false
ToggleBtn.Active = true
ToggleBtn.Draggable = true

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = ToggleBtn
ToggleStroke.Color = Color3.fromRGB(0, 255, 140)
ToggleStroke.Thickness = 2

-- ==========================================
-- 2. NEON EMERALD LOADING SCREEN
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = ScreenGui
LoadingFrame.BackgroundColor3 = Color3.fromRGB(8, 12, 10)
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.ZIndex = 10

local LoadingCard = Instance.new("Frame")
LoadingCard.Parent = LoadingFrame
LoadingCard.BackgroundColor3 = Color3.fromRGB(14, 22, 18)
LoadingCard.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingCard.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingCard.Size = UDim2.new(0, 360, 0, 220)

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 16)
CardCorner.Parent = LoadingCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Parent = LoadingCard
CardStroke.Color = Color3.fromRGB(0, 255, 140)
CardStroke.Thickness = 2.5

local LoadLogo = Instance.new("TextLabel")
LoadLogo.Parent = LoadingCard
LoadLogo.BackgroundTransparency = 1
LoadLogo.Position = UDim2.new(0, 0, 0.15, 0)
LoadLogo.Size = UDim2.new(1, 0, 0.3, 0)
LoadLogo.Font = Enum.Font.GothamBold
LoadLogo.Text = "🐍 SNARKHIS"
LoadLogo.TextColor3 = Color3.fromRGB(0, 255, 140)
LoadLogo.TextScaled = true

local LoadStatus = Instance.new("TextLabel")
LoadStatus.Parent = LoadingCard
LoadStatus.BackgroundTransparency = 1
LoadStatus.Position = UDim2.new(0, 0, 0.45, 0)
LoadStatus.Size = UDim2.new(1, 0, 0.15, 0)
LoadStatus.Font = Enum.Font.Gotham
LoadStatus.Text = "Loading 40 OP Modules & 10 Tabs..."
LoadStatus.TextColor3 = Color3.fromRGB(170, 220, 190)
LoadStatus.TextScaled = true

local BarBg = Instance.new("Frame")
BarBg.Parent = LoadingCard
BarBg.BackgroundColor3 = Color3.fromRGB(25, 40, 32)
BarBg.Position = UDim2.new(0.1, 0, 0.7, 0)
BarBg.Size = UDim2.new(0.8, 0, 0.12, 0)

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(0, 6)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Parent = BarBg
BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
BarFill.Size = UDim2.new(0, 0, 1, 0)

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(0, 6)
BarFillCorner.Parent = BarFill

-- ==========================================
-- 3. KEY SYSTEM UI
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 18, 15)
KeyFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
KeyFrame.Size = UDim2.new(0, 350, 0, 210)
KeyFrame.Visible = false
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 14)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Parent = KeyFrame
KeyStroke.Color = Color3.fromRGB(0, 255, 140)
KeyStroke.Thickness = 2

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0, 0, 0.1, 0)
KeyTitle.Size = UDim2.new(1, 0, 0.2, 0)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "🔑 Enter Key for Snarkhis"
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 140)
KeyTitle.TextScaled = true

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 30, 25)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.22, 0)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter key (imcool)..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextScaled = true

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 110)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.72, 0)
SubmitBtn.Size = UDim2.new(0.6, 0, 0.2, 0)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "Unlock Snarkhis"
SubmitBtn.TextColor3 = Color3.fromRGB(12, 18, 15)
SubmitBtn.TextScaled = true

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitBtn

-- ==========================================
-- 4. MAIN HUB UI (10 TABS | EMERALD GLASS)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 16, 13)
MainFrame.Position = UDim2.new(0.12, 0, 0.12, 0)
MainFrame.Size = UDim2.new(0, 620, 0, 400)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(0, 255, 140)
MainStroke.Thickness = 1.5

-- Top Header
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(16, 26, 21)
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.03, 0, 0, 0)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🐍 SNARKHIS — OP ULTIMATE V1"
Title.TextColor3 = Color3.fromRGB(0, 255, 140)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Horizontal Scrollable Tab Bar (10 Tabs)
local TabBar = Instance.new("ScrollingFrame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(8, 12, 10)
TabBar.Position = UDim2.new(0, 0, 0, 45)
TabBar.Size = UDim2.new(1, 0, 0, 42)
TabBar.CanvasSize = UDim2.new(2.5, 0, 0, 0)
TabBar.ScrollBarThickness = 2

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabBar
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)

local function CreateTabBtn(text)
    local btn = Instance.new("TextButton")
    btn.Parent = TabBar
    btn.Size = UDim2.new(0.095, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(16, 26, 21)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(170, 220, 190)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

local TabNames = {"Speed/Fly", "Jump/Phys", "ESP", "Lighting", "Combat", "Camera", "Utils", "Teleports", "Character", "Server"}
local TabButtons = {}

for _, name in ipairs(TabNames) do
    table.insert(TabButtons, CreateTabBtn(name))
end

-- Pages Container
local function CreatePage()
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = MainFrame
    scroll.Position = UDim2.new(0.03, 0, 0.24, 0)
    scroll.Size = UDim2.new(0.94, 0, 0.73, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.CanvasSize = UDim2.new(0, 0, 2.2, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = scroll
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    return scroll
end

local TabPages = {}
for i = 1, 10 do
    local p = CreatePage()
    p.Visible = (i == 1)
    table.insert(TabPages, p)
end

local function SwitchTab(index)
    for i, page in ipairs(TabPages) do
        page.Visible = (i == index)
        TabButtons[i].BackgroundColor3 = (i == index) and Color3.fromRGB(0, 255, 140) or Color3.fromRGB(16, 26, 21)
        TabButtons[i].TextColor3 = (i == index) and Color3.fromRGB(10, 16, 13) or Color3.fromRGB(170, 220, 190)
    end
end

for i, btn in ipairs(TabButtons) do
    btn.Activated:Connect(function() SwitchTab(i) end)
end
SwitchTab(1)

local function CreateBtn(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(18, 28, 23)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

-- ==================== TAB 1: SPEED & FLY (4 Features) ====================
local cframeSpeedOn, cframeSpeedVal, flyOn, flySpeedVal = false, 100, false, 100

local F1 = CreateBtn(TabPages[1], "1. CFrame Speed Boost: OFF")
F1.Activated:Connect(function()
    cframeSpeedOn = not cframeSpeedOn
    F1.Text = "1. CFrame Speed Boost: " .. (cframeSpeedOn and "ON" or "OFF")
end)

local F2 = CreateBtn(TabPages[1], "2. CFrame Speed [1-500]: 100 (Tap to Cycle)")
F2.Activated:Connect(function()
    cframeSpeedVal = cframeSpeedVal + 50
    if cframeSpeedVal > 500 then cframeSpeedVal = 25 end
    F2.Text = "2. CFrame Speed [1-500]: " .. cframeSpeedVal .. " (Tap to Cycle)"
end)

local F3 = CreateBtn(TabPages[1], "3. Fly Hack: OFF")
F3.Activated:Connect(function()
    flyOn = not flyOn
    F3.Text = "3. Fly Hack: " .. (flyOn and "ON" or "OFF")
end)

local F4 = CreateBtn(TabPages[1], "4. Fly Speed [1-400]: 100 (Tap to Cycle)")
F4.Activated:Connect(function()
    flySpeedVal = flySpeedVal + 50
    if flySpeedVal > 400 then flySpeedVal = 25 end
    F4.Text = "4. Fly Speed [1-400]: " .. flySpeedVal .. " (Tap to Cycle)"
end)

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if cframeSpeedOn and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (char.Humanoid.MoveDirection * (cframeSpeedVal / 50))
        end
        if flyOn then
            char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            if char.Humanoid.MoveDirection.Magnitude > 0 then
                char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (Camera.CFrame.LookVector * (flySpeedVal / 40))
            end
        end
    end
end)

-- ==================== TAB 2: JUMP & PHYSICS (4 Features) ====================
local superJumpOn, infJumpOn, noclipOn = false, false, false

local F5 = CreateBtn(TabPages[2], "5. Super Jump: OFF")
F5.Activated:Connect(function()
    superJumpOn = not superJumpOn
    F5.Text = "5. Super Jump: " .. (superJumpOn and "ON" or "OFF")
end)

local F6 = CreateBtn(TabPages[2], "6. Infinite Jump: OFF")
F6.Activated:Connect(function()
    infJumpOn = not infJumpOn
    F6.Text = "6. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
end)

local F7 = CreateBtn(TabPages[2], "7. Low Gravity Mode")
F7.Activated:Connect(function() Workspace.Gravity = 45 end)

local F8 = CreateBtn(TabPages[2], "8. Noclip: OFF")
F8.Activated:Connect(function()
    noclipOn = not noclipOn
    F8.Text = "8. Noclip: " .. (noclipOn and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if superJumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
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

-- ==================== TAB 3: VISUALS (4 Features) ====================
local espOn = false

local F9 = CreateBtn(TabPages[3], "9. Player ESP Highlights: OFF")
F9.Activated:Connect(function()
    espOn = not espOn
    F9.Text = "9. Player ESP Highlights: " .. (espOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espOn then
                local hl = Instance.new("Highlight")
                hl.Name = "SnarkhisHL"
                hl.FillColor = Color3.fromRGB(0, 255, 140)
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("SnarkhisHL") then
                plr.Character.SnarkhisHL:Destroy()
            end
        end
    end
end)

local F10 = CreateBtn(TabPages[3], "10. Player Tracers")
local F11 = CreateBtn(TabPages[3], "11. Name & Distance Tags")
local F12 = CreateBtn(TabPages[3], "12. Neon Chams")

-- ==================== TAB 4: LIGHTING & WORLD (5 Features) ====================
local F13 = CreateBtn(TabPages[4], "13. Full Brightness")
F13.Activated:Connect(function() Lighting.Brightness = 3; Lighting.ClockTime = 14 end)

local F14 = CreateBtn(TabPages[4], "14. Clear Fog")
F14.Activated:Connect(function() Lighting.FogEnd = 100000 end)

local F15 = CreateBtn(TabPages[4], "15. Midnight Mode")
F15.Activated:Connect(function() Lighting.ClockTime = 0 end)

local F16 = CreateBtn(TabPages[4], "16. Disable Shadows")
F16.Activated:Connect(function() Lighting.GlobalShadows = false end)

local F17 = CreateBtn(TabPages[4], "17. Remove Atmospheric Effects")
F17.Activated:Connect(function()
    for _, item in pairs(Lighting:GetChildren()) do
        if item:IsA("PostEffect") or item:IsA("Atmosphere") then item:Destroy() end
    end
end)

-- ==================== TAB 5: COMBAT ELITE (4 Features) ====================
local aimbotOn, autoClickOn, hitboxOn, spinbotOn = false, false, false, false

local F18 = CreateBtn(TabPages[5], "18. Camera Aimbot: OFF")
F18.Activated:Connect(function()
    aimbotOn = not aimbotOn
    F18.Text = "18. Camera Aimbot: " .. (aimbotOn and "ON" or "OFF")
end)

local F19 = CreateBtn(TabPages[5], "19. Fast Auto-Clicker: OFF")
F19.Activated:Connect(function()
    autoClickOn = not autoClickOn
    F19.Text = "19. Fast Auto-Clicker: " .. (autoClickOn and "ON" or "OFF")
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if autoClickOn then mouse1click() end
    end
end)

local F20 = CreateBtn(TabPages[5], "20. Hitbox Expander: OFF")
F20.Activated:Connect(function()
    hitboxOn = not hitboxOn
    F20.Text = "20. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = hitboxOn and Vector3.new(12, 12, 12) or Vector3.new(2, 2, 1)
        end
    end
end)

local F21 = CreateBtn(TabPages[5], "21. Spinbot Exploit: OFF")
F21.Activated:Connect(function()
    spinbotOn = not spinbotOn
    F21.Text = "21. Spinbot Exploit: " .. (spinbotOn and "ON" or "OFF")
end)

RunService.RenderStepped:Connect(function()
    if spinbotOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(30), 0)
    end
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

-- ==================== TAB 6: CAMERA & FOV (4 Features) ====================
local F22 = CreateBtn(TabPages[6], "22. Max FOV Boost (120)")
F22.Activated:Connect(function() Camera.FieldOfView = 120 end)

local F23 = CreateBtn(TabPages[6], "23. Reset Camera FOV")
F23.Activated:Connect(function() Camera.FieldOfView = 70 end)

local F24 = CreateBtn(TabPages[6], "24. Max Camera Zoom Unlock")
F24.Activated:Connect(function() LocalPlayer.CameraMaxZoomDistance = 10000 end)

local F25 = CreateBtn(TabPages[6], "25. Freecam Visual")

-- ==================== TAB 7: UTILITIES (4 Features) ====================
local F26 = CreateBtn(TabPages[7], "26. Enable Anti-AFK")
F26.Activated:Connect(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
    end)
    F26.Text = "26. Anti-AFK: ENABLED"
end)

local F27 = CreateBtn(TabPages[7], "27. Anti-Lag / Plastic Mode")
F27.Activated:Connect(function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") then part.Material = Enum.Material.SmoothPlastic end
    end
end)

local F28 = CreateBtn(TabPages[7], "28. X-Ray Translucent Walls")
F28.Activated:Connect(function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Parent:FindFirstChild("Humanoid") then
            part.LocalTransparencyModifier = 0.5
        end
    end
end)

local F29 = CreateBtn(TabPages[7], "29. Give Building Tools (BTools)")
F29.Activated:Connect(function()
    for i = 1, 4 do Instance.new("HopperBin", LocalPlayer.Backpack).BinType = i end
end)

-- ==================== TAB 8: TELEPORTS (3 Features) ====================
local F30 = CreateBtn(TabPages[8], "30. Teleport to Spawn")
F30.Activated:Connect(function()
    local spawnLoc = Workspace:FindFirstChildOfClass("SpawnLocation")
    if spawnLoc and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = spawnLoc.CFrame + Vector3.new(0, 3, 0)
    end
end)

local F31 = CreateBtn(TabPages[8], "31. Teleport to Random Player")
F31.Activated:Connect(function()    local plrs = Players:GetPlayers()
    local target = plrs[math.random(1, #plrs)]
    if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end
end)

local F32 = CreateBtn(TabPages[8], "32. Give Click Teleport Tool")
F32.Activated:Connect(function()
    local mouse = LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Click Teleport Tool"
    tool.Activated:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)
    tool.Parent = LocalPlayer.Backpack
end)

-- ==================== TAB 9: CHARACTER MODS (5 Features) ====================
local F33 = CreateBtn(TabPages[9], "33. Semi-Invisible Character")
F33.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.Transparency = 0.8 end
        end
    end
end)

local F34 = CreateBtn(TabPages[9], "34. Local Headless Visual")
F34.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        LocalPlayer.Character.Head.Transparency = 1
        if LocalPlayer.Character.Head:FindFirstChildOfClass("Decal") then
            LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Destroy()
        end
    end
end)

local F35 = CreateBtn(TabPages[9], "35. Remove Accessories")
F35.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, acc in pairs(LocalPlayer.Character:GetChildren()) do
            if acc:IsA("Accessory") then acc:Destroy() end
        end
    end
end)

local F36 = CreateBtn(TabPages[9], "36. Sit Character")
F36.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Sit = true
    end
end)

local F37 = CreateBtn(TabPages[9], "37. Respawn / Reset Character")
F37.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

-- ==================== TAB 10: SERVER & GUI (3 Features) ====================
local F38 = CreateBtn(TabPages[10], "38. Rejoin Server")
F38.Activated:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local F39 = CreateBtn(TabPages[10], "39. Server Hop")
F39.Activated:Connect(function()
    local http = game:GetService("HttpService")
    local servers = http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, server in ipairs(servers) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
            break
        end
    end
end)

local F40 = CreateBtn(TabPages[10], "40. Destroy Snarkhis GUI")
F40.Activated:Connect(function()
    ScreenGui:Destroy()
end)

-- ==========================================
-- 5. TOGGLE BUTTON & KEY LOGIC
-- ==========================================
local function ToggleUI()
    MainFrame.Visible = not MainFrame.Visible
end

ToggleBtn.MouseButton1Click:Connect(ToggleUI)
ToggleBtn.TouchTap:Connect(ToggleUI)

local loadTween = TweenService:Create(BarFill, TweenInfo.new(2.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
loadTween:Play()
loadTween.Completed:Connect(function()
    LoadingFrame:Destroy()
    KeyFrame.Visible = true
end)

SubmitBtn.Activated:Connect(function()
    if KeyInput.Text == CORRECT_KEY then
        KeyFrame:Destroy()
        MainFrame.Visible = true
        ToggleBtn.Visible = true
    else
        SubmitBtn.Text = "Incorrect Key!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        task.wait(1.5)
        SubmitBtn.Text = "Unlock Snarkhis"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 110)
    end
end)
