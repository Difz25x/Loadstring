local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoKillTerrorSharkGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Text = "Auto Kill TerrorShark"
titleLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
titleLabel.Parent = frame

local attackButton = Instance.new("TextButton")
attackButton.Size = UDim2.new(0, 200, 0, 50)
attackButton.Position = UDim2.new(0.5, -100, 0, 60)
attackButton.Text = "Auto Dodge Terror"
attackButton.Parent = frame

local xSlider = Instance.new("TextBox")
xSlider.Size = UDim2.new(0, 200, 0, 50)
xSlider.Position = UDim2.new(0.5, -100, 0, 120)
xSlider.PlaceholderText = "X Position (1-200)"
xSlider.Parent = frame

local ySlider = Instance.new("TextBox")
ySlider.Size = UDim2.new(0, 200, 0, 50)
ySlider.Position = UDim2.new(0.5, -100, 0, 180)
ySlider.PlaceholderText = "Y Position (1-200)"
ySlider.Parent = frame

local zSlider = Instance.new("TextBox")
zSlider.Size = UDim2.new(0, 200, 0, 50)
zSlider.Position = UDim2.new(0.5, -100, 0, 240)
zSlider.PlaceholderText = "Z Position (1-200)"
zSlider.Parent = frame

local function onAttackButtonClick()
    local xPos = tonumber(xSlider.Text) or 0
    local yPos = tonumber(ySlider.Text) or 0
    local zPos = tonumber(zSlider.Text) or 0

    if xPos >= 1 and xPos <= 200 and yPos >= 1 and yPos <= 200 and zPos >= 1 and zPos <= 200 then
        while true do
            player.Character.HumanoidRootPart.CFrame = CFrame.new(xPos, yPos, zPos)
            wait(0.5)
            -- Add attack logic for TerrorShark here
        end
    end
end

attackButton.MouseButton1Click:Connect(onAttackButtonClick)
