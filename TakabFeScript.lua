repeat wait() until game:IsLoaded() and game.CoreGui:FindFirstChild('RobloxPromptGui')

local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
 
po.ChildAdded:connect(function(a)
    if a.Name == 'ErrorPrompt' then
        repeat
            ts:Teleport(game.PlaceId)
            wait(2)
        until false
    end
end)

local LunaUI = {}

do  local ui =  game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Luna")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService")

local LunaColor = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(85, 85, 127)


coroutine.wrap(
	function()
		while wait() do
			LunaColor.RainbowColorValue = LunaColor.RainbowColorValue + 1 / 255
			LunaColor.HueSelectionPosition = LunaColor.HueSelectionPosition + 1

			if LunaColor.RainbowColorValue >= 1 then
				LunaColor.RainbowColorValue = 0
			end

			if LunaColor.HueSelectionPosition == 160 then
				LunaColor.HueSelectionPosition = 0
			end
		end
	end
)()


local Luna = Instance.new("ScreenGui")
Luna.Name = "Luna"
Luna.Parent = game:GetService("CoreGui").RobloxGui.Modules
Luna.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
	syn.protect_gui(game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Luna"))
end

getgenv().Settings = {
	Key = Enum.KeyCode.RightControl
}

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function LunaUI.create()
	LunaFocus = false
	
	local MainSceen = Instance.new("Frame")
	
	MainSceen.Name = "MainSceen"
	MainSceen.Parent = Luna
	MainSceen.Active = true
	MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
	MainSceen.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	MainSceen.BorderColor3 = Color3.fromRGB(10, 10, 10)
	MainSceen.ClipsDescendants = true
	MainSceen.Position = UDim2.new(0.474336475, 0, 0.324846715, 0)
	MainSceen.Size = UDim2.new(0, 0, 0, 0)
	
	tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 525, 0, 440)}):Play()
	
	local Main_UiConner = Instance.new("UICorner")
	
	Main_UiConner.CornerRadius = UDim.new(0, 9)
	Main_UiConner.Name = "Main_UiConner"
	Main_UiConner.Parent = MainSceen
	
	local ClickFrame = Instance.new("Frame")
	
	ClickFrame.Name = "ClickFrame"
	ClickFrame.Parent = MainSceen
	ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ClickFrame.BackgroundColor3 = Color3.fromRGB(240, 244, 242)
	ClickFrame.BackgroundTransparency = 1.000
	ClickFrame.Position = UDim2.new(0.160435274, 0, 0.499144733, 0)
	ClickFrame.Size = UDim2.new(0, 168, 0, 439)
	
	local NameReal = Instance.new("TextLabel")
	
	NameReal.Name = "NameReal"
	NameReal.Parent = MainSceen
	NameReal.Active = true
	NameReal.AnchorPoint = Vector2.new(0.5, 0)
	NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameReal.BackgroundTransparency = 1.000
	NameReal.Position = UDim2.new(0.14046073, 17, 0.915909111, 0)
	NameReal.Size = UDim2.new(0.322724581, -14, 0.0380000025, 20)
	NameReal.Font = Enum.Font.GothamBold
	NameReal.Text = "Takab Hub | Pro Max"
	NameReal.TextColor3 = Color3.fromRGB(85, 85, 127)
	NameReal.TextSize = 13.000
	NameReal.TextWrapped = true
	NameReal.TextXAlignment = Enum.TextXAlignment.Left
	
	local Logo_2 = Instance.new("ImageLabel")
	
	Logo_2.Name = "Logo"
	Logo_2.Parent = MainSceen
	Logo_2.Active = true
	Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo_2.BackgroundTransparency = 1.000
	Logo_2.Position = UDim2.new(0.0647619069, 0, 0.0454545468, 0)
	Logo_2.Size = UDim2.new(0, 100, 0, 100)---Logo_2.Size = UDim2.new(0, 100, 0, 100)
	Logo_2.Image = "rbxassetid://9513349012"
	
	local MainSceen2 = Instance.new("Frame")
	
	MainSceen2.Name = "MainSceen2"
	MainSceen2.Parent = MainSceen
	MainSceen2.Active = true
	MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
	MainSceen2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MainSceen2.BackgroundTransparency = 1.000
	MainSceen2.BorderSizePixel = 0
	MainSceen2.Position = UDim2.new(0.499762595, 0, 0.499515384, 0)
	MainSceen2.Size = UDim2.new(0, 524, 0, 439)
	
	local ScolTapBarFrame = Instance.new("Frame")
	
	ScolTapBarFrame.Name = "ScolTapBarFrame"
	ScolTapBarFrame.Parent = MainSceen2
	ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	ScolTapBarFrame.BackgroundTransparency = 1.000
	ScolTapBarFrame.BorderSizePixel = 0
	ScolTapBarFrame.Position = UDim2.new(0.160025209, 0, 0.583629191, 5)
	ScolTapBarFrame.Selectable = true
	ScolTapBarFrame.Size = UDim2.new(0.341, -10, 0.531, 23)
	
	local KeyButton = Instance.new("TextButton")

	KeyButton.Name = "Key"
	KeyButton.Parent = ScolTapBarFrame
	KeyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeyButton.BackgroundTransparency = 1.000
	KeyButton.Position = UDim2.new(0.07732898, 0, 1, 0)
	KeyButton.Size = UDim2.new(0, 154, 0, 26)
	KeyButton.Font = Enum.Font.Gotham
	KeyButton.Text = "[ " .. getgenv().Settings.Key.Name .." ] "
	KeyButton.TextColor3 = Color3.fromRGB(109, 109, 109)
	KeyButton.TextSize = 12.000
	KeyButton.TextXAlignment = Enum.TextXAlignment.Left
	
	KeyButton.MouseButton1Click:Connect(function()
		KeyButton.Text = "Select Key"
		local inputwait = UserInputService.InputBegan:wait()
		if inputwait.KeyCode.Name ~= "Unknown" then
			getgenv().Settings.Key = inputwait.KeyCode
			KeyButton.Text = "[ " .. getgenv().Settings.Key.Name .." ] "

			Key = inputwait.KeyCode.Name
		end
	end)
	local uitoggled = false
	UserInputService.InputBegan:Connect(function(io, p)
		if io.KeyCode == getgenv().Settings.Key then
			if uitoggled == false then
				uitoggled = true
				TweenService:Create(
					MainSceen,
					TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
					{Size = UDim2.new(0, 0, 0, 0)}
				):Play()
			else
				TweenService:Create(
					MainSceen,
					TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 525, 0, 440)}
				):Play()
				repeat wait() until MainSceen.Size == UDim2.new(0, 525, 0, 440)
				uitoggled = false
			end
		end
	end)
	
	local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")
	
	ScrollingFrame_Menubar.Name = "ScrollingFrame_Menubar"
	ScrollingFrame_Menubar.Parent = ScolTapBarFrame
	ScrollingFrame_Menubar.Active = true
	ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame_Menubar.BackgroundTransparency = 1.000
	ScrollingFrame_Menubar.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ScrollingFrame_Menubar.BorderSizePixel = 0
	ScrollingFrame_Menubar.Position = UDim2.new(0, 0, 0.0191065446, 0)
	ScrollingFrame_Menubar.Size = UDim2.new(1.05936217, -10, 0.923487365, 23)
	ScrollingFrame_Menubar.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	ScrollingFrame_Menubar.ScrollBarThickness = 3
	
	local UIListLayout_Menubar = Instance.new("UIListLayout")
	local UIPadding_Menubar = Instance.new("UIPadding")
	
	UIListLayout_Menubar.Name = "UIListLayout_Menubar"
	UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
	UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_Menubar.Padding = UDim.new(0, 12)

	UIPadding_Menubar.Name = "UIPadding_Menubar"
	UIPadding_Menubar.Parent = ScrollingFrame_Menubar
	UIPadding_Menubar.PaddingLeft = UDim.new(0, 30)
	UIPadding_Menubar.PaddingTop = UDim.new(0, 7)
	
	local PageOrders = -1
	
	local Container_Page = Instance.new("Frame")
	
	Container_Page.Name = "Container_Page"
	Container_Page.Parent = MainSceen2
	Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)
	Container_Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container_Page.BackgroundTransparency = 1.000
	Container_Page.ClipsDescendants = true
	Container_Page.Position = UDim2.new(0.660313249, 0, 0.499615937, 0)
	Container_Page.Size = UDim2.new(0, 355, 0, 439)
	
	local pagesFolder = Instance.new("Folder")
	
	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = Container_Page
	
	local UIPage = Instance.new("UIPageLayout")
	
	UIPage.Name = "UIPage"
	UIPage.Parent = pagesFolder
	UIPage.SortOrder = Enum.SortOrder.LayoutOrder
	UIPage.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIPage.EasingStyle = Enum.EasingStyle.Cubic
	UIPage.Padding = UDim.new(0, 15)
	UIPage.FillDirection = Enum.FillDirection.Vertical
	UIPage.TweenTime = 0.3
	
	MakeDraggable(ClickFrame,MainSceen)
	
	local LunaTab = {}
	
	local FrameNotification = Instance.new("Frame")
	
	FrameNotification.Name = "FrameNotification"
	FrameNotification.Parent = Luna
	FrameNotification.Active = true
	FrameNotification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FrameNotification.BackgroundTransparency = 1.000
	FrameNotification.ClipsDescendants = true
	FrameNotification.Position = UDim2.new(0.844123185, 0, 0.0110429451, 0)
	FrameNotification.Size = UDim2.new(0.146448776, 0, 0.973006129, 0)
	
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	
	UIListLayout.Parent = FrameNotification
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	UIPadding.Parent = FrameNotification
	UIPadding.PaddingLeft = UDim.new(0, 5)
	UIPadding.PaddingTop = UDim.new(0, 5)
	
	function LunaUI:Notification(text,text2,delays)
		local MainNotification = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		MainNotification.Name = "Main"
		MainNotification.Parent = FrameNotification
		MainNotification.Active = true
		MainNotification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		MainNotification.BackgroundTransparency = 0.100
		MainNotification.BorderColor3 = Color3.fromRGB(27, 42, 53)
		MainNotification.BorderSizePixel = 0
		MainNotification.Size = UDim2.new(0, 0, 0.0117016882, 0)

		UICorner.Parent = MainNotification
		
		local Line = Instance.new("Frame")

		Line.Name = "Line"
		Line.Parent = MainNotification
		Line.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 0.290697694, 0)
		Line.Size = UDim2.new(0.999320805, 0, 0.0117016882, 0)

		local Header = Instance.new("TextLabel")

		Header.Name = "Header"
		Header.Parent = MainNotification
		Header.Active = true
		Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Header.BackgroundTransparency = 1.000
		Header.Size = UDim2.new(0.999320805, 0, 0.292542189, 0)
		Header.Font = Enum.Font.Gotham
		Header.Text = tostring(text)
		Header.TextColor3 = Color3.fromRGB(255, 255, 255)
		Header.TextSize = 12.000

		local Description = Instance.new("TextLabel")

		Description.Name = "Description"
		Description.Parent = MainNotification
		Description.Active = true
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.Position = UDim2.new(0, 0, 0.383720934, 0)
		Description.Size = UDim2.new(0.999320805, 0, 0.620189488, 0)
		Description.Font = Enum.Font.Gotham
		Description.Text = tostring(text2)
		Description.TextColor3 = Color3.fromRGB(186, 186, 186)
		Description.TextSize = 11.000
		Description.TextYAlignment = Enum.TextYAlignment.Top
		
		TweenService:Create(
			MainNotification,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0.969957054, 0, 0.10844893, 0)}
		):Play()
		
		delay(tonumber(delays),function()
			TweenService:Create(
				Header,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				Description,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				MainNotification,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 0, 0.10844893, 0)}
			):Play()
			wait(.2)
			MainNotification:Destroy()
		end
		)
	end
	
	function LunaTab.createtab(text,logo)
		if logo == nil then
			logo = 7072981376
		end
		
		PageOrders = PageOrders + 1
		
		local name = tostring(text) or tostring(math.random(1,5000))
		
		local Frame_Tap = Instance.new("Frame")
		
		Frame_Tap.Name = text.."Server"
		Frame_Tap.Parent = ScrollingFrame_Menubar
		Frame_Tap.Active = true
		Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_Tap.BackgroundTransparency = 1.000
		Frame_Tap.Size = UDim2.new(0, 70, 0, 24)
		
		local TextButton_Tap = Instance.new("TextButton")
		
		TextButton_Tap.Name = "TextButton_Tap"
		TextButton_Tap.Parent = Frame_Tap
		TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton_Tap.BackgroundTransparency = 1.000
		TextButton_Tap.Position = UDim2.new(0.114666745, 0, 0.100000381, 0)
		TextButton_Tap.Size = UDim2.new(0, 66, 0, 20)
		TextButton_Tap.Font = Enum.Font.GothamBold
		TextButton_Tap.Text = tostring(text)
		TextButton_Tap.TextColor3 = Color3.fromRGB(109, 109, 109)
		TextButton_Tap.TextSize = 11.000
		TextButton_Tap.TextWrapped = true
		TextButton_Tap.TextXAlignment = Enum.TextXAlignment.Left
		
		local Logo = Instance.new("ImageLabel")
		
		Logo.Name = "Logo"
		Logo.Parent = Frame_Tap
		Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Logo.BackgroundTransparency = 1.000
		Logo.Position = UDim2.new(-0.19, 0, 0.18, 0)
		Logo.Size = UDim2.new(0, 15, 0, 15)
		Logo.Image = "http://www.roblox.com/asset/?id="..tostring(logo)
		Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
		Logo.ImageTransparency = 0.6
		
		local ButtonGradient = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")

		ButtonGradient.Name = "ButtonGradient"
		ButtonGradient.Parent = Frame_Tap
		ButtonGradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ButtonGradient.Position = UDim2.new(-0.242476985, 0, 0, 0)
		ButtonGradient.Size = UDim2.new(0, 0, 0, 22)
		ButtonGradient.ZIndex = 0

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = ButtonGradient

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 85, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(68, 68, 102))}
		UIGradient.Parent = ButtonGradient
		
		local MainPage = Instance.new("Frame")
		
		MainPage.Name = name.."_MainPage"
		MainPage.Parent = pagesFolder
		MainPage.Active = true
		MainPage.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
		MainPage.BackgroundTransparency = 1.000
		MainPage.BorderSizePixel = 0
		MainPage.ClipsDescendants = true
		MainPage.Position = UDim2.new(0, 0, -0.000269166427, 0)
		MainPage.Size = UDim2.new(0, 356, 0, 439)
		
		MainPage.LayoutOrder = PageOrders
		
		TextButton_Tap.MouseButton1Click:connect(function()
			if MainPage.Name == text.."_MainPage" then
				UIPage:JumpToIndex(MainPage.LayoutOrder)

			end
			for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
				if v:IsA("Frame") then
					TweenService:Create(
						v.TextButton_Tap,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(100, 100, 100)}
					):Play()
					TweenService:Create(
						v.Logo,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0.6}
					):Play()
					TweenService:Create(
						v.ButtonGradient,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 0, 0, 22)}
					):Play()
				end
				TweenService:Create(
					TextButton_Tap,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
				TweenService:Create(
					Logo,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0}
				):Play()
				TweenService:Create(
					ButtonGradient,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 147, 0, 22)}
				):Play()
			end
		end)

		if LunaFocus == false then
			TweenService:Create(
				TextButton_Tap,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()

			TweenService:Create(
				Logo,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageTransparency = 0}
			):Play()
			TweenService:Create(
				ButtonGradient,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 147, 0, 22)}
			):Play()

			MainPage.Visible = true
			Frame_Tap.Name  = text .. "Server"
			LunaFocus  = true
		end
		
		local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")
		
		ScrollingFrame_Pagefrist.Name = "ScrollingFrame_Pagefrist"
		ScrollingFrame_Pagefrist.Parent = MainPage
		ScrollingFrame_Pagefrist.Active = true
		ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame_Pagefrist.BackgroundTransparency = 1.000
		ScrollingFrame_Pagefrist.BorderSizePixel = 0
		ScrollingFrame_Pagefrist.ClipsDescendants = false
		ScrollingFrame_Pagefrist.Position = UDim2.new(-0.00118658517, 0, -0.000269166427, 0)
		ScrollingFrame_Pagefrist.Size = UDim2.new(0, 356, 0, 439)
		ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame_Pagefrist.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
		ScrollingFrame_Pagefrist.ScrollBarThickness = 3
		
		local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
		local UIPadding_Pagefrist = Instance.new("UIPadding")
		
		UIGridLayout_Pagefrist.Name = "UIGridLayout_Pagefrist"
		UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
		UIGridLayout_Pagefrist.FillDirection = Enum.FillDirection.Vertical
		UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 15, 0, 30)
		UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 340, 0, 420)

		UIPadding_Pagefrist.Name = "UIPadding_Pagefrist"
		UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
		UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 8)
		UIPadding_Pagefrist.PaddingTop = UDim.new(0, 10)
		
		local LunaPage = {}
		
		function LunaPage.page()
			local Pageframe = Instance.new("Frame")
			
			Pageframe.Name = "Pageframe"
			Pageframe.Parent = ScrollingFrame_Pagefrist
			Pageframe.Active = true
			Pageframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Pageframe.BorderSizePixel = 0
			Pageframe.Size = UDim2.new(0, 435, 0, 395)
			
			local PageFrameStroke = Instance.new("UIStroke")

			PageFrameStroke.Parent = Pageframe
			PageFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			PageFrameStroke.Color = Color3.fromRGB(25,25,25)
			PageFrameStroke.Thickness = 2
			PageFrameStroke.Transparency = 0.2
			
			local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")
			
			ScrollingFrame_Pageframe.Name = "ScrollingFrame_Pageframe"
			ScrollingFrame_Pageframe.Parent = Pageframe
			ScrollingFrame_Pageframe.Active = true
			ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame_Pageframe.BackgroundTransparency = 1.000
			ScrollingFrame_Pageframe.BorderSizePixel = 0
			ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, 0.0761904791, 0)
			ScrollingFrame_Pageframe.Size = UDim2.new(0, 340, 0, 388)
			ScrollingFrame_Pageframe.ScrollBarThickness = 3
			
			local ScrollingFrame_PageframeUIListLayout = Instance.new("UIListLayout")
			local ScrollingFrame_PageframeUIPadding = Instance.new("UIPadding")
			
			ScrollingFrame_PageframeUIListLayout.Name = "ScrollingFrame_PageframeUIListLayout"
			ScrollingFrame_PageframeUIListLayout.Parent = ScrollingFrame_Pageframe
			ScrollingFrame_PageframeUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ScrollingFrame_PageframeUIListLayout.Padding = UDim.new(0, 10)

			ScrollingFrame_PageframeUIPadding.Name = "ScrollingFrame_PageframeUIPadding"
			ScrollingFrame_PageframeUIPadding.Parent = ScrollingFrame_Pageframe
			ScrollingFrame_PageframeUIPadding.PaddingLeft = UDim.new(0, 10)
			ScrollingFrame_PageframeUIPadding.PaddingTop = UDim.new(0, 10)
			
			local Glow = Instance.new("ImageLabel")
			
			Glow.Name = "Glow"
			Glow.Parent = Pageframe
			Glow.Active = true
			Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Glow.BackgroundTransparency = 1.000
			Glow.Position = UDim2.new(-0.0578724593, 0, -0.0604636073, 0)
			Glow.Size = UDim2.new(0, 381, 0, 471)
			Glow.Image = "rbxassetid://5028857084"
			Glow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local UICorner_3 = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 9)
			UICorner.Parent = MainSceen2

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Pageframe

			TextLabel.Parent = Pageframe
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.ClipsDescendants = true
			TextLabel.Position = UDim2.new(0.0205882359, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 333, 0, 31)
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.Text = TextButton_Tap.Text
			TextLabel.TextColor3 = Color3.fromRGB(85, 85, 127)
			TextLabel.TextSize = 12.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_3.CornerRadius = UDim.new(0, 2)
			UICorner_3.Parent = MainPage
			
			ScrollingFrame_PageframeUIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,ScrollingFrame_PageframeUIListLayout.AbsoluteContentSize.Y + 120)
			end)

			UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 15)
			end)

			game:GetService("RunService").Stepped:Connect(function ()
				pcall(function ()
					ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,0, 0,UIListLayout_Menubar.AbsoluteContentSize.Y + 20)
					ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,ScrollingFrame_PageframeUIListLayout.AbsoluteContentSize.Y +25)
				end)
			end)
			
			local LunaFunction = {}
			
			function LunaFunction:Button(text,callback)
				local ButtonFrame = Instance.new("Frame")
				local Button = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")

				ButtonFrame.Name = "ButtonFrame"
				ButtonFrame.Parent = ScrollingFrame_Pageframe
				ButtonFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
				ButtonFrame.BackgroundTransparency = 1.000
				ButtonFrame.Size = UDim2.new(0, 318, 0, 21)
				ButtonFrame.BorderSizePixel = 0

				Button.Name = "Button"
				Button.AnchorPoint = Vector2.new(0.5, 0.5)
				Button.Position = UDim2.new(0.5, 0, 0.5, 0)
				Button.Parent = ButtonFrame
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.Size = UDim2.new(0, 318, 0, 18)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.Text = tostring(text)
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 12.000

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = Button
				
				local ButtonStroke = Instance.new("UIStroke")

				ButtonStroke.Parent = Button
				ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ButtonStroke.Color = Color3.fromRGB(85, 85, 127)
				ButtonStroke.Thickness = 1.4
				ButtonStroke.Transparency = 0
				
				Button.MouseButton1Down:Connect(function()
					pcall(callback)
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 310, 0, 10)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextSize = 10} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						ButtonFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					wait(0.1)
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 318, 0, 18)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextSize = 12} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						ButtonFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)
			end
			
			function LunaFunction:Toggle(text,default,callback)
				local ToggleFrame = Instance.new("Frame")
				local Toggle = Instance.new("TextButton")
				local Title = Instance.new("TextLabel")
				local Toggle1 = Instance.new("TextButton")
				local Toggle1Corner = Instance.new("UICorner")
				local Toggle2 = Instance.new("TextButton")
				local Toggle2Corner = Instance.new("UICorner")
				local Check = Instance.new("ImageLabel")

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = ScrollingFrame_Pageframe
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleFrame.BackgroundTransparency = 1.000
				ToggleFrame.Position = UDim2.new(0.0121212117, 0, 0.0687830672, 0)
				ToggleFrame.Size = UDim2.new(0, 314, 0, 21)

				Toggle.Name = "Toggle"
				Toggle.Parent = ToggleFrame
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.Size = UDim2.new(0, 314, 0, 21)
				Toggle.Font = Enum.Font.SourceSans
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.TextSize = 14.000

				Title.Name = "Title"
				Title.Parent = Toggle
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.ClipsDescendants = true
				Title.Position = UDim2.new(0.0191082805, 0, 0, 0)
				Title.Size = UDim2.new(0, 274, 0, 21)
				Title.Font = Enum.Font.Gotham
				Title.Text = tostring(text)
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 12.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				Toggle1.Name = "Toggle1"
				Toggle1.Parent = Toggle
				Toggle1.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle1.BackgroundTransparency = 1.000
				Toggle1.BorderSizePixel = 0
				Toggle1.Position = UDim2.new(0.980000019, 0, 0.5, 0)
				Toggle1.Size = UDim2.new(0, 23, 0, 23)
				Toggle1.AutoButtonColor = false
				Toggle1.Font = Enum.Font.SourceSans
				Toggle1.Text = ""
				Toggle1.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle1.TextSize = 1.000

				Toggle1Corner.CornerRadius = UDim.new(0, 7)
				Toggle1Corner.Name = "Toggle1Corner"
				Toggle1Corner.Parent = Toggle1
				
				local Toggle1Stroke = Instance.new("UIStroke")

				Toggle1Stroke.Parent = Toggle1
				Toggle1Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Toggle1Stroke.Color = Color3.fromRGB(85, 85, 127)
				Toggle1Stroke.Thickness = 1.4
				Toggle1Stroke.Transparency = 0

				Toggle2.Name = "Toggle2"
				Toggle2.Parent = Toggle1
				Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle2.BackgroundColor3 = Color3.fromRGB(85, 85, 127)
				Toggle2.BorderSizePixel = 0
				Toggle2.ClipsDescendants = true
				Toggle2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Toggle2.Size = UDim2.new(0, 0, 0, 0)
				Toggle2.AutoButtonColor = false
				Toggle2.Font = Enum.Font.SourceSans
				Toggle2.Text = ""
				Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle2.TextSize = 1.000

				Toggle2Corner.CornerRadius = UDim.new(0, 7)
				Toggle2Corner.Name = "Toggle2Corner"
				Toggle2Corner.Parent = Toggle2

				Check.Name = "Check"
				Check.Parent = Toggle2
				Check.AnchorPoint = Vector2.new(0.5, 0.5)
				Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Check.BackgroundTransparency = 1.000
				Check.Position = UDim2.new(0.5, 0, 0.5, 0)
				Check.Size = UDim2.new(0, 0, 0, 0)
				Check.Image = "rbxassetid://7072706620"
				
				local FocusToggle = false
				
				Toggle2.MouseButton1Down:Connect(function()
					if FocusToggle == false then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end)
				
				Toggle1.MouseButton1Down:Connect(function()
					if FocusToggle == false then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end)
				
				Toggle.MouseButton1Down:Connect(function()
					if FocusToggle == false then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end)
				
				if default == true then
					TweenService:Create(
						Toggle2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					wait(0.1)
					TweenService:Create(
						Check,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end
			end
			
			function LunaFunction:Dropdown(text,list,callback)
				local dropfunc = {}
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropBtn = Instance.new("TextButton")
				local UICorner_15 = Instance.new("UICorner")
				local DropText = Instance.new("TextLabel")
				local UICorner_16 = Instance.new("UICorner")
				local keyboard_arrow_left = Instance.new("ImageButton")
				local DropHold = Instance.new("Frame")
				local Droplist = Instance.new("ScrollingFrame")
				local UIListLayout_5 = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				local UICorner_18 = Instance.new("UICorner")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ScrollingFrame_Pageframe
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0, 0, 0, 0)
				Dropdown.Size = UDim2.new(0, 318, 0, 21)
				Dropdown.ClipsDescendants = true
				
				DropBtn.Name = "DropBtn"
				DropBtn.Parent = Dropdown
				DropBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				DropBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropBtn.BorderSizePixel = 0
				DropBtn.Position = UDim2.new(0, 0, 0, 0)
				DropBtn.Size = UDim2.new(0,318,0,21)
				DropBtn.Font = Enum.Font.GothamSemibold
				DropBtn.Text = ""
				DropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropBtn.TextSize = 13.000
				DropBtn.AutoButtonColor = false

				UICorner_15.CornerRadius = UDim.new(0, 5)
				UICorner_15.Parent = DropBtn

				DropText.Name = "DropText"
				DropText.Parent = DropBtn
				DropText.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				DropText.BackgroundTransparency = 1.000
				DropText.Position = UDim2.new(0.0121402545, 0, 0.0466926247, -1)
				DropText.Size = UDim2.new(0, 288, 0, 25)
				DropText.Font = Enum.Font.Gotham
				DropText.Text = "".. text ..": nil"
				DropText.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropText.TextSize = 12.000
				DropText.TextXAlignment = Enum.TextXAlignment.Left

				UICorner_16.CornerRadius = UDim.new(0, 5)
				UICorner_16.Parent = DropText

				keyboard_arrow_left.Name = "keyboard_arrow_left"
				keyboard_arrow_left.Parent = DropBtn
				keyboard_arrow_left.BackgroundTransparency = 1.000
				keyboard_arrow_left.Position = UDim2.new(0.902036726, 0, 0.13, 0)
				keyboard_arrow_left.Size = UDim2.new(0, 19, 0, 19)
				keyboard_arrow_left.ZIndex = 2
				keyboard_arrow_left.Image = "rbxassetid://3926305904"
				keyboard_arrow_left.ImageRectOffset = Vector2.new(724, 284)
				keyboard_arrow_left.ImageRectSize = Vector2.new(36, 36)

				DropHold.Name = "DropHold"
				DropHold.Parent = Dropdown
				DropHold.AnchorPoint = Vector2.new(0.5,0.5)
				DropHold.BackgroundColor3 = Color3.fromRGB(30,30,30)
				DropHold.BorderSizePixel = 0
				DropHold.Position = UDim2.new(0.5, 0, 0.151162788, 22)
				DropHold.Size = UDim2.new(0, 318, 0, 0)
				DropHold.ClipsDescendants = true

				Droplist.Name = "Droplist"
				Droplist.Parent = DropHold
				Droplist.Active = true
				Droplist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Droplist.BackgroundTransparency = 1.000
				Droplist.Size = UDim2.new(0, 318, 0, 133)
				Droplist.ScrollBarThickness = 3
				Droplist.BorderSizePixel = 0

				UIListLayout_5.Parent = Droplist
				UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_5.Padding = UDim.new(0, 2)

				UIPadding.Parent = Droplist
				UIPadding.PaddingLeft = UDim.new(0, 4)
				UIPadding.PaddingTop = UDim.new(0, 3)


				UICorner_18.CornerRadius = UDim.new(0, 3)
				UICorner_18.Parent = DropHold

				keyboard_arrow_left.MouseButton1Click:Connect(function()
					if DropTog == false then
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 172)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 133)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 272} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					DropTog = not DropTog
				end)
				DropBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 172)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 133)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 272} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					DropTog = not DropTog
				end)

				for i,v in next, list do

					local DropBn = Instance.new("TextButton")
					local UICorner_17 = Instance.new("UICorner")
					local TextLabel = Instance.new("TextLabel")

					DropBn.Name = "DropBn"
					DropBn.Parent = Droplist
					DropBn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					DropBn.Size = UDim2.new(0, 310, 0, 17)
					DropBn.Font = Enum.Font.SourceSans
					DropBn.Text = ""
					DropBn.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropBn.TextSize = 14.000
					DropBn.AutoButtonColor = false

					UICorner_17.CornerRadius = UDim.new(0, 4)
					UICorner_17.Parent = DropBn

					TextLabel.Parent = DropBn
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0.0209790207, 0, 0, 0)
					TextLabel.Size = UDim2.new(0, 310, 0, 17)
					TextLabel.Font = Enum.Font.Gotham
					TextLabel.Text = v
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 12.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

					Droplist.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 5)
					
					DropBn.MouseEnter:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(85, 85, 127)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
					
					DropBn.MouseLeave:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					DropBn.MouseButton1Click:Connect(function()
						pcall(callback, v)
						DropText.Text = text .. ": ".. v
						DropTog = not DropTog
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
				end
				function dropfunc:Add(addtext)

					local DropBn = Instance.new("TextButton")
					local UICorner_17 = Instance.new("UICorner")
					local TextLabel = Instance.new("TextLabel")

					DropBn.Name = "DropBn"
					DropBn.Parent = Droplist
					DropBn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					DropBn.Size = UDim2.new(0, 310, 0, 17)
					DropBn.Font = Enum.Font.SourceSans
					DropBn.Text = ""
					DropBn.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropBn.TextSize = 14.000
					DropBn.AutoButtonColor = false

					UICorner_17.CornerRadius = UDim.new(0, 4)
					UICorner_17.Parent = DropBn

					TextLabel.Parent = DropBn
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0.0209790207, 0, 0, 0)
					TextLabel.Size = UDim2.new(0, 310, 0, 17)
					TextLabel.Font = Enum.Font.Gotham
					TextLabel.Text = addtext
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 12.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					
					DropBn.MouseEnter:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(85, 85, 127)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					DropBn.MouseLeave:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					Droplist.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 5)

					DropBn.MouseButton1Click:Connect(function()
						pcall(callback, addtext)
						DropText.Text = text .. ": ".. addtext
						DropTog = not DropTog
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
				end
				function dropfunc:Clear()
					DropText.Text = text
					TweenService:Create(
						Dropdown,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						DropHold,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						DropHold,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						keyboard_arrow_left,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					for i, v in next, Droplist:GetChildren() do
						if v.Name == "DropBn" then
							v:Destroy()
						end
					end
					if DropTog == true then
						DropText.Text = text
					end
				end
				return dropfunc
			end
			
			function LunaFunction:Slider(text,floor,min,max,de,callback)

				local sliderfunc = {}

				local SliderFrame = Instance.new("Frame")
				local Slider = Instance.new("TextButton")
				local ToggleUICorner = Instance.new("UICorner")
				local TextLabel = Instance.new("TextLabel")
				local ShowValueFrame = Instance.new("Frame")
				local CustomValue = Instance.new("TextBox")
				local ValueFrame = Instance.new("Frame")
				local ValueFrameUICorner = Instance.new("UICorner")
				local PartValue = Instance.new("Frame")
				local MainValue = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local ConneValue = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = ScrollingFrame_Pageframe
				SliderFrame.Active = true
				SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderFrame.BackgroundTransparency = 1.000
				SliderFrame.Size = UDim2.new(0, 318, 0, 40)

				Slider.Name = "Slider"
				Slider.Parent = SliderFrame
				Slider.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.Size = UDim2.new(0, 318, 0, 40)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 12.000

				ToggleUICorner.CornerRadius = UDim.new(0, 4)
				ToggleUICorner.Name = "ToggleUICorner"
				ToggleUICorner.Parent = Slider

				TextLabel.Parent = Slider
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0.01, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 100, 0, 20)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 12.000
				TextLabel.TextTransparency = 0
				TextLabel.Text = tostring(text)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				ShowValueFrame.Name = "ShowValueFrame"
				ShowValueFrame.Parent = Slider
				ShowValueFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ShowValueFrame.BackgroundTransparency = 1.000
				ShowValueFrame.Position = UDim2.new(0.85, 0, 0.5, 0)
				ShowValueFrame.Size = UDim2.new(0, 59, 0, 20)

				CustomValue.Name = "CustomValue"
				CustomValue.Parent = ShowValueFrame
				CustomValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CustomValue.BackgroundTransparency = 1.000
				CustomValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				CustomValue.ClipsDescendants = true
				CustomValue.Size = UDim2.new(0, 59, 0, 20)
				CustomValue.Font = Enum.Font.Gotham
				CustomValue.Text = ""
				CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				CustomValue.TextSize = 12.000
				CustomValue.TextTransparency = 1
				if floor == true then
					CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
				else
					CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
				end

				ValueFrame.Name = "ValueFrame"
				ValueFrame.Parent = Slider
				ValueFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				ValueFrame.BorderSizePixel = 0
				ValueFrame.Position = UDim2.new(0.4, 0, 0.15, 0)
				ValueFrame.Size = UDim2.new(0, 190, 0, 6)

				ValueFrameUICorner.CornerRadius = UDim.new(0, 4)
				ValueFrameUICorner.Name = "ValueFrameUICorner"
				ValueFrameUICorner.Parent = ValueFrame

				local ValueStroke = Instance.new("UIStroke")

				ValueStroke.Thickness = 1
				ValueStroke.Name = ""
				ValueStroke.Parent = ValueFrame
				ValueStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ValueStroke.LineJoinMode = Enum.LineJoinMode.Round
				ValueStroke.Color = Color3.fromRGB(50,50,50)
				ValueStroke.Transparency = 0

				PartValue.Name = "PartValue"
				PartValue.Parent = ValueFrame
				PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
				PartValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				PartValue.BackgroundTransparency = 1.000
				PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				PartValue.Size = UDim2.new(0, 190, 0, 6)

				MainValue.Name = "MainValue"
				MainValue.Parent = PartValue
				MainValue.BackgroundColor3 = Color3.fromRGB(85, 85, 127)
				MainValue.BorderSizePixel = 0
				MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 6)

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = MainValue

				ConneValue.Name = "ConneValue"
				ConneValue.Parent = PartValue
				ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
				ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.5,0, 0)
				ConneValue.Size = UDim2.new(0, 0, 0, 0)
				ConneValue.BorderSizePixel = 0

				UICorner_2.Parent = ConneValue

				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0.5,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							6
						)

					MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

					TweenService:Create(
						CustomValue,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					if floor == true then
						local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
						CustomValue.Text = tostring(value)
						pcall(callback, CustomValue.Text)
					else
						local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
						CustomValue.Text = tostring(value)
						pcall(callback, CustomValue.Text)
					end
				end
				
				local dragging = false
				ConneValue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				ConneValue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)
				SliderFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)
				SliderFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)


				ValueFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				ValueFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				CustomValue.FocusLost:Connect(function()
					if CustomValue.Text == "" then
						CustomValue.Text  = de
					end
					if  tonumber(CustomValue.Text) > max then
						CustomValue.Text  = max
					end
					MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 6), "Out", "Sine", 0.2, true)
					ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
					if floor == true then
						CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
					else
						CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
					end
					pcall(callback, CustomValue.Text)
				end)
				function sliderfunc:Update(value)
					MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 6), "Out", "Sine", 0.2, true)
					CustomValue.Text = value

					pcall(function()
						pcall(callback, CustomValue.Text)
					end)
				end
				return sliderfunc
			end
			
			function LunaFunction:Blank(count)
				if count == nil then
					count = 0.01
				end
				local BlankFrame = Instance.new("Frame")


				BlankFrame.Name = "Mainframenoti"
				BlankFrame.Parent = ScrollingFrame_Pageframe
				BlankFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				BlankFrame.BackgroundTransparency = 1
				BlankFrame.BorderSizePixel = 0
				BlankFrame.ClipsDescendants = false
				BlankFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				BlankFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
				BlankFrame.Size = UDim2.new(0, 238, 0, count)
			end
			
			function LunaFunction:Label(text)

				local Refresh = {}

				local LabelFrame = Instance.new("Frame")
				local Label = Instance.new("TextButton")

				LabelFrame.Name = "LabelFrame"
				LabelFrame.Parent = ScrollingFrame_Pageframe
				LabelFrame.Active = true
				LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelFrame.BackgroundTransparency = 1.000
				LabelFrame.Size = UDim2.new(0, 318, 0, 20)

				Label.Name = "Label"
				Label.Parent = LabelFrame
				Label.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0, 318, 0, 20)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.Gotham
				Label.Text = tostring(text)
				Label.ClipsDescendants = true
				Label.TextXAlignment = Enum.TextXAlignment.Center
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextSize = 12.000

				function Refresh:Change(textchange)
					Label.Text = tostring(textchange)
				end
				return Refresh
			end
			
			function LunaFunction:Line()
				local LineFrame = Instance.new("Frame")
				local Line = Instance.new("TextButton")

				LineFrame.Name = "LineFrame"
				LineFrame.Parent = ScrollingFrame_Pageframe
				LineFrame.Active = true
				LineFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LineFrame.BackgroundTransparency = 1.000
				LineFrame.Size = UDim2.new(0, 318, 0, 5)

				Line.Name = "Line"
				Line.Parent = LineFrame
				Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Line.BackgroundTransparency = 0.850
				Line.Size = UDim2.new(0, 318, 0, 1)
				Line.AutoButtonColor = false
				Line.Font = Enum.Font.Gotham
				Line.Text = ""
				Line.TextColor3 = Color3.fromRGB(255, 255, 255)
				Line.TextSize = 12.000
			end
			
			function LunaFunction:ColorPicker(text,preset,callback)
				local Pixker = Instance.new("Frame")

				Pixker.Name = "Pixker"
				Pixker.Parent = ScrollingFrame_Pageframe
				Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
				Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
				Pixker.Size = UDim2.new(0, 318, 0, 33)
				Pixker.BackgroundTransparency = 1
				Pixker.BorderSizePixel = 0 
				Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
				Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
				Pixker.ClipsDescendants = true

				local TextFrameColor = Instance.new("TextLabel")

				TextFrameColor.Parent = Pixker
				TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrameColor.BorderSizePixel = 0
				TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
				TextFrameColor.Font = Enum.Font.SourceSans
				TextFrameColor.Text = "  "
				TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextFrameColor.TextSize = 14.000
				TextFrameColor.BackgroundTransparency = 1
				TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

				local TextReal = Instance.new("TextLabel")

				TextReal.Parent = TextFrameColor
				TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextReal.BorderSizePixel = 0
				TextReal.Size = UDim2.new(0, 140, 0, 34)
				TextReal.Font = Enum.Font.Gotham
				TextReal.Text = text
				TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
				TextReal.TextSize = 12.000
				TextReal.BackgroundTransparency = 1
				TextReal.Position = UDim2.new(0.05, 0, 0., 0)
				TextReal.TextXAlignment = Enum.TextXAlignment.Left

				local BoxColor = Instance.new("Frame")

				BoxColor.Name = "BoxColor"
				BoxColor.Parent = TextFrameColor
				BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BoxColor.Position = UDim2.new(1.4, 0, 0.5, 0)
				BoxColor.Size = UDim2.new(0, 50, 0, 15)
				BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

				local BoxColorCorner = Instance.new("UICorner")

				BoxColorCorner.CornerRadius = UDim.new(0, 8)
				BoxColorCorner.Name = "BoxColorCorner"
				BoxColorCorner.Parent = BoxColor

				local TextButton_Dropdown = Instance.new("TextButton")


				TextButton_Dropdown.Parent = TextFrameColor
				TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				TextButton_Dropdown.BorderSizePixel = 0
				TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
				TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
				TextButton_Dropdown.Font = Enum.Font.SourceSans
				TextButton_Dropdown.Text = "  "
				TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_Dropdown.TextSize = 14.000
				TextButton_Dropdown.AutoButtonColor = false 
				--TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
				TextButton_Dropdown.BackgroundTransparency = 1

				-- Rainbow Toggle 

				
				local Toggle1 = Instance.new("TextButton")
				local Toggle1Corner = Instance.new("UICorner")
				local Toggle2 = Instance.new("TextButton")
				local Toggle2Corner = Instance.new("UICorner")
				local Check = Instance.new("ImageLabel")
				
				Toggle1.Name = "Toggle1"
				Toggle1.Parent = TextFrameColor
				Toggle1.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle1.BackgroundTransparency = 1.000
				Toggle1.BorderSizePixel = 0
				Toggle1.Position = UDim2.new(0.2, 0, 1.87, 0)
				Toggle1.Size = UDim2.new(0, 23, 0, 23)
				Toggle1.AutoButtonColor = false
				Toggle1.Font = Enum.Font.SourceSans
				Toggle1.Text = ""
				Toggle1.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle1.TextSize = 1.000

				Toggle1Corner.CornerRadius = UDim.new(0, 7)
				Toggle1Corner.Name = "Toggle1Corner"
				Toggle1Corner.Parent = Toggle1

				local Toggle1Stroke = Instance.new("UIStroke")

				Toggle1Stroke.Parent = Toggle1
				Toggle1Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Toggle1Stroke.Color = Color3.fromRGB(85, 85, 127)
				Toggle1Stroke.Thickness = 1.4
				Toggle1Stroke.Transparency = 0

				Toggle2.Name = "Toggle2"
				Toggle2.Parent = Toggle1
				Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle2.BackgroundColor3 = Color3.fromRGB(85, 85, 127)
				Toggle2.BorderSizePixel = 0
				Toggle2.ClipsDescendants = true
				Toggle2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Toggle2.Size = UDim2.new(0, 0, 0, 0)
				Toggle2.AutoButtonColor = false
				Toggle2.Font = Enum.Font.SourceSans
				Toggle2.Text = ""
				Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle2.TextSize = 1.000

				Toggle2Corner.CornerRadius = UDim.new(0, 7)
				Toggle2Corner.Name = "Toggle2Corner"
				Toggle2Corner.Parent = Toggle2

				Check.Name = "Check"
				Check.Parent = Toggle2
				Check.AnchorPoint = Vector2.new(0.5, 0.5)
				Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Check.BackgroundTransparency = 1.000
				Check.Position = UDim2.new(0.5, 0, 0.5, 0)
				Check.Size = UDim2.new(0, 0, 0, 0)
				Check.Image = "rbxassetid://7072706620"

				local TextButton_3_Toggle2 = Instance.new("TextLabel")

				TextButton_3_Toggle2.Parent = Toggle1
				TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
				TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(249, 53, 139)
				TextButton_3_Toggle2.BorderSizePixel = 0
				TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_3_Toggle2.Position = UDim2.new(2.4, 0, 0.5, 0)
				TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
				TextButton_3_Toggle2.Font = Enum.Font.Gotham
				TextButton_3_Toggle2.Text = "Rainbow"
				TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_3_Toggle2.TextSize = 12.000
				TextButton_3_Toggle2.BackgroundTransparency = 1 

				local OMF = Instance.new("TextButton")

				OMF.Parent = Toggle1
				OMF.BackgroundTransparency =1
				OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OMF.BorderSizePixel = 0
				OMF.Size = UDim2.new(0, 300, 0, 20)
				OMF.AutoButtonColor = false
				OMF.Font = Enum.Font.SourceSans
				OMF.Text = " "
				OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
				OMF.TextSize = 12.000
				OMF.AnchorPoint = Vector2.new(0.5, 0.5)
				OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

				local Color =  Instance.new("ImageLabel")

				Color.Name = "Color"
				Color.Parent = TextFrameColor
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0.05,0,4,0)
				Color.Size = UDim2.new(0, 300, 0, 40)
				Color.ZIndex = 0
				Color.BorderSizePixel = 0
				Color.Image = "rbxassetid://4155801252"

				local ColorFucj = Instance.new("UICorner")

				ColorFucj.CornerRadius = UDim.new(0, 4)
				ColorFucj.Name = ""
				ColorFucj.Parent = Color

				local ColorSelection =  Instance.new("ImageLabel")

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit
				ColorSelection.Visible = true

				local Hue =  Instance.new("ImageLabel")

				Hue.Name = "Hue2"
				Hue.Parent = TextFrameColor
				Hue.Position = UDim2.new(0.05,0,3,0)
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Size = UDim2.new(0, 300, 0, 25)
				Hue.ZIndex = 0
				Hue.BorderSizePixel = 0

				local ColorFucj2 = Instance.new("UICorner")

				ColorFucj2.CornerRadius = UDim.new(0, 4)
				ColorFucj2.Name = ""
				ColorFucj2.Parent = Hue

				local HueGradient = Instance.new("UIGradient")

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}			
				HueGradient.Rotation = 0
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				local HueSelection =  Instance.new("ImageLabel")

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				HueSelection.ScaleType = Enum.ScaleType.Fit
				HueSelection.Visible = true

				local UwU = false 


				OMF.MouseButton1Click:Connect(function()
					if  UwU == false  then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					UwU = not UwU
				end
				)

				OMF.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then


							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0,  LunaColor.HueSelectionPosition, 0.5,0)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)
				Toggle2.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then


							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0,  LunaColor.HueSelectionPosition, 0.5,0)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)


				local function UpdateColorPicker(nope)
					BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, BoxColor.BackgroundColor3)
				end
				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				BoxColor.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, BoxColor.BackgroundColor3)

				local RainbowColorPicker = false 

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(function()
										local ColorX =(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /Color.AbsoluteSize.X)
										local ColorY =(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /Color.AbsoluteSize.Y)

										ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
										ColorS = ColorX
										ColorV = 1 - ColorY

										UpdateColorPicker(true)
									end
								)
						end
					end
				)


				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
										local HueY =(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)
										local HueX =(math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
											Hue.AbsoluteSize.X)

										HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
										ColorH = 1 - HueY

										UpdateColorPicker(true)
									end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)
				local sk = false 
				TextButton_Dropdown.MouseButton1Click:Connect(function()
					if sk == false then 
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 180)}
						):Play()
					else
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 33)}
						):Play()
					end
					sk = not sk 
				end
				)
			end
			
			return LunaFunction
		end
		return LunaPage
	end
	return LunaTab
end
---------------------------------------------------------UI--------------------------------
local Main = LunaUI.create()
 
 LunaUI:Notification("Takab Pro Max","Takab Hub is Loading...",5)

LunaUI:Notification("DISCORD TAKAB HUB","https://discord.gg/464zmHcH99",5)
wait(3)
 
 local Tab1 = Main.createtab("Main")

local Page = Tab1.page()


 local vu = game:GetService("VirtualUser")
 game:GetService("Players").LocalPlayer.Idled:connect(function()
 vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
 wait()
 vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
 end)
 
Page:Label("WalkSpeed")
_G.GravityPoint = 196.5
_G.WalkSpeedPoint = 16
_G.JumpPowerPoint = 50
Page:Toggle("WalkSpeed", false, function(A)
    if A then
        _G.WalkSpeed = A
    else
        _G.WalkSpeed = A
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

Page:Slider("WalkSpeed",false,0,1000,16,function(P)
	_G.WalkSpeedPoint = P
end)   

Page:Label("JumpPower")

Page:Toggle("JumpPower", false, function(A1)
    if A1 then
        _G.JumpPower = A1
    else
        _G.JumpPower = A1
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

Page:Slider("JumpPower",false,0,1000,50,function(P1)
	_G.JumpPowerPoint = P1
end)   

Page:Label("Gravity")

Page:Toggle("Gravity", false, function(A11)
    if A11 then
        _G.Gravity = A11
    else
        _G.Gravity = A11
        game.Workspace.Gravity = 50
    end
end)

Page:Slider("Gravity",false,0,500,196.5,function(P11)
	_G.GravityPoint = P11
end)  

Page:Label("Misc")

Page:Button("Inf Jump", function()
    LunaUI:Notification("Done!",5)
    local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 75;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)


Page:Button("Fly", function()
    
LunaUI:Notification("Press E to toggle",5)

local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local UpperTorso = plr.Character.UpperTorso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 500
local speed = 0

function Fly()
local bg = Instance.new("BodyGyro", UpperTorso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = UpperTorso.CFrame
local bv = Instance.new("BodyVelocity", UpperTorso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+10.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "e" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
end)

Page:Label("Players")
PlayerName = {}
	for i,v in pairs(game.Players:GetChildren()) do  
		table.insert(PlayerName ,v.Name)
	end


local PlayerDropdown = Page:Dropdown("Select Weapon",PlayerName,function(Value)
    _G.SelectPlayer = Value
end)

Page:Button("Refresh Player",function()
	    pcall(function()
		PlayerName = {}
		PlayerDropdown:Clear()
		for i,v in pairs(game.Players:GetChildren()) do  
			PlayerDropdown:Add(v.Name)
		end
		end)
end)

Page:Button("Teleport to Player",function()
pcall(function()
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.SelectPlayer].Character.HumanoidRootPart.CFrame
	   end)
	end)

spawn(function()
    pcall(function()
     while task.wait() do
         if _G.WalkSpeed then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeedPoint
            end
         end
    end)    
end)

spawn(function()
    pcall(function()
     while task.wait() do
         if _G.JumpPower then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpPowerPoint
            end
         end
    end)    
end)

spawn(function()
    pcall(function()
     while task.wait() do
         if _G.Gravity then
            game.Workspace.Gravity = _G.GravityPoint
            end
         end
    end)    
end)

