repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
local vu = game:GetService("VirtualUser")

game.Players.LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

spawn(function()
    while wait() do
        for _, v in pairs(game.Players.LocalPlayer.Inventory:GetChildren()) do
            if v:FindFirstChild("Bisento") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Bisento") then
                game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild(
                    "Functions"):WaitForChild("InventoryEq"):InvokeServer("Bisento")
            end
        end
    end
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(0.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
    end
end

while wait() do
    for i, v in pairs(workspace.Island:GetDescendants()) do
        if (string.find(v.Name, "Tree") or string.find(v.Name, "tree")) and v:IsA("Model") then
            local cframe = v.WorldPivot

            repeat
                wait()
                spawn(function()
                    EquipWeapon("Bisento")
                end)
                spawn(function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
                end)
                spawn(function()
                    game:service("VirtualInputManager"):SendKeyEvent(true, 'Z', false, game)
                    wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, 'Z', false, game)
                    wait()
                end)
                spawn(function()
                    game:service("VirtualInputManager"):SendKeyEvent(true, 'X', false, game)
                    wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, 'X', false, game)
                end)
            until (string.find(v.Parent.Name, "Effects") or string.find(v.Parent.Name, "effects"))
        end
    end
end
