repeat wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading")
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()

local workspace = workspace
local huge = math.huge
local task = task
local Player = game.Players.LocalPlayer
local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")
local Services = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services")
	
RemoteEvent:FireServer({{"!", "EnemyRender", 10000}})
	
local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")
Config = {
    click = false,
    autofarm = false,
}
local FolderName = "Banana Hub"
local ConfigFile = game.Players.LocalPlayer.Name.."-AWS2.json"
local function LoadPreset()
    return game:GetService("HttpService"):JSONDecode(readfile(FolderName .. "/"  .. ConfigFile))
end

local function SavePreset()
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
if isfile(FolderName .. "/"  .. ConfigFile) then
local Decode = LoadPreset()
for i,v in pairs(Decode) do
    Config[i] = v
end
elseif  not isfile(FolderName .. "/"  .. ConfigFile) then
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
local function EnemyTable()
    local Enemies = {"Closest Farm"}
    for i,v in next, workspace.ClientEnemies:GetChildren() do 
        if v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") then 
        if not table.find(Enemies,v.HumanoidRootPart.EnemyHealthBar.Title.Text) then 
            table.insert(Enemies,v.HumanoidRootPart.EnemyHealthBar.Title.Text)
        end
    end
  end
  return Enemies
end
local function map()
    map = {}
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        table.insert(map,v.Name)
    end
    return map
end
task.spawn(function()
	while task.wait() do
        pcall(function()
		if Config.autofarm then
			local Number = huge
			local Enemy = Config.concac
            if Config.concac == "Closest Farm" or Config.concac == nil then 
            for i,v in pairs(workspace.ClientEnemies:GetChildren()) do
                if v and v:FindFirstChild("HumanoidRootPart") then
                    local Magnitude = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if Magnitude < Number then
                        Number = Magnitude
                        Enemy = v
                    end
                end
            end
        end
        if Enemy then 
				for i,v in pairs(workspace.ClientEnemies:GetChildren()) do
					if v and v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") and (v.HumanoidRootPart.EnemyHealthBar.Title.Text == Config.concac) then
			
						Enemy = v
					end
			end			
        end
			if Config.concac then
				if Config.Teleport then
					HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
				end
				
                local args = {
                    [1] = {
                        [1] = {
                            [1] = "(",
                            [2] = tostring(Enemy)
                        }
                    }
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
				repeat task.wait() until not Enemy or not Enemy.Parent or not Config.autofarm
			end
		end
    end)
	end
end)
spawn(function()
while wait() do 
    if Config.click then
        local args = {
            [1] = {
                [1] = {
                    [1] = ")"
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    end
    end)
task.spawn(function()
while task.wait() do
    pcall(function()
    if Config.autocollect then
        for i,v in pairs(workspace.Drops:GetChildren()) do
            v.CFrame = HumanoidRootPart.CFrame * CFrame.new(10,0,0)
        end
    end
end)
end
end)
local Window =
    OrionLib:MakeWindow(
    {
        Name = "Hlamm Dep Trai",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = FolderName,
        IntroEnabled = false,
        IntroText = "Your Mom Fat",
        IntroIcon = "rbxassetid://5245791567",
        Icon = "rbxassetid://5245791567"
    }
)

local MainTab =
    Window:MakeTab(
    {
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local Teleport =
    Window:MakeTab(
    {
        Name = "Teleport",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)
MainTab:AddToggle({
    Name = "Auto Farm",
    Default = Config.autofarm,
    Callback = function(a)
        Config.autofarm = a
        SavePreset()
    end
})

local hihi = MainTab:AddDropdown({
    Name = "Enemies Select",
    Default = Config.concac,
    Options = EnemyTable(),
    Callback = function(a)
        Config.concac = a
        SavePreset()

    end
})
MainTab:AddButton({
    Name = "Refresh Mob",
    Callback = function()
        print("cc")
        hihi:Refresh(EnemyTable(),true)
    end
})
Teleport:AddDropdown({
    Name = "Teleport Map",
    Options = map(),
    Callback = function(v)
        local args = {
            [1] = {
                [1] = {
                    [1] = "@",
                    [2] = tostring(v)
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
})

Teleport:AddButton({
    Name = "Teleport to Dungeon",
    Callback = function()
        local args = {
            [1] = {
                [1] = {
                    [1] = "@",
                    [2] = "Dungeon"
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
         
    end
})
MainTab:AddToggle({
    Name = "Auto Click",
    Default = Config.click,
    Callback = function(a)
        Config.click = a
        SavePreset()
    end
})

teleportdung = false 
spawn(function()
while wait() do 
    if Config.dungeon then 
        if workspace.Components.DungeonLobby.Gamemodes.Easy.Door.Part.Easy.Timer.Text >= "1" then 
            print("Sap Start Dungeon")
            if not teleportdung then 
            local args = {
                [1] = {
                    [1] = {
                        [1] = "X",
                        [2] = "Easy"
                    }
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            teleportdung = true 
        end
        end
    end
end
end)
MainTab:AddToggle({
    Name = "Auto Collect",
    Default = Config.autocollect,
    Callback = function(a)
        Config.autocollect = a
        SavePreset()
    end
})

MainTab:AddToggle({
    Name = "Auto Teleport Enemies",
    Default = Config.Teleport,
    Callback = function(a)
        Config.Teleport = a
        SavePreset()
    end
})
MainTab:AddToggle({
    Name = "Auto Quest Farm",
    Default = Config.quest,
    Callback = function(v)
        Config.quest = v
        SavePreset()

    end
})

function checkquest()
    concac = {}
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container:GetChildren()) do 
            if v:IsA("Frame") then 
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name]:FindFirstChild("List") then 
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name].List.Complete.Visible == false then 
    
                    local inputString = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name].Title.Text
                    local pattern = "(.-)%s*%((.-)%)"
                    local match1, match2 = inputString:gsub(pattern, "%1")
                    local strain = inputString:gsub(pattern, "%2")
                        table.insert(concac,match1)
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name].List.Complete.Visible == true and table.find(concac,match1) then
                        table.remove(concac,match1)
                    end
                end
            end
        end
        return concac
    end
    spawn(function()
    while wait() do 
        if Config.quest then 
            for i,v in pairs(checkquest()) do 
                Config.concac = v
                if i == nil or v == nil then 
                    Config.autofarm = false 
                    wait()
                    Config.autofamr = true
                end
            end
 for i, v in pairs(workspace.Maps:GetChildren()) do
       RemoteEvent:FireServer({{"D", v.Components:FindFirstChild("NPC", true).Parent.Name}})
        end
     end
    end
 end)
MainTab:AddToggle({
    Name = "Auto Open Egg",
    Default = Config.open,
    Callback = function(test)
        Config.open = test
        SavePreset()

    end
})
teleporttoegg = false
task.spawn(function()
	while task.wait() do
		if Config.open then
			local Number = huge
			local Egg

			for i,v in pairs(workspace.Maps:GetChildren()) do
				for i,v in pairs(v.Eggs:GetChildren()) do
					if v.PrimaryPart and v.Egg:FindFirstChild("PriceBillboard") and v.Egg.PriceBillboard.Yen.Icon.Image ~= "rbxassetid://9126788621" then
						local Magnitude = (HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
						if Magnitude < Number then
							Number = Magnitude
							Egg = v
						end
					end
				end
			end

			if Egg then
				local EggCFrame = Egg.PrimaryPart.CFrame
                    if not teleporttoegg and Config.open then 
				if (HumanoidRootPart.Position - EggCFrame.Position).Magnitude > 4 then
					HumanoidRootPart.CFrame = EggCFrame + EggCFrame.LookVector * 3
                    teleporttoegg = true 
				end
            end
                game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                wait()
                game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)			
            end
        elseif teleporttoegg and not Config.open then 
            teleporttoegg = false
		end

	end
end)

MainTab:AddToggle({
    Name = "Auto Dungeon ( Comming Soon )",
    Default = Config.dungeon,
    Callback = function(v)
       -- Config.dungeon = v
    end
})
local function8 = MainTab:AddLabel("Time Dungeon Easy: "..workspace.Components.DungeonLobby.Gamemodes.Easy.Door.Part.Easy.Timer.Text)
spawn(function()
while task.wait() do
    function8:Set("Time Dungeon Easy: "..workspace.Components.DungeonLobby.Gamemodes.Easy.Door.Part.Easy.Timer.Text)
end
end)
