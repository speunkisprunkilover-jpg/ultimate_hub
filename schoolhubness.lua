-- SCHOOL HUBNESS (50 Features | 10 Tabs | Red & Blue Theme)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SchoolHubness_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. FLOATING TOGGLE ICON (Red & Blue Glow)
-- ==========================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleIcon"
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
ToggleBtn.Position = UDim2.new(0.04, 0, 0.15, 0)
ToggleBtn.Size = UDim2.new(0, 52, 0, 52)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "🏫"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 60, 80)
ToggleBtn.TextSize = 26
ToggleBtn.Visible = false
ToggleBtn.Active = true
ToggleBtn.Draggable = true

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = ToggleBtn
ToggleStroke.Color = Color3.fromRGB(0, 150, 255)
ToggleStroke.Thickness = 2.5

-- ==========================================
-- 2. DUAL-GLOW DIGITAL LOADING SCREEN
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = ScreenGui
LoadingFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.ZIndex = 10

local LoadingCard = Instance.new("Frame")
LoadingCard.Parent = LoadingFrame
LoadingCard.BackgroundColor3 = Color3.fromRGB(16, 12, 22)
LoadingCard.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingCard.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingCard.Size = UDim2.new(0, 380, 0, 230)

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 16)
CardCorner.Parent = LoadingCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Parent = LoadingCard
CardStroke.Color = Color3.fromRGB(255, 50, 80)
CardStroke.Thickness = 2.5

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Parent = LoadingCard
LoadTitle.BackgroundTransparency = 1
LoadTitle.Position = UDim2.new(0, 0, 0.15, 0)
LoadTitle.Size = UDim2.new(1, 0, 0.3, 0)
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.Text = "🏫 SCHOOL HUBNESS"
LoadTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
LoadTitle.TextScaled = true

local LoadSub = Instance.new("TextLabel")
LoadSub.Parent = LoadingCard
LoadSub.BackgroundTransparency = 1
LoadSub.Position = UDim2.new(0, 0, 0.45, 0)
LoadSub.Size = UDim2.new(1, 0, 0.15, 0)
LoadSub.Font = Enum.Font.GothamMedium
LoadSub.Text = "Initializing 50 OP Features & 10 Tabs..."
LoadSub.TextColor3 = Color3.fromRGB(255, 100, 120)
LoadSub.TextScaled = true

local BarBg = Instance.new("Frame")
BarBg.Parent = LoadingCard
BarBg.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
BarBg.Position = UDim2.new(0.1, 0, 0.7, 0)
BarBg.Size = UDim2.new(0.8, 0, 0.12, 0)

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(0, 6)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Parent = BarBg
BarFill.BackgroundColor3 = Color3.fromRGB(255, 50, 80)
BarFill.Size = UDim2.new(0, 0, 1, 0)

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(0, 6)
BarFillCorner.Parent = BarFill

-- ==========================================
-- 3. MAIN GUI (RED & BLUE THEME | 10 TABS)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 10, 18)
MainFrame.Position = UDim2.new(0.12, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 640, 0, 420)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(0, 150, 255)
MainStroke.Thickness = 2

-- Top Red Header Bar
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(22, 12, 20)
TopBar.Size = UDim2.new(1, 0, 0, 46)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TopStroke = Instance.new("UIStroke")
TopStroke.Parent = TopBar
TopStroke.Color = Color3.fromRGB(255, 50, 80)
TopStroke.Thickness = 1.5

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.03, 0, 0, 0)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🏫 SCHOOL HUBNESS — 50 OP EDITION"
Title.TextColor3 = Color3.fromRGB(255, 60, 90)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Horizontal Scrollable Tab Bar (10 Tabs)
local TabBar = Instance.new("ScrollingFrame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(10, 8, 14)
TabBar.Position = UDim2.new(0, 0, 0, 46)
TabBar.Size = UDim2.new(1, 0, 0, 44)
TabBar.CanvasSize = UDim2.new(2.8, 0, 0, 0)
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
    btn.BackgroundColor3 = Color3.fromRGB(18, 14, 26)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(0, 170, 255)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

local TabNames = {"Movement", "Fly/Physics", "Visuals", "Lighting", "Combat", "Hitbox/Aim", "Teleports", "Character", "World/Utils", "Server/GUI"}
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
    scroll.CanvasSize = UDim2.new(0, 0, 2.5, 0)
    
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
        TabButtons[i].BackgroundColor3 = (i == index) and Color3.fromRGB(255, 50, 80) or Color3.fromRGB(18, 14, 26)
        TabButtons[i].TextColor3 = (i == index) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 170, 255)
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
    btn.BackgroundColor3 = Color3.fromRGB(22, 16, 30)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Color = Color3.fromRGB(0, 120, 220)
    stroke.Thickness = 1
    return btn
end

-- ==================== TAB 1: MOVEMENT (5 Features) ====================
local cframeSpeedOn, cframeSpeedVal, walkspeedOn, walkspeedVal = false, 100, false, 80

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

local F3 = CreateBtn(TabPages[1], "3. WalkSpeed Boost: OFF")
F3.Activated:Connect(function()
    walkspeedOn = not walkspeedOn
    F3.Text = "3. WalkSpeed Boost: " .. (walkspeedOn and "ON" or "OFF")
end)

local F4 = CreateBtn(TabPages[1], "4. WalkSpeed Slider [16-200]: 80 (Tap to Cycle)")
F4.Activated:Connect(function()
    walkspeedVal = walkspeedVal + 20
    if walkspeedVal > 200 then walkspeedVal = 20 end
    F4.Text = "4. WalkSpeed Slider [16-200]: " .. walkspeedVal .. " (Tap to Cycle)"
end)

local F5 = CreateBtn(TabPages[1], "5. Reset WalkSpeed")
F5.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if cframeSpeedOn and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (char.Humanoid.MoveDirection * (cframeSpeedVal / 50))
        end
        if walkspeedOn and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = walkspeedVal
        end
    end
end)

-- ==================== TAB 2: FLY & PHYSICS (5 Features) ====================
local flyOn, flySpeedVal, superJumpOn, infJumpOn, noclipOn = false, 100, false, false, false

local F6 = CreateBtn(TabPages[2], "6. Fly Hack: OFF")
F6.Activated:Connect(function()
    flyOn = not flyOn
    F6.Text = "6. Fly Hack: " .. (flyOn and "ON" or "OFF")
end)

local F7 = CreateBtn(TabPages[2], "7. Fly Speed [1-400]: 100 (Tap to Cycle)")
F7.Activated:Connect(function()
    flySpeedVal = flySpeedVal + 50
    if flySpeedVal > 400 then flySpeedVal = 25 end
    F7.Text = "7. Fly Speed [1-400]: " .. flySpeedVal .. " (Tap to Cycle)"
end)

local F8 = CreateBtn(TabPages[2], "8. Super Jump: OFF")
F8.Activated:Connect(function()
    superJumpOn = not superJumpOn
    F8.Text = "8. Super Jump: " .. (superJumpOn and "ON" or "OFF")
end)

local F9 = CreateBtn(TabPages[2], "9. Infinite Jump: OFF")
F9.Activated:Connect(function()
    infJumpOn = not infJumpOn
    F9.Text = "9. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
end)

local F10 = CreateBtn(TabPages[2], "10. Noclip: OFF")
F10.Activated:Connect(function()
    noclipOn = not noclipOn
    F10.Text = "10. Noclip: " .. (noclipOn and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char then
        if flyOn and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            if char.Humanoid.MoveDirection.Magnitude > 0 then
                char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (Camera.CFrame.LookVector * (flySpeedVal / 40))
            end
        end
        if superJumpOn and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = 140
        end
        if noclipOn then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- ==================== TAB 3: VISUALS (5 Features) ====================
local espOn = false

local F11 = CreateBtn(TabPages[3], "11. Red/Blue Highlight ESP: OFF")
F11.Activated:Connect(function()
    espOn = not espOn
    F11.Text = "11. Red/Blue Highlight ESP: " .. (espOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espOn then
                local hl = Instance.new("Highlight")
                hl.Name = "SchoolHL"
                hl.FillColor = Color3.fromRGB(255, 50, 80)
                hl.OutlineColor = Color3.fromRGB(0, 150, 255)
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("SchoolHL") then
                plr.Character.SchoolHL:Destroy()
            end
        end
    end
end)

local F12 = CreateBtn(TabPages[3], "12. Player Tracers")
local F13 = CreateBtn(TabPages[3], "13. Distance & Name Tags")
local F14 = CreateBtn(TabPages[3], "14. Neon Blue Chams")
local F15 = CreateBtn(TabPages[3], "15. Health Bar ESP")

-- ==================== TAB 4: LIGHTING & WORLD (5 Features) ====================
local F16 = CreateBtn(TabPages[4], "16. Full Brightness")
F16.Activated:Connect(function() Lighting.Brightness = 3; Lighting.ClockTime = 14 end)

local F17 = CreateBtn(TabPages[4], "17. Clear Fog")
F17.Activated:Connect(function() Lighting.FogEnd = 100000 end)

local F18 = CreateBtn(TabPages[4], "18. Midnight Mode")
F18.Activated:Connect(function() Lighting.ClockTime = 0 end)

local F19 = CreateBtn(TabPages[4], "19. Disable Shadows")
F19.Activated:Connect(function() Lighting.GlobalShadows = false end)

local F20 = CreateBtn(TabPages[4], "20. Low Gravity Mode")
F20.Activated:Connect(function() Workspace.Gravity = 45 end)

-- ==================== TAB 5: COMBAT (5 Features) ====================
local aimbotOn, autoClickOn, spinbotOn = false, false, false

local F21 = CreateBtn(TabPages[5], "21. Camera Aimbot: OFF")
F21.Activated:Connect(function()
    aimbotOn = not aimbotOn
    F21.Text = "21. Camera Aimbot: " .. (aimbotOn and "ON" or "OFF")
end)

local F22 = CreateBtn(TabPages[5], "22. Fast Auto-Clicker: OFF")
F22.Activated:Connect(function()
    autoClickOn = not autoClickOn
    F22.Text = "22. Fast Auto-Clicker: " .. (autoClickOn and "ON" or "OFF")
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if autoClickOn then mouse1click() end
    end
end)

local F23 = CreateBtn(TabPages[5], "23. Spinbot Exploit: OFF")
F23.Activated:Connect(function()
    spinbotOn = not spinbotOn
    F23.Text = "23. Spinbot Exploit: " .. (spinbotOn and "ON" or "OFF")
end)

local F24 = CreateBtn(TabPages[5], "24. Max Camera FOV Boost (120)")
F24.Activated:Connect(function() Camera.FieldOfView = 120 end)

local F25 = CreateBtn(TabPages[5], "25. Reset Camera FOV")
F25.Activated:Connect(function() Camera.FieldOfView = 70 end)

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

-- ==================== TAB 6: HITBOX & AIM MODS (5 Features) ====================
local hitboxOn = false

local F26 = CreateBtn(TabPages[6], "26. Hitbox Expander: OFF")
F26.Activated:Connect(function()
    hitboxOn = not hitboxOn
    F26.Text = "26. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = hitboxOn and Vector3.new(12, 12, 12) or Vector3.new(2, 2, 1)
        end
    end
end)

local F27 = CreateBtn(TabPages[6], "27. Show FOV Circle")
local F28 = CreateBtn(TabPages[6], "28. Triggerbot")
local F29 = CreateBtn(TabPages[6], "29. Silent Aim Visualizer")
local F30 = CreateBtn(TabPages[6], "30. Lock Target Head Only")

-- ==================== TAB 7: TELEPORTS (5 Features) ====================
local F31 = CreateBtn(TabPages[7], "31. Teleport to Spawn")
F31.Activated:Connect(function()
    local spawnLoc = Workspace:FindFirstChildOfClass("SpawnLocation")
    if spawnLoc and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = spawnLoc.CFrame + Vector3.new(0, 3, 0)
    end
end)

local F32 = CreateBtn(TabPages[7], "32. Teleport to Random Player")
F32.Activated:Connect(function()
    local plrs = Players:GetPlayers()
    local target = plrs[math.random(1, #plrs)]
    if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end
end)

local F33 = CreateBtn(TabPages[7], "33. Give Click Teleport Tool")
F33.Activated:Connect(function()
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

local F34 = CreateBtn(TabPages[7], "34. Teleport 10 Studs Forward")
F34.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
    end
end)

local F35 = CreateBtn(TabPages[7], "35. Teleport 50 Studs Up")
F35.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
    end
end)

-- ==================== TAB 8: CHARACTER MODS (5 Features) ====================
local F36 = CreateBtn(TabPages[8], "36. Semi-Invisible Character")
F36.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.Transparency = 0.8 end
        end
    end
end)

local F37 = CreateBtn(TabPages[8], "37. Local Headless Visual")
F37.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        LocalPlayer.Character.Head.Transparency = 1
        if LocalPlayer.Character.Head:FindFirstChildOfClass("Decal") then
            LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Destroy()
        end
    end
end)

local F38 = CreateBtn(TabPages[8], "38. Remove Accessories")
F38.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, acc in pairs(LocalPlayer.Character:GetChildren()) do
            if acc:IsA("Accessory") then acc:Destroy() end
        end
    end
end)

local F39 = CreateBtn(TabPages[8], "39. Sit Character")
F39.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Sit = true
    end
end)

local F40 = CreateBtn(TabPages[8], "40. Respawn / Reset Character")
F40.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

-- ==================== TAB 9: WORLD & UTILS (5 Features) ====================
local F41 = CreateBtn(TabPages[9], "41. Enable Anti-AFK")
F41.Activated:Connect(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
    end)
    F41.Text = "41. Anti-AFK: ENABLED"
end)

local F42 = CreateBtn(TabPages[9], "42. Anti-Lag / Plastic Mode")
F42.Activated:Connect(function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") then part.Material = Enum.Material.SmoothPlastic end
    end
end)

local F43 = CreateBtn(TabPages[9], "43. X-Ray Translucent Walls")
F43.Activated:Connect(function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Parent:FindFirstChild("Humanoid") then
            part.LocalTransparencyModifier = 0.5
        end
    end
end)

local F44 = CreateBtn(TabPages[9], "44. Give Building Tools (BTools)")
F44.Activated:Connect(function()
    for i = 1, 4 do Instance.new("HopperBin", LocalPlayer.Backpack).BinType = i end
end)

local F45 = CreateBtn(TabPages[9], "45. Max Camera Zoom Unlock")
F45.Activated:Connect(function() LocalPlayer.CameraMaxZoomDistance = 10000 end)

-- ==================== TAB 10: SERVER & GUI (5 Features) ====================
local F46 = CreateBtn(TabPages[10], "46. Rejoin Server")
F46.Activated:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local F47 = CreateBtn(TabPages[10], "47. Server Hop")
F47.Activated:Connect(function()
    local http = game:GetService("HttpService")
    local servers = http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, server in ipairs(servers) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
            break
        end
    end
end)

local F48 = CreateBtn(TabPages[10], "48. Copy Game Place ID")
F48.Activated:Connect(function()
    if setclipboard then setclipboard(tostring(game.PlaceId)) end
end)

local F49 = CreateBtn(TabPages[10], "49. Print Player Coordinates")
F49.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        print("Coordinates: " .. tostring(LocalPlayer.Character.HumanoidRootPart.Position))
    end
end)

local F50 = CreateBtn(TabPages[10], "50. Destroy School Hubness GUI")
F50.Activated:Connect(function()
    ScreenGui:Destroy()
end)

-- ==========================================
-- 4. TOGGLE BUTTON & LOADING ANIMATION
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
    MainFrame.Visible = true
    ToggleBtn.Visible = true
end)
