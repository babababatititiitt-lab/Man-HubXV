local Place = game.PlaceId
local Game = game.GameId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(Place).Name

local scripts = {
    [112413741511713] = "https://raw.githubusercontent.com/x7dJJ9vnFH23/Maintained-Fun/refs/heads/main/FUNC/Games/MCT.lua"
}

local scriptURL = scripts[Place] or scripts[Game]

if scriptURL then
    loadstring(game:HttpGet(scriptURL, true))()
else
    warn("Purge: Script ini sekarang khusus untuk Catch and Tame!")
end
