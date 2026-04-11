local creator = "TikTokID:Robloxscriptdistribution"
-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
-- 表示/非表示ボタン
local toggleGuiBtn = Instance.new("TextButton")
toggleGuiBtn.Size = UDim2.new(0,120,0,40)
toggleGuiBtn.Position = UDim2.new(0,10,0,10)
toggleGuiBtn.Text = "表示"
toggleGuiBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggleGuiBtn.TextColor3 = Color3.new(1,1,1)
toggleGuiBtn.Parent = ScreenGui
-- メインフレーム
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,200,0,130)
frame.Position = UDim2.new(0,10,0,60)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Visible = false
frame.Parent = ScreenGui
-- 作成者ラベル
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1,0,0,30)
label.BackgroundTransparency = 1
label.Text = creator
label.TextColor3 = Color3.new(1,1,1)
label.TextScaled = true
label.Parent = frame
-- ON/OFFボタン
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1,-20,0,40)
toggle.Position = UDim2.new(0,10,0,50)
toggle.Text = "すり抜け: OFF"
toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Parent = frame
local noclip = false
local RunService = game:GetService("RunService")
toggle.MouseButton1Click:Connect(function()
noclip = not noclip
if noclip then
toggle.Text = "すり抜け: ON"
else
toggle.Text = "すり抜け: OFF"
end
end)
-- 表示ボタン
toggleGuiBtn.MouseButton1Click:Connect(function()
frame.Visible = not frame.Visible
if frame.Visible then
toggleGuiBtn.Text = "非表示"
else
toggleGuiBtn.Text = "表示"
end
end)
-- すり抜け処理
RunService.Stepped:Connect(function()
if noclip then
for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
end
end)
