repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil

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
while wait() do
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
