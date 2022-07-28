local LocalizationService = game:GetService("LocalizationService")
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoxesFolder = game.Workspace:WaitForChild('Boxes')
local Box = ReplicatedStorage.Props:WaitForChild("Box")
local MaxBoxes = 25

local GameStart = Knit.CreateService{
    Name = "GameStart",
    Client = {}
}

function GameStart:Create()
    BoxesFolder:ClearAllChildren()
    for i=1,MaxBoxes do
        local Box_Clone = Box:Clone()
        Box_Clone.Parent = BoxesFolder
        Box_Clone:MoveTo(Vector3.new(math.random(-210,230), 3, math.random(-210,230)))
        CollectionService:AddTag(Box_Clone, "Box")
    end
end

function GameStart:KnitStart()
    self:Create()
end

return GameStart