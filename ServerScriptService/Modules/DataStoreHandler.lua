local DataStoreHandler = {}

--Services
local DS = game:GetService("DataStoreService")

--DataStores
local MainData = DS:GetDataStore("MainData")

--Database related
local TimeBtwAutoSaves = 61
local NewData = {}

game.Players.PlayerAdded:Connect(function(plr)
    
    

    local a = MainData:GetAsync(plr.UserId)
    print(a.Money)

    --Check if player is new
    if a == nil then
        NewData[plr.UserId] = {Money = 0}
    else
        NewData[plr.UserId] = {Money = a.Money}
    end

    --Auto saves
    while wait(TimeBtwAutoSaves) do
        for key, a in pairs(NewData) do    
            DataStoreHandler:SaveMoney(key)
            print("autosaved: " .. key)
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(plr)
    DataStoreHandler:SaveMoney(plr.UserId)
end)

function DataStoreHandler:SaveMoney(key)
    MainData:SetAsync(key, NewData[key])
end

function DataStoreHandler:AddMoney(key, amount)
    NewData[key.UserId] = {Money = NewData[key.UserId].Money + amount}
end

function DataStoreHandler:RemoveMoney(key, amount)
    NewData[key.UserId] = {Money = NewData[key.UserId].Money - amount}
end

function DataStoreHandler:GetMoney(key)
    return NewData[key.UserId].Money
end

return DataStoreHandler