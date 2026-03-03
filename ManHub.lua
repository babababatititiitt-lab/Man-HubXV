local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Membuat Window Utama
local Window = OrionLib:MakeWindow({
    Name = "C&T: Ultimate Executor 🐉", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "CT_ProConfig",
    IntroText = "Loading Gemini System..."
})

-- [[ TAB 1: ESP SYSTEM ]]
local ESPTab = Window:MakeTab({
	Name = "Animal Scanner",
	Icon = "rbxassetid://4483345998"
})

ESPTab:AddLabel("Cari hewan berdasarkan Rarity")

local SelectedRarity = "Legendary"
ESPTab:AddDropdown({
	Name = "Target Rarity",
	Default = "Legendary",
	Options = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythical"},
	Callback = function(Value)
		SelectedRarity = Value
	end    
})

ESPTab:AddButton({
	Name = "Mulai Scan & Tampilkan Teks",
	Callback = function()
		-- Logika ESP Teks yang kita bahas sebelumnya
		for _, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "AnimalESP_Tag" then v:Destroy() end
			if v:IsA("Model") and v:FindFirstChild("Rarity") and v.Rarity.Value == SelectedRarity then
				local Billboard = Instance.new("BillboardGui", v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart)
				Billboard.Name = "AnimalESP_Tag"
				Billboard.AlwaysOnTop = true
				Billboard.Size = UDim2.new(0, 200, 0, 50)
				Billboard.StudsOffset = Vector3.new(0, 3, 0)

				local TextLabel = Instance.new("TextLabel", Billboard)
				TextLabel.BackgroundTransparency = 0.5
				TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Text = "⚠️ " .. v.Name .. " [" .. v.Rarity.Value .. "]"
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextScaled = true
			end
		end
	end
})

-- [[ TAB 2: SETTINGS ]]
local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998"
})

SettingsTab:AddLabel("Kustomisasi Tampilan Menu")

-- Fitur Transparansi Background
SettingsTab:AddSlider({
	Name = "Transparency Background",
	Min = 0,
	Max = 100,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		-- Mengubah transparansi main frame Orion
		if game:GetService("CoreGui"):FindFirstChild("Orion") then
			game:GetService("CoreGui").Orion.Main.BackgroundTransparency = Value / 100
		end
	end    
})

-- Fitur Ganti Warna Background (Dropdown Pilihan Warna)
SettingsTab:AddDropdown({
	Name = "Ganti Warna Tema (Background)",
	Default = "Default Dark",
	Options = {"Default Dark", "Ocean Blue", "Forest Green", "Blood Red", "Royal Purple", "Sunset Orange"},
	Callback = function(Value)
		local TargetColor
		if Value == "Default Dark" then TargetColor = Color3.fromRGB(25, 25, 25)
		elseif Value == "Ocean Blue" then TargetColor = Color3.fromRGB(0, 50, 100)
		elseif Value == "Forest Green" then TargetColor = Color3.fromRGB(20, 60, 20)
		elseif Value == "Blood Red" then TargetColor = Color3.fromRGB(80, 0, 0)
		elseif Value == "Royal Purple" then TargetColor = Color3.fromRGB(50, 0, 80)
		elseif Value == "Sunset Orange" then TargetColor = Color3.fromRGB(100, 50, 0)
		end
		
		-- Eksekusi perubahan warna ke UI
		if game:GetService("CoreGui"):FindFirstChild("Orion") then
			game:GetService("CoreGui").Orion.Main.BackgroundColor3 = TargetColor
		end
	end    
})

SettingsTab:AddButton({
	Name = "Tutup Menu (Destroy UI)",
	Callback = function()
		OrionLib:Destroy()
	end
})

OrionLib:Init()
