function ClaimQuestV3()
    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    if bf == 0 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        wait(.1)
    elseif bf == -1 then
    end
end

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

ClaimQuestV3()
spawn(function()
    while wait() do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
    end
end)
function CheckRace()
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
end

function IsWpSKillLoaded(bW)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(bW) then
        return true
    end
end

function checkskillMelee()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameMelee()) then
        equipweapon(NameMelee())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameMelee()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
            then
                return v.Name
            end
        end
    end
end

function checkskillDF()
    if
        not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(
            game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
        )
    then
        equipweapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[
    game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
    ]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
            then
                return v.Name
            end
        end
    end
end

function checkskillSword()
    if not NameSword() then
        return
    end
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameSword()) then
        equipweapon(NameSword())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameSword()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
            then
                return v.Name
            end
        end
    end
end

function NameGun()
    dick = game.Players.LocalPlayer.Backpack or game.Players.LocalPlayer.Character
    for r, v in pairs(dick:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == "Gun" then
            return v.Name
        end
    end
end

function checkskillGun()
    if not NameGun() then
        return nil
    end
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameGun()) then
        equipweapon(NameGun())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameGun()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
            then
                return v.Name
            end
        end
    end
end

function SendKey(c9, ca)
    if c9 then
        if not ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        elseif ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait(ca)
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        end
    end
end

function EquipAllWeapon()
    u3 = { "Melee", "Blox Fruit", "Sword", "Gun" }
    u3_2 = {}
    for r, v in pairs(u3) do
        u3_3 = GetWeapon(v)
        table.insert(u3_2, u3_3)
    end
    for r, v in pairs(u3_2) do
        if not IsWpSKillLoaded(v) then
            print(v)
            EquipWeaponName(v)
        end
    end
end

function autoskill()
    sword = checkskillSword()
    meele = checkskillMelee()
    df = checkskillDF()
    gun = checkskillGun()
    if
        df and not string.find(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value, "Portal") and
        df ~= "F"
    then
        print("DF")
        EquipWeaponName(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
        local condimebeo = checkskillDF()
        if condimebeo then
            SendKey(condimebeo)
        end
    elseif checkskillMelee() and h["Spam_Melee"] then
        print("Melee")
        EquipWeaponName(NameMelee())
        local condimebeo = checkskillMelee()
        if condimebeo then
            SendKey(condimebeo)
        end
    elseif checkskillSword() and h["Spam_Sword"] then
        print("Sword")
        EquipWeaponName(NameSword())
        local condimebeo = checkskillSword()
        if condimebeo then
            SendKey(condimebeo)
        end
    elseif checkskillGun() and h["Spam_Gun"] then
        print("Gun")
        EquipWeaponName(NameGun())
        if condimebeo then
            SendKey(condimebeo)
        end
    else
        EquipAllWeapon()
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

FastAttackConnector =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/test2.lua"))()
function AttackFunction()
    FastAttackConnector:Attack()
end

spawn(
    function()
        while wait() do
            if LegitAttack then
                pcall(
                    function()
                        FastAttackConnector:InputValue(5, 3)
                        FastAttackConnector:Attack(true)
                        AttackFunction()
                       
                    end
                )
            end
        end
    end
)
local gt = getrawmetatable(game)
local old = gt.__namecall
setreadonly(gt, false)
gt.__namecall = newcclosure(function(...)
    local args = { ... }
    if getnamecallmethod() == "InvokeServer" then
        if tostring(args[2]) == "TAP" then
            if AimbotDiThangNgu and AimBotSkillPosition then
                args[3] = AimBotSkillPosition
            end
        end
    end
    return old(unpack(args))
end)
function checkattackplayuer()
    if plr.Character.Humanoid.Health > 0 then
        for i,k in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
            if k:IsA("TextLabel") then
                if string.find(k.Text,"attack") then
                    k:Destroy()
                    return true
                end
            end
        end
    end
end
saveplayer = {}
spawn(
    function()
        while wait() do
            if ChoDienCanNguoi then
                spawn(function()
                    if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end)
                if TargetedPlayer then
                    pcall(
                        function()
                            CheckPlayer = game.Players[TargetedPlayer]
                            EnableBuso()
                            EquipWeapon("Melee")
                            if not CheckPlayer then
                                repeat
                                    wait()
                                    CheckPlayer = game.Players:FindFirstChild(TargetedPlayer)
                                until CheckPlayer
                            end
                            repeat
                                if (game.Players:FindFirstChild(TargetedPlayer).Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude < 5000 then
                                    Tweento(game.Players:FindFirstChild(TargetedPlayer).Character.HumanoidRootPart
                                    .CFrame)
                                end
                                LegitAttack = true
                                autospamskill = true
                                AimBotSkillPosition = game.Players:FindFirstChild(TargetedPlayer).Character
                                    .HumanoidRootPart.CFrame.Position
                                AimbotDiThangNgu = true
                                if checkattackplayuer() then 
                                    if not table.find(saveplayer,v.Name) then 
                                        table.insert(saveplayer,v.Name)
                                    end
                                end
                                --[[else
                                    LegitAttack = false
                                    autospamskill = nil
                                    AimbotDiThangNgu = true
                                    AimBotSkillPosition = nil
                                end]]
                            until not ChoDienCanNguoi or not TargetedPlayer or not ChoDienCanNguoi or not CheckPlayer or
                                not game.Workspace.Characters:FindFirstChild(TargetedPlayer) or
                                not CheckPlayer.Character or
                                CheckPlayer.Character.Humanoid.Health <= 0 or
                                CheckCantAttackPlayer(CheckPlayer) or
                                table.find(saveplayer,v.Name) or 
                                cc2[TargetedPlayer]

                            cc2[TargetedPlayer] = true
                            autospamskill = false
                            LegitAttack = false
                            AimbotDiThangNgu = false
                            AimBotSkillPosition = nil
                            UseFastAttack = false
                        end
                    )
                elseif not TargetedPlayer then
                    cc2 = {}
                end
            end
        end
    end
)
local Settings = {}
local HttpService = game:GetService("HttpService")

local SaveFileName = "seahubjoin.json"

function SaveSettings2()
    local HttpService = game:GetService("HttpService")
    if not isfolder("Sea Hub") then
        makefolder("Sea Hub")
    end
    writefile("Sea Hub/" .. SaveFileName, HttpService:JSONEncode(Settings))
end

function ReadSetting2()
    local s, e = pcall(function()
        local HttpService = game:GetService("HttpService")
        if not isfolder("Sea Hub") then
            makefolder("Sea Hub")
        end
        return HttpService:JSONDecode(readfile("Sea Hub/" .. SaveFileName))
    end)
    if s then
        return e
    else
        SaveSettings2()
        return ReadSetting2()
    end
end

Settings2 = ReadSetting2()

function HopServer()
    local function Hop()
        for i = 1, 100 do
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k, v in pairs(huhu) do
                if k ~= game.JobId and v.Count < 10 then
                    if not Settings2[k] or tick() - Settings2[k].Time > 60 * 10 then
                        Settings2[k] = {
                            Time = tick()
                        }
                        SaveSettings2()
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                        return true
                    elseif tick() - Settings2[k].Time > 60 * 60 then
                        Settings2[k] = nil
                    end
                end
            end
        end
        return false
    end
    if not getgenv().Loaded then
        local function child(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(function()
                    if v.Visible then
                        if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                            HopServer()
                        end
                    end
                end)
            end
        end
        for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            child(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(child)
        getgenv().Loaded = true
    end
    while not Hop() do wait() end
    SaveSettings2()
end

spawn(function()
    while wait() do
        if CheckRace() == "Skypiea V2" then
           
            SkypieaPlayers = {}
            for r, v in pairs(game.Players:GetChildren()) do
                pcall(
                    function()
                        if
                            v.Name ~= game.Players.LocalPlayer.Name and
                            game.Workspace.Characters:FindFirstChild(v.Name) and
                            v:FindFirstChild("Data") and
                            v.Data:FindFirstChild("Race") and
                            v.Data.Race.Value == "Skypiea" and
                            v.Character:FindFirstChild("Humanoid")
                            and v.Team ~= game.Players.LocalPlayer.Team
                        then
                            table.insert(SkypieaPlayers, v)
                        end
                    end
                )
            end
            if #SkypieaPlayers > 0 then
                for r, v in pairs(SkypieaPlayers) do
                    repeat
                        wait()
                        TargetedPlayer = v.Name
                        ChoDienCanNguoi = true
                    until not v or
                        game.Players.LocalPlayer.Data.Race.Value ~= "Skypiea" or
                        string.find(CheckRace(), "V3")
                    ChoDienCanNguoi = nil
                    TargetedPlayer = nil
                end
            else
                HopServer(9)
                HopServer(10)
            end
        end
    end
end)
