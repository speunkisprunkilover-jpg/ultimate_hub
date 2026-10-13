-- THE ULTIMATE HUB (Universal Mobile-Supported UI)
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local CORRECT_KEY = "Ultimate2026"

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltimateHub_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. LOADING SCREEN
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = ScreenGui
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
LoadingFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
LoadingFrame.Size = UDim2.new(0.8, 0, 0.4, 0)
LoadingFrame.Active = true

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 12)
LoadingCorner.Parent = LoadingFrame

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Parent = LoadingFrame
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Position = UDim2.new(0.05, 0, 0.15, 0)
LoadingTitle.Size = UDim2.new(0.9, 0, 0.3, 0)
LoadingTitle.Font = Enum.Font.SourceSansBold
LoadingTitle.Text = "Welcome to The Ultimate Hub!"
LoadingTitle.TextColor3 = Color3.fromRGB(170, 0, 255)
LoadingTitle.TextScaled = true

local ProgressBarBackground = Instance.new("Frame")
ProgressBarBackground.Parent = LoadingFrame
ProgressBarBackground.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
ProgressBarBackground.Position = UDim2.new(0.1, 0, 0.6, 0)
ProgressBarBackground.Size = UDim2.new(0.8, 0, 0.15, 0)

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 6)
ProgressCorner.Parent = ProgressBarBackground

local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = ProgressBarBackground
ProgressBar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
ProgressBar.Size = UDim2.new(0, 0, 1, 0)

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 6)
BarCorner.Parent = ProgressBar

-- ==========================================
-- 2. KEY SYSTEM UI
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
KeyFrame.Position = UDim2.new(0.15, 0, 0.3, 0)
KeyFrame.Size = UDim2.new(0.7, 0, 0.4, 0)
KeyFrame.Visible = false
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0.05, 0, 0.1, 0)
KeyTitle.Size = UDim2.new(0.9, 0, 0.25, 0)
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Text = "🔑 Enter Key for Ultimate Hub"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextScaled = true

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(35, 25, 50)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.PlaceholderText = "Type key here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextScaled = true

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = KeyInput

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.7, 0)
SubmitBtn.Size = UDim2.new(0.6, 0, 0.2, 0)
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Text = "Submit Key"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextScaled = true

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitBtn

-- ==========================================
-- 3. MAIN HUB UI
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0.8, 0, 0.7, 0)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Title.Size = UDim2.new(1, 0, 0.12, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "👑 THE ULTIMATE HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Title

-- Tab Navigation Header (5 Tabs)
local TabHolder = Instance.new("Frame")
TabHolder.Parent = MainFrame
TabHolder.BackgroundColor3 = Color3.fromRGB(12, 8, 18)
TabHolder.Position = UDim2.new(0, 0, 0.12, 0)
TabHolder.Size = UDim2.new(1, 0, 0.1, 0)

local function CreateTabBtn(text, posScale)
    local btn = Instance.new("TextButton")
    btn.Parent = TabHolder
    btn.Position = UDim2.new(posScale, 0, 0, 0)
    btn.Size = UDim2.new(0.2, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.TextScaled = true
    return btn
end

local Tab1Btn = CreateTabBtn("Move", 0)
local Tab2Btn = CreateTabBtn("Visual", 0.2)
local Tab3Btn = CreateTabBtn("Combat", 0.4)
local Tab4Btn = CreateTabBtn("World", 0.6)
local Tab5Btn = CreateTabBtn("Server", 0.8)

Tab1Btn.BackgroundColor3 = Color3.fromRGB(140, 0, 230)
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Pages (Scrollable for mobile screens)
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

local Tab1Page = CreatePage()
local Tab2Page = CreatePage()
local Tab3Page = CreatePage()
local Tab4Page = CreatePage()
local Tab5Page = CreatePage()

Tab2Page.Visible = false
Tab3Page.Visible = false
Tab4Page.Visible = false
Tab5Page.Visible = false

-- Tab Switching Logic
local allTabs = {
    {btn = Tab1Btn, page = Tab1Page},
    {btn = Tab2Btn, page = Tab2Page},
    {btn = Tab3Btn, page = Tab3Page},
    {btn = Tab4Btn, page = Tab4Page},
    {btn = Tab5Btn, page = Tab5Page}
}

for _, t in ipairs(allTabs) do
    t.btn.Activated:Connect(function()
        for _, other in ipairs(allTabs) do
            other.page.Visible = false
            other.btn.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
            other.btn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        t.page.Visible = true
        t.btn.BackgroundColor3 = Color3.fromRGB(140, 0, 230)
        t.btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

-- Helper Button Generator
local function CreateButton(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(35, 25, 50)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

-- ==================== TAB 1: MOVEMENT ====================
-- Feature 1: Speed Boost
local speedOn = false
local SpeedBtn = CreateButton(Tab1Page, "1. Speed Boost: OFF")
SpeedBtn.Activated:Connect(function()
    speedOn = not speedOn
    SpeedBtn.Text = "1. Speed Boost: " .. (speedOn and "ON" or "OFF")
    SpeedBtn.BackgroundColor3 = speedOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
end)

-- Feature 2: Super Jump
local jumpOn = false
local JumpBtn = CreateButton(Tab1Page, "2. Super Jump: OFF")
JumpBtn.Activated:Connect(function()
    jumpOn = not jumpOn
    JumpBtn.Text = "2. Super Jump: " .. (jumpOn and "ON" or "OFF")
    JumpBtn.BackgroundColor3 = jumpOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
end)

-- Feature 3: Infinite Jump
local infJumpOn = false
local InfJumpBtn = CreateButton(Tab1Page, "3. Infinite Jump: OFF")
InfJumpBtn.Activated:Connect(function()
    infJumpOn = not infJumpOn
    InfJumpBtn.Text = "3. Infinite Jump: " .. (infJumpOn and "ON" or "OFF")
    InfJumpBtn.BackgroundColor3 = infJumpOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
end)

-- Feature 4: Noclip
local noclipOn = false
local NoclipBtn = CreateButton(Tab1Page, "4. Noclip: OFF")
NoclipBtn.Activated:Connect(function()
    noclipOn = not noclipOn
    NoclipBtn.Text = "4. Noclip: " .. (noclipOn and "ON" or "OFF")
    NoclipBtn.BackgroundColor3 = noclipOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
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
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- ==================== TAB 2: VISUALS ====================
-- Feature 5: Player ESP
local espOn = false
local EspBtn = CreateButton(Tab2Page, "5. Player Highlights: OFF")
EspBtn.Activated:Connect(function()
    espOn = not espOn
    EspBtn.Text = "5. Player Highlights: " .. (espOn and "ON" or "OFF")
    EspBtn.BackgroundColor3 = espOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espOn then
                if not plr.Character:FindFirstChild("UltimateHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "UltimateHighlight"
                    hl.FillTransparency = 0.7
                    hl.OutlineColor = Color3.fromRGB(170, 0, 255)
                    hl.Parent = plr.Character
                end
            else
                if plr.Character:FindFirstChild("UltimateHighlight") then
                    plr.Character.UltimateHighlight:Destroy()
                end
            end
        end
    end
end)

-- Feature 6: Name & Health Tags
local nameTagsOn = false
local NameBtn = CreateButton(Tab2Page, "6. Name & Health Tags: OFF")
NameBtn.Activated:Connect(function()
    nameTagsOn = not nameTagsOn
    NameBtn.Text = "6. Name & Health Tags: " .. (nameTagsOn and "ON" or "OFF")
    NameBtn.BackgroundColor3 = nameTagsOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
            if nameTagsOn then
                if not plr.Character.Head:FindFirstChild("UltimateTag") then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "UltimateTag"
                    bb.Size = UDim2.new(0, 100, 0, 40)
                    bb.StudsOffset = Vector3.new(0, 2, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = plr.Character.Head

                    local txt = Instance.new("TextLabel")
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                    txt.TextScaled = true
                    txt.Font = Enum.Font.SourceSansBold
                    txt.Text = plr.Name .. " | HP: " .. math.floor(plr.Character.Humanoid.Health)
                    txt.Parent = bb
                end
            else
                if plr.Character.Head:FindFirstChild("UltimateTag") then
                    plr.Character.Head.UltimateTag:Destroy()
                end
            end
        end
    end
end)

-- Feature 7: Chams
local chamsOn = false
local ChamsBtn = CreateButton(Tab2Page, "7. Neon Chams: OFF")
ChamsBtn.Activated:Connect(function()
    chamsOn = not chamsOn
    ChamsBtn.Text = "7. Neon Chams: " .. (chamsOn and "ON" or "OFF")
    ChamsBtn.BackgroundColor3 = chamsOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, part in pairs(plr.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Material = chamsOn and Enum.Material.Neon or Enum.Material.SmoothPlastic
                    part.Color = chamsOn and Color3.fromRGB(170, 0, 255) or part.Color
                end
            end
        end
    end
end)

-- ==================== TAB 3: COMBAT ====================
-- Feature 8: Auto Clicker
local autoClickOn = false
local AutoClickBtn = CreateButton(Tab3Page, "8. Auto-Clicker: OFF")
AutoClickBtn.Activated:Connect(function()
    autoClickOn = not autoClickOn
    AutoClickBtn.Text = "8. Auto-Clicker: " .. (autoClickOn and "ON" or "OFF")
    AutoClickBtn.BackgroundColor3 = autoClickOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if autoClickOn then
            mouse1click()
        end
    end
end)

-- Feature 9: Hitbox Expander
local hitboxOn = false
local HitboxBtn = CreateButton(Tab3Page, "9. Hitbox Expander: OFF")
HitboxBtn.Activated:Connect(function()
    hitboxOn = not hitboxOn
    HitboxBtn.Text = "9. Hitbox Expander: " .. (hitboxOn and "ON" or "OFF")
    HitboxBtn.BackgroundColor3 = hitboxOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            if hitboxOn then
                hrp.Size = Vector3.new(10, 10, 10)
                hrp.Transparency = 0.7
                hrp.BrickColor = BrickColor.new("Purple")
                hrp.CanCollide = false
            else
                hrp.Size = Vector3.new(2, 2, 1)
                hrp.Transparency = 1
            end
        end
    end
end)

-- Feature 10: Camera Lock Target
local cameraLockOn = false
local CameraLockBtn = CreateButton(Tab3Page, "10. Target Lock Cam: OFF")
CameraLockBtn.Activated:Connect(function()
    cameraLockOn = not cameraLockOn
    CameraLockBtn.Text = "10. Target Lock Cam: " .. (cameraLockOn and "ON" or "OFF")
    CameraLockBtn.BackgroundColor3 = cameraLockOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
end)

RunService.RenderStepped:Connect(function()
    if cameraLockOn then
        local closest = nil
        local maxDist = math.huge
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                local dist = (plr.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
                if dist < maxDist then
                    maxDist = dist
                    closest = plr.Character.Head
                end
            end
        end
        if closest then
            Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, closest.Position)
        end
    end
end)

-- ==================== TAB 4: WORLD ====================
-- Feature 11: Full Brightness
local brightOn = false
local BrightBtn = CreateButton(Tab4Page, "11. Full Brightness: OFF")
BrightBtn.Activated:Connect(function()
    brightOn = not brightOn
    BrightBtn.Text = "11. Full Brightness: " .. (brightOn and "ON" or "OFF")
    BrightBtn.BackgroundColor3 = brightOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    Lighting.Brightness = brightOn and 3 or 1
    Lighting.GlobalShadows = not brightOn
    Lighting.ClockTime = brightOn and 14 or Lighting.ClockTime
end)

-- Feature 12: Low Gravity
local gravOn = false
local GravBtn = CreateButton(Tab4Page, "12. Low Gravity: OFF")
GravBtn.Activated:Connect(function()
    gravOn = not gravOn
    GravBtn.Text = "12. Low Gravity: " .. (gravOn and "ON" or "OFF")
    GravBtn.BackgroundColor3 = gravOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    Workspace.Gravity = gravOn and 50 or 196.2
end)

-- Feature 13: Remove Fog
local fogOn = false
local FogBtn = CreateButton(Tab4Page, "13. Remove Fog: OFF")
FogBtn.Activated:Connect(function()
    fogOn = not fogOn
    FogBtn.Text = "13. Remove Fog: " .. (fogOn and "ON" or "OFF")
    FogBtn.BackgroundColor3 = fogOn and Color3.fromRGB(140, 0, 230) or Color3.fromRGB(35, 25, 50)
    Lighting.FogEnd = fogOn and 100000 or 1000
end)

-- ==================== TAB 5: SERVER ====================
-- Feature 14: Rejoin Server
local RejoinBtn = CreateButton(Tab5Page, "14. Rejoin Server")
RejoinBtn.Activated:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

-- Feature 15: Server Hop
local HopBtn = CreateButton(Tab5Page, "15. Server Hop")
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

-- ==========================================
-- 4. LOGIC & ANIMATIONS
-- ==========================================
-- Loading animation
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(ProgressBar, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})

tween:Play()
tween.Completed:Connect(function()
    LoadingFrame.Visible = false
    KeyFrame.Visible = true
end)

-- Key Verification
SubmitBtn.Activated:Connect(function()
    if KeyInput.Text == CORRECT_KEY then
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        SubmitBtn.Text = "Incorrect Key!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        task.wait(1.5)
        SubmitBtn.Text = "Submit Key"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    end
end)
