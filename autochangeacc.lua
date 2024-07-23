repeat wait() until game:IsLoaded()
getgenv().autochangeacc = true
repeat wait() until game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat
    pcall(function()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
            if getgenv().Teams == "Marines" then
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
                    v.Function()
                end
            elseif getgenv().Teams == "Pirates" then
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do
                    v.Function()
                end
            else
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
                    v.Function()
                end
            end
        end
    end)
until game.Players.LocalPlayer.Team ~= nil
getgenv().fraglimit = 20000
getgenv().exeucteautochange = true
function getypeaccc()
    local havegod = false
    local beli = game.Players.LocalPlayer.Data.Beli.Value
    local frag = game.Players.LocalPlayer.Data.Fragments.Value
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) then
        havegod = true
    end
    --print(Res)
    local weapon = {}
    for i, v in next, game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory") do
        if v.Name == "Soul Guitar" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Cursed Dual Katana" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Mirror Fractal" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Valkyrie Helm" then
            table.insert(weapon, v.Name)
        end
    end
    if table.find(weapon, "Valkyrie Helm") and table.find(weapon, "Mirror Fractal") and havegod then
        if table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 25000000 and frag >= getgenv().fraglimit then
            return "GOD CDK SGT MM"
        elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 25000000 and frag >= getgenv().fraglimit then
            return "GOD CDK MM"
        elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 25000000 and frag >= getgenv().fraglimit then
            return "GOD SGT MM"
        elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 25000000 and frag >= getgenv().fraglimit then
            return "GOD MM"
        end
    else
        return "Khong Du Dieu Kien"
    end
    -- print(table.concat(weapon, " , "))
end

function writefileyummy()
    writefile(game.Players.LocalPlayer.Name .. ".txt", getypeaccc())
end

writefileyummy()
print(getypeaccc())
