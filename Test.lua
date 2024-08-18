local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HeliusHubBeta"
ScreenGui.Parent = playerGui
ScreenGui.Enabled = true  -- Ensure the GUI is enabled

-- Create the main Frame
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.Size = UDim2.new(0, 300, 0, 200)

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = Frame
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Text = "Helius Hub [ Beta ]"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.BackgroundTransparency = 1  -- No background for text labels

-- Description Label
local DescriptionLabel = Instance.new("TextLabel")
DescriptionLabel.Parent = Frame
DescriptionLabel.Size = UDim2.new(1, 0, 0, 30)
DescriptionLabel.Position = UDim2.new(0, 0, 0, 50)
DescriptionLabel.Text = "Adjust your walk speed below:"
DescriptionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DescriptionLabel.TextScaled = true
DescriptionLabel.Font = Enum.Font.Gotham
DescriptionLabel.BackgroundTransparency = 1  -- No background for text labels

-- Speed Label
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = Frame
SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
SpeedLabel.Position = UDim2.new(0, 0, 0, 80)
SpeedLabel.Text = "Walk Speed: 16"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextScaled = true
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.BackgroundTransparency = 1  -- No background for text labels

-- Speed Input (TextBox)
local SpeedInput = Instance.new("TextBox")
SpeedInput.Parent = Frame
SpeedInput.Size = UDim2.new(1, 0, 0, 30)
SpeedInput.Position = UDim2.new(0, 0, 0, 110)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SpeedInput.Font = Enum.Font.Gotham
SpeedInput.TextScaled = true

-- Modify Speed Button
local ModifySpeedButton = Instance.new("TextButton")
ModifySpeedButton.Parent = Frame
ModifySpeedButton.Size = UDim2.new(1, 0, 0, 50)
ModifySpeedButton.Position = UDim2.new(0, 0, 0, 150)
ModifySpeedButton.Text = "Modify Speed"
ModifySpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ModifySpeedButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ModifySpeedButton.Font = Enum.Font.GothamBold
ModifySpeedButton.TextScaled = true

-- Function to modify speed
local function modifySpeed()
    local newSpeed = tonumber(SpeedInput.Text) or 16
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = newSpeed
        SpeedLabel.Text = "Walk Speed: " .. newSpeed
    end
end

-- Connect events
ModifySpeedButton.MouseButton1Click:Connect(modifySpeed)
SpeedInput.FocusLost:Connect(modifySpeed)
