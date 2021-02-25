--Remotes
local GetMoneyRemote = game.ReplicatedStorage.Remotes:WaitForChild("GetMoney")

--Modules
local DataStoreHandler = require(script.Parent.Parent.Modules.DataStoreHandler)
local GamePassHandler = require(script.Parent.Parent.Modules.GamePassHandler)
local LeaderboardHandler = require(script.Parent.Parent.Leaderboard.LeaderboardHandler)

local CurrencyHandler = {}

--Fire database and client for notification
function CurrencyHandler:MoneyPerMinute(plr)
    if GamePassHandler:HavePremium(plr) then
		DataStoreHandler:AddMoney(plr, 10)
		GetMoneyRemote:FireClient(plr, 10)
	else
		DataStoreHandler:AddMoney(plr, 5)
		GetMoneyRemote:FireClient(plr, 5)
	end   
    --Update Leaderboard
	LeaderboardHandler:Update(plr)
end

return CurrencyHandler