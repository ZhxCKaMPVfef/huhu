repeat wait() until game:IsLoaded()


spawn(function()
getgenv().Key = "dfead3a2d23ed448"
getgenv().NewBanana = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
  end)
spawn(function()
    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hlamx/huhu/master/watermark2.lua"))()
  end)
spawn(function()
    repeat wait()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hlamx/huhu/master/misc.lua"))()
    until execute
  end)
