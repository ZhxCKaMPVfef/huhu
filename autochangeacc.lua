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
        if table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
            return "GOD CDK SGT MM".."Made By Honglamx"
        elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
            return "GOD CDK MM".."Made By Honglamx"
        elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
            return "GOD SGT MM".."Made By Honglamx"
        elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
            return "GOD MM".."Made By Honglamx"
        elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli <= 2500000 and frag <= getgenv().fraglimit then
            return "Khong Du Dieu Kien".."Made By Honglamx"
        end
    else
        return "Khong Du Dieu Kien".."Made By Honglamx"
    end
    print(table.concat(weapon, " , "))
end

function writefileyummy()
    writefile(game.Players.LocalPlayer.Name .. ".txt", tostring(getypeaccc()))
end

local url =
"https://discord.com/api/webhooks/1012948997884882956/OysNGuyFvGl7UVEAa_eZzNv72FlyXAS1xnsKCdi2ztD973Ud7OXTJLo3W1vuzsJY7Q6u"
function send(typeacc)
    local Message = {
        ["embeds"] = {
            {
                ["title"] =
                "Honglamx Account Checker",
                ["color"] = 16684576,
                ["fields"] = {
                    {
                        ["name"] = "Account Name",
                        ["value"] = "```" .. game.Players.LocalPlayer.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Type Acc:",
                        ["value"] = "```\n" .. typeacc .. "```"
                    },
                },
                ["footer"] = {
                    ["text"] = "Honglamx"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["thumbnail"] = {
                    ["url"] =
                    "https://cdn.discordapp.com/attachments/1017024488665264218/1262729537578471504/banner_server.jpg?ex=6697a806&is=66965686&hm=e0bd7cbb8460651cc19481bf516ede631dc881b52dcebd9ab54791c37d5dc893&"
                }
            }
        }
    }
    local DataCallBack = request({
        Url = url,
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
    })
end

send(tostring(getypeaccc()))
writefileyummy()
print(getypeaccc())
