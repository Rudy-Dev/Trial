local ShopItems = {}

ShopItems.Items =
{
    ["Tool"] =
    {
        Name = "Tool",
        Price = 10,
        Tool = game.ServerStorage:WaitForChild("Tool"),
    },
    ["Nothing"] =
    {
        Name = "Nothing",
        Price = 20,
        Tool = game.ServerStorage:WaitForChild("Nothing")
    }
}

function ShopItems:ReturnItem(item)
    return ShopItems.Items[item]
end

return ShopItems