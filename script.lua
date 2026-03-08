print("script loaded")

game.StarterGui:SetCore("SendNotification",{
Title = "成功",
Text = "GitHubから読み込みました",
Duration = 5
})
-- GUI作成
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Size = UDim2.new(0,150,0,80)
Frame.Position = UDim2.new(0,20,0,200)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Parent = ScreenGui

Button.Size = UDim2.new(1,0,1,0)
Button.Text = "Infinity Jump: OFF"
Button.Parent = Frame

local infJump = false

-- ボタンON/OFF
Button.MouseButton1Click:Connect(function()
    infJump = not infJump
    if infJump then
        Button.Text = "Infinity Jump: ON"
    else
        Button.Text = "Infinity Jump: OFF"
    end
end)

-- インフィニティジャンプ
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
