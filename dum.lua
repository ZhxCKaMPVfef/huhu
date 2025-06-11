repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:GetAttribute("ClientLoaded")

local plrs = game.Players
local plr = plrs.LocalPlayer
local Character = plr.Character
local balo3 = plr.Backpack

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CoinCollectedEvent = game.ReplicatedStorage.Remotes.Gameplay.CoinCollected
local RoundStartEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundStart
local RoundEndEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundEndFade

function twn(targetPos, targetCFrame, speed,bool)
    local getpos = (targetPos-plr.Character.HumanoidRootPart.Position).Magnitude
    local Tween = game:GetService('TweenService'):Create(
        plr.Character.HumanoidRootPart,
        TweenInfo.new(
            getpos / speed, 
            Enum.EasingStyle.Linear
        ),
        {CFrame = targetCFrame * CFrame.new(0, 0, 0)}
    )
    Tween:Play()
    if bool then
    Tween.Completed:Wait()
    end
end

function getCoinContainer()
    for _, v in ipairs(workspace:GetChildren()) do
        if v:FindFirstChild("CoinContainer") and v:IsA("Model") then
            return v.CoinContainer
        end
    end
    return nil
end

function collectNearestCoin()
    local coinContainer = getCoinContainer()
    if not coinContainer then
        return nil, nil
    end

    local character = plr.Character
    if not character then
        return nil, nil
    end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then
        return nil, nil
    end

    local nearestCoin = nil
    local nearestDistance = math.huge
    for _, coin in ipairs(coinContainer:GetChildren()) do
        if coin:IsA("BasePart") and coin:FindFirstChild("TouchInterest") then
            local distance = (rootPart.Position - coin.Position).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestCoin = coin
            end
        end
    end

    return nearestCoin, nearestDistance
end

function moveToCoin(coin,speed,bool)
    if not coin then
        return false
    end

    local character = plr.Character
    if not character then
        return false
    end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return false
    end

    twn(coin.Position,coin.CFrame,speed,bool)
    for _, v2 in ipairs(coin:GetChildren()) do
        if v2 and v2:IsA("TouchTransmitter") then
            firetouchinterest(plr.Character.HumanoidRootPart, v2.Parent, 0)
        end
    end
end

function Checkcoicotoolko(toolne)
    if balo3 then
        Character.Humanoid:EquipTool(toolne)
    elseif Character:FindFirstChild(toolne.Name) then
        Character[toolne.Name]:Activate()
    end
    return "gg well play"
end

function chetmemayroi()
    for i,v in pairs(plrs:GetChildren()) do
        if not v.Name:find(plr.Name) then
            local char = v.Character
            if char:FindFirstChild("HumanoidRootPart") and char.Humanoid.Health ~= 0 then
                char.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
            end
        end
    end
end

local coin = 100

local findcoin
findcoin = CoinCollectedEvent.OnClientEvent:Connect(function(hehe, socoinne, maxcoine)
    if maxcoine then
        coin = maxcoine
        findcoin:Disconnect()
    end
end)

-- farmcoine()


function farmcoine()
        local _IGData = require(ReplicatedStorage.Modules.CurrentRoundClient).GetLatestPlayerData()
        local PlayerData = _IGData[plr.Name]

        if not PlayerData or PlayerData and  PlayerData.Dead then return end

        local Coins = PlayerData.Coins
        local nearestCoin, distance = collectNearestCoin()
        if Coins >= coin or not nearestCoin then return end

        if nearestCoin and distance <= 20 then
            moveToCoin(nearestCoin,100,true)
        elseif nearestCoin and distance <= 50 then
            moveToCoin(nearestCoin,30,true)
        else
            plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-100,0)
            task.wait(0.1)
            plr.Character.HumanoidRootPart.Anchored = true
            task.wait(1.7)
            plr.Character.HumanoidRootPart.Anchored = false
            task.wait(0.1)
            plr.Character.HumanoidRootPart.CFrame = nearestCoin.CFrame
        end
end
while wait() do
    farmcoine()
end
