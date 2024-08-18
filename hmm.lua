local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkillUI"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Text = "Skills: Z, X, C, V, F"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Parent = frame

local UserInputService = game:GetService("UserInputService")

local function useSkill(key)
    -- Simulate key press. This is a placeholder. You need to implement the actual key press logic.
    print("Using skill: " .. tostring(key))
end

local function startAutoClicker(interval)
    local keys = {
        Enum.KeyCode.Z,
        Enum.KeyCode.X,
        Enum.KeyCode.C,
        Enum.KeyCode.V,
        Enum.KeyCode.F
    }
    interval = (interval or 1) * 1000
    while true do
        local randomKey = keys[math.random(#keys)]
        useSkill(randomKey)
        task.wait(interval / 1000)
    end
end

-- Start the auto-clicker with a 1-second interval
startAutoClicker(1)

-- Placeholder for TerrorShark actions detection
local function detectTerrorSharkActions()
    while true do
        -- Replace with actual condition checking TerrorShark's state
        print("Dodge TerrorShark Skill")
        task.wait(0.1)
    end
end

-- Start detecting TerrorShark actions
detectTerrorSharkActions()

-- Placeholder for dodging skills

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
        wait(0.1)  -- Adjust the wait time based on how frequently you want to check
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
