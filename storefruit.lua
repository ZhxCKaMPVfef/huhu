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

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe);
        wait(0);
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool);
    end;
end;

function fruitstore()
    for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if string.find(v.Name, "Fruit") and not game.Players.LocalPlayer.PlayerGui.MainGui.StarterFrame.Inventory_Frame.ScrollingFrameFruits:FindFirstChild(v.Name) then
            return true
        end
    end
end

while wait() do
    if not fruitstore() then
        for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
            print(v.Name)
            if string.find(v.Name, "Fruit") then
                EquipWeapon(tostring(v.Name))
                repeat
                    wait()
                    clickUI(game.Players.LocalPlayer.PlayerGui.MyGUIFrame)
                until game.Players.LocalPlayer.PlayerGui:FindFirstChild("EatFruitBecky")
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("EatFruitBecky") then
                    repeat
                        wait()
                        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("EatFruitBecky") then
                            clickUI(game.Players.LocalPlayer.PlayerGui.EatFruitBecky.Dialogue.Collect)
                        end
                    until not game.Players.LocalPlayer.PlayerGui:FindFirstChild("EatFruitBecky") or fruitstore()
                end
            end
        end
    end
end
