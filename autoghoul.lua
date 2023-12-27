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
local Tweento = loadstring(game:HttpGet("https://raw.githubusercontent.com/hlamx/huhu/master/tween.lua"))()
function CheckMaterialCount(name)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == name then
            return v.Count
        end
    end
    return 0
end

function CheckBoss(bg)
    if game:GetService("ReplicatedStorage"):FindFirstChild(bg) then
        for r, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if string.find(v.Name,bg) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    if game.workspace.Enemies:FindFirstChild(bg) then
        for r, v in pairs(game.workspace.Enemies:GetChildren()) do
            if string.find(v.Name,bg) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
end
function ReturnBosses(bg)
    if game:GetService("ReplicatedStorage"):FindFirstChild(bg) then
        for r, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if string.find(v.Name,bg) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    if game.workspace.Enemies:FindFirstChild(bg) then
        for r, v in pairs(game.workspace.Enemies:GetChildren()) do
            if string.find(v.Name,bg) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    return false
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
                        FastAttackConnector:InputSetting(true)
                        FastAttackConnector:InputValue(5,3)
                        FastAttackConnector:Attack(true)
                    end
                )
            end
        end
    end
)

if CheckBoss("Cursed Captain") then
    Target = ReturnBosses("Cursed Captain")
    repeat
        wait()
        if
            game.Workspace.Enemies:FindFirstChild(Target.Name) and
            Target:FindFirstChild("Humanoid") and
            Target:FindFirstChild("HumanoidRootPart") and
            Target.Humanoid.Health > 0
        then
            LegitAttack = true
            EquipWeapon("Melee")
        else
            pcall(
                function()
                    Tweento(Target.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                end
            )
        end
    until  not Target or not Target:FindFirstChild("Humanoid") or
        not Target:FindFirstChild("HumanoidRootPart") or
        Target.Humanoid.Health <= 0
        LegitAttack = false
else print("Cant Detect Boss")
end
