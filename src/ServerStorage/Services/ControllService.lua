local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local Controll = Knit.CreateService{
    Name = "Controll",
    Client = {}
}

function Controll:TestMoney()
    local allow = true
    while allow do
        task.wait()
        local LeaderStat = Knit.GetService("LeaderStatService")
        local amount = 50
        for _,player in pairs(game:GetService('Players'):GetPlayers()) do
            Knit.GetService('LeaderStatService'):GiveMoney(player,amount)
        end

    end
end

function Controll:KnitStart()
    task.wait(2)
    self:TestMoney()
end

return Controll