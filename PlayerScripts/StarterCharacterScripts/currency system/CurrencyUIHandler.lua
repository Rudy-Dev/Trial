--UI
local StarterGui = game:GetService("StarterGui")

local CurrencyUIHandler = {}

function CurrencyUIHandler:CreateMoneyNotification(money)
    StarterGui:SetCore("SendNotification", {
		Title = "Pay check!",
		Text = "You just got: " .. money .. " cash!",
		Duration = 4,
	})
end

return CurrencyUIHandler