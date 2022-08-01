local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)
local ClientComm = require(ReplicatedStorage.Packages.Comm).ClientComm

local Spiner = Knit.CreateController{
    Name = "Spiner",
}

function Spiner:KnitStart(msg)
end

return Spiner