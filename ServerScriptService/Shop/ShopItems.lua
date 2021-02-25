local ShopItems = {}

ShopItems.Items =
{
    ["Tool"] =
    {
        Name = "Tool",
        Price = 10,
        Tool = game.ServerStorage:WaitForChild("Tool"),
        GiveMoney = nil
    },
    ["Cash"] =
    {
        Name = "Cash",
        Price = 0,
        Tool = nil,
        GiveMoney = 100
    }
}

function ShopItems:ReturnItem(item)
    return ShopItems.Items[item]
end

return ShopItems