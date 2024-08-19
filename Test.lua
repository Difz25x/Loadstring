local player = game.Players.LocalPlayer
local playerSpeed = player.Character:WaitForChild("Humanoid").WalkSpeed

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local Slider = Instance.new("Frame")
local SliderButton = Instance.new("Frame")
local ValueLabel = Instance.new("TextLabel")

-- Properties
ScreenGui.Parent = player.PlayerGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 100, 0, 50)
TextBox.Position = UDim2.new(0.5, -50, 0, 10)
TextBox.Text = tostring(playerSpeed)
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)

Slider.Parent = Frame
Slider.Size = UDim2.new(0, 200, 0, 20)
Slider.Position = UDim2.new(0.5, -100, 0, 100)
Slider.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)

SliderButton.Parent = Slider
SliderButton.Size = UDim2.new(0, 20, 0, 20)
SliderButton.Position = UDim2.new(0, 0, 0, 0)
SliderButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0)

ValueLabel.Parent = Frame
ValueLabel.Size = UDim2.new(0, 100, 0, 50)
ValueLabel.Position = UDim2.new(0.5, -50, 0, 60)
ValueLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ValueLabel.Text = "Speed: " .. tostring(playerSpeed)

-- Functions
local function updatePlayerSpeed(value)
    player.Character:WaitForChild("Humanoid").WalkSpeed = value
    ValueLabel.Text = "Speed: " .. tostring(value)
end

TextBox.FocusLost:Connect(function(enter)
    if enter then
        local value = tonumber(TextBox.Text) or playerSpeed
        updatePlayerSpeed(value)
        playerSpeed = value
        SliderButton.Position = UDim2.new(0, (value - 16) * 10, 0, 0)
    end
end)

SliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local connection
        connection = game:GetService("UserInputService").InputChanged:Connect(function(moveInput)
            if moveInput.UserInputType == Enum.UserInputType.MouseMovement then
                local sliderPos = moveInput.Position.X - Slider.AbsolutePosition.X
                local value = math.clamp(sliderPos / 10 + 16, 16, 200)
                updatePlayerSpeed(value)
                playerSpeed = value
                SliderButton.Position = UDim2.new(0, sliderPos, 0, 0)
            end
        end)
        input.Changed:Wait()
        connection:Disconnect()
    end
end)
