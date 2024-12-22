repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
game:service("VirtualInputManager"):SendKeyEvent(true, "Tab", false, game)
game:service("VirtualInputManager"):SendKeyEvent(false, "Tab", false, game)
spawn(function()
    repeat
        wait()
    until game.CoreGui:FindFirstChild("Banana Cat Hub Btn")
    if getgenv().hideuibanana then
        game.CoreGui.ScreenGui.Enabled = false
    end
end)

for i, v in next, workspace:GetDescendants() do
    pcall(function()
        v.Transparency = 1
    end)
end
a = workspace
a.DescendantAdded:Connect(function(v)
    pcall(function()
        v.Transparency = 1
    end)
end)
workspace.ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
settings():GetService("RenderSettings").EagerBulkExecution = false
workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
game:GetService("Lighting").GlobalShadows = false

settings().Rendering.QualityLevel = "Level01"
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
for i, v in pairs(g:GetDescendants()) do
    if v.ClassName == "WedgePart"
        or v.ClassName == "Terrain"
        or v.ClassName == "MeshPart" then
        v.BrickColor = BrickColor.new(155, 155, 155)
        v.Material = "Plastic"
        v.Transparency = 1
    end
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
game.Workspace.ChildAdded:Connect(function(v)
    if v.ClassName == "WedgePart"
        or v.ClassName == "Terrain"
        or v.ClassName == "MeshPart" then
        v.BrickColor = BrickColor.new(155, 155, 155)
        v.Material = "Plastic"
        v.Transparency = 1
    end
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end)
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
game.Lighting.ChildAdded:Connect(function(v)
    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
        v.Enabled = false
    end
end)



local Net = game:GetService("ReplicatedStorage").Modules.Net

local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

local Characters = workspace.Characters
local Enemies = workspace.Enemies

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local module = {
    NextAttack = 0,
    Distance = 55,
    attackMobs = true,
    attackPlayers = true
}

function module:GetBladeHits()
    local BladeHits = {}

    local Character = Player.Character

    for _, Enemy in Characters:GetChildren() do
        if Enemy ~= Character and Player:DistanceFromCharacter(Enemy.PrimaryPart.Position) < self.Distance then
            table.insert(BladeHits, Enemy:FindFirstChild("Head"))
        end
    end
    for _, Enemy in Enemies:GetChildren() do
        if Player:DistanceFromCharacter(Enemy.PrimaryPart.Position) < self.Distance then
            table.insert(BladeHits, Enemy:FindFirstChild("Head"))
        end
    end

    return BladeHits
end

function module:attack()
    local BladeHits = self:GetBladeHits()

    RegisterAttack:FireServer(0)

    for _, Hit in BladeHits do
        RegisterHit:FireServer(Hit)
    end
end

spawn(function()
    while task.wait() do
        module:attack()
    end
end)

pcall(function()
    local existingGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Honglamx")
    if existingGui then
        existingGui:Destroy()
    end
end)
repeat
    wait()
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui
    screenGui.Name = "Honglamx"
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 40)
    frame.Position = UDim2.new(0.35, 0, -0.055, 0)      -- Fixed Y position
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    frame.Parent = screenGui
    --//frame.Position = UDim2.new(0.3, 0, -0.07, 0)  -- Fixed Y position

    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = frame


    local frame2 = Instance.new("Frame")
    frame2.Name = "JoinSv"
    frame2.Size = UDim2.new(0, 200, 0, 40)
    frame2.Position = UDim2.new(0.35, 0, 0.055, 0)       -- Fixed Y position
    frame2.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    frame2.Parent = screenGui
    --//frame.Position = UDim2.new(0.3, 0, -0.07, 0)  -- Fixed Y position

    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = frame2
    local Text2 = Instance.new("TextBox")
    Text2.Size = UDim2.new(0, 200, 0, 40)
    Text2.Position = UDim2.new(0, 0, 0, 0)              -- Fixed Y position
    Text2.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    Text2.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
    Text2.Font = Enum.Font.SourceSans
    Text2.Text = "Input Job Id"                         -- Add your desired text
    Text2.Parent = frame2
    -- Set the TextBold property to true for bold text
    Text2.TextWrapped = true
    Text2.TextScaled = false
    Text2.TextSize = 20
    Text2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    Text2.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
    Text2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = Text2

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 101, 0, 40)
    Button.Position = UDim2.new(0.58, 0, 0.06, 0)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
    Button.Font = Enum.Font.SourceSans
    Button.Text = "Copy Job Id"                          -- Add your desired text
    Button.Parent = screenGui
    Button.TextWrapped = true
    Button.TextScaled = false
    Button.TextSize = 20
    Button.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    Button.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
    Button.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        setclipboard(tostring(game.JobId))
    end)

    local Button2 = Instance.new("TextButton")
    Button2.Size = UDim2.new(0, 101, 0, 40)
    Button2.Position = UDim2.new(0.7, 0, 0.06, 0)
    Button2.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    Button2.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
    Button2.Font = Enum.Font.SourceSans
    Button2.Text = "Join server"                          -- Add your desired text
    Button2.Parent = screenGui
    Button2.TextWrapped = true
    Button2.TextScaled = false
    Button2.TextSize = 20
    Button2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    Button2.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
    Button2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = Button2

    Button2.MouseButton1Click:Connect(function()
        while wait() do
            if game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.JoinSv.TextBox.Text ~= "" and game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.JoinSv.TextBox.Text ~= "Input Job Id" then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                    game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.JoinSv.TextBox.Text,
                    game.Players.LocalPlayer)
            end
        end
    end)

    local Button3 = Instance.new("TextButton")
    Button3.Size = UDim2.new(0, 101, 0, 40)
    Button3.Position = UDim2.new(0.8, 0, 0.06, 0)
    Button3.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    Button3.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
    Button3.Font = Enum.Font.SourceSans
    Button3.Text = "Hop server"                           -- Add your desired text
    Button3.Parent = screenGui
    Button3.TextWrapped = true
    Button3.TextScaled = false
    Button3.TextSize = 20
    Button3.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    Button3.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
    Button3.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = Button3
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments.Position = UDim2.new(0, 0, 0.3, 0)

    local bM = {}
    local HttpService = game:GetService("HttpService")
    local bN = "!Blacklist_Servers.json"
    function Saveserver()
        local HttpService = game:GetService("HttpService")
        writefile(bN, HttpService:JSONEncode(bM))
    end

    local Notify = require(game.ReplicatedStorage:WaitForChild("Notification"));
    function ReadServer()
        local s, o =
            pcall(
                function()
                    local HttpService = game:GetService("HttpService")
                    Hub = game:GetService("HttpService")
                    return HttpService:JSONDecode(readfile(bN))
                end
            )
        if s then
            return o
        else
            Saveserver()
            return ReadServer()
        end
    end

    bM = ReadServer()
    function HopServer()
        local function Hop()
            for r = math.random(10, 100), math.random(500, 1000) do
                local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
                for k, v in pairs(bP) do
                    if k ~= game.JobId and v["Count"] <= 10 then
                        if not bM[k] or tick() - bM[k].Time > 60 * 10 then
                            bM[k] = { Time = tick() }
                            Saveserver()
                            Notify.new("<Color=Red>\nServer Count: " ..
                                v["Count"] .. "\nRegion: " .. v["Region"] .. "\nServerID: " ..
                                k .. "<Color=/>"):Display();
                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                            return true
                        elseif tick() - bM[k].Time > 60 * 60 then
                            bM[k] = nil
                        end
                    end
                end
            end
            return false
        end
        if not getgenv().Loaded then
            local function bQ(v)
                if v.Name == "ErrorPrompt" then
                    if v.Visible then
                        if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                            HopServer()
                            v.Visible = false
                        end
                    end
                    v:GetPropertyChangedSignal("Visible"):Connect(
                        function()
                            if v.Visible then
                                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                    HopServer()
                                    v.Visible = false
                                end
                            end
                        end
                    )
                end
            end
            for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
                bQ(v)
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
            getgenv().Loaded = true
        end
        while not Hop() do
            wait()
        end
        Saveserver()
    end

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

    Button3.MouseButton1Click:Connect(function()
        while wait() do Teleport() end
    end)


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

    print(CheckRace())

    --//math.floor(game.Lighting.ClockTime).." | "..game.Players.NumPlayers.."/"..game.Players.MaxPlayers..
    local y = game.PlaceId
    if y == 2753915549 then
        Sea1 = true
    elseif y == 4442272183 then
        Sea2 = true
    elseif y == 7449423635 then
        Sea3 = true
    end
    function MoonTextureId()
        if Sea1 then
            return game:GetService("Lighting").FantasySky.MoonTextureId
        elseif Sea2 then
            return game:GetService("Lighting").FantasySky.MoonTextureId
        elseif Sea3 then
            return game:GetService("Lighting").Sky.MoonTextureId
        end
    end

    function getfm()
        if game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 then
            return " | Full Moon"
        elseif game:GetService("Lighting"):GetAttribute("MoonPhase") == 4 then
            return " | Next Night"
        else
            return " | Bad Moon"
        end
    end

    function getmirage()
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            return " | 🟢"
        else
            return " | 🔴"
        end
    end

    function checkgatcan()
        local a = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            "CheckTempleDoor")
        if a then
            return " | Pulled"
        else
            return " | No"
        end
    end

    local Text = Instance.new("TextLabel")
    Text.Size = UDim2.new(0, 300, 0, 40)
    Text.Position = UDim2.new(0, 0, 0, 0)              -- Fixed Y position
    Text.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
    Text.Font = Enum.Font.SourceSans
    Text.Text = "Hi"                                   -- Add your desired text
    Text.Parent = frame
    -- Set the TextBold property to true for bold text
    Text.TextWrapped = true
    Text.TextScaled = false
    Text.TextSize = 20
    Text.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    Text.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
    Text.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = Text
    repeat
        wait()
        game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.Frame.TextLabel.Text = math.floor(game
                .Lighting.ClockTime) ..
            " | " ..
            game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers .. getfm() .. getmirage() .. checkgatcan()
    until game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.Frame.TextLabel.Text ~= "Hi"
    spawn(function()
        while wait() do
            game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.Frame.TextLabel.Text = math.floor(game
                    .Lighting.ClockTime) ..
                " | " ..
                game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers .. getfm() .. getmirage() .. checkgatcan()
        end
    end)
    function CheckAcientOneStatus()
        if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
            return "You have yet to achieve greatness"
        end
        local v227 = nil
        local v228 = nil
        local v229 = nil
        v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
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

    function BuyGear()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
    end

    spawn(function()
        while wait() do
            local b_ = CheckAcientOneStatus()
            if string.find(b_, "Can Buy Gear") then
                BuyGear()
            end
        end
    end)
    local reseted = false
    spawn(function()
        while wait() do
            if game.Players.LocalPlayer.Name == "Phamtram0rfqU" or game.Players.LocalPlayer.Name == "bocanhet164" then
                local v51, v52 = game.ReplicatedStorage.Remotes.Temple.OnClientEvent:Wait()
                if v51 ~= "Start" then
                    reseted = false
                end
                if v51 == "Start" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map["Temple of Time"].SpawnRoom.WorldPivot.Position).Magnitude <= 3000 and not reseted then
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                    reseted = true
                end
            end
        end
    end)
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Honglamx")
