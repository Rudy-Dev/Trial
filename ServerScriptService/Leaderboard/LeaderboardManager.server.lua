local LeaderboardHandler = require(script.Parent.LeaderboardHandler)

game.Players.PlayerAdded:Connect(function(plr)
    LeaderboardHandler:Init(plr)
end)

game.Players.PlayerRemoving:Connect(function(plr)
    LeaderboardHandler:Update(plr)
end)