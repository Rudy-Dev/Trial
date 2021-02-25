--Remotes
local BuyItemRemote = game.ReplicatedStorage.Remotes.Shop:WaitForChild("BuyItem")
local ExtraCashR = game.ReplicatedStorage.Remotes.Shop:WaitForChild("ExtraCash")

--UI
local ShopUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ShopUI")
local ShopOpenerBtn = ShopUI.OpenShop
local ShopFrame = ShopUI.ShopFrame
local CloseShop = ShopUI.ShopFrame.CloseShop
local ExtraCash = ShopUI.BuyCash

ExtraCash.MouseButton1Click:Connect(function()
    ExtraCashR:FireServer()
end)

ShopOpenerBtn.MouseButton1Click:Connect(function()
    ShopFrame.Visible = true
end)

CloseShop.MouseButton1Click:Connect(function()
    ShopFrame.Visible = false
end)

for _,i in pairs(ShopFrame.Buttons:GetChildren()) do
    i.MouseButton1Click:Connect(function()
        local str = string.gsub(i.Name, "Buy ", "")
        BuyItemRemote:FireServer(str)
    end)
end