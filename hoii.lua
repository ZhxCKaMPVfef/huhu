ImproveFPSenabled = true
CurrentCoinType = "Coin"
AutofarmDelay = 2
ResetWhenFullBag = true

Player = game.Players.LocalPlayer
Players = game.Players
RunService = game:GetService("RunService")
CoinCollectedEvent = game.ReplicatedStorage.Remotes.Gameplay.CoinCollected
RoundStartEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundStart
RoundEndEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundEndFade

local function activateSpin(args, speaker)
    local spinSpeed = tonumber(args[1]) or 20
    local character = speaker.Character or speaker.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    for _, v in pairs(rootPart:GetChildren()) do
        if v.Name == "Spinning" then v:Destroy() end
    end

    local Spin = Instance.new("BodyAngularVelocity")
    Spin.Name, Spin.Parent, Spin.MaxTorque, Spin.AngularVelocity = "Spinning", rootPart, Vector3.new(0, math.huge, 0), Vector3.new(0, spinSpeed, 0)
end

AutofarmIN = true
AutofarmStarted = true

function StartAutofarm()
    if not AutofarmStarted then
        AutofarmStarted = true
        AutofarmIN = true
    else
        AutofarmStarted = false
    end
end

function ImproveFPS()
    if not ImproveFPSenabled then
        ImproveFPSenabled = true
        for _, player in pairs(Players:GetChildren()) do
            if player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("Accessory") then
                        part:Destroy()
                    end
                    if part.Name == "Radio" then
                        part:Destroy()
                    end
                end
            end
        end
    else
        ImproveFPSenabled = false
    end
end

bringpose = CFrame.new(math.random(-5, 5), -100, math.random(-5, 5))
safepart = Instance.new("Part")
safepart.Anchored = true
safepart.Massless = true
safepart.Transparency = 1
safepart.Size = Vector3.new(2048, 0.5, 2048)
safepart.CFrame = bringpose * CFrame.new(0, -1.2, 0)
safepart.Parent = workspace

function returncoincontainer()
    for _, v in workspace:GetChildren() do
        if v:FindFirstChild("CoinContainer") and v:IsA("Model") then
            return v:FindFirstChild("CoinContainer")
        end
    end
    return false
end

CoinCollectedEvent.OnClientEvent:Connect(function(cointype, current, max)
    AutofarmIN = true
    if cointype == CurrentCoinType and tonumber(current) == tonumber(max) then
        AutofarmIN = false
        Player.Character.Humanoid.Health = 0
    end
end)

function PcallTP(Position)
    if Player.Character then
        if Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = Position
        end
    end
end

spawn(function()
    while true do
        if AutofarmStarted and AutofarmIN and Player.Character and returncoincontainer() then
            PcallTP(bringpose)
            local container = returncoincontainer()
            local children = container:GetChildren()
            if #children > 0 then
                local randomIndex = math.random(1, #children)
                local randomChild = children[randomIndex]
                if randomChild:GetAttribute("CoinID") == CurrentCoinType and randomChild:FindFirstChild("TouchInterest") then
                    activateSpin({15}, game.Players.LocalPlayer)
                    PcallTP(randomChild.CFrame)
                    wait(0.2)
                    PcallTP(bringpose)
                    task.wait(AutofarmDelay)
                end
            end
        end
        task.wait(0.01)
    end
end)

RoundStartEvent.OnClientEvent:Connect(function()
    if AutofarmStarted then Player.Character.HumanoidRootPart.CFrame = bringpose end
    AutofarmIN = true
end)

RoundEndEvent.OnClientEvent:Connect(function()
    AutofarmIN = false
end)

for _, player1 in pairs(Players:GetChildren()) do
    player1.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if ImproveFPSenabled then
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("Accessory") then
                    part:Destroy()
                end
                if part.Name == "Radio" then
                    part:Destroy()
                end
            end
        end
    end)
end

Players.PlayerAdded:Connect(function(player1)
    player1.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if ImproveFPSenabled then
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("Accessory") then
                    part:Destroy()
                end
                if part.Name == "Radio" then
                    part:Destroy()
                end
            end
        end
    end)
end)

wait(0.5)
print("Activate Anti AFK")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    print("Roblox tried kicking you but I didn't let them!")
end)
