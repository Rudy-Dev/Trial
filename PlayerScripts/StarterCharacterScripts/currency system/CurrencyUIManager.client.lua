
--Modules
local CurrencyUIHandler = require(script.Parent:WaitForChild("CurrencyUIHandler"))

--Remotes
local GetMoneyRemote = game.ReplicatedStorage.Remotes:WaitForChild("GetMoney")

--Create
GetMoneyRemote.OnClientEvent:Connect(function(money)
	CurrencyUIHandler:CreateMoneyNotification(money)
end)


