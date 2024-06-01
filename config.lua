repeat wait() until game:IsLoaded()
if game.Players.LocalPlayer.Name == "bocanhet163" then
    getgenv().Config = {
        ["SelectChapter"] = "Infinite",
        ["AutoSell"] = false,
        ["AutoReplay"] = false,
        ["AutoReturnLobby"] = true,
        ["WH_MatchComplete"] = true,
        ["AutoSkip"] = true,
        ["WebhookURL"] = "https://discord.com/api/webhooks/1220971145034207233/H8xkCRj1ucc7jDiBXMo7c1p_jg9OOMwXExbd29-U0J_bmA05vfDfLS0udkVjuppXzyBa",
        ["HosterName"] = "bocanhet163",
        ["SelectWorld"] = "Windmill Village",
        ["TPLobbyIfPlayer"] = false,
        ["HardMode"] = false,
        ["AutoSave"] = true,
        ["AutoClaimQuest"] = true,
        ["SelectChallengeMacro"] = {

        },
        ["WaitForJoiner"] = true,
        ["SelectMacro"] = "stack4sukuna",
        ["JoinerList"] = {
            [1] = "PhapSuTrungQuoc175",
            [2] = "duykminh8",
            [3] = "thaoancuttt5"
        },
        ["IgnoreMacroTiming"] = true,
        ["AutoJoinChallenge"] = false,
        ["PlayMacro"] = true,
        ["LeaveSellWave"] = 31,
        ["BlackScreen"] = true,
        ["AutoRejoin"] = true,
        ["SelectReward"] = {
            ["Trait Crystal"] = false,
            ["Gold"] = false,
            ["Star Rift "] = false,
            ["Star Rift (Rainbow)"] = false,
            ["Risky Dice"] = false,
            ["Gems"] = false
        },
        ["SelectChallengeWorld"] = {
            ["Mob City"] = false,
            ["Cursed Academy"] = false,
            ["Windmill Village"] = false
        },
        ["AutoLeave"] = true,
        ["AutoJoinWorld"] = true,
        ["BoostFPS"] = true,
        ["AutoJoinHoster"] = false,
        ["SelectDifficulty"] = {
            ["All units lowered range"] = false,
            ["All enemies regen health"] = false,
            ["All units increased cost"] = false,
            ["All enemies +1 shield"] = false,
            ["All enemies 2x health"] = false,
            ["All enemies 2x speed"] = false
        }
    }
else
    getgenv().Config = {
        ["AutoSell"] = false,
        ["AutoReplay"] = false,
        ["AutoReturnLobby"] = true,
        ["WH_MatchComplete"] = true,
        ["AutoSkip"] = true,
        ["WebhookURL"] = "https://discord.com/api/webhooks/1220971145034207233/H8xkCRj1ucc7jDiBXMo7c1p_jg9OOMwXExbd29-U0J_bmA05vfDfLS0udkVjuppXzyBa",
        ["HosterName"] = "bocanhet163",
        ["TPLobbyIfPlayer"] = false,
        ["HardMode"] = false,
        ["AutoSave"] = true,
        ["AutoClaimQuest"] = true,
        ["SelectChallengeMacro"] = {
    
        },
        ["WaitForJoiner"] = false,
        ["JoinerList"] = {
            [1] = "No joiner in the list"
        },
        ["IgnoreMacroTiming"] = false,
        ["AutoJoinChallenge"] = false,
        ["PlayMacro"] = false,
        ["LeaveSellWave"] = 31,
        ["BlackScreen"] = true,
        ["AutoRejoin"] = true,
        ["SelectReward"] = {
            ["Trait Crystal"] = false,
            ["Gold"] = false,
            ["Star Rift "] = false,
            ["Star Rift (Rainbow)"] = false,
            ["Risky Dice"] = false,
            ["Gems"] = false
        },
        ["SelectChallengeWorld"] = {
            ["Mob City"] = false,
            ["Cursed Academy"] = false,
            ["Windmill Village"] = false
        },
        ["AutoLeave"] = true,
        ["AutoJoinWorld"] = false,
        ["BoostFPS"] = true,
        ["AutoJoinHoster"] = true,
        ["SelectDifficulty"] = {
            ["All units lowered range"] = false,
            ["All enemies regen health"] = false,
            ["All units increased cost"] = false,
            ["All enemies +1 shield"] = false,
            ["All enemies 2x health"] = false,
            ["All enemies 2x speed"] = false
        }
    }
end
repeat
    wait()
    spawn(function() loadstring(game:HttpGet("https://nousigi.com/loader.lua"))() end)
    wait(10)
until Joebiden
