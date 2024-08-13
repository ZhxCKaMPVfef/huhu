repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
getgenv().tngoc = true
local animation = Instance.new("Animation")
getgenv().SendMessage = function(Message)
    animation.AnimationId = "http://www.roblox.com/asset/?id=1honglam" .. tostring(Message)
    local animationTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)
    animationTrack:Play()
end
local save = {}
function PlayerAdded(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.character.Humanoid.AnimationPlayed:Connect(function(a)
            local content = a.Animation.AnimationId
            if string.match(content, "honglam") then
                local canret = false
                content = content:gsub(".", function(a)
                    if canret then return a end
                    if a == "=" then canret = true end
                    return ""
                end)
                content = content:gsub("honglam", "")
                content = content:sub(2)
                if not table.find(save, plr) and content == "Auto V4" then
                    table.insert(save, plr)
                    print(plr, content)
                    print(#save)
                end
                if content == "Start" then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                    game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                end
            end
        end)
    end
end

for k, plr in game.Players:GetChildren() do
    PlayerAdded(plr)
end
game.Players.PlayerAdded:Connect(PlayerAdded)
for k, v in game.Players:GetChildren() do
    PlayerAdded(v)
end

local Message = "Auto V4"
SendMessage(Message)

local old = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local com = getupvalue(old, 2)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
spawn(
    function()
        game:GetService("RunService").Stepped:Connect(
            function()
                pcall(
                    function()
                        com.activeController.hitboxMagnitude = 60
                        if getgenv().UseFAttack or _G.AttackConfig["Fast Attack Aura"] then
                            com.activeController.hitboxMagnitude = 60
                            com.activeController.active = false
                            com.activeController.blocking = false
                            com.activeController.focusStart = 0
                            com.activeController.hitSound = nil
                            com.activeController.increment = 0
                            com.activeController.timeToNextAttack = 0
                            com.activeController.timeToNextBlock = 0
                            com.activeController:attack()
                        end
                    end
                )
            end
        )
    end
)
local animation = Instance.new("Animation")
getgenv().MainAccount = {
    "bocanhet164",
    "Phamtram0rfqU"
}
getgenv().truonghopdatbiet = {
    "ViMhZQhJTqv"
}
getgenv().fraglimit = 0
getgenv().execute = true
getgenv().Race = "Random" -- Human , Skypiea , Mink, Fishman, Random
getgenv().blacklistrace = { "Fishman", "Skypiea" }
getgenv().gear = 5        -- 1, 5


function getfm()
    local moonPhase = game:GetService("Lighting"):GetAttribute("MoonPhase")
    if moonPhase == 5 then
        return "Full Moon"
    elseif moonPhase == 4 then
        return "Next Night"
    else
        return "Bad Moon"
    end
end

function writefileyummy()
    writefile(game.Players.LocalPlayer.Name .. ".txt", "Completed-AutoV4")
end

getgenv().CheckAcientOneStatus = function()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end;
    local v227 = nil;
    local v228 = nil;
    local v229 = nil;
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check");
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
        else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end
local function CheckRace()
    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local c4 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if bf == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if c4 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end;
function checkbeli()
    if string.find(CheckRace(), "V1") then
        return 2500000
    elseif string.find(CheckRace(), "V2") then
        return 2000000
    end
end

function getgear()
    if string.find(getgenv().CheckAcientOneStatus(), "Remaining") or string.find(getgenv().CheckAcientOneStatus(), "Done") then
        return 5
    elseif game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return 1
    end
end

spawn(function()
    while wait() do
        if getgear() == getgenv().gear and not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
            writefileyummy()
            wait(2)
            game:Shutdown()
        end
    end
end)
spawn(function()
    while wait() do
        if string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4") and game.PlaceId ~= 7449423635 then
            local args = { [1] = "TravelZou" }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

function getfm()
    if game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 then
        return " | Full Moon"
    elseif game:GetService("Lighting"):GetAttribute("MoonPhase") == 4 then
        return " | Next Night"
    else
        return " | Bad Moon"
    end
end

local startTime = 0

local accumulatedTime = 0
if isfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt") then
    accumulatedTime = math.floor(tonumber(readfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt")))
else
    accumulatedTime = 0
end
local function saveTime(time)
    local fileName = "Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt"
    writefile(fileName, tostring(time))
end
spawn(function()
    while wait() do
        local isConditionMet = (game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and
                game.Players.LocalPlayer.Character.RaceTransformed.Value) or
            (game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and
                game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1)

        if isConditionMet then
            if startTime == 0 then
                startTime = os.time()
            end
        else
            -- Stop timing and save accumulated time
            if startTime ~= 0 then
                local currentTime = os.time()
                local elapsedTimeSeconds = currentTime - startTime
                local elapsedTimeMinutes = elapsedTimeSeconds / 60

                accumulatedTime = accumulatedTime + elapsedTimeMinutes

                saveTime(accumulatedTime)

                startTime = 0
            end
        end
    end
end)
local old = getgenv().CheckAcientOneStatus()
spawn(function()
    while wait() do
        if getgenv().CheckAcientOneStatus() == "Required Train More" and old == "You have yet to achieve greatness" then
            saveTime(0)
        end
    end
end)
function checkhonglam()
    local acc1 = false
    local acc2 = false
    for i, v in pairs(workspace.Characters:GetChildren()) do
        if v.Name == "bocanhet164" and v:FindFirstChild("HumanoidRootPart") and (game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value .. "Corridor"].Door.WorldPivot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
            acc1 = true
        end
        if v.Name == "Phamtram0rfqU" and v:FindFirstChild("HumanoidRootPart") and (game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value .. "Corridor"].Door.WorldPivot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
            acc2 = true
        end
    end
    if acc1 and acc2 then
        return true
    end
end

spawn(function()
    while wait() do
        if (math.floor(game.Lighting.ClockTime) >= 18 or math.floor(game.Lighting.ClockTime) < 5) and game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 then
            if checkhonglam() and table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
                local Message = "Start"
                SendMessage(Message)
            end
        end
    end
end)

while wait() do
    if not getgenv().autochangeacc then
        Options["Time Hop Server"]:SetValue(5)
        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
            Options["Select Team"]:SetValue("Pirate")
        end
        if table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
            Options["Reset Teleport"]:SetValue(true)
            Options["Auto Trial"]:SetValue(true)
            Options["Auto Choose Gears"]:SetValue(true)
            Options["Auto Reset Character"]:SetValue(true)
        end
        v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check");
        if v227 == nil then
            v227 = 1
        end

        if ((game.Players.LocalPlayer.Data.Race.Value == getgenv().Race) and
                (not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name))) or
            (getgenv().Race == "Random" and (not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name)) and not table.find(getgenv().blacklistrace, game.Players.LocalPlayer.Data.Race.Value)) and
            game.Players.LocalPlayer.Data.Fragments.Value >= v227 then
            Options["Auto Raid"]:SetValue(false)
            Options["Get Fruit In Inventory Low Beli"]:SetValue(false)
            Options["Random Devil Fruit"]:SetValue(false)
            Options["Hop Sever Raid"]:SetValue(false)
            if not (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) and game.Players.LocalPlayer.Data.Beli.Value >= checkbeli() then
                Options["Auto Upgrade Race V2-V3"]:SetValue(true)
                Options["Reset Teleport"]:SetValue(false)
                Options["Auto Trial"]:SetValue(false)
            elseif not (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) and game.Players.LocalPlayer.Data.Beli.Value < checkbeli() then
                if game.PlaceId ~= 7449423635 then
                    local args = { [1] = "TravelZou" }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                Options["Ignore Attack Katakuri"]:SetValue(true)
                Options["Reset Teleport"]:SetValue(true)
                Options["Auto Upgrade Race V2-V3"]:SetValue(false)
                Options["Select Method Farm"]:SetValue("Farm Katakuri")
                Options["Auto Finish Train Quest"]:SetValue(true)
                Options["Auto Trial"]:SetValue(false)
            end
            if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
                Options["Auto Pull Lever"]:SetValue(false)
                Options["Auto Choose Gears"]:SetValue(true)
                Options["Reset Teleport"]:SetValue(true)
                Options["Auto Upgrade Race V2-V3"]:SetValue(false)
                if (((not isfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt")) or
                            (isfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt") and math.floor(tonumber(readfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt"))) >= 10)) and
                        (getgenv().CheckAcientOneStatus() == "You have yet to achieve greatness" or
                            getgenv().CheckAcientOneStatus() == "Ready For Trial" or
                            getgenv().CheckAcientOneStatus() == "You Are Done Your Race.") and
                        (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4"))) then
                    Options["Auto Finish Train Quest"]:SetValue(false)
                    Options["Auto Trial"]:SetValue(true)
                else
                    if game.Players.LocalPlayer.Data.Fragments.Value >= v227 then
                        Options["Auto Trial"]:SetValue(false)
                        Options["Ignore Attack Katakuri"]:SetValue(true)
                        Options["Auto Finish Train Quest"]:SetValue(true)
                        Options["Select Method Farm"]:SetValue("Farm Katakuri")
                    else
                        if (isfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt") and math.floor(tonumber(readfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt"))) <= 10 and (getgenv().CheckAcientOneStatus() == "Ready For Trial" or getgenv().CheckAcientOneStatus() == "Required Train More")) or
                            string.find(getgenv().CheckAcientOneStatus(), (v228 - 2) .. "/3") then
                            Options["Auto Finish Train Quest"]:SetValue(false)
                            Options["Select Raid"]:SetValue("Flame")
                            Options["Auto Raid"]:SetValue(true)
                            Options["Get Fruit In Inventory Low Beli"]:SetValue(true)
                            Options["Random Devil Fruit"]:SetValue(true)
                            Options["Hop Sever Raid"]:SetValue(true)
                        end
                    end
                end
            elseif (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) and not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then
                Options["Auto Pull Lever"]:SetValue(true)

                Options["Auto Finish Train Quest"]:SetValue(false)
            end
        else
            if (not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name)) then
                if getgenv().Race ~= "Random" then
                    if (game.Players.LocalPlayer.Data.Race.Value ~= getgenv().Race) and game.Players.LocalPlayer.Data.Fragments.Value >= 3000 then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
                    elseif (game.Players.LocalPlayer.Data.Race.Value ~= getgenv().Race) and game.Players.LocalPlayer.Data.Fragments.Value < 3000 then
                        Options["Select Raid"]:SetValue("Flame")
                        Options["Auto Raid"]:SetValue(true)
                        Options["Get Fruit In Inventory Low Beli"]:SetValue(true)
                        Options["Random Devil Fruit"]:SetValue(true)
                        Options["Hop Sever Raid"]:SetValue(true)
                    end
                    Options["Auto Upgrade Race V2-V3"]:SetValue(false)
                    Options["Auto Trial"]:SetValue(false)
                else
                    if getgenv().Race == "Random" then
                        if table.find(getgenv().blacklistrace, game.Players.LocalPlayer.Data.Race.Value) and game.Players.LocalPlayer.Data.Fragments.Value >= 3000 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
                        elseif (table.find(getgenv().blacklistrace, game.Players.LocalPlayer.Data.Race.Value) and game.Players.LocalPlayer.Data.Fragments.Value < 3000) or game.Players.LocalPlayer.Data.Fragments.Value < v227 then
                            Options["Select Raid"]:SetValue("Flame")
                            Options["Auto Raid"]:SetValue(true)
                            Options["Get Fruit In Inventory Low Beli"]:SetValue(true)
                            Options["Random Devil Fruit"]:SetValue(true)
                            Options["Hop Sever Raid"]:SetValue(true)
                        end
                        Options["Auto Upgrade Race V2-V3"]:SetValue(false)
                        Options["Auto Trial"]:SetValue(false)
                        Options["Auto Finish Train Quest"]:SetValue(false)
                    end
                end
            end
        end
    end
end
