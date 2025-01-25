local plr = game.Players.LocalPlayer
function islive()
    local plr = game.Players.LocalPlayer
    local character = plr.Character or plr.CharacterAdded:Wait() -- Wait for character to load if it doesn't exist yet
    local humanoid = character:WaitForChild("Humanoid")
    return humanoid
end
if getgenv().noclipsetup ~= true then
    spawn(function()
        game:GetService("RunService").Stepped:Connect(function()
            if islive() then
                if getgenv().noclip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end

                    if not islive() then
                        getgenv().noclip = false
                    end
                end
                if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") and getgenv().noclip then
                    local ag = Instance.new("BodyVelocity")
                    ag.Velocity = Vector3.new(0, 0, 0)
                    ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    ag.P = 9000
                    ag.Parent = game.Players.LocalPlayer.Character.Head
                    for r, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                elseif not getgenv().noclip and game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                    game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
                end
            end
        end)
    end)
    getgenv().noclipsetup = true
    print("Noclip Setuped!")
end
local lp = game.Players.LocalPlayer
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
    if NewWorld then
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
    local args = {
        [1] = "requestEntrance",
        [2] = vector3
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end

local farmfishv2 = false
function Tweento(targetCFrame)
    getgenv().noclip = true
    if
        game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
        game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 and
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    then
        if TweenSpeed == nil then
            TweenSpeed = 200
        end
        if game.Players.LocalPlayer.Character.Humanoid.Sit and not farmfishv2 then
            getgenv().noclip = false
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                canceltween()
                game:service("VirtualInputManager"):SendKeyEvent(true, "Space", false,
                    game)
                task.wait()
                game:service("VirtualInputManager"):SendKeyEvent(false, "Space",
                    false,
                    game)
            end
        end
        local targetPos = targetCFrame.Position
        Distance =
            (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
            .Magnitude

        if Distance < 600 then
            Speed = TweenSpeed
        elseif Distance >= 600 then
            Speed = TweenSpeed
        end
        local bmg = CheckNearestTeleporter(targetCFrame)
        if type(bmg) ~= "boolean" and plr:DistanceFromCharacter(targetPos) >= 1000 then
            pcall(
                function()
                    tween:Cancel()
                end
            )
            requestEntrance(bmg)
            task.wait(1)
        end

        local tweenfunc = {}
        local tween_s = game:service "TweenService"
        local info =
            TweenInfo.new(
                (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
                .Magnitude /
                250,
                Enum.EasingStyle.Linear
            )
        local tween =
            tween_s:Create(
                game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                info,
                { CFrame = targetCFrame }
            )
        tween:Play()
        getgenv().noclip = true
        function tweenfunc:Stop()
            tween:Cancel()
        end

        tween.Completed:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y,
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
            )
        --getgenv().noclip = false
    end

    if not tween then
        return tween
    end
    return tweenfunc
end

function canceltween()
    Tweento(plr.Character.HumanoidRootPart.CFrame)
end

local attempt = 0
spawn(function()
    while wait() do
        pcall(function()
            local starttime = tick()
            local oldpos = plr.Character.HumanoidRootPart.CFrame.p
            delay(0.1, function()
                if tick() - starttime >= 0 and (plr.Character.HumanoidRootPart.CFrame.p - oldpos).Magnitude >= 800 then
                    if attempt >= 2 then
                        canceltween()
                        tickoldtp = tick()
                        repeat
                            wait()
                            canceltween()
                        until tick() - tickoldtp >= 1.5
                        attempt = 0
                    else
                        attempt = attempt + 1
                    end
                end
            end)
        end)
    end
end)
return Tweento
