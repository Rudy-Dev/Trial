--Modules
local LeaderboardHandler = require(script.Parent.LeaderboardHandler)

--Create leaderboard for a client
game.Players.PlayerAdded:Connect(function(plr)
    LeaderboardHandler:Init(plr)
end)
