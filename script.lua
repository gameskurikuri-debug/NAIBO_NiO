local player = game.Players.LocalPlayer
local gui = script.Parent

local ammoText = gui:WaitForChild("AmmoText")
local crosshair = gui:WaitForChild("Crosshair")

local ammo = 30
local maxAmmo = 30

-- 弾数表示更新
local function updateAmmo()
	ammoText.Text = "Ammo: "..ammo
end

updateAmmo()

-- 発射処理
local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()

	if ammo <= 0 then
		return
	end
	
	ammo -= 1
	updateAmmo()

	-- クロスヘア反応
	crosshair.Size = UDim2.new(0,10,0,10)
	
	wait(0.05)
	
	crosshair.Size = UDim2.new(0,6,0,6)

end)

-- リロード (Rキー)
game:GetService("UserInputService").InputBegan:Connect(function(input)

	if input.KeyCode == Enum.KeyCode.R then
		
		wait(1.5) -- リロード時間
		
		ammo = maxAmmo
		updateAmmo()
		
	end
	
end)
