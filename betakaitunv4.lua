repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
local animation = Instance.new("Animation")

getgenv().SendMessage = function(Message)
    animation.AnimationId = "http://www.roblox.com/asset/?id=1cp" .. tostring(Message)
    if animation then
        local animationTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)
        animationTrack:Play()
    end
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
                    game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                    task.wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                end
            end
        end)
    end
end

for _, plr in ipairs(game.Players:GetPlayers()) do
    PlayerAdded(plr)
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

while wait() do
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        Options["Select Team"]:SetValue("Pirate")
    end
    if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then
        Options["Auto Pull Lever"]:SetValue(false)
        Options["Auto Choose Gears"]:SetValue(true)
        if not (string.find(CheckRace(), "V3") or string.find(CheckRace(), "V4")) then
            Options["Auto Upgrade Race V2-V3"]:SetValue(true)
        else
            Options["Auto Upgrade Race V2-V3"]:SetValue(false)
        end
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
    else
        Options["Auto Pull Lever"]:SetValue(true)
    end
end
