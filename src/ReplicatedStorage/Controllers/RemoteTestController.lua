local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local Comm = require(game:GetService("ReplicatedStorage").Packages.Comm).ClientComm

local ClientRemote = Knit.CreateController{
    Name = 'ClientRemote'
}


function ClientRemote:KnitStart()
    local RemoteClient = Comm.new(game.ReplicatedStorage, false, "Test")
    local signal = RemoteClient:GetSignal("Test2")
    signal:Connect(function(message)
        print("Received message from server:", message)
    end)
    signal:Fire("Hello!")
end

return ClientRemote