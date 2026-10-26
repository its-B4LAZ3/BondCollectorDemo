-- Mobile touch drag system
-- Frame = your floating window
-- Works with touch input in a Roblox UI you control

local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStart
local startPosition
local dragInput

Frame.Active = true

Frame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then

    dragging = true
    dragStart = input.Position
    startPosition = Frame.Position
    dragInput = input

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

end)

UserInputService.InputChanged:Connect(function(input)
if dragging and (
input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseMovement
) then
local delta = input.Position - dragStart

    Frame.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

end)
