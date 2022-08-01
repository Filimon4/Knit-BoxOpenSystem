local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")

local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local Comm = require(game:GetService("ReplicatedStorage").Packages.Comm).ServerComm

local ServerEvent = Knit.CreateService{
    Name = "ServerEvent",
    Client = {}
}

function ServerEvent:KnitStart()
    local RemoteServer = Comm.new(game.ReplicatedStorage, "Test")
    RemoteServer:BindFunction("TestFunciton",function()
        return "Test"
    end)
    local mySignal = RemoteServer:CreateSignal("Test2")
    mySignal:Connect(function(player, message)
        print("Got a message from " .. player.Name .. ":", message)
    end)
    task.wait(1)
    for i,v in ipairs(Players:GetPlayers()) do
        print(i,v)
        mySignal:Fire(v, "Helljoy")
    end
end

return ServerEvent