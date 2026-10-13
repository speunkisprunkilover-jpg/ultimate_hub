-- SLEEP HUB (31 Features | 10 Tabs | Midnight Theme)
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local CORRECT_KEY = "Idk"

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SleepHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. MIDNIGHT LOADING SCREEN
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = ScreenGui
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 28)
LoadingFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
LoadingFrame.Size = UDim2.new(0.8, 0, 0.4, 0)
LoadingFrame.Active = true

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 14)
LoadingCorner.Parent = LoadingFrame

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Parent = LoadingFrame
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Position = UDim2.new(0.05, 0, 0.15, 0)
LoadingTitle.Size = UDim2.new(0.9, 0, 0.25, 0)
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.Text = "🌙 SLEEP HUB"
LoadingTitle.TextColor3 = Color3.fromRGB(160, 120, 255)
LoadingTitle.TextScaled = true

local LoadingSubtitle = Instance.new("TextLabel")
LoadingSubtitle.Parent = LoadingFrame
LoadingSubtitle.BackgroundTransparency = 1
LoadingSubtitle.Position = UDim2.new(0.05, 0, 0.4, 0)
LoadingSubtitle.Size = UDim2.new(0.9, 0, 0.15, 0)
LoadingSubtitle.Font = Enum.Font.Gotham
LoadingSubtitle.Text = "Loading 31 Features & 10 Tabs..."
LoadingSubtitle.TextColor3 = Color3.fromRGB(180, 170, 220)
LoadingSubtitle.TextScaled = true

local ProgressBarBackground = Instance.new("Frame")
ProgressBarBackground.Parent = LoadingFrame
ProgressBarBackground.BackgroundColor3 = Color3.fromRGB(28, 22, 50)
ProgressBarBackground.Position = UDim2.new(0.1, 0, 0.65, 0)
ProgressBarBackground.Size = UDim2.new(0.8, 0, 0.12, 0)

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 8)
ProgressCorner.Parent = ProgressBarBackground

local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = ProgressBarBackground
ProgressBar.BackgroundColor3 = Color3.fromRGB(160, 120, 255)
ProgressBar.Size = UDim2.new(0, 0, 1, 0)

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 8)
BarCorner.Parent = ProgressBar

-- ==========================================
-- 2. KEY SYSTEM UI
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 32)
KeyFrame.Position = UDim2.new(0.15, 0, 0.3, 0)
KeyFrame.Size = UDim2.new(0.7, 0, 0.4, 0)
KeyFrame.Visible = false
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0.05, 0, 0.1, 0)
KeyTitle.Size = UDim2.new(0.9, 0, 0.25, 0)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "🔑 Enter Key for Sleep Hub"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextScaled = true

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 24, 54)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter key (Idk)..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextScaled = true

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = KeyInput

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.BackgroundColor3 = Color3.fromRGB(140, 90, 240)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.7, 0)
SubmitBtn.Size = UDim2.new(0.6, 0, 0.2, 0)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "Unlock Sleep Hub"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextScaled = true

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitBtn

-- ==========================================
-- 3. MAIN HUB UI (10 TABS)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 32)
MainFrame.Position = UDim2.new(0.08, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0.84, 0, 0.7, 0)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.BackgroundColor3 = Color3.fromRGB(28, 22, 48)
Header.Size = UDim2.new(1, 0, 0.12, 0)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.03, 0, 0, 0)
Title.Size = UDim2.new(0.94, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌙 SLEEP HUB | UNIVERSAL V3"
Title.TextColor3 = Color3.fromRGB(160, 120, 255)
Title.TextScaled = true

-- Scrollable Tab Bar (10 Tabs)
local TabBar = Instance.new("ScrollingFrame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(12, 10, 22)
TabBar.Position = UDim2.new(0, 0, 0.12, 0)
TabBar.Size = UDim2.new(1, 0, 0.11, 0)
TabBar.CanvasSize = UDim2.new(2.4, 0, 0, 0)
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
    btn.BackgroundColor3 = Color3.fromRGB(28, 22, 48)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(170, 160, 200)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

local TabNames = {"Move", "Visuals", "Combat", "Player", "World", "Misc", "Server", "Teleports", "Fun", "Settings"}
local TabButtons = {}

for _, name in ipairs(TabNames) do
    table.insert(TabButtons, CreateTabBtn(name))
end

-- Pages Container
local function CreatePage()
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = MainFrame
    scroll.Position = UDim2.new(0.03, 0, 0.25, 0)
    scroll.Size = UDim2.new(0.94, 0, 0.72, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.CanvasSize = UDim2.new(0, 0, 1.5, 0)
    
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
        TabButtons[i].BackgroundColor3 = (i == index) and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(28, 22, 48)
        TabButtons[i].TextColor3 = (i == index) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(170, 160, 200)
    end
end

for i, btn in ipairs(TabButtons) do
    btn.Activated:Connect(function() SwitchTab(i) end)
end
SwitchTab(1)

-- Helper Button
local function CreateButton(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(30, 24, 54)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

-- ==================== TAB 1: MOVEMENT ====================
local speedOn, jumpOn, infJumpOn, noclipOn = false, false, false, false

local SpeedBtn = CreateButton(TabPages[1], "1. Speed Boost: OFF")
SpeedBtn.Activated:Connect(function()
    speedOn = not speedOn
    SpeedBtn.Text = "1. Speed Boost: " .. (speedOn and "ON" or "OFF")
    SpeedBtn.BackgroundColor3 = speedOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

local JumpBtn = CreateButton(TabPages[1], "2. Super Jump: OFF")
JumpBtn.Activated:Connect(function()
    jumpOn = not jumpOn
    JumpBtn.Text = "2. Super Jump: " .. (jumpOn and "ON" or "OFF")
    JumpBtn.BackgroundColor3 = jumpOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

local InfJumpBtn = CreateButton(TabPages[1], "3. Infinite Jump: OFF")
InfJumpBtn.Activated:Connect(function()
    infJumpOn = not infJumpOn
    InfJumpBtn.Text = "3. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
    InfJumpBtn.BackgroundColor3 = infJumpOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

local NoclipBtn = CreateButton(TabPages[1], "4. Noclip: OFF")
NoclipBtn.Activated:Connect(function()
    noclipOn = not noclipOn
    NoclipBtn.Text = "4. Noclip: " .. (noclipOn and "ON" or "OFF")
    NoclipBtn.BackgroundColor3 = noclipOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

RunService.Stepped:Connect(function()
    if speedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 90
    end
    if jumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 130
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

-- ==================== TAB 2: VISUALS ====================
local espOn, tagsOn, chamsOn, tracersOn = false, false, false, false

local EspBtn = CreateButton(TabPages[2], "5. Player ESP: OFF")
EspBtn.Activated:Connect(function()
    espOn = not espOn
    EspBtn.Text = "5. Player ESP: " .. (espOn and "ON" or "OFF")
    EspBtn.BackgroundColor3 = espOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espOn then
                local hl = Instance.new("Highlight")
                hl.Name = "SleepHighlight"
                hl.OutlineColor = Color3.fromRGB(160, 120, 255)
                hl.Parent = plr.Character
            elseif plr.Character:FindFirstChild("SleepHighlight") then
                plr.Character.SleepHighlight:Destroy()
            end
        end
    end
end)

local TagsBtn = CreateButton(TabPages[2], "6. Name & Health Tags: OFF")
TagsBtn.Activated:Connect(function()
    tagsOn = not tagsOn
    TagsBtn.Text = "6. Name & Health Tags: " .. (tagsOn and "ON" or "OFF")
    TagsBtn.BackgroundColor3 = tagsOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

local ChamsBtn = CreateButton(TabPages[2], "7. Neon Chams: OFF")
ChamsBtn.Activated:Connect(function()
    chamsOn = not chamsOn
    ChamsBtn.Text = "7. Neon Chams: " .. (chamsOn and "ON" or "OFF")
    ChamsBtn.BackgroundColor3 = chamsOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

local TracersBtn = CreateButton(TabPages[2], "8. Player Tracers: OFF")
TracersBtn.Activated:Connect(function()
    tracersOn = not tracersOn
    TracersBtn.Text = "8. Player Tracers: " .. (tracersOn and "ON" or "OFF")
    TracersBtn.BackgroundColor3 = tracersOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

-- ==================== TAB 3: COMBAT ====================
local autoClickOn, hitboxOn, targetLockOn = false, false, false

local ClickBtn = CreateButton(TabPages[3], "9. Auto Clicker: OFF")
ClickBtn.Activated:Connect(function()
    autoClickOn = not autoClickOn
    ClickBtn.Text = "9. Auto Clicker: " .. (autoClickOn and "ON" or "OFF")
    ClickBtn.BackgroundColor3 = autoClickOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if autoClickOn then mouse1click() end
    end
end)

local HitboxBtn = CreateButton(TabPages[3], "10. Hitbox Expander: OFF")
HitboxBtn.Activated:Connect(function()
    hitboxOn = not hitboxOn
    HitboxBtn.Text = "10. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    HitboxBtn.BackgroundColor3 = hitboxOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = hitboxOn and Vector3.new(12, 12, 12) or Vector3.new(2, 2, 1)
        end
    end
end)

local TargetBtn = CreateButton(TabPages[3], "11. Camera Lock Target: OFF")
TargetBtn.Activated:Connect(function()
    targetLockOn = not targetLockOn
    TargetBtn.Text = "11. Camera Lock Target: " .. (targetLockOn and "ON" or "OFF")
    TargetBtn.BackgroundColor3 = targetLockOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

-- ==================== TAB 4: PLAYER MODS ====================
local spinOn = false

local SpinBtn = CreateButton(TabPages[4], "12. Spinbot: OFF")
SpinBtn.Activated:Connect(function()
    spinOn = not spinOn
    SpinBtn.Text = "12. Spinbot: " .. (spinOn and "ON" or "OFF")
    SpinBtn.BackgroundColor3 = spinOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
end)

RunService.RenderStepped:Connect(function()
    if spinOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(30), 0)
    end
end)

local TeleportBtn = CreateButton(TabPages[4], "13. Click Teleport Tool")
TeleportBtn.Activated:Connect(function()
    local mouse = LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Teleport Tool"
    tool.Activated:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)
    tool.Parent = LocalPlayer.Backpack
end)

local InvisibleBtn = CreateButton(TabPages[4], "14. Semi-Invisible Character")
InvisibleBtn.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.Transparency = 0.8 end
        end
    end
end)

local ResetBtn = CreateButton(TabPages[4], "15. Reset Character")
ResetBtn.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

-- ==================== TAB 5: WORLD ====================
local brightOn = false

local BrightBtn = CreateButton(TabPages[5], "16. Full Brightness: OFF")
BrightBtn.Activated:Connect(function()
    brightOn = not brightOn
    BrightBtn.Text = "16. Full Brightness: " .. (brightOn and "ON" or "OFF")
    BrightBtn.BackgroundColor3 = brightOn and Color3.fromRGB(140, 90, 240) or Color3.fromRGB(30, 24, 54)
    Lighting.Brightness = brightOn and 3 or 1
    Lighting.ClockTime = brightOn and 14 or 12
end)

local GravBtn = CreateButton(TabPages[5], "17. Low Gravity")
GravBtn.Activated:Connect(function()
    Workspace.Gravity = 50
end)

local FogBtn = CreateButton(TabPages[5], "18. Clear Fog")
FogBtn.Activated:Connect(function()
    Lighting.FogEnd = 100000
end)

local NightBtn = CreateButton(TabPages[5], "19. Night Mode")
NightBtn.Activated:Connect(function()
    Lighting.ClockTime = 0
end)

-- ==================== TAB 6: MISC ====================
local BtoolsBtn = CreateButton(TabPages[6], "20. Give Building Tools (BTools)")
BtoolsBtn.Activated:Connect(function()
    for i = 1, 4 do Instance.new("HopperBin", LocalPlayer.Backpack).BinType = i end
end)

local AntiAfkBtn = CreateButton(TabPages[6], "21. Enable Anti-AFK")
AntiAfkBtn.Activated:Connect(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    end)
    AntiAfkBtn.Text = "21. Anti-AFK: ENABLED"
    AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(140, 90, 240)
end)

local LowGfxBtn = CreateButton(TabPages[6], "22. Anti-Lag / Low Graphics Mode")
LowGfxBtn.Activated:Connect(function()
    for _, item in pairs(Workspace:GetDescendants()) do
        if item:IsA("BasePart") then item.Material = Enum.Material.SmoothPlastic end
    end
end)

-- ==================== TAB 7: SERVER ====================
local RejoinBtn = CreateButton(TabPages[7], "23. Rejoin Server")
RejoinBtn.Activated:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local HopBtn = CreateButton(TabPages[7], "24. Server Hop")
HopBtn.Activated:Connect(function()
    HopBtn.Text = "Searching Server..."
    local http = game:GetService("HttpService")
    local servers = http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for _, server in ipairs(servers) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
            break
        end
    end
end)

-- ==================== TAB 8: TELEPORTS ====================
local SpawnTpBtn = CreateButton(TabPages[8], "25. Teleport to Spawn")
SpawnTpBtn.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local spawnLoc = Workspace:FindFirstChildOfClass("SpawnLocation")
        if spawnLoc then
            LocalPlayer.Character.HumanoidRootPart.CFrame = spawnLoc.CFrame + Vector3.new(0, 3, 0)
        end
    end
end)

local RandomPlayerTpBtn = CreateButton(TabPages[8], "26. Teleport to Random Player")
RandomPlayerTpBtn.Activated:Connect(function()
    local plrs = Players:GetPlayers()
    local target = plrs[math.random(1, #plrs)]
    if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end
end)

-- ==================== TAB 9: FUN ACTIONS ====================
local SitBtn = CreateButton(TabPages[9], "27. Sit Character")
SitBtn.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Sit = true
    end
end)

local HeadlessBtn = CreateButton(TabPages[9], "28. Local Headless Visual")
HeadlessBtn.Activated:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        LocalPlayer.Character.Head.Transparency = 1
        if LocalPlayer.Character.Head:FindFirstChildOfClass("Decal") then
            LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Destroy()
        end
    end
end)

local ClearAccBtn = CreateButton(TabPages[9], "29. Remove Accessories")
ClearAccBtn.Activated:Connect(function()
    if LocalPlayer.Character then
        for _, acc in pairs(LocalPlayer.Character:GetChildren()) do
            if acc:IsA("Accessory") then acc:Destroy() end
        end
    end
end)

-- ==================== TAB 10: SETTINGS ====================
local DestroyGuiBtn = CreateButton(TabPages[10], "30. Destroy Hub GUI")
DestroyGuiBtn.Activated:Connect(function()
    ScreenGui:Destroy()
end)

local CopyKeyBtn = CreateButton(TabPages[10], "31. Print Key Info")
CopyKeyBtn.Activated:Connect(function()
    print("Sleep Hub Key is: " .. CORRECT_KEY)
    CopyKeyBtn.Text = "31. Key: " .. CORRECT_KEY
end)

-- ==========================================
-- 4. ANIMATIONS & LOGIC
-- ==========================================
local tween = TweenService:Create(ProgressBar, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()
tween.Completed:Connect(function()
    LoadingFrame.Visible = false
    KeyFrame.Visible = true
end)

SubmitBtn.Activated:Connect(function()
    if KeyInput.Text == CORRECT_KEY then
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        SubmitBtn.Text = "Incorrect Key!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 80)
        task.wait(1.5)
        SubmitBtn.Text = "Unlock Sleep Hub"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(140, 90, 240)
    end
end)
