local DataStoreHandler = {}

--Services
local DS = game:GetService("DataStoreService")

--Remotes
local DailyRewardEvent = game.ReplicatedStorage.Remotes:WaitForChild("Reward")

--DataStores
local MainData = DS:GetDataStore("MainData")

--Database related
local TimeBtwAutoSaves = 61
local NewData = {}

game.Players.PlayerAdded:Connect(function(plr)

	Startup(plr)
    DailyReward(plr)
end)

--Startup function
    
function Startup(plr)
    local Mainkey = "MainKey_" .. plr.UserId
    
	local a = MainData:GetAsync(Mainkey)

	--Check if player is new
	if a == nil then
		NewData[Mainkey] = {Money = 0, LastLoginTime = 0}
	else
		NewData[Mainkey] = {Money = a.Money, LastLoginTime = a.LastLoginTime}
	end
end

--For daily reward
function DailyReward(plr)
    local Mainkey = "MainKey_" .. plr.UserId

        if NewData[Mainkey].LastLoginTime then
            --Cant figure out to make it cleaner :(
        local Seconds = os.time()- NewData[Mainkey].LastLoginTime
		local Minutes = Seconds / 60
		local Hours = Minutes / 60

		if Hours >= 24 then
			print("yo moni") 
            DailyRewardEvent:FireClient(plr)
			NewData[Mainkey].LastLoginTime = os.time()
            DataStoreHandler:AddMoney(plr, 100)
		end
	else
		print("u need wait")
		NewData[Mainkey].LastLoginTime = os.time()
	end
end

--Auto save in another thread
local function AutoSave()
    	while wait(TimeBtwAutoSaves) do
		for key, a in pairs(NewData) do    
			DataStoreHandler:SaveMoney(key)
			print("autosaved: " .. key)
		end
	end
end

--Run autosave in diffrent thread
spawn(AutoSave)

game.Players.PlayerRemoving:Connect(function(plr)
	DataStoreHandler:SaveMoney(plr)
end)

--save money, max one request per 6 seconds
function DataStoreHandler:SaveMoney(key)
	local Mainkey = "MainKey_" .. key.UserId
	MainData:SetAsync(Mainkey, NewData[Mainkey])
end

--add money
function DataStoreHandler:AddMoney(key, amount)
	local Mainkey = "MainKey_" .. key.UserId
	NewData[Mainkey] = {Money = NewData[Mainkey].Money + amount}
end

--remove money
function DataStoreHandler:RemoveMoney(key, amount)
	local Mainkey = "MainKey_" .. key.UserId
	NewData[Mainkey] = {Money = NewData[Mainkey].Money - amount}
end

--returing money
function DataStoreHandler:GetMoney(key)
	local Mainkey = "MainKey_" .. key.UserId
	return NewData[Mainkey].Money
end

return DataStoreHandler