repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")

getgenv().link = "http://192.168.1.8:2908/mirage"
local old = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local com = getupvalue(old, 2)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
UseFastAttack = true
spawn(
    function()
        game:GetService("RunService").Stepped:Connect(
            function()
                pcall(
                    function()
                        com.activeController.hitboxMagnitude = 60
                        if UseFastAttack then
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

local ply = game.Players.LocalPlayer

local Combatfram1 = debug.getupvalues(require(ply.PlayerScripts.CombatFramework))
local Combatfram2 = Combatfram1[2]

function GetCurrentBlade()
    local p13 = Combatfram2.activeController
    local ret = p13.blades[1]
    if not ret then
        return
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do
        ret = ret.Parent
    end
    return ret
end

function Attack()
    pcall(
        function()
            local a = game.Players.LocalPlayer
            local b = getupvalues(require(a.PlayerScripts.CombatFramework))[2]
            local e = b.activeController
            for f = 1, 1 do
                local g =
                    require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                        a.Character,
                        { a.Character.HumanoidRootPart },
                        60
                    )
                local h = {}
                local i = {}
                for j, k in pairs(g) do
                    if k.Parent:FindFirstChild("HumanoidRootPart") and not i[k.Parent] then
                        table.insert(h, k.Parent.HumanoidRootPart)
                        i[k.Parent] = true
                    end
                end
                g = h
                if #g > 0 then
                    local l = debug.getupvalue(e.attack, 5)
                    local m = debug.getupvalue(e.attack, 6)
                    local n = debug.getupvalue(e.attack, 4)
                    local o = debug.getupvalue(e.attack, 7)
                    local p = (l * 798405 + n * 727595) % m
                    local q = n * 798405
                    (function()
                        p = (p * m + q) % 1099511627776
                        l = math.floor(p / m)
                        n = p - l * m
                    end)()
                    o = o + 1
                    debug.setupvalue(e.attack, 5, l)
                    debug.setupvalue(e.attack, 6, m)
                    debug.setupvalue(e.attack, 4, n)
                    debug.setupvalue(e.attack, 7, o)
                    pcall(
                        function()
                            if a.Character:FindFirstChildOfClass("Tool") and e.blades and e.blades[1] then
                                e.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                                    "weaponChange",
                                    tostring(GetCurrentBlade())
                                )
                                game.ReplicatedStorage.Remotes.Validator:FireServer(
                                    math.floor(p / 1099511627776 * 16777215),
                                    o
                                )
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", g, f, "")
                            end
                        end
                    )
                end
            end
            b.activeController.timeToNextAttack = -math.huge
            b.activeController.attacking = false
            b.activeController.timeToNextBlock = 0
            b.activeController.humanoid.AutoRotate = 80
            b.activeController.increment = 4
            b.activeController.blocking = false
            b.activeController.hitboxMagnitude = 200
        end
    )
end

local LastAz = 0
local delaysetting = 0.2
local old = 0
spawn(function()
    pcall(function()
        game:GetService "RunService".Heartbeat:Connect(function()
            if UseFastAttack and tick() - old >= delaysetting then
                old = tick()
                Attack()
            end
        end)
    end)
end)
if game.Players.LocalPlayer.Name ~= "Phamtram0rfqU" and game.Players.LocalPlayer.Name ~= "PhapSuTrungQuoc175" and game.Players.LocalPlayer.Name ~= "bocanhet164" then
      local args = {
        [1] = "redeemRefundPoints",
        [2] = "Refund Points"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

    local string_1 = "BuySharkmanKarate";
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1);
    local args = {
        [1] = "AddPoint",
        [2] = "Sword",
        [3] = 2550
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "AddPoint",
        [2] = "Defense",
        [3] = 2550
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "AddPoint",
        [2] = "Melee",
        [3] = 2550
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "LoadItem",
        [2] = "Tushita"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    function getinfoall()
        local res = request({
            Url = link,
            Method = "GET",
        })
        local data = game:GetService("HttpService"):JSONDecode(res.Body)
        return data
    end

    function IsMirageIsland2()
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            return true
        else
            return false
        end
    end

    function checkgatcan()
        if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                "CheckTempleDoor") then
            return true
        else
            return false
        end
    end

    local l__LocalPlayer__3 = game.Players.LocalPlayer;
    local l__Character__4 = l__LocalPlayer__3.Character;

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
    local checkpoint = false

    while wait() do

        Race = CheckRace()
        if string.find(Race,"V3") or string.find(Race,"V4") and game.PlaceId ~= 7449423635 then
            if game.Players.LocalPlayer.Data.Race.Value ~= "Skypiea" then
                local args = { [1] = "TravelZou" }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
        if not checkgatcan() and string.find(Race,"V3") and not string.find(Race,"V4") and game.PlaceId == 7449423635 then
         
            if not IsMirageIsland2() then
                local allData = getinfoall()

                if #allData > 1 then
                    local player = string.split(allData[#allData].Players, "/")
                    local time = string.split(allData[#allData].Time, ":")
                    print(allData[#allData].JobId, allData[#allData].Players, allData[#allData].Time)
                    if tonumber(player[1]) <= 11 and (tonumber(time[1]) >= 12 or tonumber(time[1]) <= 0) then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                            allData[#allData].JobId,
                            game.Players.LocalPlayer)
                    end
                else
                    print("Dont Have Server")
                end
            end
        end
    end
end
