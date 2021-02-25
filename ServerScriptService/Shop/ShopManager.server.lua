--Modules
local Items = require(script.Parent.ShopItems)
local DataModule = require(script.Parent.Parent.Modules.DataStoreHandler)
local LeaderboardHandler = require(script.Parent.Parent.Leaderboard.LeaderboardHandler)

--Remotes
local BuyItemRemote = game.ReplicatedStorage.Remotes.Shop:WaitForChild("BuyItem")

BuyItemRemote.OnServerEvent:Connect(function(plr ,item)
    local Selected = Items:ReturnItem(item)

    DataModule:RemoveMoney(plr, Selected.Price)

    GiveTool(plr, Selected)
end)

function GiveTool(plr, Selected)
    LeaderboardHandler:Update(plr)
    local Tool = Selected.Tool

    local Copy = Tool:Clone()
    Copy.Parent = plr.Backpack
end