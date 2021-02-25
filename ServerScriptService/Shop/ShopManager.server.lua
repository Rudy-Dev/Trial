--Modules
local Items = require(script.Parent.ShopItems)
local DataModule = require(script.Parent.Parent.Modules.DataStoreHandler)
local LeaderboardHandler = require(script.Parent.Parent.Leaderboard.LeaderboardHandler)

--Remotes
local BuyItemRemote = game.ReplicatedStorage.Remotes.Shop:WaitForChild("BuyItem")
local ExtraCash = game.ReplicatedStorage.Remotes.Shop:WaitForChild("ExtraCash")

ExtraCash.OnServerEvent:Connect(function(plr)
    DataModule:AddMoney(plr, 100)

    LeaderboardHandler:Update(plr)
end)

BuyItemRemote.OnServerEvent:Connect(function(plr ,item)
    local Selected = Items:ReturnItem(item)
    if Selected.Price <= DataModule:GetMoney(plr) then    
        DataModule:RemoveMoney(plr, Selected.Price)

        GiveTool(plr, Selected)
    end
end)

function GiveTool(plr, Selected)
    LeaderboardHandler:Update(plr)
    local Tool = Selected.Tool

    local Copy = Tool:Clone()
    Copy.Parent = plr.Backpack
end