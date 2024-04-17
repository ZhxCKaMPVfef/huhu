repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil

function fireremotechoosegear(bH)
    v = bH
    if v == "Gear1" then
        print("Gear3")
        local args = { [1] = "TempleClock", [2] = "SpendPoint" }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    elseif v == "Gear2" then
        print("Gear2")
        local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear2", [4] = "Omega" }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    elseif v == "Gear4" then
        print("Gear4")
        if condimemeaymeci.B == 2 then
            print("Gear 4 Omega")
            local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Omega" }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif condimemeaymeci.A == 2 then
            print("Gear 4 Alpha")
            local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Alpha" }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif condimemeaymeci.A < 2 then
            v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
            condimemeaymeci = v14.RaceDetails
            print("Gear 4 Alpha")
            local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Alpha" }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        end
    elseif v == "Gear3" then
        print("Gear3")
        if condimemeaymeci.A < 2 then
            local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear3", [4] = "Alpha" }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        else
            local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear3", [4] = "Omega" }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args))
        end
    elseif v == "Gear5" then
        print("Gear5")
        local args = { [1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear5", [4] = "Default" }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    end
end

function InstantChooseGear()
    v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
    if v14 and v14.HadPoint then
        condimemeaymeci = v14.RaceDetails
        fireproximityprompt(workspace.Map["Temple of Time"].Prompt.ProximityPrompt)
        for r, v in pairs(workspace.Map["Temple of Time"].InnerClock:GetChildren()) do
            if v:FindFirstChild("Highlight") and v.Highlight.Enabled then
                print(v.Name)
                spawn(
                    function()
                        fireremotechoosegear(v.Name)
                    end
                )
            end
        end
    end
    if game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Enabled then
        wait(1)
        for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Skip.TextButton.Activated)) do
            v.Function()
        end
    end
end

spawn(function()
    while wait() do
        InstantChooseGear()
    end
end)
game:service("VirtualInputManager"):SendKeyEvent(true, "Tab", false, game)
wait(0)
game:service("VirtualInputManager"):SendKeyEvent(false, "Tab", false, game)
pcall(function()
    local existingGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Honglamx")
    if existingGui then
        existingGui:Destroy()
    end
end)

local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.Name = "Honglamx"
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 40)
frame.Position = UDim2.new(0.35, 0, -0.055, 0)      -- Fixed Y position
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
frame.Parent = screenGui
--//frame.Position = UDim2.new(0.3, 0, -0.07, 0)  -- Fixed Y position

local UIcorner = Instance.new("UICorner")
UIcorner.Parent = frame
local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(0, 300, 0, 40)
Text.Position = UDim2.new(0, 0, 0, 0)              -- Fixed Y position
Text.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
Text.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
Text.Font = Enum.Font.SourceSans
Text.Text = "Hi"                                   -- Add your desired text
Text.Parent = frame
-- Set the TextBold property to true for bold text
Text.TextWrapped = true
Text.TextScaled = false
Text.TextSize = 20
Text.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
Text.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
Text.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Text


local frame2 = Instance.new("Frame")
frame2.Name = "JoinSv"
frame2.Size = UDim2.new(0, 200, 0, 40)
frame2.Position = UDim2.new(0.35, 0, 0.055, 0)       -- Fixed Y position
frame2.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
frame2.Parent = screenGui
--//frame.Position = UDim2.new(0.3, 0, -0.07, 0)  -- Fixed Y position

local UIcorner = Instance.new("UICorner")
UIcorner.Parent = frame2
local Text2 = Instance.new("TextBox")
Text2.Size = UDim2.new(0, 200, 0, 40)
Text2.Position = UDim2.new(0, 0, 0, 0)              -- Fixed Y position
Text2.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
Text2.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
Text2.Font = Enum.Font.SourceSans
Text2.Text = "Input Job Id"                         -- Add your desired text
Text2.Parent = frame2
-- Set the TextBold property to true for bold text
Text2.TextWrapped = true
Text2.TextScaled = false
Text2.TextSize = 20
Text2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
Text2.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
Text2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Text2

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 101, 0, 40)
Button.Position = UDim2.new(0.58, 0, 0.06, 0)
Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
Button.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
Button.Font = Enum.Font.SourceSans
Button.Text = "Copy Job Id"                          -- Add your desired text
Button.Parent = screenGui
Button.TextWrapped = true
Button.TextScaled = false
Button.TextSize = 20
Button.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
Button.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
Button.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Button

Button.MouseButton1Click:Connect(function()
    setclipboard(tostring(game.JobId))
end)

local Button2 = Instance.new("TextButton")
Button2.Size = UDim2.new(0, 101, 0, 40)
Button2.Position = UDim2.new(0.7, 0, 0.06, 0)
Button2.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
Button2.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
Button2.Font = Enum.Font.SourceSans
Button2.Text = "Join server"                          -- Add your desired text
Button2.Parent = screenGui
Button2.TextWrapped = true
Button2.TextScaled = false
Button2.TextSize = 20
Button2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
Button2.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
Button2.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Button2

Button2.MouseButton1Click:Connect(function()
    while wait() do
        if game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.JoinSv.TextBox.Text ~= "" and game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.JoinSv.TextBox.Text ~= "Input Job Id" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.JoinSv.TextBox.Text, game.Players.LocalPlayer)
        end
    end
end)

local Button3 = Instance.new("TextButton")
Button3.Size = UDim2.new(0, 101, 0, 40)
Button3.Position = UDim2.new(0.8, 0, 0.06, 0)
Button3.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
Button3.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
Button3.Font = Enum.Font.SourceSans
Button3.Text = "Hop server"                           -- Add your desired text
Button3.Parent = screenGui
Button3.TextWrapped = true
Button3.TextScaled = false
Button3.TextSize = 20
Button3.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
Button3.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
Button3.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Button3

local bM = {}
local HttpService = game:GetService("HttpService")
local bN = "!Blacklist_Servers.json"
function Saveserver()
    local HttpService = game:GetService("HttpService")
    writefile(bN, HttpService:JSONEncode(bM))
end

local Notify = require(game.ReplicatedStorage:WaitForChild("Notification"));
function ReadServer()
    local s, o =
        pcall(
            function()
                local HttpService = game:GetService("HttpService")
                Hub = game:GetService("HttpService")
                return HttpService:JSONDecode(readfile(bN))
            end
        )
    if s then
        return o
    else
        Saveserver()
        return ReadServer()
    end
end

bM = ReadServer()
function HopServer()
    local function Hop()
        for r = math.random(10, 100), math.random(500, 1000) do
            local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
            for k, v in pairs(bP) do
                if k ~= game.JobId and v["Count"] <= 10 then
                    if not bM[k] or tick() - bM[k].Time > 60 * 10 then
                        bM[k] = { Time = tick() }
                        Saveserver()
                        Notify.new("<Color=Red>\nServer Count: " ..
                            v["Count"] .. "\nRegion: " .. v["Region"] .. "\nServerID: " ..
                            k .. "<Color=/>"):Display();
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                        return true
                    elseif tick() - bM[k].Time > 60 * 60 then
                        bM[k] = nil
                    end
                end
            end
        end
        return false
    end
    if not getgenv().Loaded then
        local function bQ(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                        v.Visible = false
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(
                    function()
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                    end
                )
            end
        end
        for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            bQ(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
        getgenv().Loaded = true
    end
    while not Hop() do
        wait()
    end
    Saveserver()
end

Button3.MouseButton1Click:Connect(function()
    while wait() do
        HopServer()
    end
end)
--//math.floor(game.Lighting.ClockTime).." | "..game.Players.NumPlayers.."/"..game.Players.MaxPlayers..
local y = game.PlaceId
if y == 2753915549 then
    Sea1 = true
elseif y == 4442272183 then
    Sea2 = true
elseif y == 7449423635 then
    Sea3 = true
end
function MoonTextureId()
    if Sea1 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif Sea2 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif Sea3 then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end

function getfm()
    if MoonTextureId() == "http://www.roblox.com/asset/?id=9709149431" then
        return " | Full Moon"
    elseif MoonTextureId() == "http://www.roblox.com/asset/?id=9709149052" then
        return " | Next Night"
    else
        return " | Bad Moon"
    end
end

function getmirage()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        return " | 🟢"
    else
        return " | 🔴"
    end
end

function checkgatcan()
    local a = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
        "CheckTempleDoor")
    if a then
        return " | Pulled"
    else
        return " | No"
    end
end

spawn(function()
    while wait() do
        game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.Frame.TextLabel.Text = math.floor(game.Lighting
                .ClockTime) ..
            " | " .. game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers .. getfm() .. getmirage() .. checkgatcan()
    end
end)
function CheckAcientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local v227 = nil
    local v228 = nil
    local v229 = nil
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
        else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end

function BuyGear()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
end

spawn(function()
    while wait() do
        local b_ = CheckAcientOneStatus()
        if string.find(b_, "Can Buy Gear") then
            BuyGear()
        end
    end
end)
