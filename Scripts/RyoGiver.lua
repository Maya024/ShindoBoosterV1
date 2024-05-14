--[[

ShindoBoosterV1 Interface Beta
Update: 2.0
by Mays (Maya)

Mays (Maya) | Designing + Programming

]]

local function createTimerPopup()
    local timerScreenGui = Instance.new("ScreenGui")
    timerScreenGui.Name = "TimerScreenGui"
    timerScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local timerFrame = Instance.new("Frame")
    timerFrame.Name = "TimerFrame"
    timerFrame.Size = UDim2.new(0.3, 0, 0.3, 0)
    timerFrame.Position = UDim2.new(0.5, -timerFrame.Size.X.Offset / 2, 0.5, -timerFrame.Size.Y.Offset / 2)
    timerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    timerFrame.BorderSizePixel = 0
    timerFrame.Parent = timerScreenGui

    local timerLabel = Instance.new("TextLabel")
    timerLabel.Name = "TimerLabel"
    timerLabel.Size = UDim2.new(1, 0, 0.4, 0)
    timerLabel.Position = UDim2.new(0, 0, 0, 0)
    timerLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    timerLabel.BorderSizePixel = 0
    timerLabel.Font = Enum.Font.SourceSansBold
    timerLabel.TextSize = 18
    timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    timerLabel.Text = "Set Timer (seconds):"
    timerLabel.TextWrapped = true
    timerLabel.Parent = timerFrame

    local timerTextBox = Instance.new("TextBox")
    timerTextBox.Name = "TimerTextBox"
    timerTextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
    timerTextBox.Position = UDim2.new(0.5, -timerTextBox.Size.X.Offset / 2, 0.5, 10)
    timerTextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    timerTextBox.BorderSizePixel = 0
    timerTextBox.Font = Enum.Font.SourceSansBold
    timerTextBox.TextSize = 18
    timerTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    timerTextBox.Text = ""
    timerTextBox.Parent = timerFrame

    local okButton = Instance.new("TextButton")
    okButton.Name = "OkButton"
    okButton.Size = UDim2.new(0.4, 0, 0.2, 0)
    okButton.Position = UDim2.new(0.5, -okButton.Size.X.Offset / 2, 0.8, 10)
    okButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    okButton.BorderSizePixel = 0
    okButton.Font = Enum.Font.SourceSansBold
    okButton.TextSize = 18
    okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    okButton.Text = "Okay"
    okButton.Parent = timerFrame

    return timerScreenGui, timerTextBox, okButton
end

local function runCodeWithTimer(code, duration)
    local timerScreenGui, timerTextBox, okButton = createTimerPopup()
    local countdown = tonumber(timerTextBox.Text)

    okButton.MouseButton1Click:Connect(function()
        countdown = tonumber(timerTextBox.Text)
        timerScreenGui:Destroy()
    end)

    while countdown and countdown > 0 do
        countdown = countdown - 1
        wait(1)
    end

    if countdown == 0 then
        loadstring(code)()
    end
end

local function pressKeyForDuration(key, duration)
    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("key", key)
    wait(duration)
    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("key", key.."end")
end

local codeToRun = [[
    local allJutsu = game:GetService("ReplicatedStorage"):WaitForChild("alljutsu")
    if allJutsu:FindFirstChild("RELL") then
        local args = {
            [1] = "equipjutsu",
            [2] = "v",
            [3] = allJutsu.RELL:WaitForChild("rell2")
        }
        game:GetService("Players").LocalPlayer:WaitForChild("startevent"):FireServer(unpack(args))
        
        pressKeyForDuration("v", %duration%) -- %duration% wird durch die eingegebene Zeit ersetzt
        
        local args = {
            [1] = "key",
            [2] = "vend"
        }
        game:GetService("Players").LocalPlayer.Character.combat.update:FireServer(unpack(args))
    end
]]

local timerDuration = 10 
codeToRun = codeToRun:gsub("%%duration%%", tostring(timerDuration))
runCodeWithTimer(codeToRun, timerDuration)
