function getypeaccc()
    local havegod = false
    local beli = game.Players.LocalPlayer.Data.Beli.Value
    local frag = game.Players.LocalPlayer.Data.Fragments.Value
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) then
        havegod = true
    end
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
    if getgenv().checkv3 then
        if table.find(weapon, "Valkyrie Helm") and table.find(weapon, "Mirror Fractal") and havegod then
            if table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(getgenv().CheckRace(), "V3") then
                return "GOD CDK SGT MM Have V3"
            elseif table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(getgenv().CheckRace(), "V3") then
                return "GOD CDK SGT MM Don't V3"
            elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(getgenv().CheckRace(), "V3") then
                return "GOD CDK MM Have V3"
            elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(getgenv().CheckRace(), "V3") then
                return "GOD CDK MM Don't V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(getgenv().CheckRace(), "V3") then
                return "GOD SGT MM Have V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(getgenv().CheckRace(), "V3") then
                return "GOD SGT MM Don't V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(getgenv().CheckRace(), "V3") then
                return "GOD MM Have V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(getgenv().CheckRace(), "V3") then
                return "GOD MM Don't Have V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and (beli <= 2500000 or frag <= getgenv().fraglimit) then
                return "Khong Du Dieu Kien"
            end
        else
            return "Khong Du Dieu Kien"
        end
    end
end
print(getypeaccc())
