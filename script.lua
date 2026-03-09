local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Brainrot Stealer Helper", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- メインタブ
local MainTab = Window:MakeTab({
	Name = "メイン",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = MainTab:AddSection({
	Name = "自動化設定"
})

-- 自動投入トグル
MainTab:AddToggle({
	Name = "自動で出す (相手にも見える)",
	Default = false,
	Callback = function(Value)
		getgenv().AutoVisible = Value
		
		task.spawn(function()
			while getgenv().AutoVisible do
				-- ゲーム内の通信用リモートイベントを自動探索
				local remote = game:GetService("ReplicatedStorage"):FindFirstChild("TradeRemote") 
                            or game:GetService("ReplicatedStorage"):FindFirstChild("AddBrainrot")
                            or game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent")
                            or game:GetService("ReplicatedStorage"):FindFirstChild("ItemEvent")

				if remote then
					-- サーバーへ送信（これで相手からも見えるようになる）
					remote:FireServer("Brainrot", 1) 
				end
				
				task.wait(0.2) -- 0.1秒だと落ちる場合があるので0.2に設定
			end
		end)
	end    
})

MainTab:AddLabel("※アイテムを1つ以上持っていないと相手には見えません")

OrionLib:Init()
