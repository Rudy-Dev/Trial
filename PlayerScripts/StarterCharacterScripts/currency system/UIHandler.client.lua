local StarterGui = game:GetService("StarterGui") 
local GetMoneyRemote = game.ReplicatedStorage.Remotes:WaitForChild("GetMoney")

GetMoneyRemote.OnClientEvent:Connect(function(money)
	StarterGui:SetCore("SendNotification", {
		Title = "Pay check!",
		Text = "You just got: " .. money .. " cash!",
		Duration = 5,
	})
end)


