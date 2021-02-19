local GamePassHandler ={}
function GamePassHandler:HavePremium(plr)
    if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 5064174) then
        return true
    else
        return false
    end
end

return GamePassHandler