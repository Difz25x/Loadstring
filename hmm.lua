local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local Mouse = p

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
          PressKey(key)
          ReleaseKey(key)
        end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Z then
        
    elseif input.KeyCode == Enum.KeyCode.X then
        -- Execute skill X
    elseif input.KeyCode == Enum.KeyCode.C then
        -- Execute skill C
    elseif input.KeyCode == Enum.KeyCode.V then
        -- Execute skill V
    elseif input.KeyCode == Enum.KeyCode.F then
        -- Execute skill F
    end
end)

local function startAutoClicker(interval)

        interval = (interval or 1) * 10
  
        while true do
    
        useSkill()
    
        Sleep(interval)
    end
end

startAutoClicker(1)

local function detectTerrorSharkActions()
    while true do
if TerrorShark.IsAttacking then
     fireRemoteEvent("UseSkill", "Z")
 end
        wait(0.1)
    end
end


detectTerrorSharkActions()

local function dodgeSkills()
if TerrorShark.IsUsingSkillA then
     player.Character:MoveTo(upPosition)
elseif TerrorShark.IsUsingSkillB then
     player.Character:MoveTo(downPosition)
  end
end
