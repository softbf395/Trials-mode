--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
workspace.Ambience_Dark.SoundId="rbxassetid://3466798390"
--===setup entities===--
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

function setup(name, asset, E, Speed, delay, Reverse, Reboundsm, ReboundsX, ReboundDelay, Rebounds, Damage, DmgRange, CrossBreak, CrossResist, CrossEnabled,DeathType, DeathMessages, Jumpscare)
   ---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = name,
		Asset = asset,
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = E or false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = Speed*100,
		Delay = delay,
		Reversed = Reverse
	},
	Rebounding = {
		Enabled = Rebounds,
		Type = "Ambush", -- "Blitz"
		Min = Reboundsm,
		Max = ReboundsX,
		Delay = ReboundDelay
	},
	Damage = {
		Enabled = true,
		Range = DmgRange,
		Amount = Damage
	},
	Crucifixion = {
		Enabled = CrossEnabled,
		Range = 40,
		Resist = CrossResist,
		Break = CrossBreak
	},
	Death = {
		Type = DeathType,
		Hints = DeathMessages,
		Cause = ""
	}
})
return entity
end

--create entity func
function makeEntity(ent)
   ent:Run()
end

local TIMEChance={number=10, inAChance=100}
local doorNumV:IntValue=game.ReplicatedStorage.GameData.LatestRoom
doorNumV.Changed:Connect(function()
	if math.random(1,40) <=20 then
		if math.random(1, TIMEChance.inAChance) <=TIMEChance.number then
                        local time=setup("Time", "https://raw.githubusercontent.com/softbf395/DoorsTheTialsModeAssets/refs/heads/main/entitymodels/TIME.rbxm",  true, 1.1, 0, false, 3, 6, 2, true, 100, 40, true, true, true, "Guiding", {"You Died To Time.", "He Rebounds, so try hiding and stopping!", "Use what you learned from ambush!"}, function() end)
			time:Run()
		end
	end
end)
