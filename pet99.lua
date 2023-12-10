print("HI")
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()
local FolderName = "Banana Hub"
local ConfigFile = game.Players.LocalPlayer.Name.."-Pet99.json"
local function LoadPreset()
    return game:GetService("HttpService"):JSONDecode(readfile(FolderName .. "/"  .. ConfigFile))
end
local function SavePreset()
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
if isfile(FolderName .. "/"  .. ConfigFile) then
local Decode = LoadPreset()
for i,v in pairs(Decode) do
    Config[i] = v
end
elseif  not isfile(FolderName .. "/"  .. ConfigFile) then
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
local Window =
    OrionLib:MakeWindow(
    {
        Name = "Banana Hub",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = FolderName,
        IntroEnabled = false,
        IntroText = "Your Mom Fat",
        IntroIcon = "rbxassetid://5245791567",
        Icon = "rbxassetid://5245791567"
    }
)
local function mapselect()
    local map = {}
    for i,v in pairs(workspace.Map:GetChildren()) do  
        if not table.find(map,v) then 
            table.insert(map,v) 
        end
    end
  return map
end
local MainTab =
    Window:MakeTab(
    {
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)
MainTab:AddDropdown({
    Name = "Map Select",
    Default = Config.concac,
    Options = mapselect(),
    Callback = function(a)
        Config.concac = a
        SavePreset()

    end
})
