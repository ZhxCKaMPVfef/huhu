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

function getnamefruit()
    for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if string.find(v.Name, "Fruit") then
            return v.Name
        end
    end
end


while wait() do
    if (game.Workspace.AllNPC.ARandomFruit.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 20 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.AllNPC.ARandomFruit.CFrame
    end
    local args = {
        [1] = workspace:WaitForChild("AllNPC"):WaitForChild("ARandomFruit")
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckQuest")
        :InvokeServer(unpack(args))
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ARandomFruit") then
        if game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Visible == true then
            click(game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Gem)
        end
    end
            
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
