local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- Create the main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkillUI"
screenGui.Parent = playerGui

-- Create a frame to hold the skill buttons
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.Parent = screenGui

-- Function to create a skill button
local function createSkillButton(name, key, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 40, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.Text = key
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Parent = frame

    -- Connect button click to use skill
    button.MouseButton1Click:Connect(function()
        useSkill(key)
    end)

    -- Connect key press to use skill
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode[key] then
            useSkill(key)
        end
    end)
end

-- Create skill buttons
createSkillButton("SkillZ", "Z", UDim2.new(0, 0, 0, 0))
createSkillButton("SkillX", "X", UDim2.new(0, 50, 0, 0))
createSkillButton("SkillC", "C", UDim2.new(0, 100, 0, 0))
createSkillButton("SkillV", "V", UDim2.new(0, 150, 0, 0))
createSkillButton("SkillF", "F", UDim2.new(0, 0, 0, 50))

-- Function to use a skill
local function useSkill(key)
    print("Using skill: " .. tostring(key))
    -- Implement the actual skill logic here
end
