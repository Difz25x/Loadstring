local libs = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = libs:MakeWindow({
        Title = "Helius Hub [ Beta ]",
        SubTitle = "by Difz25x",
        SaveFolder = "heliushub.lua"
})
local tab1test = Window:MakeTab({"Main Config", "Position Y"})

tab1test:AddSlider({
        Name = "Position Y"
})
