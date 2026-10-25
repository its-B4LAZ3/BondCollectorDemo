-- Bond Collector Demo
-- Visual demonstration only

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

ScreenGui.Name = "BondCollectorDemo"
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 210, 0, 40)
Button.Position = UDim2.new(0, 20, 0, 20)
Button.Text = "Auto Bond: OFF"
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
Button.Text = "Demo Activated!"
end)

Frame.Parent = ScreenGui
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
