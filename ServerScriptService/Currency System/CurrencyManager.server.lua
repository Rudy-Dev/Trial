--Remotes
local GetMoneyRemote = game.ReplicatedStorage.Remotes:WaitForChild("GetMoney")


--Modules
local DataStoreHandler = require(script.Parent.DataStoreHandler)
local GamePassHandler = require(script.Parent.GamePassHandler)

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
        if GamePassHandler:HavePremium(plr) then
            DataStoreHandler:AddMoney(plr, 10)
            GetMoneyRemote:FireClient(plr, 10)
        else
            DataStoreHandler:AddMoney(plr, 5)
            GetMoneyRemote:FireClient(plr, 5)
        end
    end