local DataStoreHandler = require(script.Parent.Parent.Modules.DataStoreHandler)

local LeaderboardHandler = {}

local Money = Instance.new("IntValue")
local leaderstats = Instance.new("Folder")

function LeaderboardHandler:Init(plr)
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr
 
	Money.Name = "Money"
	Money.Value = DataStoreHandler:GetMoney(plr)
	Money.Parent = leaderstats
end

function LeaderboardHandler:Update(plr)
    Money.Value = DataStoreHandler:GetMoney(plr)
end

return LeaderboardHandler