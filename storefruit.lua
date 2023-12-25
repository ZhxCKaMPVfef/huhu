repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
local VirtualUser = game:service 'VirtualUser'
game:service('Players').LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe);
        wait(0);
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool);
    end;
end;

function clickUI(a)
    (game:GetService("VirtualInputManager")):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2,
        a.AbsolutePosition.Y + 50, 0, true, a, 1);
    (game:GetService("VirtualInputManager")):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2,
        a.AbsolutePosition.Y + 50, 0, false, a, 1);
end;

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
