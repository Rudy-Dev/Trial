local GamePassHandler ={}
function GamePassHandler:HavePremium(plr)
    local success, _error = pcall(function()
        if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 5064174) then
            return true
            
        else
            return false
        end
    end)

    if success == false then
        print("ERROR CANT GET GAMEPASS")
        error(_error)
    end
end

return GamePassHandler