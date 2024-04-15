repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
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
Button3.Position = UDim2.new(0.8, 0, 0.08, 0)
Button3.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Use Color3.fromRGB for values between 0 and 255
Button3.TextColor3 = Color3.fromRGB(255, 255, 255)    -- Use Color3.fromRGB for values between 0 and 255
Button3.Font = Enum.Font.SourceSans
Button3.Text = "Join server"                          -- Add your desired text
Button3.Parent = screenGui
Button3.TextWrapped = true
Button3.TextScaled = false
Button3.TextSize = 20
Button3.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
Button3.TextStrokeColor3 = Color3.new(0, 0, 0) -- Set the color of the text stroke
Button3.TextStrokeTransparency = 0.5           -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Button3

repeat wait() until game:IsLoaded()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    pcall(function()
        TPReturner()
        if foundAnything ~= "" then
            TPReturner()
        end
    end)
end

Button3.MouseButton1Click:Connect(function()
    while wait() do
        Teleport()
    end
end)
--//math.floor(game.Lighting.ClockTime).." | "..game.Players.NumPlayers.."/"..game.Players.MaxPlayers..
function getfm()
    if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
        return " | Full Moon"
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
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
