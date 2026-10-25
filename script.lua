-- Floating UI Demo (Roblox)
-- Draggable window with a toggle button
-- For your own Roblox Studio game

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("BondCollectorDemo")
if oldGui then
oldGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BondCollectorDemo"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Frame.Active = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextButton")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Text = "Bond Collector Demo - Drag Me"
Title.TextSize = 14
Title.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 210, 0, 40)
Button.Position = UDim2.new(0, 20, 0, 55)
Button.BackgroundColor3 = Color3.fromRGB(55, 100, 65)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Text = "Demo: OFF"
Button.Parent = Frame

Button.Activated:Connect(function()
if Button.Text == "Demo: OFF" then
Button.Text = "Demo: ON"
else
Button.Text = "Demo: OFF"
end
end)

-- Drag support for mouse and touch
local dragging = false
local dragInput
local dragStart
local startPosition

Title.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then

    dragging = true
    dragStart = input.Position
    startPosition = Frame.Position

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

end)

Title.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

UserInputService.InputChanged:Connect(function(input)
if dragging and (input == dragInput
or input.UserInputType == Enum.UserInputType.Touch) then

    local delta = input.Position - dragStart

    Frame.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

end)
