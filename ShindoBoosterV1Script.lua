--[[

ShindoBoosterV1 Interface Beta
Update: 1.9
by Mays (Maya) + nikenoez

Mays (Maya) + nikenoez | Designing + Programming

]]

local function updatePlayerMovement(player, shouldDisable)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if shouldDisable then
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            humanoid.HipHeight = -5 
        else
            humanoid.WalkSpeed = 16 
            humanoid.JumpPower = 50 
            humanoid.HipHeight = 0
        end
    end
end


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
                playerButton.Text = player.Name
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



getgenv().toggle25 = true
getgenv().Nickname = "PlayerName"
repeat wait() until game:GetService("Players").PlayerAdded and getgenv().toggle25 == true
wait(1.5)

local examplePlayers = game.Players:GetPlayers()

createPlayerMenu(examplePlayers)
