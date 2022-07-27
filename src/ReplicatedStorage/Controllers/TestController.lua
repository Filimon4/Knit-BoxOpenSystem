local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local TestController = Knit.CreateController{
    Name = "TestController"
}

function TestController:KnitStart()
    print("TestController started")
    local Num = Knit.GetService("Controll"):Add(2):andThen(function(result)
        print(result)
    end)
end

return TestController