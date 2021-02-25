--Clone ShopItems into client, simple

local Orginal = script.Parent.ShopItems

local Prefab = Orginal:Clone()

Prefab.Parent = game.ReplicatedStorage.Modules