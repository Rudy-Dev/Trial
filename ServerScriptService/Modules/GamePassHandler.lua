local GamePassHandler ={}

--Check if player has premium gamepass, not roblox premium!
function GamePassHandler:HavePremium(plr)
    local success, _error = pcall(function()
        if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 5064174) then
            return true
        else
            return false
        end
    end)

    --Check if there is any problem with marketplaceservice
    if success == false then
        print("ERROR CANT GET GAMEPASS")
        error(_error)
    end
end

return GamePassHandler