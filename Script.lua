local ShindoBoosterV1 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Maya024/ShindoBoosterV1/main/GUI.lua'))()

local Window = ShindoBoosterV1:CreateWindow({
    Name = "Shindo Life booster V1",
    LoadingTitle = "♾️ Beta Script ♾️",
    LoadingSubtitle = "by Mays (Maya)",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, 
       FileName = "ShindoBoosterV1"
    },
    Discord = {
       Enabled = true,
       Invite = "UHv8TEQgND", 
       RememberJoins = true 
    },
    KeySystem = true, 
    KeySettings = {
       Title = "Booster V1 | Key",
       Subtitle = "The key is on our discord server",
       Note = "Discord link in Misc Tab!",
       FileName = "Booster V1 | Key", 
       SaveKey = true, 
       GrabKeyFromSite = true, 
       Key = {"https://pastebin.com/raw/UnFxjk5Y"},
       ResetKeyTimer = os.time()
    }
})

local LanguagesTab = Window:CreateTab("Languages", nil)
local LanguagesSection = LanguagesTab:CreateSection("Language settings")


-- Notification --

ShindoBoosterV1:Notify({
    Title = "Executed the script",
    Content = "Loaded Script.. Thank you for using!",
    Duration = 4,
    Image = nil,
    Actions = { 
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("Close Notification")
       end
    },
 },
 })


-- functions ---

function resetKey()
    while true do
        if os.difftime(os.time(), Window.KeySettings.ResetKeyTimer) >= 2*60*60 then
            Window.KeySettings.SaveKey = false
            Window.KeySettings.ResetKeyTimer = os.time()
        end
        os.execute("sleep "..tostring(1)) 
    end
end

coroutine.wrap(resetKey)()
