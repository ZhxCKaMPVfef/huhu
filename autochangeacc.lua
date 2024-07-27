repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat
    pcall(function()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
            if getgenv().Teams == "Marines" then
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
                    v.Function()
                end
            elseif getgenv().Teams == "Pirates" then
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do
                    v.Function()
                end
            else
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
                    v.Function()
                end
            end
        end
    end)
until game.Players.LocalPlayer.Team ~= nil
getgenv().fraglimit = 25000
getgenv().exeucteautochange = true
print(getgenv().exeucteautochange)
function getypeaccc()
    local havegod = false
    local beli = game.Players.LocalPlayer.Data.Beli.Value
    local frag = game.Players.LocalPlayer.Data.Fragments.Value
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) then
        havegod = true
    end
    --print(Res)
    local weapon = {}
    for i, v in next, game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory") do
        if v.Name == "Soul Guitar" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Cursed Dual Katana" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Mirror Fractal" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Valkyrie Helm" then
            table.insert(weapon, v.Name)
        end
    end
    if table.find(weapon, "Valkyrie Helm") and table.find(weapon, "Mirror Fractal") and havegod then
        if table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and  frag >= getgenv().fraglimit then
            return "GOD CDK SGT MM"
        elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and frag >= getgenv().fraglimit then
            return "GOD CDK MM"
        elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and frag >= getgenv().fraglimit then
            return "GOD SGT MM"
        elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar")  and frag >= getgenv().fraglimit then
            return "GOD MM"
        elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar")  and frag <= getgenv().fraglimit then
            return "Khong Du Dieu Kien"
        end
    else
        return "Khong Du Dieu Kien"
    end
end

function writefileyummy()
    writefile(game.Players.LocalPlayer.Name .. ".txt", "Completed-" .. tostring(getypeaccc()))
end

local url =
"https://discord.com/api/webhooks/1012948997884882956/OysNGuyFvGl7UVEAa_eZzNv72FlyXAS1xnsKCdi2ztD973Ud7OXTJLo3W1vuzsJY7Q6u"
function send(typeacc)
    local Message = {
        ["embeds"] = {
            {
                ["title"] =
                "Honglamx Account Checker",
                ["color"] = 16684576,
                ["fields"] = {
                    {
                        ["name"] = "Account Name",
                        ["value"] = "```" .. game.Players.LocalPlayer.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Type Acc:",
                        ["value"] = "```\n" .. typeacc .. "```"
                    },
                },
                ["footer"] = {
                    ["text"] = "Honglamx"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["thumbnail"] = {
                    ["url"] =
                    "https://cdn.discordapp.com/attachments/1017024488665264218/1262729537578471504/banner_server.jpg?ex=6697a806&is=66965686&hm=e0bd7cbb8460651cc19481bf516ede631dc881b52dcebd9ab54791c37d5dc893&"
                }
            }
        }
    }
    local DataCallBack = request({
        Url = url,
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
    })
end

local ScreenGui = Instance.new("ScreenGui");
local DropShadowHolder = Instance.new("Frame");
local DropShadow = Instance.new("ImageLabel");
local Main = Instance.new("Frame");
local UICorner = Instance.new("UICorner");
local UIStroke = Instance.new("UIStroke");
local UIGradient = Instance.new("UIGradient");
local Top = Instance.new("TextLabel");
local UIGradient1 = Instance.new("UIGradient");
local Under = Instance.new("TextLabel");
local UIGradient2 = Instance.new("UIGradient");

for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == 'CoinCard' then
        v:Destroy()
    end
end

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
ScreenGui.Name = 'CoinCard'


local DiscordUrlTextLabel = Instance.new("TextLabel", ScreenGui);
DiscordUrlTextLabel["BorderSizePixel"] = 0;
DiscordUrlTextLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
DiscordUrlTextLabel["TextSize"] = 16;
DiscordUrlTextLabel["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold,
    Enum.FontStyle.Normal);
DiscordUrlTextLabel["TextColor3"] = Color3.fromRGB(223, 115, 255);
DiscordUrlTextLabel["BackgroundTransparency"] = 1;
DiscordUrlTextLabel["AnchorPoint"] = Vector2.new(0.5, 0.5);
DiscordUrlTextLabel["Size"] = UDim2.new(0, 200, 0, 50);
DiscordUrlTextLabel["BorderColor3"] = Color3.fromRGB(142, 66, 133);
DiscordUrlTextLabel["Text"] = [[Honglamx Stats Account Checker]];
DiscordUrlTextLabel["Position"] = UDim2.new(0.5, 0, -0.025, 0);

local DiscordUrlUiStroke = Instance.new("UIStroke", DiscordUrlTextLabel);
DiscordUrlUiStroke["Color"] = Color3.fromRGB(255, 255, 255);

local DiscordUrlUiGradient = Instance.new("UIGradient", DiscordUrlUiStroke);
GDiscordUrlUiGradient = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 164, 194)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(142, 66, 133))
};



DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadowHolder.BackgroundTransparency = 1
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Position = UDim2.new(0.5, 0, 0.1, 0)
DropShadowHolder.Size = UDim2.new(0, 500, 0, 68)
DropShadowHolder.ZIndex = 0
DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = ScreenGui

DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.5
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder

Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.5
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(1, -47, 1, -47)
Main.Name = "Main"
Main.Parent = DropShadow

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Main

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2.5
UIStroke.Parent = Main

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 102, 204)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(223, 115, 255))
}
UIGradient.Parent = UIStroke

Top.Font = Enum.Font.GothamBold
Top.Text = "Let the music play"
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.TextSize = 16.5
Top.TextYAlignment = Enum.TextYAlignment.Bottom
Top.AnchorPoint = Vector2.new(0.5, 0)
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 0.9990000128746033
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(0.5, 0, 0, 15)
Top.Size = UDim2.new(0, 500, 0, 18)
Top.Name = "Top"
Top.Parent = Main

UIGradient1.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 102, 204)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(223, 115, 255))
}
UIGradient1.Parent = Top

Under.Font = Enum.Font.GothamBold
Under.Text = "Script started!"
Under.TextColor3 = Color3.fromRGB(255, 255, 255)
Under.TextSize = 18
Under.TextYAlignment = Enum.TextYAlignment.Bottom
Under.AnchorPoint = Vector2.new(0.5, 0)
Under.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Under.BackgroundTransparency = 0.9990000128746033
Under.BorderColor3 = Color3.fromRGB(0, 0, 0)
Under.BorderSizePixel = 0
Under.Position = UDim2.new(0.5, 0, 0, 35)
Under.Size = UDim2.new(0, 500, 0, 18)
Under.Name = "Under"
Under.Parent = Main

UIGradient2.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 102, 204)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(223, 115, 255))
}
UIGradient2.Parent = Under
Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
if Top.Size.X.Offset > Under.Size.X.Offset then
    DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
else
    DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
end
Top:GetPropertyChangedSignal("Text"):Connect(function()
    Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)
Under:GetPropertyChangedSignal("Text"):Connect(function()
    Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)

Top.Text = "Username: "
Under.Text = "Type Account: "
function ContentSet(Content1, Content2)
    if not Content1 then Content1 = 'None (Not Found)' end
    if not Content2 or Content2 == '' then Content2 = 'None' end
    Top.Text = "Username: " .. Content1
    Under.Text = "Type Account: " .. Content2
end

ContentSet(game.Players.LocalPlayer.Name, getypeaccc())
writefileyummy()
print(getypeaccc(),readfile(game.Players.LocalPlayer.Name .. ".txt"))
