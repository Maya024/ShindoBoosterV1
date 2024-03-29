--[[

ShindoBoosterV1 Interface Beta
Update: 1.9 fix
by Mays (Maya) + nikenoez + dell_noa

Mays (Maya) + nikenoez | Designing + Programming

]]




if game.PlaceId == 4616652839 then

-- Loading screen
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
loadingBottomRightText.Text = "Version: 1.9"
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


-- Script menu
local function createPlayerMenu(players)
    local playerDropdown = Instance.new("ScreenGui")
    playerDropdown.Name = "PlayerDropdownGui"
    playerDropdown.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") 

    local playerDropdownFrame = Instance.new("Frame")
    playerDropdownFrame.Name = "PlayerDropdownFrame"
    playerDropdownFrame.Size = UDim2.new(0, 200, 0, 200)
    playerDropdownFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    playerDropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
    playerDropdownFrame.BorderSizePixel = 0
    playerDropdownFrame.Parent = playerDropdown

    local playerDropdownTitle = Instance.new("TextLabel")
    playerDropdownTitle.Name = "PlayerDropdownTitle"
    playerDropdownTitle.Size = UDim2.new(1, 0, 0, 30)
    playerDropdownTitle.Position = UDim2.new(0, 0, 0, 0)
    playerDropdownTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 40) 
    playerDropdownTitle.BorderSizePixel = 0
    playerDropdownTitle.Font = Enum.Font.SourceSansBold
    playerDropdownTitle.TextSize = 18
    playerDropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255) 
    playerDropdownTitle.Text = "Player Selection"
    playerDropdownTitle.TextWrapped = true
    playerDropdownTitle.Parent = playerDropdownFrame

    local playerListScrollingFrame = Instance.new("ScrollingFrame")
    playerListScrollingFrame.Name = "PlayerListScrollingFrame"
    playerListScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
    playerListScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
    playerListScrollingFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    playerListScrollingFrame.BorderSizePixel = 0
    playerListScrollingFrame.ScrollBarThickness = 6
    playerListScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #players * 30)
    playerListScrollingFrame.Parent = playerDropdownFrame

    local playerListLayout = Instance.new("UIListLayout")
    playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    playerListLayout.Padding = UDim.new(0, 5)
    playerListLayout.Parent = playerListScrollingFrame

    -- Teleport to the player
    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer then
            local playerButton = Instance.new("TextButton")
            playerButton.Name = player.Name
            playerButton.Size = UDim2.new(1, 0, 0, 30)
            playerButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60) 
            playerButton.BorderSizePixel = 0
            playerButton.Font = Enum.Font.SourceSans
            playerButton.TextSize = 14
            playerButton.TextColor3 = Color3.fromRGB(255, 255, 255) 
            playerButton.Text = player.Name
            playerButton.Parent = playerListScrollingFrame

            playerButton.MouseButton1Click:Connect(function()
                playerButton.Visible = false
                getgenv().Nickname = player.Name
                updatePlayerMovement(player, true)

                workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = workspace[Nickname].HumanoidRootPart.CFrame
                game:GetService("Players").LocalPlayer.startevent:FireServer("band", "\128")
                local args = {
                    [1] = "equipjutsu",
                    [2] = "v",
                    [3] = game:GetService("ReplicatedStorage"):WaitForChild("alljutsu"):WaitForChild("RELL"):WaitForChild("rell1")
                }

                game:GetService("Players").LocalPlayer:WaitForChild("startevent"):FireServer(unpack(args))
                local args = {
                    [1] = "key",
                    [2] = "v"
                }

                game:GetService("Players").LocalPlayer.Character.combat.update:FireServer(unpack(args))
                local args = {
                    [1] = "key",
                    [2] = "vend"
                }

                game:GetService("Players").LocalPlayer.Character.combat.update:FireServer(unpack(args))
                wait(4)
                updatePlayerMovement(player, false)
                wait(6)
                local TeleportService = game:GetService("TeleportService")
                TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
            end)
        end
    end

    -- Functions for moving the UI
 
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        playerDropdownFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    playerDropdownFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = playerDropdownFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    playerDropdownFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end


-- Main script

getgenv().toggle25 = true
getgenv().Nickname = "PlayerName"
repeat wait() until game:GetService("Players").PlayerAdded and getgenv().toggle25 == true
wait(3)
loadingScreen:Destroy()
wait(1)
local examplePlayers = game.Players:GetPlayers()
createPlayerMenu(examplePlayers)

else
    -- GameNotStartedGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "GameNotStartedGui"
    gui.IgnoreGuiInset = true

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.8, 0)
    textLabel.Position = UDim2.new(0, 0, 0.1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 24
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Text = "This script can only be started in Shindo life 2! PlaceId: " .. game.PlaceId
    textLabel.Parent = frame

    local okButton = Instance.new("TextButton")
    okButton.Size = UDim2.new(0.6, 0, 0.1, 0)
    okButton.Position = UDim2.new(0.5, -okButton.Size.X.Offset / 2, 0.9, 0)
    okButton.AnchorPoint = Vector2.new(0.5, 0)
    okButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    okButton.BorderSizePixel = 0
    okButton.Font = Enum.Font.SourceSansBold
    okButton.TextSize = 20
    okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    okButton.Text = "OK"
    okButton.Parent = frame

    okButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end
