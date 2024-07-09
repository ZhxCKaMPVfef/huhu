repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
local animation = Instance.new("Animation")
getgenv().MainAccount = {
    "bocanhet164",
    "Phamtram0rfqU"
}
getgenv().execute = true
getgenv().Race = "Random" -- Human , Skypiea , Mink, Fishman, Random
getgenv().blacklistrace = { "Fishman", "Skypiea" }
getgenv().gear = 5        -- 5
getgenv().SendMessage = function(Message)
    animation.AnimationId = "http://www.roblox.com/asset/?id=1cp" .. tostring(Message)
    local animationTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)
    animationTrack:Play()
    wait(60)
    animationTrack:Stop()
    animationTrack = nil
end
local acc = {}
local old = #acc

function PlayerAdded(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.AnimationPlayed:Connect(function(a)
            local aniid = a.Animation.AnimationId
            if string.match(aniid, "cp") then
                local canret = false
                aniid = aniid:gsub(".", function(a)
                    if canret then return a end
                    if a == "=" then canret = true end
                    return ""
                end)
                aniid = aniid:gsub("cp", "")
                aniid = aniid:sub(2)
                if aniid == "Banana Auto V4 Made By Honglamx" then
                    if not table.find(acc, plr) then
                        print(plr, aniid)
                        table.insert(acc, plr)
                    end
                end
                if aniid == "Enable Race" then
                    print(plr, aniid)
                    game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                    task.wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                end
            end
        end)
    end
end

spawn(function()
    while wait() do
        if old > #acc then
            for i, v in next, acc do
                print(i, v)
            end
            old = #acc
        end
    end
end)
spawn(function()
    while wait() do
        local Message = "Banana Auto V4 Made By Honglamx"
        SendMessage(Message)
    end
end)

local accenable = {}

function getcountplayer()
    local saverace = {}
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local templePosition = workspace.Map["Temple of Time"].SpawnRoom.WorldPivot.Position
            if (plr.Character.HumanoidRootPart.Position - templePosition).Magnitude <= 3000 then
                local raceValue = plr.Data and plr.Data.Race and plr.Data.Race.Value
                if raceValue and not table.find(saverace, raceValue) then
                    table.insert(saverace, raceValue)
                end
            end
        end
    end
    return #saverace
end

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

spawn(function()
    while wait() do
        wait()
        local templePosition = workspace.Map["Temple of Time"].SpawnRoom.WorldPivot.Position
        for _, character in ipairs(workspace.Characters:GetChildren()) do
            if character:FindFirstChild("HumanoidRootPart") then
                local activationRing = character.HumanoidRootPart:FindFirstChild("ActivationRing")
                local activationRingRefresh = character.HumanoidRootPart:FindFirstChild("ActivationRingRefresh")
                if activationRing and (character.HumanoidRootPart.Position - templePosition).Magnitude <= 3000 then
                    table.insert(accenable, character.Name)
                    print(character.Name .. " enabled race, count:", #accenable)
                elseif table.find(accenable, character.Name) then
                    if (activationRingRefresh and (character.HumanoidRootPart.Position - templePosition).Magnitude <= 3000) or character.Humanoid.Health <= 0 then
                        local indicesToRemove = {}
                        for i, name in ipairs(accenable) do
                            if name == character.Name then
                                table.insert(indicesToRemove, i)
                                print(character.Name .. " refreshed race, count:", #accenable)
                            end
                        end
                        for i = #indicesToRemove, 1, -1 do
                            table.remove(accenable, indicesToRemove[i])
                        end
                    end
                end
            end
        end
    end
end)
--[[
elseif table.find(accenable, plr.Name) or (getfm() ~= "Full Moon" or (currentTime >= 5 and currentTime < 18)) or getcountplayer() < 3 then
                        print("Current count:", #accenable)
                        ]]
spawn(function()
    while wait() do
        wait()
        pcall(function()
            for _, plr in ipairs(game.Players:GetPlayers()) do
                if plr:FindFirstChild("Data") then
                    local currentTime = math.floor(game:GetService("Lighting").ClockTime)
                    local fullMoonCondition = getfm() == "Full Moon" and (currentTime >= 18 or currentTime < 5)
                    if not table.find(accenable, plr.Name) and fullMoonCondition and getcountplayer() >= 3 then
                        local Message = "Enable Race"
                        SendMessage(Message)
                    end
                end
            end
        end)
    end
end)

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
while wait() do
    Options["Time Hop Server"]:SetValue(5)
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        Options["Select Team"]:SetValue("Pirate")
    end
    if table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
        Options["Reset Teleport"]:SetValue(true)
        Options["Auto Trial"]:SetValue(true)
        Options["Auto Choose Gears"]:SetValue(true)
    end

    if ((game.Players.LocalPlayer.Data.Race.Value == getgenv().Race) and (not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name))) or (getgenv().Race == "Random" and (not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name))) then
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
            Options["Start Farm"]:SetValue(true)
            Options["Auto Trial"]:SetValue(false)
        end
        if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
            Options["Auto Pull Lever"]:SetValue(false)
            Options["Auto Choose Gears"]:SetValue(true)
            Options["Reset Teleport"]:SetValue(true)
            Options["Auto Upgrade Race V2-V3"]:SetValue(false)
            if (getgenv().CheckAcientOneStatus() == "You have yet to achieve greatness" or getgenv().CheckAcientOneStatus() == "Ready For Trial" or getgenv().CheckAcientOneStatus() == "You Are Done Your Race.") and (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
                Options["Start Farm"]:SetValue(false)
                Options["Auto Trial"]:SetValue(true)
            else
                Options["Auto Trial"]:SetValue(false)
                Options["Ignore Attack Katakuri"]:SetValue(true)
                Options["Auto Buy Gear"]:SetValue(true)
                Options["Auto Turn On V4"]:SetValue(true)
                Options["Select Method Farm"]:SetValue("Farm Katakuri")
                Options["Start Farm"]:SetValue(true)
            end
        elseif (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) and not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then
            Options["Auto Pull Lever"]:SetValue(true)

            Options["Start Farm"]:SetValue(false)
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
                    elseif table.find(getgenv().blacklistrace, game.Players.LocalPlayer.Data.Race.Value) and game.Players.LocalPlayer.Data.Fragments.Value < 3000 then
                        Options["Select Raid"]:SetValue("Flame")
                        Options["Auto Raid"]:SetValue(true)
                        Options["Get Fruit In Inventory Low Beli"]:SetValue(true)
                        Options["Random Devil Fruit"]:SetValue(true)
                        Options["Hop Sever Raid"]:SetValue(true)
                    end
                    Options["Auto Upgrade Race V2-V3"]:SetValue(false)
                    Options["Auto Trial"]:SetValue(false)
                end
            end
        end
    end
end
