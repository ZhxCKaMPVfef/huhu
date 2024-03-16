repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil
wait(5)
local old = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local com = getupvalue(old, 2)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
UseFastAttack = true
spawn(
	function()
		game:GetService("RunService").Stepped:Connect(
			function()
				pcall(
					function()
						com.activeController.hitboxMagnitude = 60
						if UseFastAttack then
							com.activeController.hitboxMagnitude = 60
							com.activeController.active = false
							com.activeController.blocking = false
							com.activeController.focusStart = 0
							com.activeController.hitSound = nil
							com.activeController.increment = 0
							com.activeController.timeToNextAttack = 0
							com.activeController.timeToNextBlock = 0
							com.activeController:attack()
						end
					end
				)
			end
		)
	end
)

local ply = game.Players.LocalPlayer

local Combatfram1 = debug.getupvalues(require(ply.PlayerScripts.CombatFramework))
local Combatfram2 = Combatfram1[2]

function GetCurrentBlade()
	local p13 = Combatfram2.activeController
	local ret = p13.blades[1]
	if not ret then
		return
	end
	while ret.Parent ~= game.Players.LocalPlayer.Character do
		ret = ret.Parent
	end
	return ret
end

function Attack()
	pcall(
		function()
			local a = game.Players.LocalPlayer
			local b = getupvalues(require(a.PlayerScripts.CombatFramework))[2]
			local e = b.activeController
			for f = 1, 1 do
				local g =
					require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
						a.Character,
						{ a.Character.HumanoidRootPart },
						60
					)
				local h = {}
				local i = {}
				for j, k in pairs(g) do
					if k.Parent:FindFirstChild("HumanoidRootPart") and not i[k.Parent] then
						table.insert(h, k.Parent.HumanoidRootPart)
						i[k.Parent] = true
					end
				end
				g = h
				if #g > 0 then
					local l = debug.getupvalue(e.attack, 5)
					local m = debug.getupvalue(e.attack, 6)
					local n = debug.getupvalue(e.attack, 4)
					local o = debug.getupvalue(e.attack, 7)
					local p = (l * 798405 + n * 727595) % m
					local q = n * 798405
					(function()
						p = (p * m + q) % 1099511627776
						l = math.floor(p / m)
						n = p - l * m
					end)()
					o = o + 1
					debug.setupvalue(e.attack, 5, l)
					debug.setupvalue(e.attack, 6, m)
					debug.setupvalue(e.attack, 4, n)
					debug.setupvalue(e.attack, 7, o)
					pcall(
						function()
							if a.Character:FindFirstChildOfClass("Tool") and e.blades and e.blades[1] then
								e.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
									"weaponChange",
									tostring(GetCurrentBlade())
								)
								game.ReplicatedStorage.Remotes.Validator:FireServer(
									math.floor(p / 1099511627776 * 16777215),
									o
								)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", g, f, "")
							end
						end
					)
				end
			end
			b.activeController.timeToNextAttack = -math.huge
			b.activeController.attacking = false
			b.activeController.timeToNextBlock = 0
			b.activeController.humanoid.AutoRotate = 80
			b.activeController.increment = 4
			b.activeController.blocking = false
			b.activeController.hitboxMagnitude = 200
		end
	)
end

local LastAz = 0
local delaysetting = 0.2
local old = 0
spawn(function()
	pcall(function()
		game:GetService "RunService".Heartbeat:Connect(function()
			if UseFastAttack and tick() - old >= delaysetting then
				old = tick()
				Attack()
			end
		end)
	end)
end)
if game.Players.LocalPlayer.Name ~= "accbloxfruit120" and game.Players.LocalPlayer.Name ~= "PhapSuTrungQuoc175" and game.Players.LocalPlayer.Name ~= "bocanhet164" then
	local args = {
		[1] = "redeemRefundPoints",
		[2] = "Refund Points"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

	local string_1 = "BuyElectricClaw";
	local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
	Target:InvokeServer(string_1);
	local args = {
		[1] = "AddPoint",
		[2] = "Sword",
		[3] = 2550
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	local args = {
		[1] = "AddPoint",
		[2] = "Defense",
		[3] = 2550
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	local args = {
		[1] = "AddPoint",
		[2] = "Melee",
		[3] = 2550
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	local args = {
		[1] = "LoadItem",
		[2] = "Tushita"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
	pcall(function()
		function getinfoall()
			local res = request({
				Url = "http://192.168.1.2:3000",
				Method = "GET",
			})
			local data = game:GetService("HttpService"):JSONDecode(res.Body)
			return data
		end

		local hihi = "Bloc kid Notification"
		local AllRequest = http_request or request or HttpPost or syn.request
		local Webhooklink =
		"https://discord.com/api/webhooks/1216974099868418108/PTxzZhUyOtGOGIfZAVW8JRJB9WX0DLDSIAB3fxrteAiPlh1NtSDWPJ9WRrpTu4fJKPx5"
		function WebhookSender()
			Message = {
				['username'] = hihi,
				["content"] = "@everyone\n**Username: `" .. game.Players.LocalPlayer.Name .. "`**\n**Đã Gạt Cần",
			}
			local DataCallBack = AllRequest({
				Url = Webhooklink,
				Method = 'POST',
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = game:GetService("HttpService"):JSONEncode(Message)
			})
		end

		function IsMirageIsland2()
			if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
				return true
			else
				return false
			end
		end

		function checkgatcan()
			if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
					"CheckTempleDoor") then
				return true
			else
				return false
			end
		end

		local function v5()
			for v6, v7 in pairs({ "Last Resort", "Agility", "Water Body", "Heavenly Blood", "Heightened Senses", "Energy Core" }) do
				if game.Players.LocalPlayer.Backpack:FindFirstChild(v7) then
					return true;
				end;
				if game.Players.LocalPlayer.Character:FindFirstChild(v7) then
					return true;
				end;
			end;
		end;
		while wait() do
			if not checkgatcan() and v5() then
					print("Start")
				local ConfigPull = {
					["Reset Teleport new"] = true,
					["Spam Join"] = true,
					["Auto rejoin Disconnect"] = true,
					["Auto Click"] = true,
					["Auto Pull Lever"] = true,
					["Auto Choose Gears"] = true,
					["Auto Kill Player When complete Trial"] = true,
					["Select Method Farm"] = "Farm Bones",

				}
				local HttpService = game:GetService("HttpService")
				if not isfolder("Banana Hub") then
					makefolder("Banana Hub")
				end
				writefile("Banana Hub/" .. game.Players.LocalPlayer.Name .. "_BFNew.json",
					HttpService:JSONEncode(ConfigPull))

				if not IsMirageIsland2() then
					local allData = getinfoall()

					if #allData > 1 then
						local player = string.split(allData[#allData].Players, "/")
						local time = string.split(allData[#allData].Time, ":")

						if tonumber(player[1]) <= 10 and (tonumber(time[1]) >= 13 and tonumber(time[1]) <= 0) then
							local old = tick()
							repeat
								wait()
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
									allData[#allData].JobId,
									game.Players.LocalPlayer)
							until tick() - old >= 300
						end
					end
				else
					local Configtrial = {
						["Auto Trial"] = true,
					}
					local HttpService = game:GetService("HttpService")
					if not isfolder("Banana Hub") then
						makefolder("Banana Hub")
					end
					for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
						if v:IsA("MeshPart") then
							if v.MeshId == "rbxassetid://10153114969" then
								if v.Transparency ~= 1 then
									WebhookSender()
									writefile("Banana Hub/" .. game.Players.LocalPlayer.Name .. "_BFNew.json",
										HttpService:JSONEncode(Configtrial))
									break;
								end
							end
						end
					end
				end
			end
		end
	end)
end


--[[
    local Config = {
    ["Auto Factory"] = false,
    ["Teleport Safe if have Items"] = false,
    ["Teleport To Fruit"] = false,
    ["Auto Get Ghoul HOP"] = false,
    ["Auto Dodge Skill Mobs"] = false,
    ["Change Speed Boat"] = false,
    ["Auto Dodge Skill Terrorshark"] = false,
    ["Auto Trade Azure Ember"] = false,
    ["Auto Mob Farm"] = false,
    ["Auto Turn On V3"] = false,
    ["Hop Server"] = false,
    ["Distance Teleport Y"] = "500",
    ["Hop Server [Teleport To Fruit]"] = false,
    ["Reset Teleport new"] = false,
    ["Get Fruit In Store Low Beli"] = false,
    ["Auto Quest New World"] = false,
    ["Auto Store Fruit"] = false,
    ["Multi Trial"] = false,
    ["Auto Load Script"] = false,
    ["Auto Kill All Boss"] = false,
    ["Auto Raid"] = false,
    ["Auto Buy Haki Color"] = false,
    ["Teleport Player"] = false,
    ["Teleport Boat To Tiki"] = false,
    ["Hop Server [Trial Or Pull Lever]"] = false,
    ["Kill Rip Indra"] = false,
    ["Auto Hop Server Raid"] = false,
    ["Auto Tushita"] = false,
    ["Hop Server [ Haki color or Legendary Sword]"] = false,
    ["Webhook Status"] = false,
    ["Value Speed Boat"] = "200",
    ["Spam Join"] = false,
    ["Auto Aimbot"] = false,
    ["Ignore Attack Katakuri"] = false,
    ["Auto Kill Boss"] = false,
    ["Auto Mastery"] = false,
    ["Esp Fruit"] = false,
    ["Hop Server Farm Observation"] = false,
    ["Auto rejoin Disconnect"] = false,
    ["Auto Click"] = false,
    ["Auto Material"] = false,
    ["Bring Mob"] = true,
    ["Auto Spawn Kitsune Island"] = false,
    ["Farm Observation"] = false,
    ["Auto Random Fruit"] = false,
    ["Use SKill If Attack Terrorshark"] = false,
    ["Auto Trial"] = false,
    ["Auto Raid Castle"] = false,
    ["White Screen"] = false,
    ["Auto Farm Mastery 600 Melees"] = false,
    ["Auto Melee"] = false,
    ["Auto Craft Item Shark Anchor"] = false,
    ["Webhook Profile"] = false,
    ["Auto Quest Third Sea"] = false,
    ["Auto Choose Gears"] = false,
    ["Bring Mob [Fps Low]"] = false,
    ["Auto Saber"] = false,
    ["Auto Pull Lever"] = false,
    ["Teleport To Frozen Dimension"] = false,
    ["Auto Kill Player When complete Trial"] = false,
    ["Auto Elite Hunter"] = false,
    ["Teleport To Kitsune Island"] = false,
    ["Auto Collect Soul Ember"] = false,
    ["Teleport To Blue Gear"] = false,
    ["Auto Haki Observation"] = false,
    ["Kill DarkBeard"] = false,
    ["Auto Attack Leviathan"] = false,
    ["Summon Rip Indra"] = false,
    ["Teleport Y"] = false,
    ["Auto Find Leviathan"] = false,
    ["Auto Soul Guitar"] = false,
    ["Values Azure Ember"] = "10",
    ["Auto Turn On V4"] = false,
    ["Auto Upgrade Sword Inventory"] = false,
    ["Auto Sea Event"] = false,
    ["Auto Stats"] = false,
    ["Auto Turn On Race V3"] = false,
    ["Webhook Store Fruit"] = false,
    ["Teleport Y Attack Terrorshark"] = "60",
    ["Auto Sea Event With Friend"] = false,
    ["Hop Server Kitsune Island"] = false,
    ["Auto Buy Legendary Sword"] = false,
    ["Auto Chest"] = false,
    ["Teleport Boat Other CFrame if Rough Sea"] = false,
    ["Super Fast attack If Attack Terrorshark"] = false,
    ["Auto True Triple Katana"] = false,
    ["Auto Farm Mastery 600 Sword In Inventory"] = false,
    ["Kill Soul Reaper"] = false,
    ["Auto Reset Character"] = false,
    ["Auto Yama"] = false,
    ["Auto Buso"] = true,
    ["Auto Get Ghoul"] = false,
    ["Remove Notifications"] = false,
    ["Auto Summon Soul Ember"] = false,
    ["Auto CDK"] = false,
    ["Auto Finish Train Quest"] = false,
    ["Summon DarkBeard"] = false,
    ["Auto Upgrade Race V2-V3"] = false,
    ["Buy Blox Fruit Sniper Shop"] = false,
    ["Awake Devil Fruit"] = false,
    ["Auto Buy Gear"] = false,
    ["Auto Dough King"] = false,
    ["Health %"] = "30",
    ["Auto Chest Hop"] = false,
    ["Auto Get Cyborg"] = false,
    ["Auto Observation V2"] = false,
    ["Trade Bones"] = false,
    ["Auto Farm"] = false,
    ["Reset Teleport Get Boat"] = false
}
]]
