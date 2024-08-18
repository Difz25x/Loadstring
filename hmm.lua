local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkillUI"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.Parent = screenGui

local textLabel = Instance.new("Info")
textLabel.Size = UDim2.new(1, 0, 0.3, 0)
textLabel.Text = "Skills: Z, X, C, V, F"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Parent = frame

local statusLabel = Instance.new("Status")
statusLabel.Size = UDim2.new(1, 0, 0.3, 0)
statusLabel.Position = UDim2.new(0, 0, 0.3, 0)
statusLabel.Text = "Auto-Clicker: Off"
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.Parent = frame

local startButton = Instance.new("Config")
startButton.Size = UDim2.new(1, 0, 0.2, 0)
startButton.Position = UDim2.new(0, 0, 0.6, 0)
startButton.Text = "Start Auto-Clicker"
startButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
startButton.Parent = frame

local stopButton = Instance.new("Config")
stopButton.Size = UDim2.new(1, 0, 0.2, 0)
stopButton.Position = UDim2.new(0, 0, 0.8, 0)
stopButton.Text = "Stop Auto-Clicker"
stopButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
stopButton.Parent = frame

local autoClickerRunning = false

local function startAutoClicker()
    if not autoClickerRunning then
        autoClickerRunning = true
        statusLabel.Text = "Auto-Clicker: On"
        local keys = {
            Enum.KeyCode.Z,
            Enum.KeyCode.X,
            Enum.KeyCode.C,
            Enum.KeyCode.V,
            Enum.KeyCode.F
        }
        while autoClickerRunning do
            local randomKey = keys[math.random(#keys)]
            useSkill(randomKey)
            task.wait(1)
        end
    end
end

local function stopAutoClicker()
    autoClickerRunning = false
    statusLabel.Text = "Auto-Clicker: Off"
end

startButton.MouseButton1Click:Connect(startAutoClicker)
stopButton.MouseButton1Click:Connect(stopAutoClicker)

local function useSkill(key)
    print("Using skill: " .. tostring(key))
end
