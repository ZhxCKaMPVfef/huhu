function namemoon()
    if math.floor(game.Lighting.ClockTime) >= 18 or math.floor(game.Lighting.ClockTime) < 5 then
        return "Time To End ⛅"
    else
        return "Time To Night 🌙"
    end
end

function time()
    if namemoon() == "Time To Night 🌙" then
        return 17 - math.floor(game.Lighting.ClockTime)
    elseif namemoon() == "Time To End ⛅" then
        if math.floor(game.Lighting.ClockTime) > 0 then
            return 24 - math.floor(game.Lighting.ClockTime) + 5
        else
            return math.floor(game.Lighting.ClockTime) + 5
        end
    end
end

local Message = {
    ["embeds"] = {
        {
            ["title"] =
            "<:bananacon:1261744974534541352>  Banana Hub Notification <:bananacon:1261744974534541352>",
            ["color"] = 16684576,
            ["fields"] = {
                {
                    ["name"] = namemoon(),
                    ["value"] = "```" .. time() .. " Minute(s)```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Time in Server:",
                    ["value"] = "```\n" .. game.Lighting.TimeOfDay .. "\n```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Players:",
                    ["value"] = "```\n" ..
                        game.Players.NumPlayers .. "/" .. game.Players.MaxPlayers .. "```"
                },
                {
                    ["name"] = "Jobid:",
                    ["value"] = "```\n" .. game.JobId .. "\n```"
                },
                {
                    ["name"] = "Script To Join:",
                    ["value"] = "```lua\n" ..
                    'game:GetService("TeleportService"):TeleportToPlaceInstance(' ..
                    game.PlaceId .. ',"' .. game.JobId .. '",' .. "game.Players.LocalPlayer" .. "```"
                }
            },
            ["footer"] = {
                ["text"] = "Banana Hub"
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
    Url =
    "https://discord.com/api/webhooks/1012948997884882956/OysNGuyFvGl7UVEAa_eZzNv72FlyXAS1xnsKCdi2ztD973Ud7OXTJLo3W1vuzsJY7Q6u",
    Method = 'POST',
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode(Message)
})
