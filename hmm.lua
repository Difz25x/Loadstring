local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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
    local button = Instance.new("TextButton")  -- Corrected instance type
    button.Size = UDim2.new(0, 40, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.Text = key
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        useSkill(key)
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

-- Assuming TerrorShark is an object or a module that exposes its state
local TerrorShark = game.ReplicatedStorage:WaitForChild("TerrorShark")

-- Define positions for dodging relative to the player's current position
local function getDodgePosition(playerCharacter, offsetY)
    return playerCharacter:GetPrimaryPartCFrame() * CFrame.new(0, offsetY, 0)
end

-- Function to dodge skills based on Terror Shark's actions
local function dodgeSkills()
    if player and player.Character then
        local upPosition = getDodgePosition(player.Character, 194)  -- Position above the player
        local downPosition = getDodgePosition(player.Character, -194)  -- Position below the player

        if TerrorShark.IsUsingSkillA then
            -- Move player's character to an 'upPosition' to dodge SkillA
            player.Character:SetPrimaryPartCFrame(upPosition)
        elseif TerrorShark.IsUsingSkillB then
            -- Move player's character to a 'downPosition' to dodge SkillB
            player.Character:SetPrimaryPartCFrame(downPosition)
        end
    end
end

-- Continuously monitor Terror Shark's actions and dodge accordingly
local function monitorTerrorSharkActions()
    while true do
        if player and player.Character then
            dodgeSkills()
        end
        task.wait(0.1)  -- Adjust the wait time based on how frequently you want to check
    end
end

-- Ensure the player's character is loaded
player.CharacterAdded:Connect(function(character)
    player.Character = character
    monitorTerrorSharkActions()
end)

-- If the character is already loaded, start monitoring immediately
if player.Character then
    monitorTerrorSharkActions()
end
