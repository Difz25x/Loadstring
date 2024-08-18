local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local SpeedSlider = Instance.new("Slider")
local SpeedLabel = Instance.new("TextLabel")
local ModifySpeedButton = Instance.new("TextButton")

ScreenGui.Name = "Helius Hub [ Beta ]"
ScreenGui.Parent = playerGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.Size = UDim2.new(0, 200, 0, 100)

SpeedLabel.Parent = Frame
SpeedLabel.Size = UDim2.new(1, 0, 0, 50)
SpeedLabel.Text = "Walk Speed: 16"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedSlider.Parent = Frame
SpeedSlider.Size = UDim2.new(1, -20, 0, 30)
SpeedSlider.Position = UDim2.new(0, 10, 0, 50)
SpeedSlider.MinValue = 16
SpeedSlider.MaxValue = 100

ModifySpeedButton.Parent = Frame
ModifySpeedButton.Size = UDim2.new(1, 0, 0, 50)
ModifySpeedButton.Position = UDim2.new(0, 0, 0, 80)
ModifySpeedButton.Text = "Modify Speed"

local speedModified = true

ModifySpeedButton.MouseButton1Click:Connect(function()
    if speedModified then
        local newSpeed = SpeedSlider:Callback(function(Value)
        player.Character.Humanoid.WalkSpeed = newSpeed
        SpeedLabel.Text = "Walk Speed: " .. newSpeed
    end
end)
