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
            if not checkcantrial() == false then
                NoClip = false
            end
        end
        if not tween then
            return tween
        end
        return tweenfunc
    end
end

setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
for i, v in next, workspace.Map.CircleIsland.RaidSummon:GetDescendants() do
    if v.Name == "Color" then
        if v.Color == Color3.new(0, 1, 1) then
            print("Detected")
            Tweento(v.CFrame)
            break;
        end
    end
end
