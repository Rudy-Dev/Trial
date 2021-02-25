

local DataStore = game:GetService("DataStoreService"):GetDataStore("LastLogin") --Get the DataStore.


game.Players.PlayerAdded:connect(function(Player)
    local LastLogin = DataStore:GetAsync(Player.UserId)
        if LastLogin then
            local Seconds = os.time()-LastLogin
        local Minutes = Seconds/60
        local Hours = Minutes/60
        if Hours >= 24 then
            print("You get a daily login award") --This happens if 24 hours has passed since his last login so he gets an award!
            DataStore:SetAsync(Player.UserId,os.time())
            else
            print("u need wait")
        end
    else
       print("u need wait")
       DataStore:SetAsync(Player.UserId,os.time())
    end
end)
