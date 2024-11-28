--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local test=false
if game.ReplicatedStorage:FindFirstChild("Test") then
test = true
end
--[[

    NOTE: Custom shop items will NOT cost any real knobs

]]--
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
function ach(name,desc,reason,img)
local img2=img
if img:find("rbxassetid://") then
else
   local path="achievements/"..name.."/icon.png"
    if not isfile(path) then
    writefile(path, game:HttpGet(img))
    print("Added "..path.."!")
    else
    appendfile(path, game:HttpGet(img))
    print("if the file had an update the achievement icon for "..name.." should have been changed, file path:" ..path)
    end
   img2 =  getcustomasset(path)
end
achievementGiver({
    Title = name,
    Desc = desc,
    Reason = reason,
    Image = img2
})
end

local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()


-- Create your tool here
local Lantern = LoadCustomInstance("https://raw.githubusercontent.com/softbf395/DoorsTheTialsModeAssets/refs/heads/main/entitymodels/Lantern.rbxm")


-- Create custom shop item
CustomShop.CreateItem(Lantern, {
    Title = "Lantern",
    Desc = "Light up those annoying dark rooms!",
    Image = "rbxassetid://18249762827",
    Price = 0,
    Stack = 1,
})
local StarterGui=game:GetService("StarterGui")
if not game:FindFirstChild("TrialsModeRan", true) then
Instance.new("BoolValue", game.ReplicatedStorage).Name="TrialsModeRan"
 function displayMessages()
    -- Green Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#00FF00'>Loaded Aedaniss7’s The Trials Mode for doors!<br/>If you encounter any bugs, report it to Aedaniss7’s hub on scriptblox!<br/>Version: 0.0.2</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })

    -- Red Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#FF0000'>Good luck! You’ll need it.. ;)</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })
end
displayMessages()
workspace.Ambience_Dark.SoundId="rbxassetid://3466798390"
--===setup entities===--
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

function setup(name, asset, E, Speed, delay, Reverse, Reboundsm, ReboundsX, ReboundDelay, Rebounds, Damage, DmgRange, CrossBreak, CrossResist, CrossEnabled,DeathType, DeathMessages, Jumpscare, achName, achDesc, achR, achImg)
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
entity:SetCallback("OnDespawning", function()
    ach(achName, achDesc, achR, achImg)
end)
return entity
end

--create entity func
function makeEntity(ent)
   ent:Run()
end
local crucifixchance=10
local lanternchance=50
local TIMEChance={number=20, inAChance=100, roomMin=5}
local SPEEDChance={number=15, inAChance=100, roomMin=6}

if test==true then
SPEEDChance={number=100, inAChance=100, roomMin=0}
end
function getimglink(imgname)
    return "https://raw.githubusercontent.com/softbf395/DoorsTheTialsModeAssets/refs/heads/main/images/"..imgname
end
local doorNumV:IntValue=game.ReplicatedStorage.GameData.LatestRoom
doorNumV.Changed:Connect(function()
	if math.random(1,40) <=20 then
				local isCrucifix=false
				
		if math.random(1, TIMEChance.inAChance) <=TIMEChance.number and doorNumV.Value>=TIMEChance.roomMin then
                        local time=setup("Time", "https://raw.githubusercontent.com/softbf395/DoorsTheTialsModeAssets/refs/heads/main/entitymodels/TIME.rbxm",  true, 1.1, 0, false, 3, 6, 2, true, 100, 40, true, false, true, "Guiding", {"You Died To Time.", "He Rebounds, so try hiding and stopping!", "its very confusing. i know.", "Use what you learned from ambush!"}, function() end, "TIME IS CONTINUED.", "We're not TOO LATE!", "Survive Time", getimglink("TimeSurvive.png"))
			time:Run()
                elseif math.random(1, TIMEChance.inAChance) <=TIMEChance.number and doorNumV.Value>=TIMEChance.roomMin then
                        local time=setup("Speed", "https://raw.githubusercontent.com/softbf395/DoorsTheTialsModeAssets/refs/heads/main/entitymodels/speed.rbxm",  true, 2, 2, false, 8, 8, 4, true, 300, 40, false, false, true, "Curious", {"Hmm, who did you die to this time?", "oh, the reddish-orange one.", "I call it speed.", "Its actual name is C-9.", "How it ended up here. its unknown, the most reasonable explanation is that it somehow exited The Dimension that is Lost In Time..", "hurry up, we're not done yet!"}, function() end, "SLOW.", "We're TOO FAST!", "Survive Speed", getimglink("TimeSurvive.png"))
			time:Run()
		end
	end
end)
else
function displayMessages()
    -- Green Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#00FF00'>Already Ran: Aedaniss7’s The Trials Mode for doors!<br/>If you encounter any bugs, report it to Aedaniss7’s hub on scriptblox!<br/>Version: 0.0.2</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })

    -- Red Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#FF0000'>Good luck! You’ll need it.. ;)</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })
end
displayMessages()
end
