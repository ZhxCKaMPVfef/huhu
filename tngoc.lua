repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
--https://raw.githubusercontent.com/hlamx/huhu/master/data.lua
spawn(function()
    while wait() do
        pcall(function()
            local tickold = tick()
            repeat
                wait()
            until tick() - tickold >= 120
            if not game.CoreGui:FindFirstChild("Banana Cat Hub Btn") then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId,
                    game.Players.LocalPlayer)
            end
        end)
    end
end)
local url =
"https://discord.com/api/webhooks/1278308335615086592/iD5VdibeqTg9mTb9GEBD0VohJ4bm-BlduGodOhm_o4mFwKnUnBv-4coWViAC1QPSvEzG"
local urldone =
"https://discord.com/api/webhooks/1278309087557189654/FTLMEZoloU8YlSkOaRJs9zuAoXwQQAdcyxA5vfDaal1j_PJLD0i7-ENlQxxa3WM8DDuL"
repeat wait() until game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
getgenv().tngoc = true
getgenv().pass = {}
getgenv().save = {}
local animation = Instance.new("Animation")

getgenv().SendMessage = function(Message)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        animation.AnimationId = "http://www.roblox.com/asset/?id=1honglam" .. tostring(Message)
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
    else
        error("Player or Humanoid not found.")
    end
end

getgenv().PlayerAdded = function(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.AnimationPlayed:Connect(function(a)
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
                if content == "Auto V4" then
                    if not table.find(getgenv().save, plr) then
                        table.insert(getgenv().save, plr)
                        task.wait(1)
                        print(plr.Name, content)
                        SendMessage(content)
                    end
                    if not table.find(getgenv().pass, plr) then
                        table.insert(getgenv().pass, plr)
                        task.wait(1)
                        print(#getgenv().save, #getgenv().pass)
                    end
                elseif content == "Start" then
                    game.ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility")
                elseif content == "Rejoin" then
                    if not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId,
                            game.Players.LocalPlayer)
                    end
                end
            end
        end)
    end
end

for _, plr in pairs(game.Players:GetChildren()) do
    getgenv().PlayerAdded(plr)
end

game.Players.PlayerAdded:Connect(getgenv().PlayerAdded)

game.Players.PlayerRemoving:Connect(function(v)
    if table.find(getgenv().save, v) then
        table.remove(getgenv().save, table.find(getgenv().save, v))
        print("Players: " .. v.Name .. " Left | " .. #getgenv().save)
        if table.find(getgenv().pass, v) then
            table.remove(getgenv().pass, table.find(getgenv().pass, v))
            print("SizePass: " .. #getgenv().pass)
        end
    end
end)

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

local status = ""
function setgear()
    if getgenv().gear == 1 then
        return "1 Gear"
    elseif getgenv().gear == 5 then
        return "Full Gear"
    end
end

function writefileyummy()
    writefile(game.Players.LocalPlayer.Name .. ".txt", "Completed-AutoV4 " .. setgear())
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
local plr = game.Players.LocalPlayer
function sendstatus(log)
    local Message = {
        ['username'] = "Hyper Store Log",
        ["avatar_url"] =
        "https://media.discordapp.net/attachments/1278309066459840523/1278310293243691142/456398814_1008374461017815_6795853758068568733_n.png?ex=66d056bb&is=66cf053b&hm=6db3f5359cd3a04f9926f5baa39d31d0a73a22b1b7a7007c8d45a6baefd0ed37&=&format=webp&quality=lossless",

        ["embeds"] = {
            {
                ["title"] =
                "<a:moonwave:1258479659994058893> Kaitun v4 Log Status <a:moonwave:1258479659994058893> ",
                ["color"] = 15401988,
                ["fields"] = {
                    {
                        ["name"] = "Name Account:",
                        ["value"] = "```" .. plr.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Updated Log:",
                        ["value"] = "```\n" .. log .. "```"
                    },
                },
                ["footer"] = {
                    ["text"] = "Hyper Store"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["thumbnail"] = {
                    ["url"] =
                    "https://images-ext-1.discordapp.net/external/OACQKuFKdr_SH9Cmm7E3WUjuU8iRNRBm-yOeeV-5vtg/%3Fsize%3D4096/https/cdn.discordapp.com/icons/1253040905825292328/a_8262eee131289208eb5173b167e7011f.gif"
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

local sendlog = false
function senddone(log)
    local Message = {
        ['username'] = "Hyper Store Log",
        ["content"] = "@everyone",
        ["avatar_url"] =
        "https://media.discordapp.net/attachments/1278309066459840523/1278310293243691142/456398814_1008374461017815_6795853758068568733_n.png?ex=66d056bb&is=66cf053b&hm=6db3f5359cd3a04f9926f5baa39d31d0a73a22b1b7a7007c8d45a6baefd0ed37&=&format=webp&quality=lossless",

        ["embeds"] = {
            {
                ["title"] =
                "<a:moonwave:1258479659994058893> Kaitun v4 Log Status <a:moonwave:1258479659994058893> ",
                ["color"] = 15401988,
                ["fields"] = {
                    {
                        ["name"] = "Name Account:",
                        ["value"] = "```" .. plr.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Updated Log:",
                        ["value"] = "```\n" .. log .. "```"
                    },
                },
                ["footer"] = {
                    ["text"] = "Hyper Store"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["thumbnail"] = {
                    ["url"] =
                    "https://images-ext-1.discordapp.net/external/OACQKuFKdr_SH9Cmm7E3WUjuU8iRNRBm-yOeeV-5vtg/%3Fsize%3D4096/https/cdn.discordapp.com/icons/1253040905825292328/a_8262eee131289208eb5173b167e7011f.gif"
                }
            }
        }
    }
    local DataCallBack = request({
        Url = urldone,
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
    })
end

local oldwebhook = getgenv().CheckAcientOneStatus()
spawn(function()
    while wait() do
        if getgenv().CheckAcientOneStatus() ~= oldwebhook and not table.find(getgenv().MainAccount, plr.Name) then
            if getgenv().CheckAcientOneStatus() ~= "Ready For Trial" and not string.find(getgenv().CheckAcientOneStatus(), "Can Buy Gear") and not string.find(CheckAcientOneStatus(), "Remaining ") then
                sendstatus(getgenv().CheckAcientOneStatus())
                task.wait(1)
                oldwebhook = getgenv().CheckAcientOneStatus()
            end
        end
    end
end)
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

local passSet = {}
function size()
    local trueCount = 0
    for _, value in pairs(passSet) do
        if value == true then
            trueCount = trueCount + 1
        end
    end
    return trueCount
end

spawn(function()
    while wait() do
        for _, v in pairs(game.Players:GetChildren()) do
            if table.find(save, v) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
                local humanoidRootPart = v.Character.HumanoidRootPart
                local playerName = v.Name
                if humanoidRootPart:FindFirstChild("ActivationRing") and passSet[playerName] then
                    passSet[playerName] = nil
                    print("Removed: " .. playerName .. " from pass | Size: " .. size())
                end

                -- Kiểm tra ActivationRingRefresh, tử vong hoặc thêm vào 'pass'
                if ((humanoidRootPart:FindFirstChild("ActivationRingRefresh") or v.Character.Humanoid.Health <= 0) and not passSet[playerName]) then
                    passSet[playerName] = true
                    task.wait(1)
                    print("Inserted: " .. playerName .. " to pass | Size: " .. size())
                end
            end
        end
    end
end)




spawn(function()
    while wait() do
        if getgear() == getgenv().gear and not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
            writefileyummy()
            senddone("Done Account: " .. setgear())
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
function crawlfm()
    local res = request({
        Url = link .. "/getmoonstatus",
        Method = "GET",
    })
    local data = game:GetService("HttpService"):JSONDecode(res.Body)
    return data
end

function datamain2()
    local res = request({
        Url = link .. "/datamain2",
        Method = "GET",
    })
    local data = game:GetService("HttpService"):JSONDecode(res.Body)
    return data
end

function postmoonmain2(jobid)
    local data = {
        JobId = jobid
    }
    local res = request({
        Url = link .. "/postdatamain2",
        Method = "POST",
        Body = game:GetService("HttpService"):JSONEncode(data),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    })
end

function postdataclone(jobid)
    local data = {
        JobId = jobid
    }
    local res = request({
        Url = link .. "/postdatamoon",
        Method = "POST",
        Body = game:GetService("HttpService"):JSONEncode(data),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    })
end

function dataclone()
    local res = request({
        Url = link .. "/getdatamoon",
        Method = "GET",
    })
    local data = game:GetService("HttpService"):JSONDecode(res.Body)
    return data
end

local plr = game.Players.LocalPlayer
spawn(function()
    while wait() do
        if game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 and game.Players.NumPlayers == game.Players.MaxPlayers and #save >= 2 and not table.find(getgenv().MainAccount, plr.Name) then
            if math.floor(game.Lighting.ClockTime) >= 12 and math.floor(game.Lighting.ClockTime) <= 17 then
                local Message = "Rejoin"
                SendMessage(Message)
            end
        end
    end
end)
local old = tick()
spawn(function()
    while wait() do
        if plr.Name == "bocanhet164" then
            if game:GetService("Lighting"):GetAttribute("MoonPhase") ~= 5 or (math.floor(game.Lighting.ClockTime) <= 11 and math.floor(game.Lighting.ClockTime) >= 5) or (tick() - old >= 120 and not workspace.Characters:FindFirstChild("Phamtram0rfqU") and math.floor(game.Lighting.ClockTime) >= 18) then
                local allData = crawlfm()
                if #allData > 1 then
                    local player = string.split(allData[#allData].Players, "/")
                    if tonumber(player[1]) <= 9 then
                        if allData[#allData].Type == ":alarm_clock: Become Around :" then
                            if allData[#allData].Time == "6 Minute ( s )" or allData[#allData].Time == "5 Minute ( s )" then
                                postmoonmain2(allData[#allData].JobId)
                                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",
                                    allData[#allData].JobId)
                            end
                        end
                    end
                    if allData[#allData].Type == "WracMoon" then
                        if tonumber(allData[#allData].Players) <= 9 then
                            if math.floor(tonumber(allData[#allData].Time)) >= 12 and math.floor(tonumber(allData[#allData].Time)) <= 15 then
                                postmoonmain2(allData[#allData].JobId)
                                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",
                                    allData[#allData].JobId)
                            end
                        end
                    end
                end
            else
                postmoonmain2(game.JobId)
            end
        end
        if plr.Name == "Phamtram0rfqU" then
            if datamain2().JobId then
                if datamain2().JobId ~= game.JobId then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",
                        datamain2().JobId)
                else
                    postdataclone(datamain2().JobId)
                end
            end
        end
        if plr.Name ~= "Phamtram0rfqU" and plr.Name ~= "bocanhet164" then
            if dataclone().JobId and Options["Auto Trial"].Value then
                if dataclone().JobId ~= game.JobId then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",
                        dataclone().JobId)
                end
            end
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
local HttpService = game:GetService("HttpService")

local function fetchServerData(placeid)
    local url = getgenv().link .. "/get-server-data?placeid=" .. placeid
    local data = {} -- Có thể để trống hoặc thêm dữ liệu nếu cần

    local success, response = pcall(function()
        return request({
            Url = url,
            Method = "POST",
            Body = HttpService:JSONEncode(data),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        })
    end)

    if success and response.StatusCode == 200 then
        local result = HttpService:JSONDecode(response.Body)
        return result
    end
end
local placeId = tostring(game.PlaceId)
local serverData = fetchServerData(placeId)

function Teleport()
    local placeId = tostring(game.PlaceId)
    local serverData = fetchServerData(placeId)
    if serverData then
        print(serverData.players, serverData.jobid)

        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverData.jobid,
            game.Players.LocalPlayer)
    end
end

local old = getgenv().CheckAcientOneStatus()
spawn(function()
    while wait() do
        if not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
            if old == "Ready For Trial" or old == "You Are Done Your Race." then
                if not string.find(getgenv().CheckAcientOneStatus(), "Can Buy Gear") then
                    if old ~= getgenv().CheckAcientOneStatus() then
                        Teleport()
                        task.wait(5)
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().CheckAcientOneStatus() == "Required Train More" and old == "You have yet to achieve greatness" then
            saveTime(0)
        end
    end
end)

function function0(a)
    if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

function function01(tb)
    tb2 = 0
    for i, v in pairs(tb) do
        if v > tb2 then tb2 = v end
    end
    return tb2
end

function function1()
    local s = {}
    local s3 = false
    for _, t1 in pairs(game.Workspace.Enemies:GetChildren()) do
        if function0(t1) then
            for _, t2 in pairs(game.Workspace.Enemies:GetChildren()) do
                if function0(t2) and function0(t1) then
                    if (t2.HumanoidRootPart.Position - t1.HumanoidRootPart.Position).Magnitude < 350 then
                        if not s[t1.HumanoidRootPart.CFrame] then
                            s[t1.HumanoidRootPart.CFrame] = 1
                        else
                            s[t1.HumanoidRootPart.CFrame] = s[t1.HumanoidRootPart.CFrame] + 1
                        end
                    end
                end
            end
        end
    end
    local s2 = function01(s)
    for i, v in pairs(s) do
        if v == s2 then
            s3 = i
        end
    end
    return s3;
end

function sizepart(v)
    for i, k in next, v:GetDescendants() do
        if (k:IsA("Part") or k:IsA("MeshPart")) and k.CanCollide then
            k.CanCollide = false
        end
    end
    if not v.HumanoidRootPart:FindFirstChild("vando") and plr:DistanceFromCharacter(v.HumanoidRootPart.Position) <= 50 then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v
        lock.Name = "vando"
        lock.MaxForce = Vector3.new(0, 10000, 0)
        lock.Velocity = Vector3.new(0, 0, 0)
    end
end

local TargetBring
local PositionBring
function ValueMob(a)
    local b = 0
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v.Name == a.Name then
            b = b + 1
        end
    end
    return b
end

function BringMob(a)
    pcall(function()
        if TargetBring ~= a then
            TargetBring = a
            PositionBring = a.PrimaryPart.CFrame
        end
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == a.Name and a:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                v.PrimaryPart.CFrame = PositionBring
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.CFrame.Position).Magnitude <= 1000 then
                    sizepart(v)
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
    end)
end

spawn(function()
    while wait() do
        if Options["Auto Trial"].Value then
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                pcall(function()
                    repeat
                        BringMob(v)
                        v.Humanoid.Health = 0
                    until v.Humanoid.Health <= 0 or not v.Parent or not v or not Options["Auto Trial"].Value
                end)
            end
        end
    end
end)
function checkmain()
    local acc1 = false
    local acc2 = false
    for i, v in pairs(workspace.Characters:GetChildren()) do
        if v.Name == "bocanhet164" and v:FindFirstChild("HumanoidRootPart") and (game:GetService("Workspace").Map["Temple of Time"][game.Players[v.Name].Data.Race.Value .. "Corridor"].Door.WorldPivot.Position - v.HumanoidRootPart.Position).Magnitude < 10 then
            acc1 = true
        end
        if v.Name == "Phamtram0rfqU" and v:FindFirstChild("HumanoidRootPart") and (game:GetService("Workspace").Map["Temple of Time"][game.Players[v.Name].Data.Race.Value .. "Corridor"].Door.WorldPivot.Position - v.HumanoidRootPart.Position).Magnitude < 10 then
            acc2 = true
        end
    end
    if acc1 == true and acc2 == true then
        return true
    end
end

function checkclone()
    for i, v in pairs(workspace.Characters:GetChildren()) do
        if table.find(v.Name, save) and v:FindFirstChild("HumanoidRootPart") and (game:GetService("Workspace").Map["Temple of Time"][game.Players[v.Name].Data.Race.Value .. "Corridor"].Door.WorldPivot.Position - v.HumanoidRootPart.Position).Magnitude < 10 then
            return true
        end
    end
end

spawn(function()
    while wait() do
        for k, plr in game.Players:GetChildren() do
            PlayerAdded(plr)
        end
    end
end)

spawn(function()
    while wait() do
        if (math.floor(game.Lighting.ClockTime) >= 18 or math.floor(game.Lighting.ClockTime) < 5) and game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if checkmain() and game.Players.LocalPlayer.Name == "bocanhet164" and #pass >= 3 then
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
                    Options["Kill players When complete Trial"]:SetValue(true)
                    Options["Start Farm"]:SetValue(false)
                else
                    if game.Players.LocalPlayer.Data.Fragments.Value >= v227 then
                        Options["Auto Trial"]:SetValue(false)
                        Options["Ignore Attack Katakuri"]:SetValue(true)
                        Options["Auto Finish Train Quest"]:SetValue(true)
                        Options["Select Method Farm"]:SetValue("Farm Katakuri")
                    else
                        if (isfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt") and math.floor(tonumber(readfile("Debug Gear 1" .. game.Players.LocalPlayer.Name .. ".txt"))) <= 10 and (getgenv().CheckAcientOneStatus() == "Ready For Trial" or getgenv().CheckAcientOneStatus() == "Required Train More")) or
                            string.find(getgenv().CheckAcientOneStatus(), (v228 - 2) .. "/3") then
                            Options["Ignore Attack Katakuri"]:SetValue(false)
                            Options["Start Farm"]:SetValue(true)
                            Options["Select Method Farm"]:SetValue("Farm Katakuri")
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
                        Options["Ignore Attack Katakuri"]:SetValue(false)
                        Options["Start Farm"]:SetValue(true)
                        Options["Select Method Farm"]:SetValue("Farm Katakuri")
                    end
                    Options["Auto Upgrade Race V2-V3"]:SetValue(false)
                    Options["Auto Trial"]:SetValue(false)
                else
                    if getgenv().Race == "Random" then
                        if table.find(getgenv().blacklistrace, game.Players.LocalPlayer.Data.Race.Value) and game.Players.LocalPlayer.Data.Fragments.Value >= 3000 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
                        elseif (table.find(getgenv().blacklistrace, game.Players.LocalPlayer.Data.Race.Value) and game.Players.LocalPlayer.Data.Fragments.Value < 3000) or game.Players.LocalPlayer.Data.Fragments.Value < v227 then
                            Options["Ignore Attack Katakuri"]:SetValue(false)
                            Options["Start Farm"]:SetValue(true)
                            Options["Select Method Farm"]:SetValue("Farm Katakuri")
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
