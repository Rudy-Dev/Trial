--Modules
local CurrencyHandler = require(script.Parent.CurrencyHandler)

--Money per minute 
local TimeBtwgives = 60

--TODO: make it cleaner, I guess
game.Players.PlayerAdded:Connect(function()
	while true do
		wait(TimeBtwgives)
		for _,i in pairs(game.Players:GetPlayers()) do
			CurrencyHandler:MoneyPerMinute(i)
		end
	end
end)
