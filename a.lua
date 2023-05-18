--fluxus key = aa28747898c32c8a4dd73eb03e2b9e88
getgenv().Key = "Hlamm dep trai"
getgenv().ChooseTeam = "Marine"
w = task.wait
t = task

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
function click(a)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end
pcall(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
        if getgenv().ChooseTeam == "Marine" then 
            repeat wait()
            click(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton)
        until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() or not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")
    elseif getgenv().ChooseTeam == "Pirates" then 
        repeat wait()
            click(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton)
        until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() or not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")
    else
        repeat wait()
            click(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton)
        until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() or not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")
    end
    end
end)

w(1)
if getgenv().Key == nil or getgenv().Key == "" or string.find(getgenv().Key,"Key") or string.find(getgenv().Key,"key") or string.find(getgenv().Key,"Sitink")or string.find(getgenv().Key,"sitink") then 
return game.Players.LocalPlayer:Kick("May nghi may crack duoc ha?, cai nay co ip log het day thang ngu") 
end 
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport

--------------------------
local DefaultSettings = {
["AttackNocDAura"] = false,
["Ignore Y"] = true,
["HopMirage"] = false,
["PlayerAura"] = false
}
local HttpService = game:GetService("HttpService")
local FolderName = "YMF"
local SaveFileNameGame = "-BloxFruit_Misc.json"
local SaveFileName = game.Players.LocalPlayer.Name..SaveFileNameGame

function SaveSettings(fff,fff2)
if fff~=nil and fff2 ~= nil then
DefaultSettings[fff] = fff2
end
local HttpService = game:GetService("HttpService")
if not isfolder(FolderName) then
makefolder(FolderName)
end
writefile(FolderName.."/" .. SaveFileName, HttpService:JSONEncode(DefaultSettings))
end

function ReadSetting()
local s,e = pcall(function()
local HttpService = game:GetService("HttpService")
if not isfolder(FolderName) then
    makefolder(FolderName)
end
return HttpService:JSONDecode(readfile(FolderName.."/" .. SaveFileName))
end)
if s then return e
else
SaveSettings()
return ReadSetting()
end
end
Settings = ReadSetting()

local placeId = game.PlaceId
if placeId == 2753915549 then
Sea1 = true
elseif placeId == 4442272183 then
Sea2 = true
elseif placeId == 7449423635 then
Sea3 = true
end
CurrentUseAwakedFromScript = 0
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()
function MoonTextureId()
if Sea1 then
return game:GetService("Lighting").FantasySky.MoonTextureId
elseif Sea2 then
return game:GetService("Lighting").FantasySky.MoonTextureId
elseif Sea3 then
return game:GetService("Lighting").Sky.MoonTextureId
end
end
local Window =
OrionLib:MakeWindow(
{
Name = "Hlamm Dep Trai",
HidePremium = false,
SaveConfig = true,
ConfigFolder = "Your Mom Fat",
IntroEnabled = false,
IntroText = "Your Mom Fat",
IntroIcon = "rbxassetid://5245791567",
Icon = "rbxassetid://5245791567",
}
)
local MainTab =
Window:MakeTab(
{
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
}
)
local ServerTab =
Window:MakeTab(
{
Name = "Server ",
Icon = MoonTextureId(),
PremiumOnly = false
}
)
local FarmTab =
Window:MakeTab(
{
Name = "Extra Farm",
Icon = MoonTextureId(),
PremiumOnly = false
}
)
local TrialTab =
Window:MakeTab(
{
Name = "Trial",
Icon = MoonTextureId(),
PremiumOnly = false
}
)

function Notify(T1, T2, T3)
if T1 == nil or T1 == "" then
T1 = "Not Titled"
end
if T2 == nil or T2 == "" then
T2 = "No Any Descriptions"
end
if type(T3) ~= "number" then
T3 = 10
end
OrionLib:MakeNotification(
{
    Name = T1,
    Content = T2,
    Image = MoonTextureId(),
    Time = T3
}
)
end
spawn(
function()
game:GetService("RunService").Stepped:Connect(
    function()
        if not donotdixuyentuong then
            if NoClip then
                if not KRNL_LOADED and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    setfflag("HumanoidParallelRemoveNoPhysics", "False")
                    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                else
                 if not game:GetService("Workspace"):FindFirstChild("LOL") then
                        local LOL = Instance.new("Part")
                        LOL.Name = "LOL"
                        LOL.Parent = game.Workspace
                        LOL.Anchored = true
                        LOL.Transparency = 0.8
                        LOL.Size = Vector3.new(50, 0.5, 50)
                    elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                        game.Workspace["LOL"].CFrame =
                            CFrame.new(
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.8,
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                        )
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
            end
        end
    end
end)
end
)
local SmartBring = {
["Bandit [Lv. 5]"] = true,
["Monkey [Lv. 14]"] = true,
["Gorilla [Lv. 20]"] = true,
["Pirate [Lv. 35]"] = true,
["Desert Bandit [Lv. 60]"] = true,
["Desert Officer [Lv. 70]"] = true,
["Snow Bandit [Lv. 90]"] = true,
["Snowman [Lv. 100]"] = true,
["Chief Petty Officer [Lv. 120]"] = false,
["Sky Bandit [Lv. 150]"] = true,
["Dark Master [Lv. 175]"] = true,
["Prisoner [Lv. 190]"] = false,
["Dangerous Prisoner [Lv. 210]"] = false,
["Toga Warrior [Lv. 250]"] = true,
["Military Soldier [Lv. 300]"] = true,
["Military Spy [Lv. 325"] = true,
["Fishman Warrior [Lv. 375]"] = true,
["Fishman Commando [Lv. 400]"] = true,
["God's Guard [Lv. 450]"] = true,
["Shanda [Lv. 450]"] = true,
["Royal Squad [Lv. 525]"] = true,
["Royal Soldier [Lv. 550]"] = true,
["Galley Pirate [Lv. 625]"] = true,
["Galley Captain [Lv. 650]"] = true,
["Raider [Lv. 700]"] = false,
["Mercenary [Lv. 725]"] = false,
["Swan Pirate [Lv. 775]"] = true,
["Factory Staff [Lv. 800]"] = false,
["Marine Lieutenant [Lv. 875]"] = true,
["Marine Captain [Lv. 900]"] = true,
["Zombie [Lv. 950]"] = true,
["Vampire [Lv. 975]"] = true,
["Snow Trooper [Lv. 1000]"] = false,
["Winter Warrior [Lv. 1050]"] = true,
["Lab Subordinate [Lv. 1100]"] = true,
["Horned Warrior [Lv. 1125]"] = true,
["Magma Ninja [Lv. 1175]"] = false,
["Lava Pirate [Lv. 1200]"] = true,
["Ship Deckhand [Lv. 1250]"] = false,
["Ship Engineer [Lv. 1275]"] = false,
["Ship Steward [Lv. 1300]"] = true,
["Ship Officer [Lv. 1325]"] = false,
["Arctic Warrior [Lv. 1350]"] = true,
["Snow Lurker [Lv. 1375]"] = true,
["Sea Soldier [Lv. 1425]"] = false,
["Water Fighter [Lv. 1450]"] = true,
["Pirate Millionaire [Lv. 1500]"] = false,
["Pistol Billionaire [Lv. 1525]"] = false,
["Dragon Crew Warrior [Lv. 1575]"] = false,
["Dragon Crew Archer [Lv. 1600]"] = false,
["Female Islander [Lv. 1625]"] = false,
["Giant Islander [Lv. 1650]"] = false,
["Marine Commodore [Lv. 1700]"] = false,
["Marine Rear Admiral [Lv. 1725]"] = true,
["Fishman Raider [Lv. 1775]"] = true,
["Fishman Captain [Lv. 1800]"] = false,
["Forest Pirate [Lv. 1825]"] = true,
["Mythological Pirate [Lv. 1850]"] = false,
["Jungle Pirate [Lv. 1900]"] = false,
["Musketeer Pirate [Lv. 1925]"] = true,
["Reborn Skeleton [Lv. 1975]"] = true,
["Living Zombie [Lv. 2000]"] = true,
["Demonic Soul [Lv. 2025]"] = true,
["Posessed Mummy [Lv. 2050]"] = true,
["Peanut Scout [Lv. 2075]"] = true,
["Peanut President [Lv. 2100]"] = true,
["Ice Cream Chef [Lv. 2125]"] = true,
["Ice Cream Commander [Lv. 2150]"] = true,
["Cookie Crafter [Lv. 2200]"] = true,
["Cake Guard [Lv. 2225]"] = true,
["Baking Staff [Lv. 2250]"] = true,
["Head Baker [Lv. 2275]"] = true,
["Cocoa Warrior [Lv. 2300]"] = true,
["Chocolate Bar Battler [Lv. 2325]"] = true,
["Sweet Thief [Lv. 2350]"] = true,
["Candy Rebel [Lv. 2375]"] = true,
["Snow Demon [Lv. 2425]"] = true,
["Candy Pirate [Lv. 2400]"] = true
}
function CancelTween()
Tweento(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end
function function0(a)
if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") then
return true
else
return false
end
end
function function01(tb)
tb2 = 0
for i,v in pairs(tb) do
if v > tb2 then tb2 = v end 
end
print(tb2)
return tb2
end
function function1()
local s = {}
local s3 = false
for _,t1 in pairs(game.workspace.Enemies:GetChildren()) do
if function0(t1) then
    for _,t2 in pairs(game.workspace.Enemies:GetChildren()) do
        if function0(t2) and function0(t1) then
            if (t2.HumanoidRootPart.Position-t1.HumanoidRootPart.Position).Magnitude < 350 then
                if not s[t1.HumanoidRootPart.CFrame] then
                    s[t1.HumanoidRootPart.CFrame] = 1
                else
                    s[t1.HumanoidRootPart.CFrame] = s[t1.HumanoidRootPart.CFrame]+1 
                end
            end
        end
    end
end
end
local s2 = function01(s)
for i,v in pairs(s) do
if v == s2 then 
    print(v)
    s3 = i 
end
end
return s3;
end
function BringMobSkidCuaSeaHub()
local c = function1()
local c2 = game.workspace.Enemies:GetChildren()
if #c2 > 1 then
for c4 = 1,#c2 do
    for k,v in pairs(game.workspace.Enemies:GetChildren()) do
        if function0(v) and (v.HumanoidRootPart.Position-c.Position).Magnitude < 350 then
            v.HumanoidRootPart.CFrame = c
            v.Humanoid:ChangeState(11)
            v.HumanoidRootPart.CanCollide = false
            v.HumanoidRootPart.Size = Vector3.new(1,1,1)
            v.HumanoidRootPart.Transparency = 1
            for _, f in pairs(v:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Velocity = Vector3.new(0, 0, 0)
                    v.CanCollide = 0
                    v.Anchored = true
                end
            end
            if v:FindFirstChild("Humanoid") then
                v.Humanoid.WalkSpeed = 0
                v.Humanoid.JumpPower = 0
            else
                return
            end
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            v.Humanoid:ChangeState(11)
        end
    end
end
end
end
function BringMob()
ememe = game.Workspace.Enemies:GetChildren()
if #ememe > 0 then
for memay = 1, #ememe do
    function GetNpcPos(name)
        local tong
        local c = 0
        for k, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == name then
                if not tong then
                    tong = v.HumanoidRootPart.Position
                else
                    tong = tong + v.HumanoidRootPart.Position
                end
                c = c + 1
            end
        end
        tong = tong / c
        return tong
    end
    totalpos = {}
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if not totalpos[v.Name] then
            totalpos[v.Name] = GetNpcPos(v.Name)
        end
    end
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if not string.find(v.Name, "Boss") or not string.find(v.Name, "Raid") then
            for _, f in pairs(v:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Velocity = Vector3.new(0, 0, 0)
                    v.CanCollide = 0
                    v.Anchored = true
                end
            end
            if v:FindFirstChild("Humanoid") then
                v.Humanoid.WalkSpeed = 0
                v.Humanoid.JumpPower = 0
            else
                return
            end
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            v.Humanoid:ChangeState(11)
            for k, f in pairs(totalpos) do
                if k and v.Name == k then
                    a = {
                        [1] = f.X,
                        [2] = f.Y,
                        [3] = f.Z
                    }
                    hahah = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                    if isnetworkowner(v.HumanoidRootPart) then
                        if SmartBring[v.Name] == false or SmartBring[v.Name] == nil then
                            BringMobSkidCuaSeaHub()
                        else
                            if
                                (v.HumanoidRootPart.Position - CFrame.new(a[1], a[2], a[3]).Position).Magnitude >
                                    3 and
                                    (v.HumanoidRootPart.Position - CFrame.new(a[1], a[2], a[3]).Position).Magnitude <=
                                        349
                                then
                                v.HumanoidRootPart.CFrame = CFrame.new(a[1], a[2], a[3])
                                v.HumanoidRootPart.CanCollide = false
                            end
                        end
                    --elseif not isnetworkowner(v.HumanoidRootPart) and (v.HumanoidRootPart.Position-hahah.Position).Magnitude <= 340 then
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,0)
                    end
                end
            end
        end
    end
end
end
end
function BringMobSmart()
ememe = game.Workspace.Enemies:GetChildren()
if #ememe > 0 then
for memay = 1, #ememe do
    function GetNpcPos(name)
        local tong
        local c = 0
        for k, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == name then
                if not tong then
                    tong = v.HumanoidRootPart.Position
                else
                    tong = tong + v.HumanoidRootPart.Position
                end
                c = c + 1
            end
        end
        tong = tong / c
        return tong
    end
    totalpos = {}
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if not totalpos[v.Name] then
            totalpos[v.Name] = GetNpcPos(v.Name)
        end
    end
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if not string.find(v.Name, "Boss") or not string.find(v.Name, "Raid") then
            for _, f in pairs(v:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Velocity = Vector3.new(0, 0, 0)
                    v.CanCollide = 0
                    v.Anchored = true
                end
            end
            if v:FindFirstChild("Humanoid") then
                v.Humanoid.WalkSpeed = 0
                v.Humanoid.JumpPower = 0
            else
                return
            end
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            v.Humanoid:ChangeState(11)
            for k, f in pairs(totalpos) do
                if k and v.Name == k then
                    a = {
                        [1] = f.X,
                        [2] = f.Y,
                        [3] = f.Z
                    }
                    hahah = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
                    if isnetworkowner(v.HumanoidRootPart) then
                        if
                            (v.HumanoidRootPart.Position - CFrame.new(a[1], a[2], a[3]).Position).Magnitude > 3 and
                                (v.HumanoidRootPart.Position - CFrame.new(a[1], a[2], a[3]).Position).Magnitude <=
                                    349
                            then
                            v.HumanoidRootPart.CFrame = CFrame.new(a[1], a[2], a[3])
                            v.HumanoidRootPart.CanCollide = false
                        end
                        
                    --elseif not isnetworkowner(v.HumanoidRootPart) and (v.HumanoidRootPart.Position-hahah.Position).Magnitude <= 340 then
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,0)
                    end
                end
            end
        end
    end
end
end
end

local FullOfEnemySpawns = {}
for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
if not FullOfEnemySpawns[v.Name] or FullOfEnemySpawns[v.Name] == nil then
FullOfEnemySpawns[v.Name] = {
    v.CFrame
}
elseif FullOfEnemySpawns[v.Name] then
table.insert(FullOfEnemySpawns[v.Name], v.CFrame)
end
end
function CheckMobInDistance(BF)
idot = {
["Workspace"] = false,
["ReplicatedStorage"] = false,
["NilInstace"] = false
}
for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
if table.find(BF, v.Name) then
    idot["Workspace"] = true
end
end
for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
if table.find(BF, v.Name) then
    idot["ReplicatedStorage"] = true
end
end
allnilinstance = getnilinstances()
for i, v in pairs(allnilinstance) do
if table.find(BF, v.Name) then
    idot["NilInstace"] = true
end
end
return idot
end
function deobiettengi(fk, fk2)
for i, v in pairs(fk) do
for i2, v2 in pairs(fk2) do
    if string.find(v, i2) then
        return true
    end
end
end
return false
end
function deobiettengi2(str, fk2)
for i, v in pairs(fk2) do
if string.find(i, str) then
    return true
end
end
end
function getLargestNumber(tablei)
s = 0
for i, v in pairs(tablei) do
if type(i) == "number" and i > s then
    s = i
end
end
return s
end
function removeNumber(str)
if type(str) ~= "string" then
return ""
end
str2 = str:split(" ")
str3 = ""
str5 = getLargestNumber(str2)
for i, v in pairs(str2) do
if i < str5 then
    if i == 0 then
        str3 = v
    else
        str3 = str3 .. " " .. v
    end
end
end
print(str3)
return str3
end
task.spawn(
function()
while task.wait() do
    task.wait()
    if AutoFarmMeter or AutoFarmElec then
        pcall(
            function()
                BringMobSkidCuaSeaHub()
                task.wait(1)
            end
        )
    end
end
end
)
task.spawn(
function()
while task.wait() do
    task.wait()
    if AutoFarmMeter then
        if Sea3 then
            MobFarmRequired = {
                "Candy Rebel [Lv. 2375]",
                "Sweet Thief [Lv. 2350]",
                "Chocolate Bar Battler [Lv. 2325]",
                "Cocoa Warrior [Lv. 2300]"
            }
        end
        if
            AutoFarmMeter and game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and
                ((not game.Players.LocalPlayer.Character.RaceTransformed.Value and
                    game.Players.LocalPlayer.Character.RaceEnergy.Value < 1) or
                    KeepFarm)
            then
            if type(MobFarmRequired) == "table" then
                local mmb = CheckMobInDistance(MobFarmRequired)
                if mmb["Workspace"] then
                    print("Workspace")
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if
                            v and table.find(MobFarmRequired, v.Name) and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0
                            then
                            repeat wait()
                                if v:FindFirstChild("HumanoidRootPart") and  v.Humanoid.Health > 0 then 
                                EquipWeapon()
                                EnableBuso()
                                Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                NoPlayersInTherePlease = v.HumanoidRootPart.CFrame
                                EquipWeapon()
                                EnableBuso()
                                UseFastAttack = true
                                end
                            until not AutoFarmMeter or not v or not table.find(MobFarmRequired, v.Name) or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or (((game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and game.Players.LocalPlayer.Character.RaceTransformed.Value) or (game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1)) and not KeepFarm)
                            UseFastAttack = false
                            --CancelTween()
                        end
                    end
                elseif mmb["ReplicatedStorage"] then
                    print("ReplicatedStorage")
                    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if
                            v and table.find(MobFarmRequired, v.Name) and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0
                            then
                            repeat
                                wait()
                                pcall(
                                    function()
                                        EquipWeapon()
                                        EnableBuso()
                                        Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        EquipWeapon()
                                        EnableBuso()
                                        UseFastAttack = true
                                    end
                                )
                            until not AutoFarmMeter or not v or not table.find(MobFarmRequired, v.Name) or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or (((game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and game.Players.LocalPlayer.Character.RaceTransformed.Value) or (game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1)) and not KeepFarm)
                            UseFastAttack = false
                            --CancelTween()
                        end
                    end
                else
                    id = 0
                    for i, v in pairs(MobFarmRequired) do
                        for i2, v2 in pairs(FullOfEnemySpawns) do
                            if v == i2 or string.find(v, i2) then
                                pcall(
                                    function()
                                        id = id + 1
                                        UseFastAttack = false
                                        EquipWeapon()
                                        EnableBuso()
                                        Tweento(v2[id] * CFrame.new(0, 30, 0))
                                        wait(1)
                                    end
                                )
                            end
                        end
                    end
                end
            else
                print("Please Select A Mob")
            end
        end
    end
end
end
)
task.spawn(
function()
while task.wait() do
    task.wait()
    if Autofarmcoca then
        if Sea3 then
            MobFarmRequired = {
                "Candy Rebel [Lv. 2375]",
                "Sweet Thief [Lv. 2350]",
                "Chocolate Bar Battler [Lv. 2325]",
                "Cocoa Warrior [Lv. 2300]"
            }
        end
        if Autofarmcoca then
            if type(MobFarmRequired) == "table" then
                local mmb = CheckMobInDistance(MobFarmRequired)
                if mmb["Workspace"] then
                    print("Workspace")
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if
                            v and table.find(MobFarmRequired, v.Name) and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0
                            then
                            repeat wait()
                                if v:FindFirstChild("HumanoidRootPart") and  v.Humanoid.Health > 0 then 
                                EquipWeapon()
                                EnableBuso()
                                Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                NoPlayersInTherePlease = v.HumanoidRootPart.CFrame
                                EquipWeapon()
                                EnableBuso()
                                UseFastAttack = true
                                end
                            until not Autofarmcoca or not v or not table.find(MobFarmRequired, v.Name) or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or (((game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and game.Players.LocalPlayer.Character.RaceTransformed.Value) or (game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1)) and not KeepFarm)
                            UseFastAttack = false
                            --CancelTween()
                        end
                    end
                elseif mmb["ReplicatedStorage"] then
                    print("ReplicatedStorage")
                    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if
                            v and table.find(MobFarmRequired, v.Name) and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0
                            then
                            repeat
                                wait()
                                pcall(
                                    function()
                                        EquipWeapon()
                                        EnableBuso()
                                        Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        EquipWeapon()
                                        EnableBuso()
                                        UseFastAttack = true
                                    end
                                )
                            until not Autofarmcoca or not v or not table.find(MobFarmRequired, v.Name) or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or (((game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and game.Players.LocalPlayer.Character.RaceTransformed.Value) or (game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1)) and not KeepFarm)
                            UseFastAttack = false
                            --CancelTween()
                        end
                    end
                else
                    id = 0
                    for i, v in pairs(MobFarmRequired) do
                        for i2, v2 in pairs(FullOfEnemySpawns) do
                            if v == i2 or string.find(v, i2) then
                                pcall(
                                    function()
                                        id = id + 1
                                        UseFastAttack = false
                                        EquipWeapon()
                                        EnableBuso()
                                        Tweento(v2[id] * CFrame.new(0, 30, 0))
                                        wait(1)
                                    end
                                )
                            end
                        end
                    end
                end
            else
                print("Please Select A Mob")
            end
        end
    end
end
end
)

spawn(function()
    if AutoFarmElec then 
        while wait() do 
            BringMob()
        end
    end
end)
task.spawn(
function()
while task.wait() do
    task.wait()
    if AutoFarmElec and AutoGhoulQuest then
if Sea2 then
            MobFarmRequired = {
                "Ship Engineer [Lv. 1275]",
                "Ship Deckhand [Lv. 1250]",
                "Ship Officer [Lv. 1325]",
                "Ship Steward [Lv. 1300]",

            }
        end
        if AutoFarmElec and AutoGhoulQuest then
            if type(MobFarmRequired) == "table" then
                local mmb = CheckMobInDistance(MobFarmRequired)
                if mmb["Workspace"] then
                    print("Workspace")
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if
                            v and table.find(MobFarmRequired, v.Name) and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0
                            then
                            repeat
                                wait()
                                EquipWeapon()
                                BringMobSkidCuaSeaHub()
                                EnableBuso()
                                Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                NoPlayersInTherePlease = v.HumanoidRootPart.CFrame
                                EquipWeapon()
                                EnableBuso()
                                hit = 0
                                UseFastAttack = true
                            until not AutoFarmElec or not AutoGhoulQuest or  not v or not table.find(MobFarmRequired, v.Name) or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
                            UseFastAttack = false
                            --CancelTween()
                        end
                    end
                elseif mmb["ReplicatedStorage"] then
                    print("ReplicatedStorage")
                    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if
                            v and table.find(MobFarmRequired, v.Name) and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0
                            then
                            repeat
                                wait()
                                pcall(
                                    function()
                                        EquipWeapon()
                                        EnableBuso()
                                        BringMobSkidCuaSeaHub()
                                        Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        EquipWeapon()
                                        EnableBuso()
                                        UseFastAttack = true
                                    end
                                )
                            until not AutoFarmElec or not AutoGhoulQuest or  not v or not table.find(MobFarmRequired, v.Name) or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
                            UseFastAttack = false
                            --CancelTween()
                        end
                    end
                else
                    id = 0
                    for i, v in pairs(MobFarmRequired) do
                        for i2, v2 in pairs(FullOfEnemySpawns) do
                            if v == i2 or string.find(v, i2) then
                                pcall(
                                    function()
                                        id = id + 1
                                        UseFastAttack = false
                                        EquipWeapon()
                                        EnableBuso()
                                        Tweento(v2[id] * CFrame.new(0, 30, 0))
                                        wait(1)
                                    end
                                )
                            end
                        end
                    end
                end
            else
                print("Please Select A Mob")
            end
        end
    end
end
end
)
function checkgatcan()
    local a = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor")
if a then 
    return true
    else 
        return false 
end
end
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
if ThreeWorld then
TableLocations = {
    ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
    ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
    ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
    ["Temple of Time"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
    --["Great Tree"] = Vector3.new(2968.699951171875, 2284.286865234375, -7226.28662109375),
}
elseif NewWorld then
TableLocations = {
    ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
    ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
    ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
    ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
}
elseif OldWorld then
TableLocations = {
    ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
    ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
    ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
    ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
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
args = {
"requestEntrance",
vector3
}
game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
char = game.Players.LocalPlayer.Character.HumanoidRootPart
char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
task.wait(0.5)
end
TweenSpeed = 350
function AntiLowHealth(yc5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
CFrame.new(
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
yc5,
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
)
wait()
end
function Tweento(targetCFrame)
NoClip = true
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
    (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
if Distance < 600 then
    Speed = TweenSpeed
elseif Distance >= 600 then
    Speed = TweenSpeed
end
LowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 30 / 100
NotLowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 70 / 100
if game.Players.LocalPlayer.Character.Humanoid.Health <= LowHealth then
    pcall(
        function()
            tween:Cancel()
        end
    )
    OldY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
    repeat
        wait()
        AntiLowHealth(math.random(1000, 10000))
    until not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or
        game.Players.LocalPlayer.Character.Humanoid.Health > NotLowHealth
    AntiLowHealth(OldY)
end
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
if IngoreY and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
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
        (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
            Speed,
        Enum.EasingStyle.Linear
    )
    local tween =
        tween_s:Create(
        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
        info,
        {CFrame = targetCFrameWithDefualtY}
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
        (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
            Speed,
        Enum.EasingStyle.Linear
    )
    local tween =
        tween_s:Create(
        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
        info,
        {CFrame = targetCFrame}
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
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()
local Exploit = "Fluxus" or "Synapse"
-- [Camera Shaker Function]
function CameraShaker()
task.spawn(
function()
    local Camera = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
    while wait() do
        pcall(
            function()
                Camera.CameraShakeInstance.CameraShakeState.Inactive = 0
            end
        )
    end
end
)
end

--[Function RmFzdCBBdHRhY2s=]
if Exploit ~= "Fluxus" then
function CurrentWeapon()
local ac = CombatFrameworkR.activeController
local ret = ac.blades[1]
if not ret then
return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
end
pcall(
function()
    while ret.Parent ~= game.Players.LocalPlayer.Character do
        ret = ret.Parent
    end
end
)
if not ret then
return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
end
return ret
end



bo1 = 0.01
function AttackFunction()
local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
pcall(function()
function GetCurrentBlade() 
local p13 = CbFw2.activeController
local ret = p13.blades[1]
if not ret then return end
while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
return ret
end
end)
local AC = CbFw2.activeController
for i = 1, 1 do 
local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
    plr.Character,
    {plr.Character.HumanoidRootPart},
    60
)
local cac = {}
local hash = {}
for k, v in pairs(bladehit) do
    if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
        table.insert(cac, v.Parent.HumanoidRootPart)
        hash[v.Parent] = true
    end
end
bladehit = cac
if #bladehit > 0 then
    local u8 = debug.getupvalue(AC.attack, 5)
    local u9 = debug.getupvalue(AC.attack, 6)
    local u7 = debug.getupvalue(AC.attack, 4)
    local u10 = debug.getupvalue(AC.attack, 7)
    local u12 = (u8 * 798405 + u7 * 727595) % u9
    local u13 = u7 * 798405
    (function()
        u12 = (u12 * u9 + u13) % 1099511627776
        u8 = math.floor(u12 / u9)
        u7 = u12 - u8 * u9
    end)()
    u10 = u10 + 1
    debug.setupvalue(AC.attack, 5, u8)
    debug.setupvalue(AC.attack, 6, u9)
    debug.setupvalue(AC.attack, 4, u7)
    debug.setupvalue(AC.attack, 7, u10)
    pcall(function()
        for k, v in pairs(AC.animator.anims.basic) do
            v:Play()
        end                  
    end)
    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
    end
end
end
end

cooldownfastattack = tick()
TypeFastAttack = "Normal"
coroutine.wrap(
function()
while task.wait(.1) do
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        if UseFastAttack then
            AttackFunction()
            if TypeFastAttack == "Normal" then
                if tick() - cooldownfastattack > .9 then
                    wait(.1)
                    cooldownfastattack = tick()
                end
            elseif TypeFastAttack == "Fast" then
                if tick() - cooldownfastattack > 1.8 then
                    wait(.03)
                    cooldownfastattack = tick()
                end
            elseif TypeFastAttack == "Slow" then
                if tick() - cooldownfastattack > .3 then
                    wait(.7)
                    cooldownfastattack = tick()
                end
            end
        elseif not UseFastAttack then
            if ac.hitboxMagnitude ~= 55 then
                ac.hitboxMagnitude = 55
            end
        end
        if ac.hitboxMagnitude ~= 55 then
            ac.hitboxMagnitude = 55
        end
    end
end
end
)()
else 
    local up = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local ret = up[2]
function autoattack()
    pcall(function()
        ret.activeController.increment = 2                 
        ret.activeController.timeToNextAttack = 0
        ret.activeController.attacking = false
        ret.activeController.hitboxMagnitude = 100
        ret.activeController.blades = {game.Players.LocalPlayer.Character.HumanoidRootPart}
        ret.activeController:attack() 
    end)
end
spawn(function()
while wait() do 
    if UseFastAttack and Exploit == "Fluxus" then 
        autoattack()
    end
end
end)
end
task.spawn(
function()
while task.wait() do
    task.wait()
    if AutoActiveRace then
        if
            game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and
                game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and
                not game.Players.LocalPlayer.Character.RaceTransformed.Value
            then
            local vim = game:service("VirtualInputManager")
            vim:SendKeyEvent(true, "Y", false, game)
            task.wait()
            vim:SendKeyEvent(false, "Y", false, game)
            CurrentUseAwakedFromScript = CurrentUseAwakedFromScript + 1
            task.wait(5)
        end
    end
end
end
)
task.spawn(
function()
while task.wait() do
    task.wait()
    if WaitUntilMeterOut then
        wait()
        if
            game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and
                game.Players.LocalPlayer.Character.RaceTransformed.Value
            then
            CancelTween()
            --task.wait(1.5)
            a = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,math.random(100,10000),0)
            Tweento(a)
        end
    end
end
end
)
task.spawn(
function()
while task.wait() do
    task.wait()
    if AutoResetCharacterRace then
        if
            game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and
                game.Players.LocalPlayer.Character.RaceTransformed.Value
            then
            if game.Players.LocalPlayer.Character.RaceTransformed.Value then
                task.wait()
                pcall(
                    function()
                        game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    end
                )
                task.wait(5)
            end
        end
    end
end
end
)
ClaimedQuest = false
function ClaimQuest()
if ClaimedQuest == false then
local args = {
    [1] = "Wenlocktoad",
    [2] = "2"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
Notify("Quest V3","Claimed Quest V3",10)
ClaimedQuest = true
end
end
function ReturnBosses(bossname)
if game:GetService("ReplicatedStorage"):FindFirstChild(bossname) then
for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if v.Name == bossname then
        return v
    end
end
end
if game.workspace.Enemies:FindFirstChild(bossname) then
for i, v in pairs(game.workspace.Enemies:GetChildren()) do
    if v.Name == bossname then
        return v
    end
end
end
return false
end
function CheckBoss(bossname)
if game:GetService("ReplicatedStorage"):FindFirstChild(bossname) then
for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if v.Name == bossname then
        return true
    end
end
end
if game.workspace.Enemies:FindFirstChild(bossname) then
for i, v in pairs(game.workspace.Enemies:GetChildren()) do
    if v.Name == bossname then
        return true
    end
end
end
return false
end
function EnableBuso()
if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
local args = {
    [1] = "Buso"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
function GetWeapon(wptype)
s = ""
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.ToolTip == wptype then
    s = v.Name
end
end
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") and v.ToolTip == wptype then
    s = v.Name
end
end
return s
end
local plr = game.Players.LocalPlayer
function EquipWeapon(ToolSe)
if lonmemayto == "" or lonmemayto == nil then
lonmemayto = "Melee"
end
ToolSe = GetWeapon(lonmemayto)
if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
wait(.4)
game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
end
end
local fruitwl = {'Magma-Magma','Quake-Quake','String-String','Bird-Bird: Phoenix','Rumble-Rumble','Paw-Paw','Blizzard-Blizzard','Gravity-Gravity','Dough-Dough','Shadow-Shadow','Venom-Venom','Spirit-Spirit','Dragon-Dragon','Leopard-Leopard'}
function EquipWeapon2()

for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
    if v:IsA("Tool") and v.ToolTip == "Blox Fruit" and  table.find(v.Name,fruitwl) then
        v.Parent = plr.Character
    end
        if v:IsA("Tool") and v.ToolTip == "Melee" then
        v.Parent = plr.Character
    end
    if v:IsA("Tool") and v.ToolTip == "Sword" then
        v.Parent = plr.Character
    end
end
end
function TweenMirage()
repeat
wait()
until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
print("Tweening to Mirage Island")
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
AllNPCS = getnilinstances()
for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    table.insert(AllNPCS, v)
end
for i, v in pairs(AllNPCS) do
    if v.Name == "Advanced Fruit Dealer" then
        Tweento(v.HumanoidRootPart.CFrame)
    end
end
end
end
function tweenhighest()
repeat wait() until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
if game.Workspace.Map:FindFirstChild("MysticIsland") then 
    for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do 
if v:IsA("MeshPart") then 
if v.MeshId == "rbxassetid://6745037796" then 
a = v.CFrame * CFrame.new(0,300,0)
Tweento(a)
wait(3)
tweenisland = false
end
end
end
end
end
function tweentemple2()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end
function TweenTemple()
Tweento(CFrame.new(2956.78, 2281.85, -7217.63))
local args = {
[1] = "RaceV4Progress",
[2] = "Check"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
local args = {
[1] = "RaceV4Progress",
[2] = "Teleport"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
function questmirage()
TweenTemple()
wait(3)
Tweento(CFrame.new(28613.40625, 14896.5341796875, 106.96485137939453))
local args = {
[1] = "RaceV4Progress",
[2] = "Check"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
local args = {
[1] = "RaceV4Progress",
[2] = "TeleportBack"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

end
function NoFog()
local c = game.Lighting
c.FogEnd = 100000
for i, v in pairs(c:GetDescendants()) do
if v:IsA("Atmosphere") then
    v:Destroy()
end
end
end

function CheckMoon()
moon8 = "http://www.roblox.com/asset/?id=9709150401"
moon7 = "http://www.roblox.com/asset/?id=9709150086"
moon6 = "http://www.roblox.com/asset/?id=9709149680"
moon5 = "http://www.roblox.com/asset/?id=9709149431"
moon4 = "http://www.roblox.com/asset/?id=9709149052"
moon3 = "http://www.roblox.com/asset/?id=9709143733"
moon2 = "http://www.roblox.com/asset/?id=9709139597"
moon1 = "http://www.roblox.com/asset/?id=9709135895"
moonreal = MoonTextureId()
cofullmoonkothangbeo = "Bad Moon"
if moonreal == moon5 or moonreal == moon4 then
if moonreal == moon5 then
    cofullmoonkothangbeo = "Full Moon"
elseif moonreal == moon4 then
    cofullmoonkothangbeo = "Next Night"
end
end
return cofullmoonkothangbeo
end
function function7()
GameTime = "Error"
local c = game.Lighting
local c2 = c.ClockTime
if c2 >= 18 or c2 < 5 then
GameTime = "Night"
else
GameTime = "Day"
end
return GameTime
end
function TweenHighestPoint()
repeat
task.wait()
until game:GetService("Workspace"):FindFirstChild("StartPoint")
c5 = game:GetService("Workspace").StartPoint.CFrame
Tweento(c5)
end
function StopTween()
pcall(
function()
    tween:Cancel()
end
)
end
MainTab:AddButton(
{
Name = "Remove Fog",
Callback = function()
    NoFog()
end
}
)
spawn(function()
while wait() do 
if movecamera then 

    local lighting = game:GetService("Lighting");
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
end
end
end)
stop = false
spawn(function()
while wait() do 
if miragepromax and Sea3 then
if not checkgatcan() then 
local v213 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
wait(2)
if v213 ~= 4 then
repeat wait()
 game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
 wait()
 questmirage()
 wait(3)
 game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
 break;
until v213 == 4
end
if v213 == 4 then 
repeat wait() until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and function7() == "Night"then 
    if not stop then
NoFog()
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do 
if v:IsA("MeshPart") then 
if v.MeshId == "rbxassetid://6745037796" then 

a = v.CFrame * CFrame.new(0,300,0)
Tweento(a)
wait(3)
stop = true
end
end
end
end
movecamera = true
wait(2)
            local vim = game:service("VirtualInputManager")
            vim:SendKeyEvent(true, "T", false, game)
            task.wait()
            vim:SendKeyEvent(false, "T", false, game)
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do 
if v:IsA("MeshPart") then 
if v.MeshId == "rbxassetid://10153114969" then 
if v.Transparency ~= 1 then
    movecamera = false
a = v.CFrame
Tweento(a)
wait(3)

end
end
end
end
end
end
else
    miragepromax = false
end
end
end
end)

MainTab:AddToggle({
Name = "Move Camera",
Callback = function(a)
movecamera = a 
end
})

MainTab:AddButton(
{
Name = "Check Moon Status",
Callback = function()
    Notify("Moon Status", CheckMoon(), 10)
end
}
)
MainTab:AddToggle(
{
Name = "AttackNocDAura",
Default = Settings["AttackNocDAura"],
Save = true,
Flag = "Aura",
Callback = function(Value)
    UseFastAttack = Value
    SaveSettings("AttackNocDAura", Value)
    
end
}
)
MainTab:AddToggle(
{
Name = "Ignore Y Tween",
Default = true,
Save = true,
Flag = "IngoreY",
Callback = function(Value)
    IngoreY = true
    SaveSettings("Ignore Y", Value)
    
end
}
)
ALLNPCOOO = {}
for i, v in pairs(getnilinstances()) do
if
v:IsA("Model") and v:FindFirstChild("Head") and v.Head:FindFirstChild("QuestBBG") and
    v.Head.QuestBBG.Title.Text == "MISC."
then
ALLNPCOOO[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)
end
end
for i, v in pairs(game.Workspace.NPCs:GetDescendants()) do
if v.Name == "QuestBBG" and v.Title.Text == "MISC." then
ALLNPCOOO[v.Parent.Parent.Name] = v.Parent.Parent.Head.CFrame * CFrame.new(0, -2, 2)
end
end
ALLNPCOOO2 = {}
for i, v in pairs(ALLNPCOOO) do
table.insert(ALLNPCOOO2, i)
end

ClickedSea = {
["Sea 1"] = 0,
["Sea 2"] = 0,
["Sea 3"] = 0,
}
Seas = {
"Sea 1",
"Sea 2",
"Sea 3",
}
function CheckSea(Sea)
if game.PlaceId == 2753915549 then
if Sea == 1 then return true; end
elseif game.PlaceId == 4442272183 then
if Sea == 2 then return true; end
elseif game.PlaceId == 7449423635 then
if Sea == 3 then return true; end
end
return false;
end
function TeleportSea(Sea)
print("Teleporting Sea: "..Sea)
if Sea == 1 then
if not CheckSea(Sea) then
    local args = {
        [1] = "TravelMain"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    wait()
end
elseif Sea == 2 then
if not CheckSea(Sea) then
    local args = {
        [1] = "TravelDressrosa"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
elseif Sea == 3 then
if not CheckSea(Sea) then
    local args = {
        [1] = "TravelZou"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end
MainTab:AddDropdown(
{
Name = "Teleport World",
Default = "",
Options = Seas,
Callback = function(Value)
    ClickedSea[Value] = ClickedSea[Value]+1
    if ClickedSea[Value] >= 2 then
        dkkd = tostring(Value):gsub("Sea ","")
        dkkd2 = tonumber(dkkd)
        TeleportSea(dkkd2)
        Notify("Script Stauts","Teleporting to "..Value.." !",10)
    else
        Notify("Script Stauts","Are You Sure Teleport To "..Value.." ?\nClick Again To Confirm!",10)
    end
end
}
)

function function6()
return math.floor(game.Lighting.ClockTime)
end
PlayerAura_Status = "None"
function CheckAcientOneStatus()
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
return "Can Buy Gear With "..v227.." Fragments"
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
print(CheckAcientOneStatus())
--[[spawn(function() 
while wait() do 
if CheckAcientOneStatus() ~= "Ready For Trial" or CheckAcientOneStatus() ~= "You Are Done Your Race." then 
    AutoBuyGear = true
    AutoActiveRace = true
    AutoFarmMeter = true 
    WaitUntilMeterOut = true
end
if CheckAcientOneStatus() == "You have yet to achieve greatness" and  checkgatcan() == false then 
    miragepromax = true
end
if CheckAcientOneStatus() == "Ready For Trial" or (CheckAcientOneStatus() == "You have yet to achieve greatness" and checkgatcan2() == "Account Đã Gạt Cần") then 
    AutoBuyGear = false
    AutoActiveRace = false
    AutoFarmMeter = false 
    WaitUntilMeterOut = false
end
end
end)
]]
function BuyGear()
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
end
function MirageCheck()
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
return "Have Mirage"
else
return "Dont Have Mirage"
end
end

spawn(function()
    while wait() do 
if not checkgatcan() then 
    miragepromax = true
elseif checkgatcan() then 
    miragepromax = false
end
end
end)
function checkgatcan2()
    if checkgatcan() then 
        return "Account Đã Gạt Cần"
    else return "Account Chưa Gạt Cần"
end
end
function checkmirrorvamu()
    checkcheck = {}
    for i, v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("getInventory")    ) do
        if v.Name == "Mirror Fractal" then 
            table.insert(checkcheck,"MR")
        end
        if v.Name == "Valkyrie Helm" then 
            table.insert(checkcheck, "VK")
        end
    end
    return table.concat(checkcheck," & ")
end
 
function formatNumber(v)
    return tostring(v):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end
function checkweapon() 
    sw = {}
    local args = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("getInventory")
for i,v in pairs(args) do 
    if v.Type == "Sword" and (v.Rarity == 3 or v.Rarity == 4 )then
        table.insert(sw,v.Name)
end
end
return table.concat(sw,",")
end
function checkfruit() 
    fruit = {}
    local args = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("getInventory")
for i,v in pairs(args) do 
    if v.Type == "Blox Fruit" then
        if v.Rarity == 3 or v.Rarity == 4 then 
        table.insert(fruit,v.Name)
         end
     end
    end
    return table.concat(fruit,",")
end
local getawaken = (function()
	local awks = {}
	local awk = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getAwakenedAbilities")
	local canreturn;
    local returnmessage; 
    if awk then
    for i, v in pairs(awk) do 
        if v.Awakened then
            table.insert(awks, v.Key)
            canreturn = true
        else
            canreturn = false
            returnmessage = "Fruit Can't Awaken"
		end
	end
else
    canreturn = false
    returnmessage = "Fruit Can't Awaken"
end
    if canreturn then
	    return table.concat(awks, ", ")
    else
        return returnmessage
    end
end)
function checkmelee()
        local checkmelee = {}
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1 then
        table.insert(checkmelee, "Sharkman Karate")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1 then
        table.insert(checkmelee, "Death Step")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1 then
        table.insert(checkmelee, "Electric Claw")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
        table.insert(checkmelee, "Dragon Talon")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then
        table.insert(checkmelee, "Superhuman")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        table.insert(checkmelee, "God Human")
    end
    return table.concat(checkmelee, ", ")
end
function checkgatcan()
    local a = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor")
if a then 
    return true
    else 
        return false 
end
end
function checkgatcan2()
    cac = {}
    if checkgatcan() then 
        table.insert(cac,"Account Đã Gạt Cần") 
    else table.insert(cac,"Account Chưa Gạt Cần")
end
return table.concat(cac)
end

local function v5()
    local l__LocalPlayer__3 = game.Players.LocalPlayer;
local l__Character__4 = l__LocalPlayer__3.Character;
	for v6, v7 in pairs({ "Last Resort", "Agility", "Water Body", "Heavenly Blood", "Heightened Senses", "Energy Core" }) do
		if l__LocalPlayer__3.Backpack:FindFirstChild(v7) then
			return true;
		end;
		if l__Character__4:FindFirstChild(v7) then
			return true;
		end;
	end;
end;
function checkrace()
    race = {}
    local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1");
    local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        table.insert(race,game.Players.LocalPlayer.Data.Race.Value.." V4")
    end
 if v113 == -2 and not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then 
         table.insert(race,game.Players.LocalPlayer.Data.Race.Value.." V3")
 end
if v111 == -2 and not v5() and not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then 
        table.insert(race,game.Players.LocalPlayer.Data.Race.Value.." V2") 
end 
if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") and not v5() and not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then

    table.insert(race,game.Players.LocalPlayer.Data.Race.Value.." V1")
end
    return table.concat(race)
end
database = {}
datainv = {}
function setalias()
    asdas = {}
    table.insert(asdas,game:GetService("Players").LocalPlayer.Data.Level.Value)
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        table.insert(asdas, "God Human")
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("getInventory")) do 
        if v.Name == "Cursed Dual Katana" then 
            table.insert(asdas,"CDK")
        end
        if v.Name == "Soul Guitar" then 
            table.insert(asdas,"SG")
        end
    end
 table.insert(asdas,checkrace())
return table.concat(asdas,",")
end
    function checkmasterydf()
        mas = 0
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                mas = v.Level.Value
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                mas = v.Level.Value
            end
        end

        return mas;
    end
local ddr = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
local level = game:GetService("Players").LocalPlayer.Data.Level.Value
local beli = formatNumber(game:GetService("Players").LocalPlayer.Data.Beli.Value)
local fragment = formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)
local function8 = ServerTab:AddLabel("Player Count: " .. game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers)
local function9 = ServerTab:AddLabel("Server Time: " .. function6() .. " | " .. function7())
local function10 = ServerTab:AddLabel("Player Aura Status: "..tostring(PlayerAura_Status))
local function11 = ServerTab:AddLabel("Acient One Status: "..tostring(CheckAcientOneStatus()))
local mirangecheck = ServerTab:AddLabel("Mirage: "..MirageCheck().." | "..CheckMoon())
local checkgatcan = ServerTab:AddLabel("Status Lever: "..checkgatcan2())
local checkvkmr = ServerTab:AddLabel("MR + VK Status: "..checkmirrorvamu())
local stats = ServerTab:AddLabel(setalias())
task.spawn(
function()
while task.wait() do
    function8:Set("Player Count: " .. game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers)
    function9:Set("Server Time: " .. function6() .. " | " .. function7())
    function10:Set("Player Aura Status: "..tostring(PlayerAura_Status))
    function11:Set("Acient One Status: "..tostring(CheckAcientOneStatus()))
    mirangecheck:Set("Mirage: "..MirageCheck().." | "..CheckMoon())
    checkgatcan:Set("Status Lever: "..checkgatcan2())
    checkvkmr:Set("MR + VK Status: "..checkmirrorvamu())
    stats:Set(setalias())
    task.wait(2)
end
end
)
ServerTab:AddButton({
Name = "Coppy Server Job Id",
Callback = function()
setclipboard(game.JobId)
end
})
ServerTab:AddTextbox(
{
Name = "Put A Server Job Id Here",
Default = "",
TextDisappear = true,
Callback = function(Value)
    if Value == "game.JobId" then
        InputJobId = game.JobId
    else
        InputJobId = Value
    end
    Notify("Script Status", "Inputed JobID: " .. InputJobId)
end
}
)
ServerTab:AddButton(
{
Name = "Join Job Id Server",
Callback = function()
    Notify("Notify", "Joining Server Job Id: " .. tostring(InputJobId), 10)
    w(.5)
    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", tostring(InputJobId))
end
}
)
ServerTab:AddToggle({
Name = "Auto Join Serer",
Save = false,
Callback = function(a)
autojoin = a 
end
})


spawn(function()
while wait(3) do
if not detectkick and autojoin then  
game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", tostring(InputJobId))
end
end
end)
repeat wait() until game:IsLoaded()

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
local s,e = pcall(function()
local HttpService = game:GetService("HttpService")
if not isfolder("Sea Hub") then
    makefolder("Sea Hub")
end
return HttpService:JSONDecode(readfile("Sea Hub/" .. SaveFileName))
end)
if s then return e
else
SaveSettings2()
SaveSettings()
return ReadSetting2()
end
end
Settings2 = ReadSetting2()

function HopServer()
local function Hop()
for i=1,100 do
    local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
    for k,v in pairs(huhu) do
        if k~=game.JobId and v.Count < 10 then
            if not Settings2[k] or tick() - Settings2[k].Time > 60*10  then
            Settings2[k] = {
                    Time = tick()
                }
                SaveSettings2()
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",k)
                return true
            elseif tick() - Settings2[k].Time > 60*60 then
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
for k,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
    child(v)
end
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(child)
getgenv().Loaded = true
end
while not Hop() do wait() end
SaveSettings2()
SaveSettings()
end

ServerTab:AddButton({
Name = "Server Hop",
Callback = function()
HopServer()
end
})
if Sea3 then
ServerTab:AddToggle(
{
    Name = "Hop Until Mirage Island",
    Default = false,
    Flag = "HopMirage",
    Callback = function(Value)
        HopMirage = Value
        if Value == false then
            CancelTween()
        end
        SaveSettings("HopMirage", Value)

    end
}
)
end
ServerTab:AddSlider({
Name = "Slider",
Min = 0,
Max = 20,
Default = 1,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "Time Delay Hop",
Callback = function(Value)
timedelay = Value
end    
})
function IsMirageIsland2()
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
return true
else
return false
end
end
task.spawn(function()
while task.wait() do task.wait() 
if Sea3 and OrionLib.Flags["HopMirage"].Value then
    if IsMirageIsland2() and CheckMoon() == "Full Moon" then
        Notify("Script Status","Mirage Found On This Server.",30)
        task.wait(3)
        else 
        HopServer()
    end
end
end
end)
BlackList = {}
local plr = game.Players.LocalPlayer

task.spawn(function()
while task.wait() do 
if PlayerAura then
    cac = true
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name and not BlackList[v.Name] and game.Workspace.Characters:FindFirstChild(v.Name) and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 and v.Character.Humanoid.Health > 0 then
            PlayerAura_Status = v.Name.." Is Team"..tostring(v.Team)
            SelectedPlayer = v.Name
            repeat wait()
                if PlayerAura and game.Workspace.Characters:FindFirstChild(v.Name) and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 and v.Character.Humanoid.Health > 0 then
                    PlayerAura_Status = "Trying Tween to "..v.Name
                    SelectedPlayer = v.Name
                    ofo = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
                    Tweento(ofo)
spawn(function()
                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                wait()
            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                AimBotSkillPosition = v.Character.HumanoidRootPart.CFrame.Position
            end)
            spawn(function()
game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                wait()
            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)                        
            AimBotSkillPosition = v.Character.HumanoidRootPart.CFrame.Position
            end)
            spawn(function()
                
game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                wait()
            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
            AimBotSkillPosition = v.Character.HumanoidRootPart.CFrame.Position
                
            end)
            EnableBuso()
                        EquipWeapon()

                    UseFastAttack = true
                end
            until not PlayerAura or not v or not v.Character:FindFirstChild("Humanoid") or not v.Character:FindFirstChild("HumanoidRootPart") or v.Character.Humanoid.Health <= 0 or BlackList[v.Name] 
            if not table.find(v.Name,BlackList) then 
                table.insert(v.Name,BlackList)
            end
            print(#BlackList)
            PlayerAura_Status = "None"
            UseFastAttack = false
        end
    end
end
end
end)
FarmTab:AddToggle({
Name = "Aimbot Player Aura",
Callback = function(a)
aimbotaura = a 
end
})
spawn(function()
while wait() do 
if aimbotaura then 
for i,v in pairs(game.Players:GetChildren()) do
    if v.Name == PlayerAura_Status then 
        AimBotSkillPosition = v.Character.HumanoidRootPart.CFrame.Position
end
end
end
end
end)
FarmTab:AddDropdown(
{
Name = "Choose Fast Attack Type",
Default = Settings["Fast Attack Type"],
Options = {
    "Fast",
    "Normal",
    "Slow"
},
Callback = function(Value)
    TypeFastAttack = Value
    SaveSettings("Fast Attack Type",Value)
end
}
)
FarmTab:AddToggle(
{
Name = "Auto Farm Meter Race Awakening",
Default = Settings["AutoFarmMeter"],

Flag = "AutoFarmMeter",
Callback = function(Value)
    AutoFarmMeter = Value
    if Value == false then
        CancelTween()
    end
    SaveSettings("AutoFarmMeter",Value)

end
}
)
FarmTab:AddToggle(
{
Name = "Ingore Full Meter And Keep Farm (FPS Drop Warning)",
Default = Settings["KeepFarm"],

Flag = "KeepFarm",
Callback = function(Value)
    if WaitUntilMeterOut then
        return Notify("Script Warning","The Wait Until Meter out can not enable with this function",10)
    end
    KeepFarm = Value
    if Value == false then
        CancelTween()
    end
    SaveSettings("KeepFarm",Value)
end
}
)
FarmTab:AddToggle(
{
Name = "Auto Active Race",
Default = Settings["AutoActiveRace"],

Flag = "AutoActiveRace",
Callback = function(Value)
    AutoActiveRace = Value
    if Value == false then
        CancelTween()
    end
    SaveSettings("AutoActiveRace",Value)
end
}
)
FarmTab:AddToggle(
{
Name = "Random Y Until Meter Out",
Default = Settings["WaitUntilMeterOut"],

Flag = "WaitUntilMeterOut",
Callback = function(Value)
    if KeepFarm then
        Notify("Script Warning", 'You Must Disable "Ingore Full Meter And Keep Farm" To Enable This', 10)
        return
    end
    WaitUntilMeterOut = Value
    if Value == false then
        CancelTween()
    end
    SaveSettings("WaitUntilMeterOut",Value)
end
}
)
FarmTab:AddDropdown(
{
Name = "Select Your Weapon Type",
Default = Settings["SelectedWeaponType"],
Flag = "SelectedWeaponType",

Options = {
    "Melee",
    "Sword"
},
Callback = function(Value)
    lonmemayto = Value
    SaveSettings("SelectedWeaponType",Value)
end
}
)
FarmTab:AddButton(
{
Name = "Bring Mob (Smart Bring)",
Callback = function()
    BringMobSmart()
end
}
)
FarmTab:AddToggle(
{
Name = "Player Aura",
Default = Settings["PlayerAura"],

Flag = "PlayerAura",
Callback = function(Value)
    PlayerAura = Value
    if Value == false then
        CancelTween()
    end
    SaveSettings("PlayerAura",Value)
end
}
)
FarmTab:AddButton(
{
Name = "Black List Current Selected PLayer",
Callback = function()
    BlackList[SelectedPlayer] = true
end
}
)
FarmTab:AddButton(
{
Name = "Clear Black List",
Callback = function()
    BlackList = {}
end
}
)
local ShopTab =
Window:MakeTab(
{
Name = "Shop",
Icon = "rbxassetid://4483345999",
PremiumOnly = false
}
)
function BuyMelee(vcc)
if vcc == "ElectricClaw" then
game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("BuyElectricClaw")
elseif vcc == "Superhuman" then
local args = {
    [1] = "BuySuperhuman"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif vcc == "Godhuman" then
function BuyGodhuman()
    local args = {
        [1] = "BuyGodhuman",
        [2] = true
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BuyGodhuman"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
BuyGodhuman()
elseif vcc == "DragonTalon" then
local string_1 = "BuyDragonTalon"
local bool_1 = true
local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"]
Target:InvokeServer(string_1, bool_1)
local string_1 = "BuyDragonTalon"
local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"]
Target:InvokeServer(string_1)
elseif vcc == "DeathStep" then
local args = {
    [1] = "BuyDeathStep"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
elseif vcc == "SharkmanKarate" then
local args = {
    [1] = "BuySharkmanKarate",
    [2] = true
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
local args = {
    [1] = "BuySharkmanKarate"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
concacmcc = {
"ElectricClaw",
"Superhuman",
"Godhuman",
"DragonTalon",
"DeathStep",
"SharkmanKarate"
}
function BuyGhoulRace()
local args = {
[1] = "Ectoplasm",
[2] = "BuyCheck",
[3] = 4
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
local args = {
[1] = "Ectoplasm",
[2] = "Change",
[3] = 4
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
ShopTab:AddDropdown(
{
Name = "Buy Melee",
Default = "",
Options = concacmcc,
Callback = function(c)
    BuyMelee(c)
end
}
)
ShopTab:AddButton(
{
Name = "Reroll race",
Callback = function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Reroll",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
}
)

ShopTab:AddButton(
{
Name = "Buy Cyborg race",
Callback = function()
    local args = {
        [1] = "CyborgTrainer",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
}
)
ShopTab:AddButton(
{
Name = "Buy Ghoul Race",
Callback = function()
    BuyGhoulRace()
end
}
)
ShopTab:AddButton(
{
Name = "Reset Stats",
Callback = function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Refund",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
}
)
ShopTab:AddButton(
{
Name = "Buy Gear",
Callback = function()
    BuyGear()
end
}
)
ShopTab:AddToggle({
Name = "Auto Buy Gear",
Default = Settings["AutoBuyGear"],

Flag = "AutoBuyGear",
Callback = function(Value)
AutoBuyGear = Value
Settings["AutoBuyGear"] = Value
end
})

task.spawn(function()
while task.wait() do
if AutoBuyGear then
    local function12 = CheckAcientOneStatus()
    if string.find(function12,"Can Buy Gear") then
        BuyGear()
    end
end
task.wait(5)
end
end)
function PullLever()
    d = 10
    if checkgatcan2() == "Account Đã Gạt Cần" then 
        tweentemple2()
        wait(1)
        Tweento(CFrame.new(28576.947265625, 14937.8603515625, 76.32427978515625))
        local l__Temple_of_Time__1 = workspace.Map:FindFirstChild("Temple of Time");
        for i,v in pairs(game.Workspace.Map["Temple of Time"]:GetChildren()) do 
        end
        local v5 = Instance.new("ProximityPrompt", l__Temple_of_Time__1.Lever.Prompt);
        
        local l__TweenService__1 = game:GetService("TweenService");
        
            v5:Destroy()
            local v6 = Instance.new("NumberValue");
            v6.Changed:Connect(function(p3)
                l__Temple_of_Time__1.Lever.Lever.CFrame = l__Temple_of_Time__1.Lever.Mid.CFrame * CFrame.Angles(0, 0, -1.5707963267948966) * CFrame.Angles(math.rad(v6.Value * 60 - 45), 0, 0) * CFrame.new(0, 3.6, 0);
            end);
            l__Temple_of_Time__1.Lever.Mid.SFX:Play();
            l__Temple_of_Time__1.MainDoorSound.SFX:Play();
            l__TweenService__1:Create(v6, TweenInfo.new(0.4), {
                Value = 1
            }):Play();
            l__TweenService__1:Create(l__Temple_of_Time__1.MainDoor1, TweenInfo.new(4.5, Enum.EasingStyle.Linear), {
                CFrame = l__Temple_of_Time__1.MainDoor1.CFrame * CFrame.new(0, -41.953, 0)
            }):Play();
            l__TweenService__1:Create(l__Temple_of_Time__1.MainDoor2, TweenInfo.new(4.5, Enum.EasingStyle.Linear), {
                CFrame = l__Temple_of_Time__1.MainDoor2.CFrame * CFrame.new(0, -41.953, 0)
            }):Play();
            game.Debris:AddItem(v6, 2);
            return true
end
end
function TweentoCurrentRaceDoor()
if workspace.Map:FindFirstChild("Temple of Time") and game:GetService("Workspace").Map["Temple of Time"].MainDoor2.CFrame.Position == CFrame.new(28578.234375, 14531.939453125, -87.38996124267578) or PullLever() then 
    a = game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union.CFrame 
        Tweento(a)
else print("DONT OPEN")
end
end
if game.PlaceId == 7449423635 then 
spawn(function()
if checkgatcan2() == "Account Đã Gạt Cần" then 
PullLever()
wait(1)
TweentoCurrentRaceDoor()
end
end)
end
--[[spawn(function()
    print(PullLever())
if checkgatcan2() == "Account Đã Gạt Cần" then 
PullLever()
        end
print(PullLever())
wait(2)
if PullLever() then 
    TweentoCurrentRaceDoor()
end
end)]]


spawn(function()
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = {...}
if tostring(method) == "FireServer" then
    if tostring(args[1]) == "RemoteEvent" then
        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
            if cac then
                args[2] = AimBotSkillPosition
                print(args[2])
                return old(unpack(args))
            end
        end
    end
end
return old(...)
end)
end)
if Sea3 then

TrialTab:AddButton({
Name = "Pull Lever",
Callback = function()
    PullLever()
end
})
TrialTab:AddButton({
Name = "Tween to Current Race Door",
Callback = function()
    TweentoCurrentRaceDoor()
end
})
    
TrialTab:AddButton({
    Name = "Tween To Clock",
    Callback = function()
        Tweento(CFrame.new(29539.82421875, 15069.001953125, -86.21076202392578))
    end
})
TrialTab:AddToggle({
Name = "Mink",
Callback = function(a)
   autotrialmink = a
end
})
task.spawn(function()
    while task.wait() do
    task.wait()
    if autotrialmink then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Speed"].CFrame.Position).Magnitude <= 1000 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").StartPoint.CFrame
            end
    end
    end 
    end)
TrialTab:AddToggle({
Name = "FIsh Trial (Beta)",
Callback = function(a)
trialfish = a 
end
})
TrialTab:AddButton({
Name = "Cyborg",
Callback = function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20013.2402, 10090.5332, -17.1017056, -0.697729588, 2.21663612e-08, -0.716361225, 4.15089296e-08, 1, -9.48634149e-09, 0.716361225, -3.63542902e-08, -0.697729588)
        NoClip = false
    end)
end
})
TrialTab:AddButton({
Name = "Sky",
Callback = function()
    pcall(function()
        Tweento(game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.CFrame)
        NoClip = false
    end)
end
})
TrialTab:AddToggle(
{
    Name = "Human",
    Default = Settings["BypassTrial_Human"],
    
    Flag = "BypassTrial_Human",
    Callback = function(Value)
        BypassTrial_Human = Value
        if Value == false then
            CancelTween()
        end
        Settings["BypassTrial_Human"] = Value
    end
}
)
TrialTab:AddToggle({
    Name = "Auto Trial Ghoul", 
    Callback = function(Value)
        AutoTrialGhoul = Value
    end
})
TrialTab:AddToggle({
    Name = "Kill Aura",
    Callback = function(Value)
        KillAura = Value
    end
})
spawn(function()
    while wait() do
        if Killaura or AutoTrialGhoul or BypassTrial_Human then
             for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        pcall(function()
                            repeat 
                                BringMobSkidCuaSeaHub()
                                v.Humanoid.Health = 0
                            until not AutoTrialGhoul or not  AutoTrialGhoul or not BypassTrial_Human  or v.Humanoid.Health <= 0 or not v.Parent
                        end)
    end
end
end
end)

end

if game.Players.LocalPlayer.Data.Race.Value == "Human" then 
    BypassTrial_Human = true
elseif game.Players.LocalPlayer.Data.Race.Value == "Skypiea" then 
    
elseif game.Players.LocalPlayer.Data.Race.Value == "Ghoul" then 
    AutoTrialGhoul = true 
elseif game.Players.LocalPlayer.Data.Race.Value == "Mink" then 
    autotrialmink = true
end
TrialTab:AddToggle(
{
    Name = "Auto Do Ghoul Quest (Must In Sea 2)",
    Default = Settings["AutoGhoulQuest"],
    
    Flag = "AutoGhoulQuest",
    Callback = function(Value)
        if game.PlaceId == 4442272183 then
            AutoGhoulQuest = Value
            if Value == false then
                CancelTween()
            end
            Settings["AutoGhoulQuest"] = Value
        else
            return Notify("Script Warning","Dit Me may bi ngu a? da bao o sea 2 roi",10)
        end
    end
}
)
TrialTab:AddToggle(
{
    Name = "Auto Do Ghoul Quest | Server Hop (Option)",
    Default = Settings["AutoGhoulQuest_Hop"],
    
    Flag = "AutoGhoulQuest_Hop",
    Callback = function(Value)
        AutoGhoulQuest_Hop = Value
        if Value == false then
            CancelTween()
        end
        Settings["AutoGhoulQuest_Hop"] = Value
    end
}
)
TrialTab:AddToggle({
    Name = "Auto Upgrade v3 Ghoul",
    Callback = function(b)
        AutoV3Ghoul = b
    end
})
function CheckRace() 
    for i,v in pairs(game:GetService("Players").LocalPlayer.Data:GetChildren()) do 
        return game:GetService("Players").LocalPlayer.Data.Race.Value
    end
end
print(CheckRace())
function  checkEctoplasm()
    for i,v in pairs(game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("getInventory")) do 
       if v.Type == "Material" then 
            if v.Name == "Ectoplasm" then 
                return v.Count 
            end
       end
    end
end
function autoattackplayer()
    pcall(function()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))                                                 
    end)
end
function equipgun()
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            v.Parent = plr.Character
        end
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            v.Parent = plr.Character
        end
    end
end
local function checkraidbounty(p)
    if  plr.Character.Humanoid.Health > 0 then
        for i,v in pairs(game.Workspace["_WorldOrigin"].Locations:GetChildren()) do
            if string.find(v.Name, "Island") then
                if game.Workspace["_WorldOrigin"].Locations:FindFirstChild(v.Name) then
                    if (v.Position-p.HumanoidRootPart.Position).Magnitude <= 1000 then
                        getgenv().Checkraids = true 
                        return true
                    end
                end
            end
        end
    end
    return false
end
function checksafezone(p)
    if plr.Character.Humanoid.Health > 0 then
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
            if v:IsA("Part") then
                if (v.Position-p.HumanoidRootPart.Position).magnitude <= 400 and p.Humanoid.Health / p.Humanoid.MaxHealth >= 90/100 then
                    getgenv().CheckSafeZone = true
                    return true
                end
            end
        end
    end
    return false
end
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
function autoskillpro(v1)
    spawn(function()
        for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
            if v1:FindFirstChild("HumanoidRootPart") and v:IsA("RemoteFunction") and plr.Character.Humanoid.Health > 0 and (plr.Character.HumanoidRootPart.Position-v1.HumanoidRootPart.Position).Magnitude < 10 then
                pcall(function()
                    spawn(function()
                        v:InvokeServer("Z")
                        AimBotSkillPosition = v1.HumanoidRootPart.Position
                    end)
                    spawn(function()
                        v:InvokeServer("X")
                       AimBotSkillPosition = v1.HumanoidRootPart.Position
                    end)
                    spawn(function()
                        pcall(function()
                            v:InvokeServer("C")
                           AimBotSkillPosition = v1.HumanoidRootPart.Position
                        end)
                    end)
                end)
            end
        end
    end)
end
count = 0
saveplayer = {}
local plr = game.Players.LocalPlayer
local attempt = 0
spawn(function()
    while wait() do
            pcall(function()
                local starttime = tick()
                local oldpos = plr.Character.HumanoidRootPart.CFrame.p
                
                    if tick()-starttime >= 0 and (plr.Character.HumanoidRootPart.CFrame.p-oldpos).Magnitude >= 800 then
                        print(attempt)
                        if attempt >= 2 then
                            CancelTween()
                            tickoldtp = tick()
                            repeat wait()
                                CancelTween()

                            until tick()-tickoldtp >= 1.2
                            attempt = 0
                        else
                            attempt = attempt + 1
                        end
                    end
            end)
        end
end)
AutoV3Ghoul = true
spawn(function()
    while wait() do 
        pcall(function()
       if AutoV3Ghoul then 
        tickfarmbountyyae = tick()
        tickteleport = tick()
        local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1");

            for i,v in pairs(game.Workspace.Characters:GetChildren()) do 
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v.Name ~= game.Players.LocalPlayer.Name then
                    if v113 == -2 then 
                        AutoV3Ghoul = false 
                    elseif game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") and v113 ~= -2 then 
                    ClaimQuest()
                if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10000 and (game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text ~= "⚔️In Combat - Bounty at risk!⚔️" or game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false) and not table.find(saveplayer,v.Name) then
                    repeat wait()
                        if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == true then
                            local args = {
                                [1] = "EnablePvp"
                            }
        
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                        a = v.HumanoidRootPart.CFrame * CFrame.new(0,5,0) 
                        print(v.Name)
                        Tweento(a)
                        equipgun()
                        autoattackplayer()
                        EnableBuso()
                        autoskillpro(v)
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health <= 0 then
                            count = count+1
                            print(count)
                        end
                        if tick() -tickteleport >= 10 then
                            tickteleport = tick()
                        end

                    until count == 5 or not AutoV3Ghoul or checkraidbounty(v) == true or checkattackplayuer() == true or  checksafezone(v) == true or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")

                end
            end
       end
    end
    end
end)
end
end)
task.spawn(function()
while task.wait() do
if AutoGhoulQuest then
    if  CheckRace() ~= "Ghoul" then
        if checkEctoplasm() < 100 then
            AutoFarmElec = true
        elseif checkEctoplasm() > 100 then 
            AutoFarmElec = false
            repeat wait() 
            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain [Lv. 1325] [Raid Boss]") then
                repeat wait()
                   if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain [Lv. 1325] [Raid Boss]") then
                    pcall(function()
                    Tweento(game:GetService("Workspace").Enemies["Cursed Captain [Lv. 1325] [Raid Boss]"].HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                    end)
                        EnableBuso()
                        EquipWeapon()
                        UseFastAttack = true
                    else
                        pcall(function()
                            Tweento(game:GetService("Workspace").Enemies["Cursed Captain [Lv. 1325] [Raid Boss]"].HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                        end)
                    end
                until not AutoGhoulQuest or not game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain [Lv. 1325] [Raid Boss]")
                UseFastAttack = false
            end
        until  game.Players.LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Hellfire Torch")
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Hellfire Torch") then
                Tweento(CFrame.new(918.615234, 122.202454, 33454.3789, -0.999998808, 0, 0.00172644004, 0, 1, 0, -0.00172644004, 0, -0.999998808))
                local args = {
                    [1] = "Ectoplasm",
                    [2] = "BuyCheck",
                    [3] = 4
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {
                    [1] = "Ectoplasm",
                    [2] = "Change",
                    [3] = 4
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end
end
end)
--[[task.spawn(function()
while task.wait() do
task.wait()
if BypassTrial_Human then
    if game:GetService("Workspace").Map:FindFirstChild("HumanTrial") and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Strength")  then
        StrengthPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].CFrame
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-StrengthPart.Position).Magnitude <= 1000 then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if BypassTrial_Human and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
                    pcall(function()
                        repeat wait()
                            EquipWeapon()
                            EnableBuso()
                            UseFastAttack = true
                            BringMobSmart()
                            v.Humanoid.Health = 0
                        until not BypassTrial_Human or v.Humanoid.Health <= 0 or not v.Parent
                    end)
                end
            end
        end
    end
end
end 
end)]]
spawn(function()
    repeat wait()
    until CheckMoon() == "Full Moon" and function7() == "Night"
if CheckMoon() == "Full Moon" and function7() == "Night" and game.Players.LocalPlayer.Name == "bocanhet164" then
    local AllRequest = http_request or request or HttpPost or syn.request

        Message = {
        ["content"] = "@everyone Full Moon Kia Huhu",
        }
        local DataCallBack = AllRequest({
        Url = "https://discord.com/api/webhooks/1012948997884882956/OysNGuyFvGl7UVEAa_eZzNv72FlyXAS1xnsKCdi2ztD973Ud7OXTJLo3W1vuzsJY7Q6u",
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
        })
        end
    end)
function IsMirageIsland()
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
return "```true```"
else
return "```false```"
end
end
local AllRequest = http_request or request or HttpPost or syn.request
function concacmmb()
if CheckMoon() == "Full Moon" and IsMirageIsland2() then
return "@everyone MOM CALLED"
elseif IsMirageIsland2() then
return "@here MIRAGE NE THANG BEO"
else
return "No Any Special Events In Here"
end
end
function WebhookSender(dec)
Message = {
["content"] = concacmmb(),
['username'] = "Full Moon Finder 24/7",
["avatar_url"] = "https://media.discordapp.net/attachments/1059858215879311412/1059864410740502578/Ew4kWteXEAAK2Hy.png",
["embeds"]= {
    {            
        ["title"]= "Full Moon Checker";["url"]= "https://www.pornhub.com";
        ["description"]= "Moon Status: ```"..dec.."```\nMirage Island Status: "..IsMirageIsland().."\nServer Time: ```" .. function6() .. " | " .. function7().."```\nPlayers Count: "..game.Players.NumPlayers.."/12\n```\nJobId: "..game.JobId.."\n```".."Script To Join: ```lua\n"..'game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport","'..game.JobId..'")'.."\n```Code By: Hlamm";
        ["footer"] = {
            ["text"] = "script Doc la Dong thap ".."\nTime".." : "..os.date("%c").." ("..os.date("%X")..")\nVersion: 1.15 | Lastest Update: 8:35 PM 1/3/2023",
            ["icon_url"] = "https://media.discordapp.net/attachments/1059858215879311412/1059864410740502578/Ew4kWteXEAAK2Hy.png"
        },
        ["color"]= tonumber(0xe962e2);
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

fofofofo = true
AutoFullMoon = true
spawn(function()
if not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and (CheckMoon() ~= "Full Moon" or CheckMoon() ~= "Next Night") then 
            AutoFullMoon = true
end
end)
local tweentab = Window:MakeTab({
Name = "Tween Tab",
Icon = MoonTextureId(),
PremiumOnly = false
})
local LandsA = {}
local function removeduplicates(b)
local c = {}
local d = {}
for e, f in ipairs(b) do
if not d[f] then
    d[f] = true
    table.insert(c, f)
end
end
return c
end
for i,v in pairs(game.Workspace["_WorldOrigin"].Locations:GetChildren()) do
if v.Name ~= "Sea" and not string.find(v.Name,"Trial") then
table.insert(LandsA, v.Name)
end
end

local Lands = {}

LandsC = removeduplicates(LandsA)
for i = 1, #LandsC do
table.insert(Lands, LandsC[i])
end
for i,v in pairs(Lands) do 
print(v,v.CFrame) end

function testconcac(u)
local dist = math.huge
getgenv().nameisland = nil
for i,v in pairs(game.Workspace["_WorldOrigin"].Locations:GetChildren()) do
    if v.Name == u then
        for i,k in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetDescendants()) do
            if k.ClassName == "Part" then
                local concac = (v.Position-k.Position).Magnitude 
                if concac < dist then
                    dist = concac
                    getgenv().nameisland = k.CFrame
                end
            end
        end
    end
end
return getgenv().nameisland
end
tweentab:AddButton(
{
    Name = "Cancel Tween",
    Callback = function()
        CancelTween()
    end
}
)
tweentab:AddDropdown({
Name = "Tween To Map",
Default = "",
Options = Lands,
Callback = function(Value)
    selectisland = Value
    
    for i,v in pairs(game.Workspace["_WorldOrigin"].Locations:GetChildren()) do
        if v.Name == selectisland then
            hlamm = v.CFrame * CFrame.new(0,50,0)
            wait()
            Tweento(hlamm)
            --getgenv().starttweenisland = false
            -- game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,50,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        end
    end
end
})
local plr = game.Players.LocalPlayer
tweentab:AddDropdown(
{
Name = "Tween To NPC",
Default = "",
Options = ALLNPCOOO2,
Callback = function(Value)
    if Value == "Ancient One" then
        tweentemple2()
        local args = {
            [1] = "RaceV4Progress",
            [2] = "Check"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        local args = {
            [1] = "RaceV4Progress",
            [2] = "Teleport"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        Tweento(ALLNPCOOO[Value])
    else
        Tweento(ALLNPCOOO[Value])
    end
end
}
)
tweentab:AddButton(
{
    Name = "Tween to Mirage Island",
    Callback = function()
        TweenMirage()
    end
}
)
tweentab:AddButton(
{
    Name = "Tween to Highest Mirage",
    Callback = function()
        tweenhighest()
    end
}
)
tweentab:AddToggle({
Name = "Auto Tween To Mirage + moon",
Callback = function(a)
    miragepromax = a 
    tweenisland = a 
    end
})
tweentab:AddButton(
{
    Name = "Tween to Temple Of Time",
    Callback = function()
        tweentemple2()
    end
}
)
spawn(function()
while wait() do 
SaveSettings()
end
end)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end)
OrionLib:Init()
