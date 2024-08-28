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

repeat wait() until game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
getgenv().tngoc = true
local savecd = {}
local pass = {}
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
local save = {}
getgenv().PlayerAdded = function(plr)
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
                    if not table.find(pass, plr) then
                        table.insert(pass, plr)
                    end
                    print(plr, content)
                    print(#save, #pass)
                    local Message = "Auto V4"
                    SendMessage(Message)
                end
                if content == "Start" then
                    game.ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility")
                end
                if content == "Rejoin" then
                    if not table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId,
                            game.Players.LocalPlayer)
                    end
                end
            end
        end)
    end
end
spawn(function()
    game.Players.ChildRemoved:Connect(function(v)
        local index = table.find(save, v.Name)
        if index then
            table.remove(save, index)
        end

        index = table.find(savecd, v.Name)
        if index then
            table.remove(savecd, index)
        end

        index = table.find(pass, v.Name)
        if index then
            table.remove(pass, index)
        end
    end)
end)
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
        for _, v in pairs(game.Players:GetChildren()) do
            if table.find(save, v) and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") then
                if v.Character.HumanoidRootPart:FindFirstChild("ActivationRing") and table.find(pass, v) then
                    for i1, v1 in next, pass do
                        if v1 == v then
                            table.remove(pass, i1)
                        end
                    end
                    print(#pass)
                end
                if (v.Character.HumanoidRootPart:FindFirstChild("ActivationRingRefresh") or v.Character.Humanoid.Health <= 0) and not table.find(pass, v) then
                    table.insert(pass, v)
                    print(#pass)
                end
            end
        end
    end
end)



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
                        if allData[#allData].Type == ":alarm_clock: Become Around :" or allData[#allData].Type == "Time To Night 🌙" then
                            if allData[#allData].Time == "6 Minute ( s )" or allData[#allData].Time == "5 Minute ( s )" then
                                postmoonmain2(allData[#allData].JobId)
                                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                                    allData[#allData].JobId,
                                    game.Players.LocalPlayer)
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
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                        datamain2().JobId,
                        game.Players.LocalPlayer)
                else
                    postdataclone(datamain2().JobId)
                end
            end
        end
        if plr.Name ~= "Phamtram0rfqU" and plr.Name ~= "bocanhet164" then
            if dataclone().JobId and Options["Auto Trial"].Value then
                if dataclone().JobId ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                        dataclone().JobId,
                        game.Players.LocalPlayer)
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
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                        game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    pcall(function()
        TPReturner()
        if foundAnything ~= "" then
            TPReturner()
        end
    end)
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
            Teleport()
            task.wait(5)
        end
    end
end)
spawn(function()
    while wait() do
        if not table.find(getgenv().MainAccount, plr.Name) and game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then
            for _, v in pairs(game.Players:GetChildren()) do
                if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") then
                    if not string.find(getgenv().CheckAcientOneStatus(), "Can Buy Gear") then
                        if getgenv().CheckAcientOneStatus() == "Required Train More" or string.find(getgenv().CheckAcientOneStatus(), (v228 - 2) .. "/3") then
                            if plr:DistanceFromCharacter(v.Character.HumanoidRootPart.CFrame.Position) <= 100 then
                                Teleport()
                                task.wait(5)
                            end
                        end
                    end
                end
            end
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
