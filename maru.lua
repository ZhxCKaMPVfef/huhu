repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
_G.Team = "Pirate"
_G.KAITUN_SCRIPT = true
_G.MainSettings = {
        ["EnabledHOP"] = false, 
        ['FPSBOOST'] = true,
        ["FPSLOCKAMOUNT"] = 30,
        ['WhiteScreen'] = true, 
        ['CloseUI'] = true, 
        ["NotifycationExPRemove"] = true,
        ['AFKCheck'] = 150,
        ["LockFragments"] = 20000, 
        ["LockFruitsRaid"] = {
            [1] = "Kitsune-Kitsune"
        }
    }
_G.Fruits_Settings = { 
    ['Main_Fruits'] = {}, 
    ['Select_Fruits'] = {}
}
_G.Quests_Settings = {
    ['Rainbow_Haki'] = false,
    ["MusketeerHat"] = false,
    ["PullLever"] = false,
    ['DoughQuests_Mirror'] = {
        ['Enabled'] = true,
        ['UseFruits'] = false
    }        
}
_G.Races_Settings = {
    ['Race'] = {
        ['EnabledEvo'] = false,
        ["v2"] = false,
        ["v3"] = false,
        ["Races_Lock"] = {
            ["Races"] = {
                ["Mink"] = false,
                ["Human"] = false,
                ["Fishman"] = false
            },
            ["RerollsWhenFragments"] = 20000 
        }
    }
}
_G.Settings_Melee = { 
    ['Superhuman'] = true,
    ['DeathStep'] = true,
    ['SharkmanKarate'] = true,
    ['ElectricClaw'] = true,
    ['DragonTalon'] = true,
    ['Godhuman'] = true
}
_G.FarmMastery_Settings = {
    ['Melee'] = true,
    ['Sword'] = false,
    ['DevilFruits'] = false,
    ['Select_Swords'] = {
        ["AutoSettings"] = false, 
        ["ManualSettings"] = {
            "Saber",
            "Buddy Sword"
        }
    }
}
_G.SwordSettings = {
    ['Saber'] = true,
    ["Pole"] = false,
    ['MidnightBlade'] = false,
    ['Shisui'] = true,
    ['Saddi'] = true,
    ['Wando'] = true,
    ['Yama'] = false,
    ['Rengoku'] = true,
    ['Canvander'] = true,
    ['BuddySword'] = true,
    ['TwinHooks'] = true,
    ['HallowScryte'] = false,
    ['TrueTripleKatana'] = false,
    ['CursedDualKatana'] = false
}
_G.GunSettings = { 
    ['Kabucha'] = true,
    ['SerpentBow'] = true,
    ['SoulGuitar'] = true
}
-- Script Here !!!
getgenv().Key = "MARU-6T45-Z7R5X-W6AK-1EM1M-B44X"
getgenv().id = "999285584927391774"
getgenv().Script_Mode = "Kaitun_Script"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
