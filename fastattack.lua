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
UseFastAttack = true
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
