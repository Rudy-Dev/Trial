--Remotes
local DailyRewardEvent = game.ReplicatedStorage.Remotes:WaitForChild("Reward")

--UI
local MainGui = game.Players.LocalPlayer.PlayerGui:WaitForChild("DailyRewardUI")
local CloseBtn = MainGui.Frame.CloseBtn


DailyRewardEvent.OnClientEvent:Connect(function()
    MainGui.Enabled = true
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainGui.Enabled = false
end)