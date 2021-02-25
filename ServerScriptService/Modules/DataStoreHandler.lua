local DataStoreHandler = {}

--Services
local DS = game:GetService("DataStoreService")

--DataStores
local MainData = DS:GetDataStore("MainData")

--Database related
local TimeBtwAutoSaves = 60
local SeasionData = 
{
    Money = 0
}

workspace.MoneyGive.ClickDetector.MouseClick:Connect(function(plr)
    DataStoreHandler:AddMoney(plr, 100)
end)

game.Players.PlayerAdded:Connect(function(plr)
    local a = MainData:GetAsync(plr.UserId)
    if a then
        SeasionData[plr.UserId] = a
    else
        SeasionData[plr.UserId] = {Money = 0}
    end

    print(SeasionData)

    function autoSave()
        while wait(TimeBtwAutoSaves) do
            for playerUserId, data in pairs(SeasionData) do
                DataStoreHandler:SaveData(playerUserId)
            end
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(plr)
    DataStoreHandler:SaveData(plr.UserId)
end)

--Add money to actual databse
function DataStoreHandler:AddMoney(plr, amount)
    --Add money in the magic way

    --If player is new their money is 0 not null so no error :)
        --Pcall because datastore is unsure
    local success, _error = pcall(function()
        SeasionData[plr.UserId] = {Money + amount}
    end)
    if success == false then
        print("ERROR DID NOT SAVE THE DATA")
        error(_error)
    end    
end

function DataStoreHandler:SaveData(key)
    if SeasionData[key] then
        MainData:SetAsync(key, SeasionData[key])
    end
end

--Remove money from player
function DataStoreHandler:RemoveMoney(plr, amount)

    --Pcall because datastore is unsure
    local success, _error = pcall(function()
        SeasionData[plr.UserId] = {Money - amount}
    end)
    if success == false then
        print("CANT REMOVE MONEY")
        error(_error)
    end    
end

--You can get player money yay
function DataStoreHandler:GetMoney(plr)
    local PlrMoneyKey = "PlrMoneyKey_" .. plr.UserId

    return MainData:GetAsync(PlrMoneyKey)
end

return DataStoreHandler