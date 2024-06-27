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
local d = 0
function getnumgear()
    local c = 0
    for i, v in next, game:GetService("Players").LocalPlayer.Data.Race:GetChildren() do
        if v.Name ~= "Evolved" then
            c = c + 1
        end
    end
    return c
end

spawn(function()
    while wait() do
        if
            game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and
            game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and
            not game.Players.LocalPlayer.Character.RaceTransformed.Value
        then
            d = d + 1
            repeat
                wait()
            until game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy")
        end
    end
end)
function checkpoint()
    if not isfolder("Banana Cat Hub") then
        makefolder("Banana Cat Hub")
    end
    writefile("Banana Cat Hub" .. "/" .. game.Players.LocalPlayer.Name .. ".txt", "Farm Gear 1 Stack Done")
end

--//checkpoint()
spawn(function()
    while wait() do
        if getnumgear() == 1 and d >= 9 and CheckAcientOneStatus() == "Ready For Trial" then
            checkpoint()
        end
    end
end)
function checkcantrial()
    if getnumgear() == 1 then
        if isfile("Banana Cat Hub" .. "/" .. game.Players.LocalPlayer.Name .. ".txt") or readfile("Banana Cat Hub" .. "/" .. game.Players.LocalPlayer.Name .. ".txt") == "Farm Gear 1 Stack Done" then
            return true
        end
    elseif getnumgear() ~= 1 then
        if (CheckAcientOneStatus() == "You have yet to achieve greatness" or CheckAcientOneStatus() == "Ready For Trial" or CheckAcientOneStatus() == "You Are Done Your Race.") and (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
            return true
        end
    end
end
print(checkcantrial())
