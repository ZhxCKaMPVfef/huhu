repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
if not getgenv().NewBanana then
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

    UseFastAttack = true
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
end
game:service("VirtualInputManager"):SendKeyEvent(true, "Tab", false, game)
game:service("VirtualInputManager"):SendKeyEvent(false, "Tab", false, game)
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
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
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


    local Button4 = Instance.new("TextButton")
    Button4.Size = UDim2.new(0, 101, 0, 40)
    Button4.Position = UDim2.new(0.58, 0, 0.2, 0)
    Button4.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
    Button4.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
    Button4.Font = Enum.Font.SourceSans
    Button4.Text = "Auto v3 mink"                         -- Add your desired text
    Button4.Parent = screenGui
    Button4.TextWrapped = true
    Button4.TextScaled = false
    Button4.TextSize = 20
    Button4.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    Button4.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
    Button4.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
    local UIcorner = Instance.new("UICorner")
    UIcorner.Parent = Button4
    local plr = game.Players.LocalPlayer
    function resetteleport(cframe)
        plr.Character.HumanoidRootPart.Anchored = true
        plr.Character.HumanoidRootPart.CFrame = cframe
        plr.Character.HumanoidRootPart.Anchored = false
        plr.Character.Humanoid.Health = 0
    end

    local plr = game.Players.LocalPlayer
    spawn(function()
        while wait() do
            if NoClip and not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
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
    TweenSpeed = 350
    function CheckNearestTeleporter(vcs)
        vcspos = vcs.Position
        min = math.huge
        min2 = math.huge
        local placeId = game.PlaceId
        if placeId == 2753915549 then
            OldWorld = true
        elseif placeId == 4442272183 then
            NewWorld = true
        elseif placeId == 7449423635 then
            ThreeWorld = true
        end
        if placeId == 7449423635 then
            TableLocations = {
                ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
                ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
                ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
                ["Temple of Time"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
                --["Great Tree"] = Vector3.new(2968.699951171875, 2284.286865234375, -7226.28662109375),
            }
        elseif placeId == 4442272183 then
            TableLocations = {
                ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
                ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
                ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
                ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
            }
        end
        TableLocations2 = {}
        for i, v in pairs(TableLocations) do
            TableLocations2[i] = (v - vcspos).Magnitude
        end
        for i, v in pairs(TableLocations2) do
            if v < min then
                min = v
                min2 = v
            end
        end
        for i, v in pairs(TableLocations2) do
            if v < min then
                min = v
                min2 = v
            end
        end
        for i, v in pairs(TableLocations2) do
            if v <= min then
                choose = TableLocations[i]
            end
        end
        min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if min2 <= min3 then
            return choose
        end
        return false
    end

    function requestEntrance(vector3)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", vector3)
        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
        task.wait(0.5)
    end

    function Tweento(targetCFrame)
        if
            game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
            game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 and
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        then
            if TweenSpeed == nil then
                TweenSpeed = 250
            end
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
            DefualtY = targetCFrame.Y
            TargetY = targetCFrame.Y
            targetCFrameWithDefualtY = CFrame.new(targetCFrame.X, DefualtY, targetCFrame.Z)
            targetPos = targetCFrame.Position
            oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            Distance =
                (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
                .Magnitude

            Speed = TweenSpeed
            local bmg = CheckNearestTeleporter(targetCFrame)
            if type(bmg) ~= "boolean" then
                pcall(
                    function()
                        tween:Cancel()
                    end
                )
                requestEntrance(bmg)
            end
            b1 =
                CFrame.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                    DefualtY,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                )
            if (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        DefualtY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                local tweenfunc = {}
                local tween_s = game:service "TweenService"
                local info =
                    TweenInfo.new(
                        (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
                        .Magnitude /
                        Speed,
                        Enum.EasingStyle.Linear
                    )
                local tween =
                    tween_s:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        info,
                        { CFrame = targetCFrameWithDefualtY }
                    )
                tween:Play()
                NoClip = true
                function tweenfunc:Stop()
                    tween:Cancel()
                end

                tween.Completed:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        TargetY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                NoClip = false
            else
                local tweenfunc = {}
                local tween_s = game:service "TweenService"
                local info =
                    TweenInfo.new(
                        (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
                        .Magnitude /
                        Speed,
                        Enum.EasingStyle.Linear
                    )
                local tween =
                    tween_s:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        info,
                        { CFrame = targetCFrame }
                    )
                tween:Play()
                NoClip = true
                function tweenfunc:Stop()
                    tween:Cancel()
                end

                tween.Completed:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        TargetY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                NoClip = false
            end
            if not tween then
                return tween
            end
            return tweenfunc
        end
    end

    function getchessnes()
        local distance = math.huge
        for i, v in pairs(workspace:GetChildren()) do
            if v.Name == "Chest3" or v.Name == "Chest2" or v.Name == "Chest1" then
                if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < distance then
                    distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    pos = v.CFrame
                end
            end
        end
        return pos
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
    spawn(function()
        while wait() do
            if CheckRace() == "Mink V2" then
                function ClaimQuestV3()
                    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
                    if bf == 0 then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                        wait(.1)
                    elseif bf == -1 then
                    end
                end

                local plr = game.Players.LocalPlayer

                ClaimQuestV3()
                spawn(function()
                    while wait() do
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                    end
                end)
            end
        end
    end)
    print(CheckRace())
    function BringMob(a)
        for i, v in pairs(workspace.Enemies:GetChildren()) do
            local cframe = v.HumanoidRootPart.CFrame
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.CFrame.Position).Magnitude < 350 then
                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                v.HumanoidRootPart.Transparency = 1
                v.HumanoidRootPart.CFrame = a
                for i1, v1 in pairs(v:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Velocity = Vector3.new(0, 0, 0)
                        v.CanCollide = 0
                        v.Anchored = true
                    end
                end
                if v:FindFirstChild("Humanoid") then
                    v.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                end
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        end
    end

    function GetWeapon(bh)
        s = ""
        for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == bh then
                s = v.Name
            end
        end
        for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == bh then
                s = v.Name
            end
        end
        return s
    end

    function EquipWeapon(ToolSe)
        if ToolSe == "" or ToolSe == nil then
            ToolSe = "Melee"
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild(GetWeapon(ToolSe)) then
            local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(GetWeapon(ToolSe))
            wait(.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        end
    end

    function EnableBuso()
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            local args = { [1] = "Buso" }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end

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
    Button4.MouseButton1Click:Connect(function()
        spawn(function()
            while wait() do
                if CheckRace() == "Mink V2" then
                    function ClaimQuestV3()
                        local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
                        if bf == 0 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                            wait(.1)
                        elseif bf == -1 then
                        end
                    end

                    local plr = game.Players.LocalPlayer

                    ClaimQuestV3()
                    spawn(function()
                        while wait() do
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                        end
                    end)
                    Tweento(getchessnes())
                elseif CheckRace() == "Mink V1" then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game.Players.LocalPlayer.Character:FindFirstChild("Flower 1")) and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                    if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game.Players.LocalPlayer.Character:FindFirstChild("Flower 1")) then
                        Tweento(workspace.Flower1.CFrame)
                    elseif not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                        Tweento(workspace.Flower2.CFrame)
                    elseif not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
                        if not workspace.Enemies:FindFirstChild("Swan Pirate") then
                            for i, v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                if v.Name == "Swan Pirate [Lv. 775]" then
                                    Tweento(v.CFrame * CFrame.new(0, 20, 0))
                                end
                            end
                        else
                            for i, v in pairs(workspace.Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v.Name == "Swan Pirate" then
                                    Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    repeat
                                        wait()
                                        spawn(function()
                                            Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                        end)
                                        spawn(function()
                                            EquipWeapon()
                                        end)
                                        spawn(function()
                                            EnableBuso()
                                        end)
                                        spawn(function()
                                            NoClip = true
                                        end)
                                        spawn(function()
                                            UseFastAttack = true
                                        end)
                                        spawn(function()
                                            BringMob(v.HumanoidRootPart.CFrame)
                                        end)
                                    until not v or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid")
                                    UseFastAttack = false
                                end
                            end
                        end
                    end
                end
            end
        end)
        spawn(function()
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end)
    end)
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
        if MoonTextureId() == "http://www.roblox.com/asset/?id=9709149431" then
            return " | Full Moon"
        elseif MoonTextureId() == "http://www.roblox.com/asset/?id=9709149052" then
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

    print(math.floor(game.Lighting
        .ClockTime))
    spawn(function()
        while wait() do
            game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.Frame.TextLabel.Text = math.floor(game.Lighting
                    .ClockTime) ..
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
    spawn(function()
        while wait() do
            if game.Players.LocalPlayer.Name == "Phamtram0rfqU" or game.Players.LocalPlayer.Name == "bocanhet164" then
                local v51, v52 = game.ReplicatedStorage.Remotes.Temple.OnClientEvent:Wait()
                print(v51, v52)
                print("Checked")
                if v51 == "Start" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map["Temple of Time"].SpawnRoom.WorldPivot.Position).Magnitude <= 3000 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                end
            end
        end
    end)
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Honglamx")
