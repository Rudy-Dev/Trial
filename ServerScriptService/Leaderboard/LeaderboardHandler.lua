--Modules
local DataStoreHandler = require(script.Parent.Parent.Modules.DataStoreHandler)

local LeaderboardHandler = {}

--Create Leaderboard for a client
function LeaderboardHandler:Init(plr)
	local Money
	local leaderstats 

	--Check if leaderboard exist for a player
	if not plr:FindFirstChild("leaderstats") then
		leaderstats = Instance.new("Folder")
	end
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr
 
	--Check if money exist in player s leaderboard
	if not leaderstats:FindFirstChild("Money") then
		Money = Instance.new("IntValue")
	end
	Money.Name = "Money"
	Money.Value = DataStoreHandler:GetMoney(plr)
	Money.Parent = leaderstats
end

--Update leaderboard not money!
function LeaderboardHandler:Update(plr)
    local Money = plr.leaderstats:WaitForChild("Money")
	Money.Value = DataStoreHandler:GetMoney(plr)
end

return LeaderboardHandler