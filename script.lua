local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "NAIBO_HUB"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,230,0,300)
frame.Position = UDim2.new(0,20,0,200)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "NAIBO HUB"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(45,45,45)

local y = 40

local function makeButton(text,callback)
    local b = Instance.new("TextButton",frame)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    y = y + 40
    b.MouseButton1Click:Connect(callback)
end

-- インフィニティジャンプ
local infJump=false
makeButton("Infinity Jump OFF",function(btn)
    infJump = not infJump
end)

UIS.JumpRequest:Connect(function()
    if infJump then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- スピード
makeButton("Speed x2",function()
    humanoid.WalkSpeed = 40
end)

-- フライ
local flying=false
makeButton("Fly ON/OFF",function()
    flying = not flying
    if flying then
        local bv = Instance.new("BodyVelocity")
        bv.Name="FlyForce"
        bv.MaxForce=Vector3.new(9e9,9e9,9e9)
        bv.Velocity=Vector3.new(0,50,0)
        bv.Parent=char.HumanoidRootPart
    else
        if char.HumanoidRootPart:FindFirstChild("FlyForce") then
            char.HumanoidRootPart.FlyForce:Destroy()
        end
    end
end)

-- ESP
local esp=false
makeButton("ESP ON/OFF",function()
    esp = not esp
    for _,v in pairs(Players:GetPlayers()) do
        if v~=player and v.Character and v.Character:FindFirstChild("Head") then
            if esp then
                local bill=Instance.new("BillboardGui",v.Character.Head)
                bill.Size=UDim2.new(0,100,0,40)
                bill.AlwaysOnTop=true
                bill.Name="ESP"

                local txt=Instance.new("TextLabel",bill)
                txt.Size=UDim2.new(1,0,1,0)
                txt.Text=v.Name
                txt.BackgroundTransparency=1
                txt.TextColor3=Color3.new(1,0,0)
            else
                if v.Character.Head:FindFirstChild("ESP") then
                    v.Character.Head.ESP:Destroy()
                end
            end
        end
    end
end)

-- テレポート（ランダムプレイヤー）
makeButton("Teleport to Player",function()
    local list=Players:GetPlayers()
    local target=list[math.random(1,#list)]
    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)

-- Close
makeButton("Close GUI",function()
    gui:Destroy()
end)
