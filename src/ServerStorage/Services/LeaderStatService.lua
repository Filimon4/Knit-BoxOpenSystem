local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local LeaderStatService = Knit.CreateService{
    Name = "LeaderStatService",
    Client = {}
}

function LeaderStatService:GetMoney(player)
    return player.leaderstats.Money
end

function LeaderStatService:GiveMoney(player,amount)
    local money = self:GetMoney(player)
    if money then
        money.Value += amount
    end
end

function LeaderStatService:KnitStart()
    game:GetService("Players").PlayerAdded:Connect(function(player)
        local leader = Instance.new('Folder',player)
        leader.Name = "leaderstats"
        local Money = Instance.new("IntValue", leader)
        Money.Name = "Money"
    end)
end

return LeaderStatService