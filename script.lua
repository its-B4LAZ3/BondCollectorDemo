-- DELX SCRIPTS BY its_B4LAZ3
-- Dark Blue Floating UI Demo
-- For your own Roblox Studio game

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("DELXScripts")
if oldGui then
oldGui:Destroy()
end

local function create(className, properties, parent)
local obj = Instance.new(className)
for key, value in pairs(properties) do
obj[key] = value
end
obj.Parent = parent
return obj
end

local function round(obj, radius)
create("UICorner", {
CornerRadius = UDim.new(0, radius)
}, obj)
end

local BLUE = Color3.fromRGB(15, 30, 65)
local PANEL = Color3.fromRGB(22, 43, 82)
local ACCENT = Color3.fromRGB(45, 115, 230)
local WHITE = Color3.fromRGB(240, 245, 255)
local MUTED = Color3.fromRGB(165, 185, 215)

local Gui = create("ScreenGui", {
Name = "DELXScripts",
ResetOnSpawn = false,
DisplayOrder = 100
}, playerGui)

-- Main floating window
local Main = create("Frame", {
Name = "MainWindow",
Size = UDim2.new(0, 290, 0, 300),
Position = UDim2.new(0.5, -145, 0.5, -150),
BackgroundColor3 = BLUE,
BorderSizePixel = 0,
ClipsDescendants = true
}, Gui)

round(Main, 12)

create("UIStroke", {
Color = ACCENT,
Thickness = 1.5,
Transparency = 0.2
}, Main)

-- Header / drag bar
local Header = create("TextButton", {
Name = "DragBar",
Size = UDim2.new(1, 0, 0, 60),
BackgroundColor3 = PANEL,
BorderSizePixel = 0,
Text = "",
AutoButtonColor = false
}, Main)

round(Header, 12)

create("TextLabel", {
Position = UDim2.new(0, 14, 0, 7),
Size = UDim2.new(1, -55, 0, 27),
BackgroundTransparency = 1,
Text = "DELX SCRIPTS",
TextColor3 = WHITE,
TextSize = 19,
Font = Enum.Font.GothamBold,
TextXAlignment = Enum.TextXAlignment.Left
}, Header)

create("TextLabel", {
Position = UDim2.new(0, 15, 0, 34),
Size = UDim2.new(1, -55, 0, 16),
BackgroundTransparency = 1,
Text = "BY its_B4LAZ3",
TextColor3 = MUTED,
TextSize = 11,
Font = Enum.Font.GothamMedium,
TextXAlignment = Enum.TextXAlignment.Left
}, Header)

local Close = create("TextButton", {
Position = UDim2.new(1, -40, 0, 12),
Size = UDim2.new(0, 28, 0, 28),
BackgroundColor3 = ACCENT,
Text = "×",
TextColor3 = WHITE,
TextSize = 21,
Font = Enum.Font.GothamBold
}, Header)

round(Close, 8)

-- Main content only
local Content = create("Frame", {
Name = "MainContent",
Position = UDim2.new(0, 12, 0, 72),
Size = UDim2.new(1, -24, 1, -84),
BackgroundTransparency = 1
}, Main)

create("TextLabel", {
Size = UDim2.new(1, 0, 0, 28),
BackgroundTransparency = 1,
Text = "MAIN",
TextColor3 = WHITE,
TextSize = 16,
Font = Enum.Font.GothamBold,
TextXAlignment = Enum.TextXAlignment.Left
}, Content)

local function addDemoToggle(title, description, y)
local Card = create("Frame", {
Position = UDim2.new(0, 0, 0, y),
Size = UDim2.new(1, 0, 0, 76),
BackgroundColor3 = PANEL,
BorderSizePixel = 0
}, Content)

round(Card, 9)

create("TextLabel", {
    Position = UDim2.new(0, 10, 0, 8),
    Size = UDim2.new(1, -65, 0, 22),
    BackgroundTransparency = 1,
    Text = title,
    TextColor3 = WHITE,
    TextSize = 13,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, Card)

create("TextLabel", {
    Position = UDim2.new(0, 10, 0, 32),
    Size = UDim2.new(1, -20, 0, 35),
    BackgroundTransparency = 1,
    Text = description,
    TextColor3 = MUTED,
    TextSize = 10,
    TextWrapped = true,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top
}, Card)

local enabled = false

local Switch = create("TextButton", {
    Position = UDim2.new(1, -48, 0, 12),
    Size = UDim2.new(0, 38, 0, 23),
    BackgroundColor3 = Color3.fromRGB(65, 75, 95),
    Text = "",
    AutoButtonColor = true
}, Card)

round(Switch, 12)

local Dot = create("Frame", {
    Position = UDim2.new(0, 3, 0, 3),
    Size = UDim2.new(0, 17, 0, 17),
    BackgroundColor3 = WHITE,
    BorderSizePixel = 0
}, Switch)

round(Dot, 10)

Switch.Activated:Connect(function()
    enabled = not enabled
    Switch.BackgroundColor3 = enabled
        and ACCENT
        or Color3.fromRGB(65, 75, 95)

    Dot.Position = enabled
        and UDim2.new(1, -20, 0, 3)
        or UDim2.new(0, 3, 0, 3)
end)

end

addDemoToggle(
"Auto Bond",
"Visual demo toggle — no collection functionality.",
34
)

addDemoToggle(
"Bond Finder",
"Example setting for your own Roblox game.",
118
)

-- Drag using touch or mouse
local dragging = false
local dragStart
local startPosition

Header.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then

    dragging = true
    dragStart = input.Position
    startPosition = Main.Position

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

end)

UIS.InputChanged:Connect(function(input)
if dragging and (
input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseMovement
) then
local delta = input.Position - dragStart

    Main.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

end)

Close.Activated:Connect(function()
Gui:Destroy()
end)
