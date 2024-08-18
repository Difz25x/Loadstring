local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local DescriptionLabel = Instance.new("TextLabel")
local SpeedSlider = Instance.new("UISlider")
local SpeedLabel = Instance.new("TextLabel")
local ModifySpeedButton = Instance.new("TextButton")

ScreenGui.Name = "Helius Hub [ Beta ]"
ScreenGui.Parent = playerGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.Size = UDim2.new(0, 300, 0, 200)

TitleLabel.Parent = Frame
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Text = "Helius Hub [ Beta ]"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold

DescriptionLabel.Parent = Frame
DescriptionLabel.Size = UDim2.new(1, 0, 0, 30)
DescriptionLabel.Position = UDim2.new(0, 0, 0, 50)
DescriptionLabel.Text = "Adjust your walk speed below:"
DescriptionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DescriptionLabel.TextScaled = true
DescriptionLabel.Font = Enum.Font.Gotham

SpeedLabel.Parent = Frame
SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
SpeedLabel.Position = UDim2.new(0, 0, 0, 80)
SpeedLabel.Text = "Walk Speed: 16"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextScaled = true
SpeedLabel.Font = Enum.Font.Gotham

SpeedSlider.Parent = Frame
SpeedSlider.Size = UDim2.new(1, -20, 0, 30)
SpeedSlider.Position = UDim2.new(0, 10, 0, 110)
SpeedSlider.MinValue = 16
SpeedSlider.MaxValue = 100
SpeedSlider.Value = 16

ModifySpeedButton.Parent = Frame
ModifySpeedButton.Size = UDim2.new(1, 0, 0, 50)
ModifySpeedButton.Position = UDim2.new(0, 0, 0, 150)
ModifySpeedButton.Text = "Modify Speed"
ModifySpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ModifySpeedButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ModifySpeedButton.Font = Enum.Font.GothamBold
ModifySpeedButton.TextScaled = true

local function modifySpeed()
    local newSpeed = SpeedSlider.Value
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = newSpeed
        SpeedLabel.Text = "Walk Speed: " .. newSpeed
    end
end

ModifySpeedButton.MouseButton1Click:Connect(modifySpeed)

SpeedSlider.ValueChanged:Connect(function()
    modifySpeed()
end)
