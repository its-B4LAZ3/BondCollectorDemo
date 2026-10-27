-- Floating GUI Demo
-- For your own Roblox Studio project
-- Visual controls only; no gameplay automation.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("BondCollectorDemo")
if oldGui then
    oldGui:Destroy()
end

local settings = {
    Bonds = false,
    AutoKill = false,
    AutoWin = false,
    AutoMilestone = false,
}

local savedSettings = {}

local gui = Instance.new("ScreenGui")
gui.Name = "BondCollectorDemo"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Floating settings icon
local settingsButton = Instance.new("TextButton")
settingsButton.Name = "SettingsButton"
settingsButton.Size = UDim2.fromOffset(45, 45)
settingsButton.Position = UDim2.new(0, 12, 0, 12)
settingsButton.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
settingsButton.Text = "⚙"
settingsButton.TextSize = 26
settingsButton.TextColor3 = Color3.new(1, 1, 1)
settingsButton.Parent = gui

Instance.new("UICorner", settingsButton).CornerRadius =
    UDim.new(0, 10)

-- Main window
local frame = Instance.new("Frame")
frame.Name = "MainWindow"
frame.Size = UDim2.fromOffset(310, 440)
frame.Position = UDim2.new(0.5, -155, 0.5, -220)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Visible = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 12)

-- Scrolling content
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -48)
scroll.Position = UDim2.fromOffset(6, 42)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 5
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = frame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 7)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingBottom = UDim.new(0, 8)
padding.Parent = scroll

-- Title bar
local title = Instance.new("TextButton")
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
title.BorderSizePixel = 0
title.Text = "  Bond Collector Demo"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

Instance.new("UICorner", title).CornerRadius =
    UDim.new(0, 10)

-- Status label
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -12, 0, 28)
status.BackgroundTransparency = 1
status.Text = "Visual demo - gameplay disabled"
status.TextColor3 = Color3.fromRGB(180, 190, 200)
status.TextSize = 12
status.LayoutOrder = 1
status.Parent = scroll

local function makeButton(text, order, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -8, 0, 35)
    button.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 13
    button.LayoutOrder = order
    button.Parent = scroll

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 7)

    button.Activated:Connect(callback)
    return button
end

local order = 2

local function addSection(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -8, 0, 27)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(120, 200, 255)
    label.TextSize = 15
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = order
    label.Parent = scroll
    order += 1
end

-- Individual feature switches
local switchButtons = {}

local function addSwitch(key, label)
    local button

    local function refresh()
        local enabled = settings[key]
        button.Text = label .. ": " .. (enabled and "ON" or "OFF")
        button.BackgroundColor3 = enabled
            and Color3.fromRGB(45, 110, 75)
            or Color3.fromRGB(65, 55, 65)
    end

    button = makeButton(label .. ": OFF", order, function()
        settings[key] = not settings[key]
        refresh()
        status.Text = label .. " visual switch updated"
    end)

    switchButtons[key] = refresh
    order += 1
    refresh()
end

addSection("FEATURE SWITCHES")
order += 1

addSwitch("Bonds", "Bonds")
addSwitch("AutoKill", "Auto Kill")
addSwitch("AutoWin", "Auto Win")
addSwitch("AutoMilestone", "Auto Milestone")

-- Individual teleport demo buttons
addSection("TELEPORT DESTINATIONS")
order += 1

local destinations = {
    "Village 1",
    "Village 2",
    "Village 3",
    "Village 4",
    "Village 5",
    "Village 6",
    "Village 7",
    "End",
}

for _, destination in ipairs(destinations) do
    local destinationName = destination

    makeButton("Teleport to " .. destinationName, order, function()
        status.Text = destinationName
            .. " selected (visual demo only)"
    end)

    order += 1
end

-- Enable all / Disable all
addSection("QUICK CONTROLS")
order += 1

makeButton("Enable All", order, function()
    for key in pairs(settings) do
        settings[key] = true
        switchButtons[key]()
    end

    status.Text = "All visual switches ON"
end)
order += 1

makeButton("Disable All", order, function()
    for key in pairs(settings) do
        settings[key] = false
        switchButtons[key]()
    end

    status.Text = "All visual switches OFF"
end)
order += 1

-- Configuration controls
addSection("CONFIGURATION")
order += 1

makeButton("Save Config", order, function()
    savedSettings = {}

    for key, value in pairs(settings) do
        savedSettings[key] = value
    end

    status.Text = "Config saved for this session"
end)
order += 1

makeButton("Load Config", order, function()
    if next(savedSettings) == nil then
        status.Text = "No saved config in this session"
        return
    end

    for key, value in pairs(savedSettings) do
        settings[key] = value
        switchButtons[key]()
    end

    status.Text = "Config loaded"
end)
order += 1

makeButton("Reset Config", order, function()
    for key in pairs(settings) do
        settings[key] = false
        switchButtons[key]()
    end

    savedSettings = {}
    status.Text = "Config reset"
end)

-- Open / close settings panel
settingsButton.Activated:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Drag support for mouse and touch
local dragging = false
local dragInput
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input == dragInput
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart

        frame.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

print("Bond Collector Demo GUI loaded!")
