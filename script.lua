local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "NAIBO_HUB"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,220,0,260)
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
local btn1 = Instance.new("TextButton", frame)
btn1.Size = UDim2.new(1,-20,0,30)
btn1.Position = UDim2.new(0,10,0,40)
btn1.Text = "Infinity Jump OFF"

btn1.MouseButton1Click:Connect(function()
    infJump = not infJump
    btn1.Text = "Infinity Jump "..(infJump and "ON" or "OFF")
end)

UIS.JumpRequest:Connect(function()
    if infJump then
        char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- スピード
local btn2 = Instance.new("TextButton", frame)
btn2.Size = UDim2.new(1,-20,0,30)
btn2.Position = UDim2.new(0,10,0,80)
btn2.Text = "Speed x2"

btn2.MouseButton1Click:Connect(function()
    char:FindFirstChildOfClass("Humanoid").WalkSpeed = 40
end)

-- フライ
local fly = false
local btn3 = Instance.new("TextButton", frame)
btn3.Size = UDim2.new(1,-20,0,30)
btn3.Position = UDim2.new(0,10,0,120)
btn3.Text = "Fly OFF"

btn3.MouseButton1Click:Connect(function()
    fly = not fly
    btn3.Text = "Fly "..(fly and "ON" or "OFF")

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

-- ESP
local espOn = false
local btn4 = Instance.new("TextButton", frame)
btn4.Size = UDim2.new(1,-20,0,30)
btn4.Position = UDim2.new(0,10,0,160)
btn4.Text = "ESP OFF"

btn4.MouseButton1Click:Connect(function()
    espOn = not espOn
    btn4.Text = "ESP "..(espOn and "ON" or "OFF")

    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            if espOn then
                local bill = Instance.new("BillboardGui", v.Character.Head)
                bill.Size = UDim2.new(0,100,0,40)
                bill.AlwaysOnTop = true

                local txt = Instance.new("TextLabel", bill)
                txt.Size = UDim2.new(1,0,1,0)
                txt.Text = v.Name
                txt.TextColor3 = Color3.new(1,0,0)
                txt.BackgroundTransparency = 1
            else
                if v.Character.Head:FindFirstChild("BillboardGui") then
                    v.Character.Head:FindFirstChild("BillboardGui"):Destroy()
                end
            end
        end
    end
end)

-- 閉じる
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(1,-20,0,30)
close.Position = UDim2.new(0,10,0,200)
close.Text = "Close"

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
