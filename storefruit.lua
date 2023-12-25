repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
spawn(function()
    while wait() do
        if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MyGUIFrame") then
            local player = game.Players.LocalPlayer
            local playerGui = player:WaitForChild("PlayerGui")

            local frameSize = 50 -- Kích thước của frame (vuông)
            local guiFrame = Instance.new("ImageButton")
            guiFrame.Name = "MyGUIFrame"
            guiFrame.Size = UDim2.new(0, frameSize, 0, frameSize) -- Kích thước cố định
            guiFrame.BackgroundColor3 = Color3.new(0, 0, 0)       -- Màu nền của frame
            guiFrame.Visible = true                               -- Ẩn frame ban đầu

            local function updateFramePosition(mousePosition)
                local halfSize = frameSize / 2
                guiFrame.Position = UDim2.new(mousePosition.X, 0, mousePosition.Y, 0)
            end

            game:GetService("RunService").RenderStepped:Connect(function()
                local mouse = game.Players.LocalPlayer:GetMouse()
                local mouseHit = mouse.Hit
                updateFramePosition(mouseHit.Position)
            end)


            guiFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        end
    end
end)
function clickUI(a)
    (game:GetService("VirtualInputManager")):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2,
        a.AbsolutePosition.Y + 50, 0, true, a, 1);
    (game:GetService("VirtualInputManager")):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2,
        a.AbsolutePosition.Y + 50, 0, false, a, 1);
end;

for i1, v1 in next, game:GetService("Players").LocalPlayer.PlayerGui:GetChildren() do
    if string.find(v1.Name, "EatFruit") then
        repeat
            wait()
            clickUI(v1.Dialogue.Collect)
        until not string.find(v1.Name, "EatFruit") or not v1 or not v1.Parent
    end
end
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe);
        wait(0);
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool);
    end;
end;

function gethavefruit()
    for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if string.find(v.Name, "Fruit") and not game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.Inventory_Frame.ScrollingFrameFruits:FindFirstChild(v.Name) then
            return true
        end
    end
end

while wait() do
    repeat
        wait()
        if not not gethavefruit() then
            if (game.Workspace.AllNPC.ARandomFruit.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 20 and not gethavefruit() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.AllNPC.ARandomFruit.CFrame
            end
            local args = {
                [1] = workspace:WaitForChild("AllNPC"):WaitForChild("ARandomFruit")
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild(
            "CheckQuest")
                :InvokeServer(unpack(args))
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ARandomFruit") then
                if game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Visible == true then
                    clickUI(game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Gem)
                end
            end
            --wait(1)
        else
            for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                if not game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.Inventory_Frame.ScrollingFrameFruits:FindFirstChild(v.Name) then
                    print("Fruit Dont Have In Bag")
                    if string.find(v.Name, "Fruit") then
                        EquipWeapon(tostring(v.Name))
                        wait(2)
                        clickUI(game:GetService("Players").LocalPlayer.PlayerGui.MyGUIFrame)
                        for i1, v1 in next, game:GetService("Players").LocalPlayer.PlayerGui:GetChildren() do
                            if string.find(v1.Name, "EatFruit") then
                                repeat
                                    wait()
                                    clickUI(v1.Dialogue.Collect)
                                until not string.find(v1.Name, "EatFruit") or not v1 or not v1.Parent
                            end
                        end
                    end
                end
            end
        end
    until game:GetService("Players").LocalPlayer.PlayerStats.Gem.Value <= 0
end
