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
frame.Position = UDim2.new(0.35, 0, -0.055, 0)  -- Fixed Y position
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)  -- Use Color3.fromRGB for values between 0 and 255
frame.Parent = screenGui
--//frame.Position = UDim2.new(0.3, 0, -0.07, 0)  -- Fixed Y position

local UIcorner = Instance.new("UICorner")
UIcorner.Parent = frame
local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(0, 300, 0, 40)
Text.Position = UDim2.new(0, 0, 0, 0)  -- Fixed Y position
Text.BackgroundColor3 = Color3.fromRGB(35, 35, 35)  -- Use Color3.fromRGB for values between 0 and 255
Text.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Use Color3.fromRGB for values between 0 and 255
Text.Font = Enum.Font.SourceSans 
Text.Text = "Hi"  -- Add your desired text
Text.Parent = frame

-- Set the TextBold property to true for bold text
Text.TextWrapped = true
Text.TextScaled = false
Text.TextSize = 20
Text.TextStrokeTransparency = 0.5  -- Adjust the transparency of the text stroke
Text.TextStrokeColor3 = Color3.new(0, 0, 0)  -- Set the color of the text stroke
Text.TextStrokeTransparency = 0.5  -- Adjust the transparency of the text stroke
local UIcorner = Instance.new("UICorner")
UIcorner.Parent = Text
--//math.floor(game.Lighting.ClockTime).." | "..game.Players.NumPlayers.."/"..game.Players.MaxPlayers..
function getfm() 
    if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then 
        return " | Full Moon"
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then 
        return " | Next Night"
    else return " | Bad Moon"
    end
end
function getmirage() 
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then 
        return " | 🟢" 
    else return " | 🔴"
    end
end
spawn(function() 
    while wait() do 
        game:GetService("Players").LocalPlayer.PlayerGui.Honglamx.Frame.TextLabel.Text = math.floor(game.Lighting.ClockTime).." | "..game.Players.NumPlayers.."/"..game.Players.MaxPlayers..getfm().. getmirage() 
    end
end)
