repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") 
repeat wait() until  game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
function CheckAcientOneStatus()
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

while wait() do
    if string.find(string.find(CheckRace(), "V1") then 
            Options["Reset Teleport"]:SetValue(false)
        else 
            Options["Reset Teleport"]:SetValue(true)
    end
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        Options["Select Team"]:SetValue("Pirate")
    end
    if not (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) and game.Players.LocalPlayer.Data.Beli.Value >= checkbeli() then
        Options["Auto Upgrade Race V2-V3"]:SetValue(true)
        Options["Start Farm"]:SetValue(false)
    elseif not (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) and game.Players.LocalPlayer.Data.Beli.Value < checkbeli() then
        if game.PlaceId ~= 7449423635 then
            local args = { [1] = "TravelZou" }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        Options["Auto Upgrade Race V2-V3"]:SetValue(false)
        Options["Select Method Farm"]:SetValue("Farm Katakuri")
        Options["Start Farm"]:SetValue(true)
        Options["Auto Trial"]:SetValue(false)
        Options["Ignore Attack Katakuri"]:SetValue(true)
    end
    if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
        Options["Auto Pull Lever"]:SetValue(false)
        Options["Auto Choose Gears"]:SetValue(true)
        if (CheckAcientOneStatus() == "You have yet to achieve greatness" or CheckAcientOneStatus() == "Ready For Trial" or CheckAcientOneStatus() == "You Are Done Your Race.") and (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
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
        Options["Auto Upgrade Race V2-V3"]:SetValue(false)
    end
end
