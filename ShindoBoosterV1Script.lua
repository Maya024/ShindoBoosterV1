--[[

ShindoBoosterV1 Interface Beta
Update: 2.0
by Mays (Maya)

Mays (Maya) | Designing + Programming

]]

local loadingScreen = Instance.new("ScreenGui")
loadingScreen.Name = "LoadingScreen"
loadingScreen.IgnoreGuiInset = true
loadingScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local loadingBackground = Instance.new("Frame")
loadingBackground.Name = "LoadingBackground"
loadingBackground.Size = UDim2.new(0.5, 0, 0.5, 0)
loadingBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingBackground.AnchorPoint = Vector2.new(0.5, 0.5)
loadingBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
loadingBackground.BorderSizePixel = 0
loadingBackground.Parent = loadingScreen

local loadingTopLeftText = Instance.new("TextLabel")
loadingTopLeftText.Name = "LoadingTopLeftText"
loadingTopLeftText.Size = UDim2.new(0.5, 0, 0.1, 0)
loadingTopLeftText.Position = UDim2.new(0, 5, 0, 5)
loadingTopLeftText.BackgroundTransparency = 1
loadingTopLeftText.Font = Enum.Font.SourceSansBold
loadingTopLeftText.TextSize = 18
loadingTopLeftText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingTopLeftText.Text = "♾️ShindoBoosterV1♾️"
loadingTopLeftText.TextXAlignment = Enum.TextXAlignment.Left
loadingTopLeftText.Parent = loadingBackground

local loadingBottomRightText = Instance.new("TextLabel")
loadingBottomRightText.Name = "LoadingBottomRightText"
loadingBottomRightText.Size = UDim2.new(0.5, 0, 0.1, 0)
loadingBottomRightText.Position = UDim2.new(1, -274, 1, -40)
loadingBottomRightText.BackgroundTransparency = 1
loadingBottomRightText.Font = Enum.Font.SourceSansBold
loadingBottomRightText.TextSize = 14
loadingBottomRightText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingBottomRightText.Text = "Version: 2.0"
loadingBottomRightText.TextXAlignment = Enum.TextXAlignment.Right
loadingBottomRightText.TextYAlignment = Enum.TextYAlignment.Bottom
loadingBottomRightText.Parent = loadingBackground

local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(1, 0, 0.6, 0)
loadingText.Position = UDim2.new(0, 0, 0.2, 0)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextSize = 24
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Text = "Loading"
loadingText.Parent = loadingBackground

wait(11)
loadingScreen:Destroy()

local menuScreen = Instance.new("ScreenGui")
menuScreen.Name = "MenuScreen"
menuScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local menuBackground = Instance.new("Frame")
menuBackground.Name = "MenuBackground"
menuBackground.Size = UDim2.new(0.5, 0, 0.5, 0)
menuBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
menuBackground.AnchorPoint = Vector2.new(0.5, 0.5)
menuBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuBackground.BorderSizePixel = 0
menuBackground.Parent = menuScreen

local button1 = Instance.new("TextButton")
button1.Name = "RC"
button1.Size = UDim2.new(0.8, 0, 0.2, 0)
button1.Position = UDim2.new(0.5, 0, 0.3, 0)
button1.AnchorPoint = Vector2.new(0.5, 0)
button1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button1.BorderSizePixel = 0
button1.Font = Enum.Font.SourceSansBold
button1.TextSize = 18
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.Text = "RC Giver"
button1.Parent = menuBackground

local button2 = Instance.new("TextButton")
button2.Name = "RYO"
button2.Size = UDim2.new(0.8, 0, 0.2, 0)
button2.Position = UDim2.new(0.5, 0, 0.7, 0)
button2.AnchorPoint = Vector2.new(0.5, 0)
button2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button2.BorderSizePixel = 0
button2.Font = Enum.Font.SourceSansBold
button2.TextSize = 18
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.Text = "Ryo Timer"
button2.Parent = menuBackground

button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Maya024/ShindoBoosterV1/ShindoLife2/Scripts/RcGiver.lua"))()
end)

button2.MouseButton1Click:Connect(function()
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Maya024/ShindoBoosterV1/ShindoLife2/Scripts/RyoGiver.lua"))()
end)
