repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
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
function ClaimQuestV3()
    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    if bf == 0 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        wait(.1)
    elseif bf == -1 then
    end
end

local plr = game.Players.LocalPlayer
local Tweento = loadstring(game:HttpGet("https://raw.githubusercontent.com/hlamx/huhu/master/tween.lua"))()

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



function equipweapon(aq)
    local c6 = tostring(aq)
    local c7 = game.Players.LocalPlayer.Backpack:FindFirstChild(c6)
    local c8 =
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    if c7 then
        c8:EquipTool(c7)
    end
end

function EquipWeaponName(m)
    if not m then
        return
    end
    NoClip = true
    ToolSe = m
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
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
function IsWpSKillLoaded(bW)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(bW) then
        return true
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
function NameMelee()
    for r, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
    for r, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
end
function NameSword()
    for r, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
    for r, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
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
    elseif checkskillMelee() then
        print("Melee")
        EquipWeaponName(NameMelee())
        local condimebeo = checkskillMelee()
        if condimebeo then
            SendKey(condimebeo)
        end
    elseif checkskillSword() then
        print("Sword")
        EquipWeaponName(NameSword())
        local condimebeo = checkskillSword()
        if condimebeo then
            SendKey(condimebeo)
        end
    elseif checkskillGun() then
        print("Gun")
        EquipWeaponName(NameGun())
        if condimebeo then
            SendKey(condimebeo)
        end
    else
        EquipAllWeapon()
    end
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
                        FastAttackConnector:InputSetting(true)
                        FastAttackConnector:InputValue(7, 3)
                        FastAttackConnector:Attack(true)
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
spawn(function()
    while wait() do
        if autospamskill then
            autoskill()
        end
    end
end)
function checksafezone(p)
    if plr.Character.Humanoid.Health > 0 then
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
            if v:IsA("Part") then
                if (v.Position - p.HumanoidRootPart.Position).magnitude <= 400 and p.Humanoid.Health / p.Humanoid.MaxHealth >= 90 / 100 then
                    getgenv().CheckSafeZone = true
                    return true
                end
            end
        end
    end
    return false
end

function CheckCantAttackPlayer(v)
    for r, k in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
        if k:IsA("TextLabel") then
            if string.find(k.Text, "attack") and not k:FindFirstChild(v.Name) then
                local cd = Instance.new("TextBox")
                cd.Parent = k.Parent
                cd.Name = v.Name
                k:Destroy()
                return true
            end
        end
    end
end

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

--[[
    spawn(function()
                if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end)

            if TargetedPlayer and not table.find(saveplayer,TargetedPlayer) then
                pcall(function()
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
                        Tweento(game.Players:FindFirstChild(TargetedPlayer).Character.HumanoidRootPart.CFrame)
                        LegitAttack = true
                        autospamskill = true
                        AimBotSkillPosition = game.Players:FindFirstChild(TargetedPlayer).Character
                            .HumanoidRootPart.CFrame.Position
                        AimbotDiThangNgu = true

                        if checkattackplayer() then
                            if not table.find(saveplayer, v.Name) then
                                table.insert(saveplayer, v.Name)
                            end
                        end
                            until not ChoDienCanNguoi or not TargetedPlayer or not CheckPlayer or not game.Workspace.Characters:FindFirstChild(TargetedPlayer) or not CheckPlayer.Character or CheckPlayer.Character.Humanoid.Health <= 0 or CheckCantAttackPlayer(CheckPlayer) or table.find(saveplayer, v.Name) or cc2[TargetedPlayer] or checksafezone(TargetedPlayer)
                            if not table.find(saveplayer,v.Name) then
                                table.insert(saveplayer,v.Name)
                            end
                            print(#saveplayer)
                            autospamskill = false
                            LegitAttack = false
                            AimbotDiThangNgu = false
                            AimBotSkillPosition = nil
                            UseFastAttack = false
                        end)
                    elseif not TargetedPlayer then
                        cc2 = {}
                    end
                end
]]
saveplayer = {}
spawn(function()
    while wait() do
        if CheckRace() == "Ghoul V2" then
            spawn(function()
                if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end)
            for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                if not table.find(saveplayer, v.Name) and  game.Players[v.Name].Team ~= game.Players.LocalPlayer.Team then 
                    EnableBuso()
                    repeat
                        wait()
                        Tweento(v.HumanoidRootPart.CFrame)
                        LegitAttack = true
                        AimBotSkillPosition = game.Players:FindFirstChild(TargetedPlayer).Character
                            .HumanoidRootPart.CFrame.Position
                        AimbotDiThangNgu = true
                        autospamskill = true
                    until not v or not v.Parent or v.Humanoid.Health == 0  or CheckCantAttackPlayer(v.Name) or table.find(saveplayer, v.Name) or checksafezone(v.Name)
                end
            end
        end
    end
end)
