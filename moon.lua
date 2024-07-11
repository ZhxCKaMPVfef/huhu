print('----------------')
function getdatamoon()
    local res = request({
        Url = getgenv().link .. "/getmoonstatus",
        Method = "GET",
    })
    if res.Success then
        return game:GetService("HttpService"):JSONDecode(res.Body)
    else
        warn("Failed to fetch moon status:", res.StatusCode, res.Body)
        return nil
    end
end

function getdatamoon2()
    local res = request({
        Url = getgenv().link .. "/getdatamoon",
        Method = "GET",
    })
    if res.Success then
        return game:GetService("HttpService"):JSONDecode(res.Body)
    else
        warn("Failed to fetch moon status 2:", res.StatusCode, res.Body)
        return nil
    end
end

spawn(function()
    while true do
        wait(5)  -- Adjust the wait time as per your needs
        
        local data = getdatamoon()
        local data2 = getdatamoon2()
        
        if data and #data > 0 then
            local latestMoon = data[#data]  -- Get the latest moon status entry
            local startnew = true
            
            if data2 and #data2 > 0 then
                local newid = data2[#data2]
                
                if game.JobId ~= newid.jobid then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, newid.jobid, game.Players.LocalPlayer)
                else
                    if math.floor(game.Lighting.ClockTime) >= 5 or game.JobId ~= newid.jobid then
                        startnew = true
                    else
                        startnew = false
                    end
                end
            end
            
            print("Latest Moon Status - Players:", latestMoon.Players, "Type:", latestMoon.Type, "Time:", latestMoon.Time, "JobId:", latestMoon.JobId)
            
            if table.find(getgenv().MainAccount, game.Players.LocalPlayer.Name) then
                if latestMoon.Type == ":alarm_clock: Become Around :" and latestMoon.Time == "6 Minute ( s )" then
                    local players = string.split(latestMoon.Players, "/")
                    local currentPlayers = tonumber(players[1])
                    
                    if currentPlayers <= 9 and startnew then
                        local res = request({
                            Url = getgenv().link .. "/postdatamoon",
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode({
                                jobid = latestMoon.JobId
                            })
                        })

                        if res.Success then
                            print("Successfully joined moon instance with jobid:", latestMoon.JobId)
                        else
                            print("Error joining moon instance:", res.StatusCode, res.Body)
                        end
                    end
                end
            end
        else
            print("No moon status data found or empty response.")
        end
    end
end)
