repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
local l__LocalPlayer__3 = game.Players.LocalPlayer;
local l__Character__4 = l__LocalPlayer__3.Character;
local function v5()
    for v6, v7 in pairs({ "Last Resort", "Agility", "Water Body", "Heavenly Blood", "Heightened Senses", "Energy Core" }) do
        if l__LocalPlayer__3.Backpack:FindFirstChild(v7) then
            return true;
        end;
        if l__Character__4:FindFirstChild(v7) then
            return true;
        end;
    end;
end;
local Config = {}
local FolderName = "Banana Hub";
local ConfigFile = game.Players.LocalPlayer.Name .. "_BFNew.json";
local function LoadPreset()
    return (game:GetService("HttpService")):JSONDecode(readfile(FolderName .. "/" .. ConfigFile));
end;
local Config = {};
local function SavePreset()
    writefile(FolderName .. "/" .. ConfigFile, (game:GetService("HttpService")):JSONEncode(Config));
end;
if isfile(FolderName .. "/" .. ConfigFile) then
    local Decode = LoadPreset();
    for i, v in pairs(Decode) do
        Config[i] = v;
    end;
elseif not isfile((FolderName .. "/" .. ConfigFile)) then
    writefile(FolderName .. "/" .. ConfigFile, (game:GetService("HttpService")):JSONEncode(Config));
end;
function all()
    local function getinfoall()
        local res = request({
            Url = "https://0cfcacbbab42.ditbloxfruit.cc/mirage",
            Method = "GET",
        })
        local data = game:GetService("HttpService"):JSONDecode(res.Body)
        return data
    end
    function function6()
        return math.floor(game.Lighting.ClockTime)
    end

    function function7()
        GameTime = "Error"
        local c = game.Lighting
        local c2 = c.ClockTime
        if c2 >= 18 or c2 < 5 then
            GameTime = "Night"
        else
            GameTime = "Day"
        end
        return GameTime
    end

    if not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and function7() == "Night" then
        local response = getinfoall()
        if response and #response > 0 then
            local latestEntry = response[#response]
            local playingValue = tonumber(latestEntry.Playing)
            print(latestEntry.Text)

            if latestEntry.Text == "Mirage Island :island: | :crescent_moon: Night" and playingValue and playingValue < 12 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(latestEntry.PlaceId, latestEntry.JobId,
                    game.Players.LocalPlayer)
            end
        else
            print("Dữ liệu rỗng hoặc không có dữ liệu trả về từ API")
        end
    end
end

while wait() do
    if not v5() and not Config["Auto Upgrade Race V2-V3"] then
        Config["Auto Upgrade Race V2-V3"] = true
        print("turn on farm v3")
        SavePreset()
    end
    if v5() and game.PlaceId == 4442272183 then
        if Config["Auto Upgrade Race V2-V3"] then
            Config["Auto Upgrade Race V2-V3"] = false
            print("turn off farm v3")
            SavePreset()
        end
        wait(1)
        local args = {[1] = "TravelZou"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if Config["Auto Upgrade Race V2-V3"] then
            Config["Auto Upgrade Race V2-V3"] = false
            SavePreset()
        end
    end
    if v5() and game.PlaceId == 7449423635 and not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and not Config["Auto Pull Lever"] then
        Config["Auto Pull Lever"] = true
        print("turn on Pull lever")
        SavePreset()
    end
    if v5() and game.PlaceId == 7449423635 and Config["Auto Pull Lever"] and not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and not Config["Auto Pull Lever"] then
        all()
    end
    if v5() and game.PlaceId == 7449423635 and Config["Auto Pull Lever"] and game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") and not Config["Auto Pull Lever"] then
        Config["Auto Pull Lever"] = false 
        Config["Auto Trial"] = true
        Config["Auto Choose Gears"] = true
        Config["Auto Turn On Race V3"] = true
        print("turn on farm gear")
        SavePreset()
    end
end
