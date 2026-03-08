local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "NAIBO_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,220)
frame.Position = UDim2.new(0,20,0,200)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "NAIBO HUB"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(40,40,40)

-- インフィニティジャンプ
local infJump = false

local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Size = UDim2.new(1,-20,0,30)
jumpBtn.Position = UDim2.new(0,10,0,40)
jumpBtn.Text = "Infinity Jump : OFF"

jumpBtn.MouseButton1Click:Connect(function()
    infJump = not infJump
    jumpBtn.Text = "Infinity Jump : "..(infJump and "ON" or "OFF")
end)

UIS.JumpRequest:Connect(function()
    if infJump then
        char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- スピード
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Size = UDim2.new(1,-20,0,30)
speedBtn.Position = UDim2.new(0,10,0,80)
speedBtn.Text = "Speed x2"

speedBtn.MouseButton1Click:Connect(function()
    char:FindFirstChildOfClass("Humanoid").WalkSpeed = 32
end)

-- フライ
local fly = false

local flyBtn = Instance.new("TextButton", frame)
flyBtn.Size = UDim2.new(1,-20,0,30)
flyBtn.Position = UDim2.new(0,10,0,120)
flyBtn.Text = "Fly : OFF"

flyBtn.MouseButton1Click:Connect(function()
    fly = not fly
    flyBtn.Text = "Fly : "..(fly and "ON" or "OFF")

    if fly then
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(9e9,9e9,9e9)
        bv.Velocity = Vector3.new(0,50,0)
        bv.Parent = char.HumanoidRootPart
    else
        if char.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
            char.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
        end
    end
end)

-- GUI閉じる
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(1,-20,0,30)
close.Position = UDim2.new(0,10,0,160)
close.Text = "Close GUI"

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
