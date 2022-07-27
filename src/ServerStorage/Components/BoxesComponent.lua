local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Component = require(ReplicatedStorage.Packages.Component)
local Signal = require(ReplicatedStorage.Packages.Signal)

local BoxesFolder = game.Workspace:WaitForChild('Boxes')

local BoxesInfo = require(script.Parent.Parent.Modules.BoxesInfo)

local Loger = {}
function Loger.ShouldConstruct(component)
    if not Component.Instance:IsA('Model') then return false end
    if Component.Instance.Parent ~= BoxesFolder then return false end
    return true
end

local BoxesComponent = Component.new{
    Tag = BoxesInfo.TAG,
    Ancestors = {BoxesFolder},
    Extensions = Loger
}

function BoxesComponent:onTouched(hit)
    local plr = Players:GetPlayerFromCharacter(hit.Parent)
    if plr then
        print(plr.Name)
    end
end

function BoxesComponent:Construct()
    print('Constructing')
    self.Win = math.random(50, 1000)
end

function BoxesComponent:Start()
    self.Instance.PrimaryPart.Touched:Connect(function(hit)
        self:onTouched(hit)
    end)
end

function BoxesComponent:Stop()
    print('Stop')
end

return BoxesComponent