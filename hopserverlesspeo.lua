    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false

    local function tpserverless(maxplayer)
        local Sitez;
        if foundAnything == "" then
            Sitez = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Sitez = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Sitez.nextPageCursor and Sitez.nextPageCursor ~= "null" and Sitez.nextPageCursor ~= nil then
            foundAnything = Sitez.nextPageCursor
        end
        local num = 0;
        for i, v in pairs(Sitez.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.playing) == maxplayer then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                delfile("NotSameServers.json")
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
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                end
            else
                print(tonumber(v.playing))
            end
        end
    end

    local function Teleportserverless(maxplayerr)
        pcall(function()
            tpserverless(maxplayerr)
            if foundAnything ~= "" then
                tpserverless(maxplayerr)
            end
        end)
    end
Teleportserverless(1)
