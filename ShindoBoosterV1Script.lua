local function createPlayerMenu(players)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local playerDropdown = Instance.new("ScreenGui")
    playerDropdown.Name = "PlayerDropdownGui"
    playerDropdown.Parent = playerGui

    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = "DropdownFrame"
    dropdownFrame.Size = UDim2.new(0, 200, 0, 30)
    dropdownFrame.Position = UDim2.new(0.5, -100, 0.5, -15)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    dropdownFrame.BorderSizePixel = 2
    dropdownFrame.BorderColor3 = Color3.fromRGB(150, 150, 150)
    dropdownFrame.Parent = playerDropdown

    local dropdownLabel = Instance.new("TextLabel")
    dropdownLabel.Name = "DropdownLabel"
    dropdownLabel.Size = UDim2.new(1, 0, 1, 0)
    dropdownLabel.Position = UDim2.new(0, 0, 0, 0)
    dropdownLabel.Text = "Select a player:"
    dropdownLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    dropdownLabel.BackgroundTransparency = 1
    dropdownLabel.Font = Enum.Font.SourceSansBold
    dropdownLabel.TextSize = 14
    dropdownLabel.Parent = dropdownFrame

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Name = "DropdownButton"
    dropdownButton.Size = UDim2.new(1, 0, 1, 0)
    dropdownButton.Position = UDim2.new(0, 0, 1, 0)
    dropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.BorderSizePixel = 0
    dropdownButton.Text = "Click to select"
    dropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    dropdownButton.TextScaled = true
    dropdownButton.Parent = dropdownFrame

    local dropdownList = Instance.new("Frame")
    dropdownList.Name = "DropdownList"
    dropdownList.Size = UDim2.new(1, 0, 0, 0)
    dropdownList.Position = UDim2.new(0, 0, 1, 0)
    dropdownList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dropdownList.BorderSizePixel = 2
    dropdownList.BorderColor3 = Color3.fromRGB(150, 150, 150)
    dropdownList.Visible = false
    dropdownList.Parent = dropdownFrame

    for _, player in ipairs(players) do
        local dropdownItem = Instance.new("TextButton")
        dropdownItem.Name = player.Name
        dropdownItem.Size = UDim2.new(1, 0, 0, 30)
        dropdownItem.Position = UDim2.new(0, 0, 0, 30 * #dropdownList:GetChildren())
        dropdownItem.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        dropdownItem.BorderSizePixel = 0
        dropdownItem.Text = player.Name
        dropdownItem.TextColor3 = Color3.fromRGB(0, 0, 0)
        dropdownItem.Font = Enum.Font.SourceSans
        dropdownItem.TextSize = 14
        dropdownItem.Parent = dropdownList

        dropdownItem.MouseButton1Click:Connect(function()
            dropdownButton.Text = player.Name
            dropdownList.Visible = false

            getgenv().Nickname = player.Name

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
            wait(6)
            local TeleportService = game:GetService("TeleportService")
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
            
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
                wait(2)
                humanoid.PlatformStand = false
            end
        end)
    end

    dropdownButton.MouseButton1Click:Connect(function()
        dropdownList.Visible = not dropdownList.Visible
    end)

    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function update(input)
        if dragging then
            local delta = input.Position - dragStart
            dropdownFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    dropdownFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = dropdownFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dropdownFrame.InputChanged:Connect(function(input)
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
repeat wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character
wait(1.5)

local examplePlayers = game.Players:GetPlayers()

createPlayerMenu(examplePlayers)
