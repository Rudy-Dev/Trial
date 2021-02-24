--Remotes
local GetMoneyRemote = game.ReplicatedStorage.Remotes:WaitForChild("GetMoney")

--Modules
local DataStoreHandler = require(script.Parent.Parent.Modules.DataStoreHandler)
local GamePassHandler = require(script.Parent.Parent.Modules.GamePassHandler)
local LeaderboardHandler = require(script.Parent.Parent.Leaderboard.LeaderboardHandler)
--Money per minute 
local TimeBtwgives = 5

game.Players.PlayerAdded:Connect(function()
	while true do
		for _,i in pairs(game.Players:GetPlayers()) do
			MoneyPerMinute(i)
		end
		wait(TimeBtwgives)
	end
end)

function MoneyPerMinute(plr)
	print(plr.UserId)
	if GamePassHandler:HavePremium(plr) then
		print("y")
		DataStoreHandler:AddMoney(plr, 10)
		GetMoneyRemote:FireClient(plr, 10)
	else
		print("n")
		DataStoreHandler:AddMoney(plr, 5)
		GetMoneyRemote:FireClient(plr, 5)
	end   
	LeaderboardHandler:Update(plr)
end
