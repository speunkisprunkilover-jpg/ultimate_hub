-- OP HUB (31 OP Features | 3 Tabs | CFrame Bypass & Mobile Fly)
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
ScreenGui.Name = "OPHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. FLOATING TOGGLE ICON
-- ==========================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleIcon"
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "👑"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.TextSize = 24
ToggleBtn.Active = true
ToggleBtn.Draggable = true

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = ToggleBtn
ToggleStroke.Color = Color3.fromRGB(255, 215, 0)
ToggleStroke.Thickness = 2

-- ==========================================
-- 2. MAIN FRAME & 3 TABS LAYOUT
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.Position = UDim2.new(0.12, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 580, 0, 380)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Thickness = 1.5

-- Top Bar Header
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.03, 0, 0, 0)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "👑 OP HUB — ULTIMATE EDITION"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Sidebar (3 Tabs)
local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.Size = UDim2.new(0, 150, 1, -45)

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 6)

local function CreateTabButton(name, order)
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.LayoutOrder = order
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.TextSize = 13
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

local Tab1Btn = CreateTabButton("1. Movement", 1)
local Tab2Btn = CreateTabButton("2. Visuals/World", 2)
local Tab3Btn = CreateTabButton("3. Combat/Utils", 3)

-- Content Pages Container
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
    scroll.CanvasSize = UDim2.new(0, 0, 2.8, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = scroll
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    return scroll
end

local TabPages = {CreatePage(), CreatePage(), CreatePage()}
TabPages[2].Visible = false
TabPages[3].Visible = false

local TabButtons = {Tab1Btn, Tab2Btn, Tab3Btn}

local function SwitchTab(idx)
    for i, page in ipairs(TabPages) do
        page.Visible = (i == idx)
        TabButtons[i].BackgroundColor3 = (i == idx) and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(20, 20, 28)
        TabButtons[i].TextColor3 = (i == idx) and Color3.fromRGB(12, 12, 16) or Color3.fromRGB(180, 180, 180)
    end
end

for i, btn in ipairs(TabButtons) do
    btn.Activated:Connect(function() SwitchTab(i) end)
end
SwitchTab(1)

local function CreateBtn(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, -10, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

-- ==========================================
-- TAB 1: MOVEMENT (7 OP Features)
-- ==========================================
local cframeSpeedOn = false
local cframeSpeedVal = 100 -- Slider 1-500
local speedBoostOn = false
local jumpBoostOn = false
local noclipOn = false
local flyOn = false
local flySpeedVal = 100   -- Slider 1-400

-- Feature 1: CFrame Speed Boost Toggle
local F1 = CreateBtn(TabPages[1], "1. CFrame Speed Boost: OFF")
F1.Activated:Connect(function()
    cframeSpeedOn = not cframeSpeedOn
    F1.Text = "1. CFrame Speed Boost: " .. (cframeSpeedOn and "ON" or "OFF")
    F1.BackgroundColor3 = cframeSpeedOn and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(22, 22, 30)
    F1.TextColor3 = cframeSpeedOn and Color3.fromRGB(12, 12, 16) or Color3.fromRGB(255, 255, 255)
end)

-- Feature 2: CFrame Speed Slider (1-500)
local F2 = CreateBtn(TabPages[1], "2. CFrame Speed [1-500]: 100 (Tap to Cycle)")
F2.Activated:Connect(function()
    cframeSpeedVal = cframeSpeedVal + 50
    if cframeSpeedVal > 500 then cframeSpeedVal = 25 end
    F2.Text = "2. CFrame Speed [1-500]: " .. cframeSpeedVal .. " (Tap to Cycle)"
end)

-- Feature 3: Standard Speed Boost
local F3 = CreateBtn(TabPages[1], "3. Standard WalkSpeed Boost: OFF")
F3.Activated:Connect(function()
    speedBoostOn = not speedBoostOn
    F3.Text = "3. Standard WalkSpeed Boost: " .. (speedBoostOn and "ON" or "OFF")
end)

-- Feature 4: Jump Boost
local F4 = CreateBtn(TabPages[1], "4. Jump Boost: OFF")
F4.Activated:Connect(function()
    jumpBoostOn = not jumpBoostOn
    F4.Text = "4. Jump Boost: " .. (jumpBoostOn and "ON" or "OFF")
end)

-- Feature 5: Noclip
local F5 = CreateBtn(TabPages[1], "5. Noclip: OFF")
F5.Activated:Connect(function()
    noclipOn = not noclipOn
    F5.Text = "5. Noclip: " .. (noclipOn and "ON" or "OFF")
end)

-- Feature 6: Fly Toggle
local F6 = CreateBtn(TabPages[1], "6. Fly Hack: OFF")
F6.Activated:Connect(function()
    flyOn = not flyOn
    F6.Text = "6. Fly Hack: " .. (flyOn and "ON" or "OFF")
    F6.BackgroundColor3 = flyOn and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(22, 22, 30)
    F6.TextColor3 = flyOn and Color3.fromRGB(12, 12, 16) or Color3.fromRGB(255, 255, 255)
end)

-- Feature 7: Fly Speed Slider (1-400)
local F7 = CreateBtn(TabPages[1], "7. Fly Speed [1-400]: 100 (Tap to Cycle)")
F7.Activated:Connect(function()
    flySpeedVal = flySpeedVal + 50
    if flySpeedVal > 400 then flySpeedVal = 25 end
    F7.Text = "7. Fly Speed [1-400]: " .. flySpeedVal .. " (Tap to Cycle)"
end)

-- Movement Loops
RunService.Stepped:Connect(function(delta)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    -- CFrame Speed Loop
    if cframeSpeedOn and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (char.Humanoid.MoveDirection * (cframeSpeedVal / 50))
    end

    -- WalkSpeed & Jump
    if speedBoostOn and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 100
    end
    if jumpBoostOn and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = 140
    end

    -- Noclip
    if noclipOn then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end

    -- Fly Mechanics
    if flyOn and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        local moveDir = char.Humanoid.MoveDirection
        if moveDir.Magnitude > 0 then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (Camera.CFrame.LookVector * (flySpeedVal / 40))
        end
    end
end)

-- ==========================================
-- TAB 2: VISUALS & WORLD (12 OP Features)
-- ==========================================
local F8 = CreateBtn(TabPages[2], "8. Player ESP Highlights: OFF")
F8.Activated:Connect(function()
    local active = F8.Text:find("OFF")
    F8.Text = "8. Player ESP Highlights: " .. (active and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if active then
                local hl = Instance.new("Highlight")
                hl.Name = "OPHighlight"
                hl.FillColor = Color3.fromRGB(255, 215, 0)
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("OPHighlight") then
                plr.Character.OPHighlight:Destroy()
            end
        end
    end
end)

local F9 = CreateBtn(TabPages[2], "9. Player Tracers: OFF")
local F10 = CreateBtn(TabPages[2], "10. Name & Distance Tags: OFF")
local F11 = CreateBtn(TabPages[2], "11. Full Brightness / Night Vision")
F11.Activated:Connect(function() Lighting.Brightness = 3; Lighting.ClockTime = 14 end)

local F12 = CreateBtn(TabPages[2], "12. Clear Fog & Shadows")
F12.Activated:Connect(function() Lighting.FogEnd = 100000; Lighting.GlobalShadows = false end)

local F13 = CreateBtn(TabPages[2], "13. Low Gravity Mode")
F13.Activated:Connect(function() Workspace.Gravity = 45 end)

local F14 = CreateBtn(TabPages[2], "14. Max FOV Boost (120)")
F14.Activated:Connect(function() Camera.FieldOfView = 120 end)

local F15 = CreateBtn(TabPages[2], "15. Anti-Lag / FPS Booster")
F15.Activated:Connect(function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") then part.Material = Enum.Material.SmoothPlastic end
    end
end)

local F16 = CreateBtn(TabPages[2], "16. X-Ray Vision (Translucent Walls)")
F16.Activated:Connect(function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Parent:FindFirstChild("Humanoid") then
            part.LocalTransparencyModifier = 0.5
        end
    end
end)

local F17 = CreateBtn(TabPages[2], "17. Midnight Mode")
F17.Activated:Connect(function() Lighting.ClockTime = 0 end)

local F18 = CreateBtn(TabPages[2], "18. Third Person Max Distance Unlock")
F18.Activated:Connect(function() LocalPlayer.CameraMaxZoomDistance = 10000 end)

local F19 = CreateBtn(TabPages[2], "19. Remove Atmospheric Blur/Bloom")
F19.Activated:Connect(function()
    for _, item in pairs(Lighting:GetChildren()) do
        if item:IsA("PostEffect") or item:IsA("Atmosphere") then item:Destroy() end
    end
end)

-- ==========================================
-- TAB 3: COMBAT & UTILS (12 OP Features)
-- ==========================================
local aimbotOn = false
local autoClickOn = false
local hitboxOn = false
local spinbotOn = false

local F20 = CreateBtn(TabPages[3], "20. Camera Lock Aimbot: OFF")
F20.Activated:Connect(function()
    aimbotOn = not aimbotOn
    F20.Text = "20. Camera Lock Aimbot: " .. (aimbotOn and "ON" or "OFF")
end)

local F21 = CreateBtn(TabPages[3], "21. Fast Auto-Clicker: OFF")
F21.Activated:Connect(function()
    autoClickOn = not autoClickOn
    F21.Text = "21. Fast Auto-Clicker: " .. (autoClickOn and "ON" or "OFF")
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if autoClickOn then mouse1click() end
    end
end)

local F22 = CreateBtn(TabPages[3], "22. Hitbox Expander: OFF")
F22.Activated:Connect(function()
    hitboxOn = not hitboxOn
    F22.Text = "22. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = hitboxOn and Vector3.new(12, 12, 12) or Vector3.new(2, 2, 1)
        end
    end
end)

local F23 = CreateBtn(TabPages[3], "23. Enable Infinite Jump")
local infJumpOn = false
F23.Activated:Connect(function()
    infJumpOn = not infJumpOn
    F23.Text = "23. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

local F24 = CreateBtn(TabPages[3], "24. Spinbot Exploit: OFF")
F24.Activated:Connect(function()
    spinbotOn = not spinbotOn
    F24.Text = "24. Spinbot Exploit: " .. (spinbotOn and "ON" or "OFF")
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

local F25 = CreateBtn(TabPages[3], "25. Semi-Invisible Glitch")
F25.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.Transparency = 0.8 end
        end
    end
end)

local F26 = CreateBtn(TabPages[3], "26. Give Click Teleport Tool")
F26.Activated:Connect(function()
    local mouse = LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "OP Teleport Tool"
    tool.Activated:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)
    tool.Parent = LocalPlayer.Backpack
end)

local F27 = CreateBtn(TabPages[3], "27. Give Building Tools (BTools)")
F27.Activated:Connect(function()
    for i = 1, 4 do Instance.new("HopperBin", LocalPlayer.Backpack).BinType = i end
end)

local F28 = CreateBtn(TabPages[3], "28. Enable Anti-AFK")
F28.Activated:Connect(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
    end)
    F28.Text = "28. Anti-AFK: ENABLED"
end)

local F29 = CreateBtn(TabPages[3], "29. Rejoin Server")
F29.Activated:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local F30 = CreateBtn(TabPages[3], "30. Server Hop")
F30.Activated:Connect(function()
    local http = game:GetService("HttpService")
    local servers = http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, server in ipairs(servers) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
            break
        end
    end
end)

local F31 = CreateBtn(TabPages[3], "31. Destroy OP Hub GUI")
F31.Activated:Connect(function()
    ScreenGui:Destroy()
end)

-- ==========================================
-- 3. RELIABLE TOGGLE BUTTON EVENT
-- ==========================================
local function ToggleUI()
    MainFrame.Visible = not MainFrame.Visible
end

ToggleBtn.MouseButton1Click:Connect(ToggleUI)
ToggleBtn.TouchTap:Connect(ToggleUI)
