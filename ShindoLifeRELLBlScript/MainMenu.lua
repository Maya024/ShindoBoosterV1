local function createMainMenu()
    local mainMenu = Instance.new("ScreenGui")
    mainMenu.Name = "MainMenu"
    mainMenu.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local mainMenuFrame = Instance.new("Frame")
    mainMenuFrame.Name = "MainMenuFrame"
    mainMenuFrame.Size = UDim2.new(0, 200, 0, 200)
    mainMenuFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
    mainMenuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainMenuFrame.BorderSizePixel = 0
    mainMenuFrame.Parent = mainMenu

    local spinsRCsButton = Instance.new("TextButton")
    spinsRCsButton.Name = "SpinsRCsButton"
    spinsRCsButton.Size = UDim2.new(1, 0, 0, 30)
    spinsRCsButton.Position = UDim2.new(0, 0, 0, 0)
    spinsRCsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    spinsRCsButton.BorderSizePixel = 0
    spinsRCsButton.Font = Enum.Font.SourceSans
    spinsRCsButton.TextSize = 14
    spinsRCsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    spinsRCsButton.Text = "RC / Spins Giver"
    spinsRCsButton.Parent = mainMenuFrame

    spinsRCsButton.MouseButton1Click:Connect(function()
        local success, script = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/Maya024/ShindoBoosterV1/ShindoLife2/ShindoLifeRELLBlScript/ShindoBoosterV1Script/ShindoBoosterV1Script.lua"))
        end)

        if success and script then
            script() 
            mainMenu:Destroy()
        else
            print("Fehler beim Laden des Skripts") 
        end
    end)

    -- Functions ---

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainMenuFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    mainMenuFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainMenuFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    mainMenuFrame.InputChanged:Connect(function(input)
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

createMainMenu()
