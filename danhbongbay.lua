repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MainLeft") and game:GetService("Players").LocalPlayer.PlayerGui.MainLeft.Left.Currency.Diamonds.Diamonds.Visible == true and not game:GetService("Players").LocalPlayer:FindFirstChild("GUIFX Holder")
spawn(function()
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    setfpscap(30)
    workspace.MAP:Destroy()
    if workspace:FindFirstChild("Map") then
        workspace.Map:Destroy()
    elseif workspace:FindFirstChild("Map2") then
        workspace.Map2:Destroy()
    end
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    UserSettings():GetService("UserGameSettings").MasterVolume = 0
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l, "Technology", 2)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = 0
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(w:GetDescendants()) do
        if v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") and decalsyeeted then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        elseif v:IsA("SpecialMesh") and decalsyeeted then
            v.TextureId = 0
        elseif v:IsA("ShirtGraphic") and decalsyeeted then
            v.Graphic = 1
        elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
            v[v.ClassName .. "Template"] = 1
        end
    end
    for i = 1, #l:GetChildren() do
        e = l:GetChildren()[i]
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end

    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = 1
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end
    for i, v in pairs(Lighting:GetDescendants()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
end)
spawn(function()
    while wait() do
        for i, v in next, workspace.__THINGS.Breakables:GetChildren() do
            if not string.find(tostring(v:GetAttribute("BreakableID")), "Balloon") and tostring(v:GetAttribute("OwnerUsername")) ~= game.Players.LocalPlayer.Name then
                v:Destroy()
            end
        end
    end
end)
spawn(function()
    while wait() do
        local iditem = nil
        local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
        for i, v in pairs(save.Get().Inventory.Currency) do
            if v.id == "Diamonds" then
                iditem = i
            end
        end
        if game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value >= value then
            local args = {
                [1] = account,
                [2] = "Made By Honglamx",
                [3] = "Currency",
                [4] = tostring(iditem),
                [5] = game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value - 10000
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(
                unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(
            "Large Gift Bag")
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(
            "Mini Chest")
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(
            "Gift Bag")
    end
end)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local function tpserverless()
    local function getRandomServerID(data)
        local randomIndex = math.random(1, #data)
        return data[randomIndex].id
    end

    local function fetchServers(cursor)
        local url = 'https://games.roblox.com/v1/games/' .. PlaceID ..
            '/servers/Public?sortOrder=Asc&limit=100'
        if cursor then
            url = url .. '&cursor=' .. cursor
        end
        return game.HttpService:JSONDecode(game:HttpGet(url))
    end

    repeat
        local Sitez = fetchServers(foundAnything)
        if Sitez.nextPageCursor and Sitez.nextPageCursor ~= "null" and Sitez.nextPageCursor ~= nil then
            foundAnything = Sitez.nextPageCursor
        end
        for i, v in ipairs(Sitez.data) do
            if tonumber(v.playing) < tonumber(v.maxPlayers) then
                local ID = tostring(v.id)
                local possible = true
                for _, existingID in ipairs(AllIDs) do
                    if ID == tostring(existingID) then
                        possible = false
                        break
                    end
                end
                if possible then
                    table.insert(AllIDs, ID)
                    print("Random Server ID:", ID, v.playing)
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    return -- End the loop once a valid server is found and teleported to
                end
            else
                print("Server is full:", v.playing .. "/" .. v.maxPlayers)
            end
        end
    until not Sitez.nextPageCursor

    print("No available servers found.")
end




function checkempty()
    local children = workspace.__THINGS.BalloonGifts:GetChildren()
    local hasBalloons = false

    for _, child in ipairs(children) do
        if child.Name == "Balloons" then
            hasBalloons = true
            break
        end
    end

    return not hasBalloons and #children == 0
end

function formatNumber(v)
    return tostring(v):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

local gemold = game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value
local AllRequest = http_request or request or HttpPost or syn.request
function WebhookSender()
    Message = {
        ['username'] = "Pet99 Notifications",
        ["avatar_url"] =
        "https://tr.rbxcdn.com/ad3fa62fcd82919e6c655e005f896eb9/150/150/Image/Png",
        ["embeds"] = {
            {
                ["title"] = "Gem Check",
                ["description"] = "**Account:** `" .. game.Players.LocalPlayer.Name ..
                    "`\n**💎: **" ..
                    formatNumber(game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"]
                        .Value) ..
                    "\n**Gem Earned: **" ..
                    formatNumber(game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"]
                        .Value - gemold),
                ["color"] = tonumber(0xe962e2),
            }
        }
    }
    local DataCallBack = AllRequest({
        Url = Webhooklink,
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
    })
end

spawn(function()
    local ahihi = tick()
    while wait() do
        print(checkempty(), math.floor(tick() - ahihi))
        print(game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value - gemold)
        if checkempty() and tick() - ahihi >= timehop then
            WebhookSender()
            tpserverless()
            break
        elseif not checkempty() then
            ahihi = tick() -- Update the value of ahihi if not empty
        end
    end
end)



local old = tick()


spawn(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
            tpserverless()
        end
    end)
end)
function getnamepet()
    local savename = {}
    for i, v in pairs(workspace.__THINGS.Pets:GetChildren()) do
        if v:IsA("Model") and not table.find(savename, v.Name) then
            table.insert(savename, v.Name)
        end
    end
    return savename
end

function checkequipgun()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == "WEAPON_" .. game.Players.LocalPlayer.Name then
            if v:FindFirstChild("Stick") then
                return true
            end
        end
    end
end

spawn(function()
    while wait() do
        if not checkequipgun() then
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Slingshot_Toggle"):InvokeServer()
        end
    end
end)

spawn(function()
    while wait() do
        for i, v in game:GetService("Players").LocalPlayer.PlayerGui._MISC.FreeGifts.Frame.ItemsFrame.Gifts:GetChildren() do
            if v:FindFirstChild("Timer") and v.Timer.Text == "Redeem!" then
                local a = v.Name:gsub("Gift", "")
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Redeem Free Gift")
                    :InvokeServer(tonumber(a))
            end
        end
    end
end)
local time = os.time() -- Record the start time
local s = require(game:GetService("ReplicatedStorage").Library:WaitForChild("Client"))
s.PlayerPet.CalculateSpeedMultiplier = function(...)
    return 999
end
spawn(function()
    while wait() do
        for i, v in game.Workspace:WaitForChild("__THINGS").Lootbags:GetChildren() do
            local args = {
                [1] = {
                    [1] = tostring(v.Name)
                }
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Lootbags_Claim")
                :FireServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        local plr = game.Players.LocalPlayer
        spawn(function()
            while wait() do
                if NoClip and not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                    local BV = Instance.new("BodyVelocity")
                    BV.Parent = plr.Character.HumanoidRootPart
                    BV.Name = "EffectsSY"
                    BV.MaxForce = Vector3.new(100000, 100000, 100000)
                    BV.Velocity = Vector3.new(0, 0, 0)
                elseif not NoClip and plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                    plr.Character.HumanoidRootPart.EffectsSY:Destroy()
                end
            end
        end)
        for i, v in next, workspace.__THINGS.BalloonGifts:GetChildren() do
            NoClip = true
            if v:FindFirstChild("Balloon") then
                pcall(function()
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Balloon.CFrame *
                            CFrame.new(0, 20, 5)
                        local args = {
                            [1] = Ray.new(Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z),
                                Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z)),
                            [2] = Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z),
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Click"):FireServer(
                            unpack(args))
                        local args = {
                            [1] = Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z),
                            [2] = math.random(-1, 3),
                            [3] = math.random(-1, 1),
                            [4] = 200
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild(
                            "Slingshot_FireProjectile"):InvokeServer(unpack(args))
                        if v:FindFirstChild("Balloon") then
                            local args = {
                                [1] = tostring(v.Balloon:GetAttribute("BalloonId"))
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild(
                                "BalloonGifts_BalloonHit"):FireServer(unpack(args))
                        end
                        spawn(function()
                            if os.time() - time >= timeskipballoon then
                                if v.Parent then
                                    v:Destroy()
                                    time = os.time()
                                    print("Destroyed " .. v.Name)
                                end
                            end
                        end)
                    until not v:FindFirstChild("Balloon") or not v or not v.Parent
                end)
            elseif not v:FindFirstChild("Balloon") then
                v:Destroy()
            end
            break
        end
        workspace.__THINGS.Breakables.ChildAdded:Connect(function(v)
            if string.find(tostring(v:GetAttribute("BreakableID")), "Balloon") and tostring(v:GetAttribute("OwnerUsername")) == game.Players.LocalPlayer.Name and v:FindFirstChild("1") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v["1"].Hitbox.CFrame
                local b = s.PlayerPet.GetAll()
                for i, a in b do
                    s.PlayerPet.SetTarget(a, v)
                end
                repeat
                    wait()
                    task.spawn(
                        function()
                            game:GetService("ReplicatedStorage"):WaitForChild("Network")
                                .Breakables_PlayerDealDamage:FireServer(tostring(v.Name))
                            task.wait(0.01)
                        end)
                until not v or not v.Parent or not string.find(tostring(v:GetAttribute("BreakableID")), "Balloon") or tostring(v:GetAttribute("OwnerUsername")) ~= game.Players.LocalPlayer.Name
            end
        end)
        wait(3)
    end
end)

spawn(function()
    while wait() do
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ShutdownUI") then
            tpserverless()
        end
    end
end)
local VirtualUser = game:service 'VirtualUser'
game:service('Players').LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
