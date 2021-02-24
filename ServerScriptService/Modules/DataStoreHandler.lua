local DataStoreHandler = {}
local DS = game:GetService("DataStoreService")

local MainData = DS:GetDataStore("MainData")

local PlrMoneyKey;

function DataStoreHandler:AddMoney(plr, amount)
    --Add money in the magic way
    PlrMoneyKey = "PlrMoneyKey_" .. plr.UserId
    local success, _error = pcall(function()
        MainData:SetAsync(PlrMoneyKey, amount + MainData:GetAsync(PlrMoneyKey))
    end)
    if success == false then
        print("ERROR DID NOT SAVE THE DATA")
        error(_error)
        else
    end
end

function DataStoreHandler:GetMoney(plr)
    PlrMoneyKey = "PlrMoneyKey_" .. plr.UserId

    return MainData:GetAsync(PlrMoneyKey)
end

return DataStoreHandler