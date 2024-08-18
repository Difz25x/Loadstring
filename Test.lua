local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Create Screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoKillTerrorShark"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.Parent = screenGui

-- Create Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "Auto Kill TerrorShark"
titleLabel.Parent = mainFrame

-- Create Attack Button
local attackButton = Instance.new("TextButton")
attackButton.Size = UDim2.new(1, 0, 0, 50)
attackButton.Position = UDim2.new(0, 0, 0, 60)
attackButton.BackgroundColor3 = Color3.new(0, 1, 0)
attackButton.Text = "Auto Dodge Terror"
attackButton.Parent = mainFrame

-- Create Position Sliders
local function createSlider(name, position)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, 0, 0, 50)
    sliderFrame.Position = position
    sliderFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    sliderFrame.Parent = mainFrame

    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Size = UDim2.new(0.6, 0, 1, 0)
    sliderLabel.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    sliderLabel.Text = name .. ": 1"
    sliderLabel.Parent = sliderFrame

    local slider = Instance.new("Slider")
    slider.Size = UDim2.new(0.4, 0, 1, 0)
    slider.Position = UDim2.new(0.6, 0, 0, 0)
    slider.MinValue = 1
    slider.MaxValue = 200
    slider.Parent = sliderFrame

    return slider, sliderLabel
end

local xSlider, xLabel = createSlider("X Position", UDim2.new(0, 0, 0, 120))
local ySlider, yLabel = createSlider("Y Position", UDim2.new(0, 0, 0, 180))
local zSlider, zLabel = createSlider("Z Position", UDim2.new(0, 0, 0, 240))

-- Update Labels on Slider Change
local function updateLabel(slider, label)
    slider.Changed:Connect(function()
        label.Text = label.Text:sub(1, label.Text:find(":") - 1) .. ": " .. math.floor(slider.Value)
    end)
end

updateLabel(xSlider, xLabel)
updateLabel(ySlider, yLabel)
updateLabel(zSlider, zLabel)

-- Attack Function
local function autoDodge()
    while wait(0.5) do
        -- Logic for dodging the TerrorShark's attack
    end
end

-- Button Functionality
attackButton.MouseButton1Click:Connect(autoDodge)

-- Tweening Function for Fly
local function flyTo(targetPosition)
    local goal = {}
    goal.Position = UDim2.new(0, targetPosition.x, 0, targetPosition.y)
    
    local tween = TweenService:Create(character, TweenInfo.new(1), goal)
    tween:Play()
end
