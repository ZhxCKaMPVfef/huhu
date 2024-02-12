repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
local vu = game:GetService("VirtualUser")

game.Players.LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)
print("Loaded")
spawn(function()
    while wait() do
        for _, v in pairs(game.Players.LocalPlayer.Inventory:GetChildren()) do
            if not game.Players.LocalPlayer.Backpack:FindFirstChild("Bisento") and not game.Players.LocalPlayer.Character:FindFirstChild("Bisento") then
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

local woodfarm = false
local player = game.Players.LocalPlayer
pcall(function()
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") then 
        game.Players.LocalPlayer.PlayerGui:Destroy()
    end
end)
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 50)
frame.Position = UDim2.new(0.5, -100, 0.5, -25)
frame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
frame.Parent = screenGui

-- Tạo một nút bật/tắt
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 1, 0)
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
toggleButton.Text = "Off"
toggleButton.Parent = frame

local isOn = false

toggleButton.MouseButton1Click:Connect(function()
    isOn = not isOn
    toggleButton.Text = isOn and "On" or "Off"

    if isOn then
        woodfarm = true
    else
        woodfarm = false
    end
end)

spawn(function()
    while wait() do
        if woodfarm then
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
                    until (string.find(v.Parent.Name, "Effects") or string.find(v.Parent.Name, "effects")) or not woodfarm
                end
            end
        end
    end
end)
