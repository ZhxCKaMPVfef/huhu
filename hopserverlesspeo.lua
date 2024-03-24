local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local function tpserverless()
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
        if tonumber(v.playing) < tonumber(v.maxPlayers) then -- Change to '<' instead of '<='
            for _, Existing in pairs(AllIDs) do
                if ID == tostring(Existing) then
                    Possible = false
                    break -- Break out of the loop once a match is found
                end
            end
            if Possible then
                table.insert(AllIDs, ID)
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                break -- Break out of the loop once a valid server is found
            end
        else
            print("Server is full")
            print(v.playing)
        end
    end
end
tpserverless()
