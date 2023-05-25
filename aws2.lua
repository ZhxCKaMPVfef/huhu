repeat wait() 
    if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading") then 
        loaded = true 
    end
    until loaded == true 
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
spawn(function()
while wait() do 
        if Config.autofarm == true and game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 1000 then 
        Config.autofarm = false
        end 
        if Config.click == true and game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 1000 then 
            Config.click = false
        end
end
end)
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
			local Number = huge
			local Enemy
             if Config.concac == "Closest Farm" then
				for i,v in pairs(workspace.ClientEnemies:GetChildren()) do

					if v and v:FindFirstChild("HumanoidRootPart") and  v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") then
						local Magnitude = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
						if Magnitude < Number then
							Number = Magnitude
							Enemy = v
						end
				end
            end
			end
            if Config.concac == "Closest Enemy" then 
                workspace.ClientEnemies.ChildAdded:Connect(function(child)
                    if  child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") then 
                        Enemy = child
                        print(Enemy)
                end
                 end)
            end
            if Config.concac ~= "Closest Enemy" then
				for i,v in pairs(workspace.ClientEnemies:GetChildren()) do
					if v and v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") and v.HumanoidRootPart.EnemyHealthBar.Title.Text == Config.concac then
						local Magnitude = (HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
						if Magnitude < Number then
							Number = Magnitude
							Enemy = v
						end
					end
				end
			end
			if Config.concac then
				if Config.Teleport then
					HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
				end
				if Config.autofarm then 
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
MainTab:AddToggle({
    Name = "Auto OpenEgg End Map",
    Default = Config.openeggendmap,
    Callback = function(cc) 
        Config.openeggendmap = cc
    end
})
MainTab:AddToggle({
    Name = "Farm Boss Hp Cao nhat",
    Default = Config.cc,
    Callback = function(huhu)
        Config.cc = huhu
    end
})
spawn(function()
    while wait() do 
        if Config.cc then 
           
local a = {}
local b = {}
local Enemies = {"Closest Farm"}

local conversions = {
    ["M"] = 1e6, -- Triệu
    ["K"] = 1e3, -- Nghìn
    ["B"] = 1e9, -- Tỷ
    ["qd"] = 1e15 -- Tỷ tỷ
}

for i,v in pairs(workspace.ClientEnemies:GetChildren()) do 
    if v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") then 
       local a1 = v.HumanoidRootPart.EnemyHealthBar.Bar.HP.ContentText
       local cc = a1:split("/")
       table.insert(b, cc[1])
       table.insert(a, v.HumanoidRootPart.EnemyHealthBar.Title.Text)
    end
end

local maxHP = -math.huge
local maxIndex = 0

for i, hp in ipairs(b) do
    local value, unit = hp:match("([%d%.]+)(%a+)")
    if value and unit then
        local hpValue = tonumber(value)
        local conversion = conversions[unit]
        if conversion then
            hpValue = hpValue * conversion
        end
        if hpValue and hpValue > maxHP then
            maxHP = hpValue
            maxIndex = i
        end
    end
end
Config.concac = npcName
print(Config.concac,npcName)
if Config.autofarm == false then 
    Config.autofarm = true
end
end 
end
end)
local teleport2 = false 
spawn(function()
while wait() do 
    if Config.openeggendmap then 
        local hihi = {} -- Khai báo biến hihi
        for i, v in pairs(workspace.Maps:GetChildren()) do
            for i1, v1 in pairs(v.Eggs:GetChildren()) do
                if v1.PrimaryPart and v1.Egg:FindFirstChild("PriceBillboard") and v1.Egg.PriceBillboard.Yen.Icon.Image ~= "rbxassetid://9126788621" then
                    table.insert(hihi, v1.PrimaryPart.Position)
                end
            end
        end
        
        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position -- Vị trí của người chơi
        local smax = nil -- Đặt giá trị ban đầu cho smax
        
        for i, v in ipairs(hihi) do
            local distance = (v - playerPosition).Magnitude -- Tính khoảng cách Euclidean giữa v và playerPosition
            if smax == nil or distance > ((smax - playerPosition).Magnitude) then
                smax = v
            end
        end
        
if Config.openeggendmap and not teleport2 then 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(smax)
teleport2 = true
end
if teleport2 and not Config.openeggendmap then 
    teleport2 = true 
end
game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
wait()
game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)	

    end
end
end)

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
MainTab:AddDropdown({
    Name = "Select Type Dungeon",
    Default = Config.selectdung,
    Options = {"Easy1","Insane1"},
    Callback = function(v)
        Config.selectdung = v 
    end
})
function checkcorrup()
    local cc = false
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        if  v.Components:FindFirstChild("CorruptMerchant") then
            cc = true
        end
end
return cc
end
function checkcorrup2()
        if checkcorrup() then 
            return "🟢"
        else return "🔴"
        end
end

--
function merchat()
    local cc = false
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        if  v.Components:FindFirstChild("Merchant") then
            cc = true
        end
end
return cc
end
function merchat2()
if merchat() then 
    return "🟢"
        else return "🔴"
end
end
    MainTab:AddToggle({
    Name = "Auto Dungeon ( Comming Soon )",
    Default = Config.dungeon,
    Callback = function(v)
       -- Config.dungeon = v
    end
})
local corrup = MainTab:AddLabel("CorruptMerchant Status: "..checkcorrup2())
local merchant = MainTab:AddLabel("Merchant Status: "..merchat2())

spawn(function()
    while wait() do 
        corrup:Set("CorruptMerchant Status: "..checkcorrup2())
        merchant:Set("Merchant Status: "..merchat2())
    end
end)
if workspace.Components.DungeonLobby.Gamemodes.Easy:FindFirstChild("Door") then 
local function8 = MainTab:AddLabel("Time Dungeon Easy: "..workspace.Components.DungeonLobby.Gamemodes.Easy.Door.Part.Easy.Timer.Text)

spawn(function()
while task.wait() do
    pcall(function()
    
    function8:Set("Time Dungeon Easy: "..workspace.Components.DungeonLobby.Gamemodes.Easy.Door.Part.Easy.Timer.Text)

end)
end
end)
end
local VirtualUser=game:service'VirtualUser'
game:service('Players').LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
