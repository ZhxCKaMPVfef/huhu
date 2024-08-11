repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
local sea3 = 7449423635
getgenv().executed = true
function checkhavegod()
    return game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
end

function checkhavetushita()
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Type == "Sword" and v.Name == "Tushita" then
            return true
        end
    end
end

function checkcdk()
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Type == "Sword" and v.Name == "Cursed Dual Katana" then
            return true
        end
    end
end

function checkAlucard()
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == "Alucard Fragment" and v.Count == 5 then
            return true
        end
    end
end

function getinfoall()
    local res = request({
        Url = link .. "/boss",
        Method = "GET",
    })
    local data = game:GetService("HttpService"):JSONDecode(res.Body)
    return data
end

function tptushita()
    local allData = getinfoall()
    if #allData > 1 then
        local player = string.split(allData[#allData].Players, "/")
        local jobid = allData[#allData].JobId
        local boss = allData[#allData].Boss
        print(boss, jobid, player[1])
        if tonumber(player[1]) <= 11 and boss == "rip_indra True Form" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(7449423635, allData[#allData].JobId,
                game.Players.LocalPlayer)
        end
    else
        print("Dont Have Server")
    end
end

function tpfinal()
    local allData = getinfoall()
    if #allData > 1 then
        local player = string.split(allData[#allData].Players, "/")
        local jobid = allData[#allData].JobId
        local boss = allData[#allData].Boss
        print(boss, jobid, player[1])
        if tonumber(player[1]) <= 11 and boss == "Soul Reaper" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(7449423635, allData[#allData].JobId,
                game.Players.LocalPlayer)
        end
    else
        print("Dont Have Server")
    end
end

while wait() do
    if checkhavegod() and not checkhavetushita() then
        if not game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or not game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
            tptushita()
        end
    end
    if checkhavegod() and checkhavetushita() and not checkcdk() and checkAlucard() then
        if not game.Workspace.Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or not game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
            tpfinal()
        end
    end
end
