print("HI")

repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer

local library = {}
local TweenService = game:GetService('TweenService')
function library.CreateMain(Main_Name)
    --Drag function, by Ririchi / Inori
    local UIS = game:GetService("UserInputService");
	local Heartbeat = game:GetService("RunService").Heartbeat;

	local dragger = {};

	do
		local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
		local inputService = game:GetService('UserInputService');
		local heartbeat    = game:GetService("RunService").Heartbeat;

		function dragger.new(frame, secondlol)
			frame.Active = true;
			secondlol.Active = true;

			secondlol.MouseLeave:connect(function()
				IsInFrame = false;
			end)

			secondlol.MouseEnter:connect(function()
				IsInFrame = true;
			end)

			local input = secondlol.InputBegan:connect(function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 and IsInFrame then
					local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
					while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						pcall(function()
							frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Linear', 0.01, true);
						end)
					end
				end
			end)
		end
    end
    
    --Create ScreenUI
    library.gui = Instance.new("ScreenGui")
	library.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	library.gui.Name = game:GetService("HttpService"):GenerateGUID(false):lower():sub(1, 10);
    library.toggled = true
    library.gui.Parent = game:WaitForChild('CoreGui')
    --Button Effect
    function library.buttoneffect(bucac0em)
		spawn(function()
			local mouse = game:GetService("Players").LocalPlayer:GetMouse();
			local buttonbucackoem = Instance.new("ImageLabel", bucac0em);
			local buttonbucackoemInner = Instance.new("ImageLabel", buttonbucackoem);
			buttonbucackoem.Name = "buttonbucackoem";
			buttonbucackoem.BackgroundTransparency = 1;
			buttonbucackoem.BorderSizePixel = 0;
			buttonbucackoem.Image = "rbxassetid://2708891598"
			buttonbucackoem.ImageColor3 = Color3.fromRGB(244, 244, 244);
			buttonbucackoem.ImageTransparency = 0.7;
			buttonbucackoem.ScaleType = Enum.ScaleType.Fit;
			buttonbucackoemInner.Name = "buttonbucackoem";
			buttonbucackoemInner.AnchorPoint = Vector2.new(0.5, 0.5);
			buttonbucackoemInner.BackgroundTransparency = 1;
			buttonbucackoemInner.BorderSizePixel = 0;
			buttonbucackoemInner.Position = UDim2.new(0.5, 0, 0.5, 0);
			buttonbucackoemInner.Size = UDim2.new(1, 0, 1, 0);
			buttonbucackoemInner.Image = "rbxassetid://2708891598"
			buttonbucackoemInner.ImageColor3 = Color3.fromRGB(255,255,255);
			buttonbucackoemInner.ImageTransparency = 0.7;
			buttonbucackoemInner.ScaleType = Enum.ScaleType.Fit;
			buttonbucackoem.Position = UDim2.new((mouse.X - buttonbucackoem.AbsolutePosition.X) / bucac0em.AbsoluteSize.X, 0, (mouse.Y - buttonbucackoem.AbsolutePosition.Y) / bucac0em.AbsoluteSize.Y, 0);
			local Animation = TweenService:Create(buttonbucackoem, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.new(-4.77, 0, -8, 0);
				Size = UDim2.new(10, 200, 10, 200);
				ImageTransparency = 1;
			})
			Animation:Play();

			Animation.Completed:Connect(function()
				buttonbucackoem:Destroy();
			end);
		end)
    end

    library.mini = false

    --Toggle UI Function
    function  library:ToggledUI()
		library.toggled = not library.toggled
        library.gui.Enabled = library.toggled
	end

    

    local Top = Instance.new("ImageLabel")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopFrame = Instance.new("ImageLabel")
    local MainName = Instance.new("TextLabel")
    local Set = Instance.new("Frame")
    local Mini = Instance.new("Frame")
    local Mini_Corner = Instance.new("UICorner")
    local Mini_Button = Instance.new("TextButton")
    local TopList = Instance.new("UIListLayout")
    local Destroy = Instance.new("Frame")
    local Destroy_Corner = Instance.new("UICorner")
    local Destroy_Button = Instance.new("TextButton")
    local MainTab = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TabFrame = Instance.new("ScrollingFrame")
    local TabContainer = Instance.new("Frame")
    local TabList = Instance.new("UIListLayout")
    local UIPageLayout = Instance.new("UIPageLayout")


    Top.Name = "Top"
    Top.Parent = library.gui
    Top.AnchorPoint = Vector2.new(0.5, 0.5)
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.BackgroundTransparency = 1.000
    Top.Position = UDim2.new(0.5, 0, 0.3000000, 0)
    Top.Size = UDim2.new(0, 500, 0, 25)
    Top.Image = "rbxassetid://4550094255"
    Top.ScaleType = Enum.ScaleType.Slice
    Top.SliceCenter = Rect.new(4, 4, 296, 296)

    dragger.new(Top,Top)

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Top
    MainFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
    MainFrame.BorderSizePixel = 0
    MainFrame.Size = UDim2.new(1, 0, 0, 300)
    MainFrame.ClipsDescendants = true

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = MainFrame

    TopFrame.Name = "TopFrame"
    TopFrame.Parent = MainFrame
    TopFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopFrame.BackgroundTransparency = 1.000
    TopFrame.Size = UDim2.new(1, 0, 0, 25)
    TopFrame.Image = "rbxassetid://4550094255"
    TopFrame.ImageColor3 = Color3.fromRGB(34, 34, 34)
    TopFrame.ScaleType = Enum.ScaleType.Slice
    TopFrame.SliceCenter = Rect.new(4, 4, 296, 296)

    MainName.Parent = TopFrame
    MainName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainName.BackgroundTransparency = 1.000
    MainName.Position = UDim2.new(0, 5, 0, 0)
    MainName.Size = UDim2.new(1, -5, 1, 0)
    MainName.Font = Enum.Font.GothamBold
    MainName.Text = Main_Name
    MainName.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainName.TextSize = 14.000
    MainName.TextXAlignment = Enum.TextXAlignment.Left

    Set.Name = "Set"
    Set.Parent = TopFrame
    Set.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Set.BackgroundTransparency = 1.000
    Set.Position = UDim2.new(0, 450, 0, 0)
    Set.Size = UDim2.new(0, 45, 0, 25)

    Mini.Name = "Mini"
    Mini.Parent = Set
    Mini.AnchorPoint = Vector2.new(1, 0.5)
    Mini.BackgroundColor3 = Color3.fromRGB(170, 255, 139)
    Mini.BorderSizePixel = 0
    Mini.Position = UDim2.new(1, 0, 0.5, 0)
    Mini.Size = UDim2.new(0, 19, 0, 19)

    Mini_Corner.CornerRadius = UDim.new(0, 4)
    Mini_Corner.Name = "Mini_Corner"
    Mini_Corner.Parent = Mini

    Mini_Button.Name = "Mini_Button"
    Mini_Button.Parent = Mini
    Mini_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Mini_Button.BackgroundTransparency = 1.000
    Mini_Button.Size = UDim2.new(1, 0, 1, 0)
    Mini_Button.Font = Enum.Font.SourceSans
    Mini_Button.Text = ""
    Mini_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Mini_Button.TextSize = 14.000

    TopList.Name = "TopList"
    TopList.Parent = Set
    TopList.FillDirection = Enum.FillDirection.Horizontal
    TopList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    TopList.SortOrder = Enum.SortOrder.LayoutOrder
    TopList.VerticalAlignment = Enum.VerticalAlignment.Center
    TopList.Padding = UDim.new(0, 5)

    Destroy.Name = "Destroy"
    Destroy.Parent = Set
    Destroy.AnchorPoint = Vector2.new(1, 0.5)
    Destroy.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
    Destroy.BorderSizePixel = 0
    Destroy.Position = UDim2.new(1, 0, 0.5, 0)
    Destroy.Size = UDim2.new(0, 19, 0, 19)

    Destroy_Corner.CornerRadius = UDim.new(0, 4)
    Destroy_Corner.Name = "Destroy_Corner"
    Destroy_Corner.Parent = Destroy

    Destroy_Button.Name = "Destroy_Button"
    Destroy_Button.Parent = Destroy
    Destroy_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Destroy_Button.BackgroundTransparency = 1.000
    Destroy_Button.Size = UDim2.new(1, 0, 1, 0)
    Destroy_Button.Font = Enum.Font.SourceSans
    Destroy_Button.Text = ""
    Destroy_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Destroy_Button.TextSize = 14.000

    MainTab.Name = "MainTab"
    MainTab.Parent = MainFrame
    MainTab.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
    MainTab.Position = UDim2.new(0, 5, 0, 30)
    MainTab.Size = UDim2.new(0, 120, 1, -30)

    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = MainTab

    TabFrame.Name = "TabFrame"
    TabFrame.Parent = MainTab
    TabFrame.Active = true
    TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabFrame.BackgroundTransparency = 1.000
    TabFrame.BorderSizePixel = 0
    TabFrame.Size = UDim2.new(1, 0, 1, 0)
    TabFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    TabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabFrame.ScrollBarThickness = 5
    TabFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = TabFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.Position = UDim2.new(0, 8, 0, 5)
    TabContainer.Size = UDim2.new(0, 100, 1, -2)

    TabList.Name = "TabList"
    TabList.Parent = TabContainer
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)

    TabList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabFrame.CanvasSize = UDim2.new(0,0,0,(10 + TabList.AbsoluteContentSize.Y))
    end)

    local Container = Instance.new("Frame")
    local Container_Corner = Instance.new("UICorner")


    Container.Name = "Container"
    Container.Parent = MainFrame
    Container.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
    Container.BackgroundTransparency = 1.000
    Container.Position = UDim2.new(0, 130, 0, 30)
    Container.Size = UDim2.new(0, 370, 0, 270)
    Container.ClipsDescendants = true

    Container_Corner.CornerRadius = UDim.new(0, 4)
    Container_Corner.Parent = Container

    UIPageLayout.Parent = Container
    UIPageLayout.FillDirection = Enum.FillDirection.Vertical
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quart
    UIPageLayout.Padding = UDim.new(0, 10)

    Destroy_Button.MouseButton1Click:Connect(function()
        library.gui:Destroy()
    end)

    Mini_Button.MouseButton1Click:Connect(function()
        library.mini = not library.mini
        local FSize = library.mini and UDim2.new(1, 0, 0, 25) or UDim2.new(1, 0, 0, 300) 
        local MColor = library.mini and Color3.fromRGB(255, 244, 147) or Color3.fromRGB(170, 255, 139) 
        TweenService:Create(MainFrame,TweenInfo.new(.5),{Size = FSize}):Play()
        TweenService:Create(Mini,TweenInfo.new(.5),{BackgroundColor3 = MColor}):Play()
        if library.mini == true then wait(.5)
            MainFrame.ClipsDescendants = library.mini end
    end)

    local Notii = Instance.new("Frame")
    local Mainnoti = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Label = Instance.new("TextLabel")
    local BottomNoti = Instance.new("Frame")
    local ButtonFrame = Instance.new("Frame")

    Notii.Name = "Notii"
    Notii.Parent = MainFrame
    Notii.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Notii.BackgroundTransparency = 1.000
    Notii.Size = UDim2.new(1, 0, 1, 0)

    Mainnoti.Name = "Mainnoti"
    Mainnoti.Parent = Notii
    Mainnoti.AnchorPoint = Vector2.new(0.5, 0.5)
    Mainnoti.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
    Mainnoti.BackgroundTransparency = 0
    Mainnoti.Position = UDim2.new(0.5, 0, 0.5, 0)
    Mainnoti.Size = UDim2.new(0, 0, 0, 0) --370 200
    Mainnoti.BorderSizePixel = 0

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Mainnoti

    Title.Name = "Title"
    Title.Parent = Mainnoti
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 5, 0, 0)
    Title.Size = UDim2.new(1, -5, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = ""
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 17.000
    Title.TextTransparency = 1.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Label.Name = "Text"
    Label.Parent = Mainnoti
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.Position = UDim2.new(0, 5, 0, 30)
    Label.Size = UDim2.new(1, -10, 1, -80)
    Label.Font = Enum.Font.GothamBold
    Label.Text = ""
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 14.000
    Label.TextTransparency = 1.000
    Label.TextWrapped = true

    BottomNoti.Name = "BottomNoti"
    BottomNoti.Parent = Mainnoti
    BottomNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BottomNoti.BackgroundTransparency = 1.000
    BottomNoti.Position = UDim2.new(0, 0, 0, 155)
    BottomNoti.Size = UDim2.new(0, 370, 0, 35)

    ButtonFrame.Name = "ButtonFrame"
    ButtonFrame.Parent = BottomNoti
    ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ButtonFrame.BackgroundTransparency = 1.000
    ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    ButtonFrame.Size = UDim2.new(1, 0, 1, -10)
    

    function library.AddNoti(Setting,Callback)
        local Setting_Title = Setting.Title
        local Setting_Text = Setting.Text
        local Setting_Button = Setting.Button_Text or 'Click'
        local Setting_Question = Setting.Question or false

        Title.Text = Setting_Title
        Label.Text = Setting_Text

        if not Setting_Question then

            local MainButton = Instance.new("Frame")
            local ButtonMain = Instance.new("Frame")
            local ButtonMainCorner = Instance.new("UICorner")
            local Button = Instance.new("TextButton")
            
            MainButton.Name = "MainButton"
            MainButton.Parent = ButtonFrame
            MainButton.AnchorPoint = Vector2.new(0.5, 0)
            MainButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MainButton.BackgroundTransparency = 1.000
            MainButton.Position = UDim2.new(0.5, 0, 0, 0)
            MainButton.Size = UDim2.new(0, 150, 1, 0)

            ButtonMain.Name = "ButtonMain"
            ButtonMain.Parent = MainButton
            ButtonMain.AnchorPoint = Vector2.new(0.5, 0)
            ButtonMain.BackgroundColor3 = Color3.fromRGB(79, 141, 255)
            ButtonMain.BackgroundTransparency = 1.000
            ButtonMain.Position = UDim2.new(0.5, 0, 0, 0)
            ButtonMain.Size = UDim2.new(1, 0, 1, 0)

            ButtonMainCorner.CornerRadius = UDim.new(0, 4)
            ButtonMainCorner.Name = "ButtonMainCorner"
            ButtonMainCorner.Parent = ButtonMain

            Button.Name = "Button"
            Button.Parent = MainButton
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 1.000
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.Font = Enum.Font.GothamBold
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14.000
            Button.TextTransparency = 1.000

            Button.Text = Setting_Button
            TweenService:Create(Notii,TweenInfo.new(.25),{BackgroundTransparency = .5}):Play()
            TweenService:Create(Mainnoti,TweenInfo.new(.25),{Size = UDim2.new(0, 370, 0, 200)}):Play()
            wait(0.125)
            TweenService:Create(Title,TweenInfo.new(.25),{TextTransparency = 0}):Play()
            TweenService:Create(Label,TweenInfo.new(.25),{TextTransparency = 0}):Play()
            wait(.125)
            TweenService:Create(ButtonMain,TweenInfo.new(.25),{BackgroundTransparency = 0}):Play()
            TweenService:Create(Button,TweenInfo.new(.25),{TextTransparency = 0}):Play()

            Button.MouseButton1Click:Connect(function()
            TweenService:Create(ButtonMain,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
            TweenService:Create(Button,TweenInfo.new(.25),{TextTransparency = 1}):Play()
            wait(.25)
            TweenService:Create(Title,TweenInfo.new(.125),{TextTransparency = 1}):Play()
            TweenService:Create(Label,TweenInfo.new(.125),{TextTransparency = 1}):Play()
            wait(.125)
            TweenService:Create(Mainnoti,TweenInfo.new(.25),{Size = UDim2.new(0, 0, 0, 0)}):Play()
            TweenService:Create(Notii,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
            wait(.25)
            MainButton:Destroy()
            Callback()
            end)

        else
            
            local Question_Yes = Instance.new("Frame")
            local Question_YesMain = Instance.new("Frame")
            local Question_YesMainCorner = Instance.new("UICorner")
            local Question_YesButton = Instance.new("TextButton")
            local Question_No = Instance.new("Frame")
            local Question_NoMain = Instance.new("Frame")
            local Question_YesMainCorner_2 = Instance.new("UICorner")
            local Question_NoButton = Instance.new("TextButton")

            Question_Yes.Name = "Question_Yes"
            Question_Yes.Parent = ButtonFrame
            Question_Yes.AnchorPoint = Vector2.new(0.25, 0)
            Question_Yes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Question_Yes.BackgroundTransparency = 1.000
            Question_Yes.Position = UDim2.new(0.25, 0, 0, 0)
            Question_Yes.Size = UDim2.new(0, 100, 1, 0)

            Question_YesMain.Name = "Question_YesMain"
            Question_YesMain.Parent = Question_Yes
            Question_YesMain.AnchorPoint = Vector2.new(0.5, 0)
            Question_YesMain.BackgroundColor3 = Color3.fromRGB(0, 229, 77)
            Question_YesMain.BackgroundTransparency = 1.000
            Question_YesMain.Position = UDim2.new(0.5, 0, 0, 0)
            Question_YesMain.Size = UDim2.new(1, 0, 1, 0)

            Question_YesMainCorner.CornerRadius = UDim.new(0, 4)
            Question_YesMainCorner.Name = "Question_YesMainCorner"
            Question_YesMainCorner.Parent = Question_YesMain

            Question_YesButton.Name = "Question_YesButton"
            Question_YesButton.Parent = Question_Yes
            Question_YesButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Question_YesButton.BackgroundTransparency = 1.000
            Question_YesButton.Size = UDim2.new(1, 0, 1, 0)
            Question_YesButton.Font = Enum.Font.GothamBold
            Question_YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            Question_YesButton.TextSize = 14.000
            Question_YesButton.TextTransparency = 1.000

            Question_No.Name = "Question_No"
            Question_No.Parent = ButtonFrame
            Question_No.AnchorPoint = Vector2.new(0.75, 0)
            Question_No.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Question_No.BackgroundTransparency = 1.000
            Question_No.Position = UDim2.new(0.75, 0, 0, 0)
            Question_No.Size = UDim2.new(0, 100, 1, 0)

            Question_NoMain.Name = "Question_NoMain"
            Question_NoMain.Parent = Question_No
            Question_NoMain.AnchorPoint = Vector2.new(0.5, 0)
            Question_NoMain.BackgroundColor3 = Color3.fromRGB(255, 78, 78)
            Question_NoMain.BackgroundTransparency = 1.000
            Question_NoMain.Position = UDim2.new(0.5, 0, 0, 0)
            Question_NoMain.Size = UDim2.new(1, 0, 1, 0)

            Question_YesMainCorner_2.CornerRadius = UDim.new(0, 4)
            Question_YesMainCorner_2.Name = "Question_YesMainCorner"
            Question_YesMainCorner_2.Parent = Question_NoMain

            Question_NoButton.Name = "Question_NoButton"
            Question_NoButton.Parent = Question_No
            Question_NoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Question_NoButton.BackgroundTransparency = 1.000
            Question_NoButton.Size = UDim2.new(1, 0, 1, 0)
            Question_NoButton.Font = Enum.Font.GothamBold
            Question_NoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            Question_NoButton.TextSize = 14.000
            Question_NoButton.TextTransparency = 1.000

            local Setting_Question_Yes = Setting.Button_Question_Yes or 'Yes'
            local Setting_Question_No = Setting.Button_Question_No or 'No'
            local Callback = Callback or function() end

            Question_YesButton.Text = Setting_Question_Yes
            Question_NoButton.Text = Setting_Question_No


            TweenService:Create(Notii,TweenInfo.new(.25),{BackgroundTransparency = .5}):Play()
            TweenService:Create(Mainnoti,TweenInfo.new(.25),{Size = UDim2.new(0, 370, 0, 200)}):Play()
            wait(0.125)
            TweenService:Create(Title,TweenInfo.new(.25),{TextTransparency = 0}):Play()
            TweenService:Create(Label,TweenInfo.new(.25),{TextTransparency = 0}):Play()
            wait(.125)
            TweenService:Create(Question_YesMain,TweenInfo.new(.25),{BackgroundTransparency = 0}):Play()
            TweenService:Create(Question_YesButton,TweenInfo.new(.25),{TextTransparency = 0}):Play()

            TweenService:Create(Question_NoMain,TweenInfo.new(.25),{BackgroundTransparency = 0}):Play()
            TweenService:Create(Question_NoButton,TweenInfo.new(.25),{TextTransparency = 0}):Play()

            Question_YesButton.MouseButton1Click:Connect(function()
                TweenService:Create(Question_NoMain,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                TweenService:Create(Question_NoButton,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                TweenService:Create(Question_YesMain,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                TweenService:Create(Question_YesButton,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                wait(.125)
                TweenService:Create(Title,TweenInfo.new(.125),{TextTransparency = 1}):Play()
                TweenService:Create(Label,TweenInfo.new(.125),{TextTransparency = 1}):Play()
                wait(.125)
                TweenService:Create(Mainnoti,TweenInfo.new(.25),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                TweenService:Create(Notii,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                wait(.25)
                Question_Yes:Destroy()
                Question_No:Destroy()
                Callback()
            end)

            Question_NoButton.MouseButton1Click:Connect(function()
                TweenService:Create(Question_NoMain,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                TweenService:Create(Question_NoButton,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                TweenService:Create(Question_YesMain,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                TweenService:Create(Question_YesButton,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                wait(.125)
                TweenService:Create(Title,TweenInfo.new(.125),{TextTransparency = 1}):Play()
                TweenService:Create(Label,TweenInfo.new(.125),{TextTransparency = 1}):Play()
                wait(.125)
                TweenService:Create(Mainnoti,TweenInfo.new(.25),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                TweenService:Create(Notii,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                Question_Yes:Destroy()
                Question_No:Destroy()
            end)

        end

    end

    local page = {}

    local LayoutOrder = -1

    function page.AddPage(PageName)
        LayoutOrder = LayoutOrder + 1

        local Frame = Instance.new("Frame")
        local PageCorner = Instance.new("UICorner")
        local PageButton = Instance.new("TextButton")

        Frame.Parent = TabContainer
        Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Frame.BackgroundTransparency = 0.300
        Frame.Size = UDim2.new(0, 100, 0, 20)
        Frame.Name = PageName..'PageFrame'

        PageCorner.CornerRadius = UDim.new(0, 4)
        PageCorner.Parent = Frame

        PageButton.Name = PageName..'PageButton'
        PageButton.Parent = Frame
        PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageButton.BackgroundTransparency = 1.000
        PageButton.Size = UDim2.new(1, 0, 1, 0)
        PageButton.Font = Enum.Font.GothamBold
        PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        PageButton.TextSize = 14.000
        PageButton.Text = PageName

        local ContainerFrame = Instance.new("ScrollingFrame")
        local ContainerList = Instance.new("UIListLayout")

        ContainerFrame.Name = PageName.."Container"
        ContainerFrame.Parent = Container
        ContainerFrame.Active = true
        ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ContainerFrame.BackgroundTransparency = 1.000
        ContainerFrame.BorderSizePixel = 0
        ContainerFrame.Size = UDim2.new(1, 0, 1, 0)
        ContainerFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        ContainerFrame.ScrollBarThickness = 5
        ContainerFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        ContainerFrame.LayoutOrder = LayoutOrder

        ContainerList.Name = "ContainerList"
        ContainerList.Parent = ContainerFrame
        ContainerList.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerList.Padding = UDim.new(0, 5)

        ContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ContainerFrame.CanvasSize = UDim2.new(0,0,0,(10 + ContainerList.AbsoluteContentSize.Y))
        end)

        for i,v in pairs(TabContainer:GetChildren()) do
			if not (v:IsA('UIListLayout')) then
				if i == 2 then 
					v.BackgroundTransparency = 0
				end
			end
		end

        PageButton.MouseButton1Click:Connect(function()
            if PageButton.Name == PageName..'PageButton' then
                for i,v in pairs(TabContainer:GetChildren()) do
                    if not (v:IsA('UIListLayout')) then
                        if v.Name == PageName..'PageFrame' then 
                            TweenService:Create(Frame,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
                        else 
                            TweenService:Create(v,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{BackgroundTransparency = .5}):Play()
                        end
                    end 
                end


                for i,v in pairs(Container:GetChildren()) do
                    if not (v:IsA('UIListLayout')) then
                        if v.Name == PageName..'Container' then
                            UIPageLayout:JumpToIndex(ContainerFrame.LayoutOrder)
                        end
                    end
                end
            end
        end)

        local page_func = {}

        function page_func.AddSection(SectionName)
            
            
            local Section = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local SectionList = Instance.new("UIListLayout")
            local SectionTop = Instance.new("ImageLabel")
            local SectionNameLabel = Instance.new("TextLabel")
            local Line = Instance.new("Frame")
            local SectionButton = Instance.new("TextButton")
            local SectionC = Instance.new("TextLabel")
            local Count = 0
            local SectionToggle = true
            local SectionSize

            Section.Name = SectionName.."Section"
            Section.Parent = ContainerFrame
            Section.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, -5, 0, 100)

            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = Section

            SectionList.Name = "SectionList"
            SectionList.Parent = Section
            SectionList.SortOrder = Enum.SortOrder.LayoutOrder
            SectionList.Padding = UDim.new(0, 5)
            SectionList.HorizontalAlignment = Enum.HorizontalAlignment.Center

            SectionTop.Name = "SectionTop"
            SectionTop.Parent = Section
            SectionTop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTop.BackgroundTransparency = 1.000
            SectionTop.Size = UDim2.new(1, 0, 0, 20)
            SectionTop.Image = "rbxassetid://4550094255"
            SectionTop.ImageColor3 = Color3.fromRGB(44, 44, 44)
            SectionTop.ScaleType = Enum.ScaleType.Slice
            SectionTop.SliceCenter = Rect.new(4, 4, 296, 296)

            SectionNameLabel.Name = SectionName..'_Section'
            SectionNameLabel.Parent = SectionTop
            SectionNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionNameLabel.BackgroundTransparency = 1.000
            SectionNameLabel.Position = UDim2.new(0, 25, 0, 0)
            SectionNameLabel.Size = UDim2.new(1, -30, 1, 0)
            SectionNameLabel.Font = Enum.Font.GothamBold
            SectionNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionNameLabel.TextSize = 14.000
            SectionNameLabel.TextXAlignment = Enum.TextXAlignment.Left

            Line.Name = "Line"
            Line.Parent = SectionTop
            Line.AnchorPoint = Vector2.new(0, 0.5)
            Line.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
            Line.BorderSizePixel = 0

            SectionButton.Name = "SectionButton"
            SectionButton.Parent = SectionTop
            SectionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionButton.BackgroundTransparency = 1.000
            SectionButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
            SectionButton.Size = UDim2.new(1, 0, 1, 0)
            SectionButton.Font = Enum.Font.SourceSans
            SectionButton.Text = ""
            SectionButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SectionButton.TextSize = 14.000

            SectionC.Name = "SectionC"
            SectionC.Parent = SectionTop
            SectionC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionC.BackgroundTransparency = 1.000
            SectionC.Position = UDim2.new(0, 5, 0, 0)
            SectionC.Rotation = -90
            SectionC.Size = UDim2.new(0, 20, 0, 20)
            SectionC.Font = Enum.Font.Gotham
            SectionC.Text = "<"
            SectionC.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionC.TextSize = 17.000
            SectionC.TextWrapped = true

            SectionNameLabel.Text = SectionName .. ' ('.. Count ..')'
            Line.Position = UDim2.new(0, SectionNameLabel.TextBounds.X + 30, 0.5, 0)
            Line.Size = UDim2.new(1, - (SectionNameLabel.TextBounds.X + 35), 0, 2)


            SectionList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section.Size = UDim2.new(1, -5, 0,(10 + SectionList.AbsoluteContentSize.Y))
                SectionSize = Section.Size
                Count = 0
                for i,v in next, Section:GetChildren() do
                    if v:IsA('Frame') then
                        Count = Count + 1
                        SectionNameLabel.Text = SectionName .. ' ('.. Count ..')'
                        Line.Position = UDim2.new(0, SectionNameLabel.TextBounds.X + 30, 0.5, 0)
                        Line.Size = UDim2.new(1, - (SectionNameLabel.TextBounds.X + 35), 0, 2)
                    end
                end

            end)


            SectionButton.MouseButton1Click:Connect(function()
                SectionToggle = not SectionToggle
                local SectionSizeTog = SectionToggle and SectionSize or UDim2.new(1,-5,0,20)
                local SectionCRotation = SectionToggle and -90 or -180
                
                if SectionToggle then
                    TweenService:Create(Section,TweenInfo.new(.5),{Size = SectionSizeTog}):Play()
                    TweenService:Create(SectionC,TweenInfo.new(.5),{Rotation = SectionCRotation}):Play()
                    wait(.5)
                    Section.ClipsDescendants = false
                else
                    Section.ClipsDescendants = true wait(.25)
                    TweenService:Create(Section,TweenInfo.new(.5),{Size = SectionSizeTog}):Play()
                    TweenService:Create(SectionC,TweenInfo.new(.5),{Rotation = SectionCRotation}):Play()
                end
            end)

            local section_func = {}

            function section_func.AddToggle(Name,Setting,Callback)
                local ToggleFrame = Instance.new("Frame")
                local ToggleMain = Instance.new("Frame")
                local ToggleMainCorner = Instance.new("UICorner")
                local ToggleIcon = Instance.new("Frame")
                local ToggleIconCorner = Instance.new("UICorner")
                local ToggleTitle = Instance.new("TextLabel")
                local ToggleButton = Instance.new("TextButton")
                local ToggleCorner = Instance.new('UICorner')


                ToggleFrame.Name = Name.."ToggleFrame"
                ToggleFrame.Parent = Section
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(99, 99, 99)
                ToggleFrame.BackgroundTransparency = 0
                ToggleFrame.Position = UDim2.new(0, 0, 0.25, 0)
                ToggleFrame.Size = UDim2.new(1, -10, 0, 30)

                ToggleCorner.CornerRadius = UDim.new(0, 4)
                ToggleCorner.Name = "SliderCorner"
                ToggleCorner.Parent = ToggleFrame

                ToggleMain.Name = "ToggleMain"
                ToggleMain.Parent = ToggleFrame
                ToggleMain.AnchorPoint = Vector2.new(1, 0.5)
                ToggleMain.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
                ToggleMain.Position = UDim2.new(1, -5, 0.5, 0)
                ToggleMain.Size = UDim2.new(0, 50, 1, -8)

                ToggleMainCorner.CornerRadius = UDim.new(1, 0)
                ToggleMainCorner.Name = "ToggleMainCorner"
                ToggleMainCorner.Parent = ToggleMain

                ToggleIcon.Name = "ToggleIcon"
                ToggleIcon.Parent = ToggleMain
                ToggleIcon.AnchorPoint = Vector2.new(0, 0.5)
                ToggleIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleIcon.Position = UDim2.new(0, 4, 0.5, 0)
                ToggleIcon.Size = UDim2.new(0, 14, 0, 14)

                ToggleIconCorner.CornerRadius = UDim.new(1, 0)
                ToggleIconCorner.Name = "ToggleIconCorner"
                ToggleIconCorner.Parent = ToggleIcon

                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Parent = ToggleFrame
                ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.BackgroundTransparency = 1.000
                ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
                ToggleTitle.Size = UDim2.new(1, -65, 1, 0)
                ToggleTitle.Font = Enum.Font.GothamBold
                ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.TextSize = 14.000
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                ToggleTitle.Text = Name

                ToggleButton.Name = "ToggleButton"
                ToggleButton.Parent = ToggleFrame
                ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleButton.BackgroundTransparency = 1.000
                ToggleButton.Size = UDim2.new(1, 0, 1, 0)
                ToggleButton.Font = Enum.Font.SourceSans
                ToggleButton.Text = ""
                ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ToggleButton.TextSize = 14.000

                local Callback = Callback or function() end


                local Default_Value = Setting.Default_Value or false

                local ToggleStagle = Default_Value

                if Default_Value and Callback then
                    local ToggleColor = Default_Value and Color3.fromRGB(3, 179, 59) or Color3.fromRGB(52, 52, 52)
                    local TogglePos = Default_Value and UDim2.new(1,-18,.5,0) or UDim2.new(0,4,.5,0)
                    TweenService:Create(ToggleMain,TweenInfo.new(.25),{BackgroundColor3 = ToggleColor}):Play()
                    TweenService:Create(ToggleIcon,TweenInfo.new(.5),{Position = TogglePos}):Play()
                    Callback(Default_Value)
                end



                ToggleButton.MouseButton1Click:Connect(function()
                    ToggleStagle = not ToggleStagle
                    local ToggleColor = ToggleStagle and Color3.fromRGB(3, 179, 59) or Color3.fromRGB(52, 52, 52)
                    local TogglePos = ToggleStagle and UDim2.new(1,-18,.5,0) or UDim2.new(0,4,.5,0)
                    TweenService:Create(ToggleMain,TweenInfo.new(.25),{BackgroundColor3 = ToggleColor}):Play()
                    TweenService:Create(ToggleIcon,TweenInfo.new(.5),{Position = TogglePos}):Play()

                    Callback(ToggleStagle)
                end)

                local Toggle_func = {}

                    function  Toggle_func.SetStage(Stage)
                        local ToggleColor = Stage and Color3.fromRGB(3, 179, 59) or Color3.fromRGB(52, 52, 52)
                        local TogglePos = Stage and UDim2.new(1,-18,.5,0) or UDim2.new(0,4,.5,0)
                        TweenService:Create(ToggleMain,TweenInfo.new(.25),{BackgroundColor3 = ToggleColor}):Play()
                        TweenService:Create(ToggleIcon,TweenInfo.new(.5),{Position = TogglePos}):Play()
                        Callback(Stage)
                    end

                return Toggle_func

            end

            function section_func.AddButton(Name,Callback)

                local ButtonFrame = Instance.new("Frame")
                local ButtonMain = Instance.new("Frame")
                local ButtonMainCorner = Instance.new("UICorner")
                local Button = Instance.new("TextButton")


                ButtonFrame.Name = Name.."ButtonFrame"
                ButtonFrame.Parent = Section
                ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonFrame.BackgroundTransparency = 1.000
                ButtonFrame.Size = UDim2.new(1, 0, 0, 25)

                ButtonMain.Name = "ButtonMain"
                ButtonMain.Parent = ButtonFrame
                ButtonMain.AnchorPoint = Vector2.new(0.5, 0)
                ButtonMain.BackgroundColor3 = Color3.fromRGB(79, 141, 255)
                ButtonMain.Position = UDim2.new(0.5, 0, 0, 0)
                ButtonMain.Size = UDim2.new(1, -10, 1, 0)
                ButtonMain.ClipsDescendants = true

                ButtonMainCorner.CornerRadius = UDim.new(0, 4)
                ButtonMainCorner.Parent = ButtonMain

                Button.Name = "Button"
                Button.Parent = ButtonFrame
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(1, 0, 1, 0)
                Button.Font = Enum.Font.GothamBold
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextSize = 14.000
                Button.Text = Name

                local Callback = Callback or function() end

                Button.MouseButton1Click:Connect(Callback)
                Button.MouseButton1Click:Connect(function()
                    library.buttoneffect(ButtonMain)
                end)

            end

            function section_func.AddLabel(Name,Setting)

                local BgColor = Color3.fromRGB(79, 141, 255)
                local TextColor = Color3.fromRGB(255,255,255)
                local BgTransparen = 0

                if Setting then
                    if Setting.BackgroundColor == 'Transparen' then
                        BgTransparen = 1
                        TextColor = Setting.TextColor
                    else
                        BgColor = Setting.BackgroundColor
                        TextColor = Setting.TextColor
                    end
                end

                local LabelFrame = Instance.new("Frame")
                local LabelMain = Instance.new("Frame")
                local LabelMainCorner = Instance.new("UICorner")
                local Label = Instance.new("TextLabel")


                LabelFrame.Name = Name.."LabelFrame"
                LabelFrame.Parent = Section
                LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelFrame.BackgroundTransparency = 1
                LabelFrame.Size = UDim2.new(1, 0, 0, 25)

                LabelMain.Name = "LabelMain"
                LabelMain.Parent = LabelFrame
                LabelMain.AnchorPoint = Vector2.new(0.5, 0)
                LabelMain.BackgroundColor3 = BgColor
                LabelMain.Position = UDim2.new(0.5, 0, 0, 0)
                LabelMain.Size = UDim2.new(1, -10, 1, 0)
                LabelMain.BackgroundTransparency = BgTransparen

                LabelMainCorner.CornerRadius = UDim.new(0, 4)
                LabelMainCorner.Name = "LabelMainCorner"
                LabelMainCorner.Parent = LabelMain

                Label.Name = "Label"
                Label.Parent = LabelFrame
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Position = UDim2.new(0, 10, 0, 0)
                Label.Size = UDim2.new(1, -10, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.TextColor3 = TextColor
                Label.TextSize = 14.000
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Text = Name

                local label_func = {}

                function label_func.SetText(...)
                    Label.Text = ...
                end

                return label_func

            end

            function section_func.AddSlider(Name,Setting,Callback)

                local Min_Value = Setting.Min or 0
                local Max_Value = Setting.Max or 100
                local Default_Value = Setting.Default_Value or Min_Value
                local Precise = Setting.Precise or false

                local Callback = Callback or function() end

                local SizeChia = 340

                local SliderFrame = Instance.new("Frame")
                local SliderTitle = Instance.new("TextLabel")
                local BarFrame = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local BarCorner = Instance.new("UICorner")
                local Inbar = Instance.new("Frame")
                local InBarCorner = Instance.new("UICorner")
                local SliderValue = Instance.new("Frame")
                local ValueCorner = Instance.new("UICorner")
                local ValueBox = Instance.new("TextBox")
                local SliderButton = Instance.new("TextButton")

                local SliderCorner = Instance.new('UICorner')



                SliderFrame.Name = Name.."Slider"
                SliderFrame.Parent = Section
                SliderFrame.BackgroundColor3 = Color3.fromRGB(99, 99, 99)
                SliderFrame.BackgroundTransparency = 0
                SliderFrame.Position = UDim2.new(0, 0, 0.566037714, 0)
                SliderFrame.Size = UDim2.new(1, -10 , 0, 55)

                SliderCorner.CornerRadius = UDim.new(0, 4)
                SliderCorner.Name = "SliderCorner"
                SliderCorner.Parent = SliderFrame

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = SliderFrame
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0, 5, 0, 0)
                SliderTitle.Size = UDim2.new(0, 280, 0, 25)
                SliderTitle.Font = Enum.Font.GothamBold
                SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.TextSize = 14.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                SliderTitle.Text = Name

                BarFrame.Name = "BarFrame"
                BarFrame.Parent = SliderFrame
                BarFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BarFrame.BackgroundTransparency = 1.000
                BarFrame.Position = UDim2.new(0, 0, 0, 30)
                BarFrame.Size = UDim2.new(0, 360, 0, 20)

                Bar.Name = "Bar"
                Bar.Parent = BarFrame
                Bar.AnchorPoint = Vector2.new(0.5, 0.5)
                Bar.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
                Bar.BorderSizePixel = 0
                Bar.Position = UDim2.new(0.5, 0, 0.5, 0)
                Bar.Size = UDim2.new(1, -20, 0, 6)

                SliderButton.Parent = Bar
				SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderButton.BackgroundTransparency = 1.000
				SliderButton.Size = UDim2.new(1, 0, 1, 0)
				SliderButton.Font = Enum.Font.SourceSans
				SliderButton.Text = ""
				SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				SliderButton.TextSize = 14.000

                BarCorner.Name = "BarCorner"
                BarCorner.Parent = Bar

                Inbar.Name = "Inbar"
                Inbar.Parent = Bar
                Inbar.BackgroundColor3 = Color3.fromRGB(79, 141, 255)
                Inbar.BorderSizePixel = 0
                Inbar.Size = UDim2.new(0, 0, 1, 0)

                InBarCorner.Name = "InBarCorner"
                InBarCorner.Parent = Inbar

                SliderValue.Name = "SliderValue"
                SliderValue.Parent = SliderFrame
                SliderValue.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
                SliderValue.Position = UDim2.new(1, -60, 0, 5)
                SliderValue.Size = UDim2.new(0, 55, 0, 25)

                ValueCorner.CornerRadius = UDim.new(0, 4)
                ValueCorner.Name = "ValueCorner"
                ValueCorner.Parent = SliderValue

                ValueBox.Name = "ValueBox"
                ValueBox.Parent = SliderValue
                ValueBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ValueBox.BackgroundTransparency = 1.000
                ValueBox.Size = UDim2.new(1, 0, 1, 0)
                ValueBox.Font = Enum.Font.GothamBold
                ValueBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
                ValueBox.Text = Default_Value
                ValueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                ValueBox.TextSize = 14.000
                ValueBox.ClearTextOnFocus = false

                local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")

                Inbar.Size = UDim2.new(math.clamp(1 - ((Max_Value - Default_Value) / (Max_Value - Min_Value)),0,0.99), 0, 0, 6)
				ValueBox.Text = Default_Value
				Callback(Default_Value)

                SliderButton.MouseButton1Down:Connect(function()
					local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))

					pcall(function()
						Callback(value)
                        ValueBox.Text = value
					end)
					Inbar.Size = UDim2.new(0, math.clamp(mouse.X - Inbar.AbsolutePosition.X, 0, SizeChia), 0, 6)
					moveconnection = mouse.Move:Connect(function()   
						local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))
						pcall(function()
							Callback(value)
                            ValueBox.Text = value
						end)
						Inbar.Size = UDim2.new(0, math.clamp(mouse.X - Inbar.AbsolutePosition.X, 0, SizeChia), 0, 6)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))

							pcall(function()
								Callback(value)
                                ValueBox.Text = value
							end)
							Inbar.Size = UDim2.new(0, math.clamp(mouse.X - Inbar.AbsolutePosition.X, 0, SizeChia), 0, 6)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)

                local function GetSliderValue(Value)
                    if tonumber(Value) <= Min_Value then
                        Inbar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
                        ValueBox.Text = Min_Value
						Callback(tonumber(Min_Value))

                    elseif tonumber(Value) >= Max_Value then
                        Inbar.Size = UDim2.new(0,(Max_Value  /  Max_Value * SizeChia), 0, 6)
                        ValueBox.Text = Max_Value
						Callback(tonumber(Max_Value))
                    else
                        Inbar.Size = UDim2.new(1 - ((Max_Value - Value) / (Max_Value - Min_Value)),0, 0, 6)
                        Callback(tonumber(Value))
					end
                end


				ValueBox.FocusLost:Connect(function()
                    GetSliderValue(ValueBox.Text)
				end)


				local slider_function = {}

				function slider_function.SetValue(Value)
					GetSliderValue(Value)
				end

				return slider_function
                
            end

            function  section_func.AddDropdown(Name,Setting,Callback)

                local List = Setting.List
                local Search_Setting = Setting.Search or false
                local Selected = Setting.Selected or false
                local DefaultVal = Setting.DefaultValue
                local Callback = Callback or function() end

                local DropdownFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local InDrop = Instance.new("ScrollingFrame")
                local ListF = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local TopDrop = Instance.new("ImageLabel")
                local DropTitle = Instance.new("TextLabel")
                local DropButton = Instance.new("TextButton")
                local Dropc = Instance.new("TextLabel")
                local Dropbox = Instance.new('TextBox')

                DropdownFrame.Name = Name.."DropdownFrame"
                DropdownFrame.Parent = Section
                DropdownFrame.BackgroundColor3 = Color3.fromRGB(99, 99, 99)
                DropdownFrame.ClipsDescendants = true
                DropdownFrame.Size = UDim2.new(1, -10, 0, 25)

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = DropdownFrame

                InDrop.Name = "InDrop"
                InDrop.Parent = DropdownFrame
                InDrop.Active = true
                InDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                InDrop.BackgroundTransparency = 1.000
                InDrop.BorderSizePixel = 0
                InDrop.Position = UDim2.new(0, 0, 0, 30)
                InDrop.Size = UDim2.new(1, 0, 1, -30)
                InDrop.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                InDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
                InDrop.ScrollBarThickness = 5
                InDrop.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                InDrop.ScrollBarImageColor3 = Color3.fromRGB(79, 141, 255)

                ListF.Name = "List"
                ListF.Parent = InDrop
                ListF.AnchorPoint = Vector2.new(0.5, 0)
                ListF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ListF.BackgroundTransparency = 1.000
                ListF.Position = UDim2.new(0.5, 0, 0, 0)
                ListF.Size = UDim2.new(1, -10, 0, 170)

                UIListLayout.Parent = ListF
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 5)

                UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					local absoluteSize = UIListLayout.AbsoluteContentSize
					InDrop.CanvasSize = UDim2.new(0, 0, 0, 10 + absoluteSize.Y)
				end)

                TopDrop.Name = "TopDrop"
                TopDrop.Parent = DropdownFrame
                TopDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TopDrop.BackgroundTransparency = 1.000
                TopDrop.Size = UDim2.new(1, 0, 0, 25)
                TopDrop.Image = "rbxassetid://4550094255"
                TopDrop.ImageColor3 = Color3.fromRGB(52, 52, 52)
                TopDrop.ScaleType = Enum.ScaleType.Slice
                TopDrop.SliceCenter = Rect.new(4, 4, 296, 296)

                if not Search_Setting then

                DropTitle.Name = "DropTitle"
                DropTitle.Parent = TopDrop
                DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropTitle.BackgroundTransparency = 1.000
                DropTitle.Position = UDim2.new(0, 5, 0, 0)
                DropTitle.Size = UDim2.new(1, -5, 0, 25)
                DropTitle.Font = Enum.Font.GothamBold
                DropTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                DropTitle.TextSize = 14.000
                DropTitle.TextXAlignment = Enum.TextXAlignment.Left
                DropTitle.Text = Name

                DropButton.Name = "DropButton"
                DropButton.Parent = TopDrop
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(1, 0, 0, 25)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000

                else
                    
                Dropbox.Name = "Dropbox"
                Dropbox.Parent = TopDrop
                Dropbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropbox.BackgroundTransparency = 1.000
                Dropbox.Position = UDim2.new(0, 5, 0, 0)
                Dropbox.Size = UDim2.new(1, -5, 0, 25)
                Dropbox.Font = Enum.Font.GothamBold
                Dropbox.TextColor3 = Color3.fromRGB(255, 255, 255)
                Dropbox.TextSize = 14.000
                Dropbox.TextXAlignment = Enum.TextXAlignment.Left
                Dropbox.ClearTextOnFocus = true
                Dropbox.PlaceholderText = Name
                Dropbox.Text = ''

                end

                Dropc.Name = "Dropc"
                Dropc.Parent = TopDrop
                Dropc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropc.BackgroundTransparency = 1.000
                Dropc.Position = UDim2.new(1, -25, 0, 2)
                Dropc.Rotation = -180.000
                Dropc.Size = UDim2.new(0, 20, 0, 20)
                Dropc.Font = Enum.Font.Gotham
                Dropc.Text = "<"
                Dropc.TextColor3 = Color3.fromRGB(255, 255, 255)
                Dropc.TextSize = 17.000
                Dropc.TextWrapped = true

                if DefaultVal then
                    Callback(DefaultVal)
                end

                local isbusy = false

                local found = {}

				local searchtable = {}
				
				local function edit()
					for i in pairs(found) do
						found[i] = nil
					end
					for h, l in pairs(ListF:GetChildren()) do
						if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
							l.Visible = false
						end
					end
					Dropbox.Text = string.lower(Dropbox.Text)
				end

				local function Search()
					local Results = {}
					for i, v in pairs(searchtable) do
						if string.find(v, Dropbox.Text) then
							table.insert(found, v)
						end
					end
					for a, b in pairs(ListF:GetChildren()) do
						for c, d in pairs(found) do
							if d == b.Name then
								b.Visible = true
							end
						end
					end
				end

				local ListNew = List
				
				local function clear_object_in_list()
					for i,v in next, ListF:GetChildren() do 
						if v:IsA('Frame') then 
							v:Destroy()
						end
					end
				end
				
				local function refreshlist()
					clear_object_in_list()

					searchtable = {}
					
					for i, v in pairs(ListNew) do
					    if not Selected then 
						table.insert(searchtable, string.lower(v))
						else 
						    table.insert(searchtable, string.lower(i))
						end 
					end
					
					if not Selected then 
						for i,v in pairs (ListNew) do
                            
							local Object = Instance.new("Frame")
                            local UICorner = Instance.new("UICorner")
                            local Button = Instance.new("TextButton")
                            local Title = Instance.new("TextLabel")


                            Object.Name = string.lower(v)
                            Object.Parent = ListF
                            Object.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
                            Object.Size = UDim2.new(1, 0, 0, 25)

                            UICorner.CornerRadius = UDim.new(0, 4)
                            UICorner.Parent = Object

                            Button.Name = "Button"
                            Button.Parent = Object
                            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Button.BackgroundTransparency = 1.000
                            Button.Size = UDim2.new(1, 0, 1, 0)
                            Button.Font = Enum.Font.GothamBold
                            Button.Text = ''
                            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Button.TextSize = 14.000

                            Title.Name = "Title"
                            Title.Parent = Object
                            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Title.BackgroundTransparency = 1.000
                            Title.Position = UDim2.new(0, 5, 0, 0)
                            Title.Size = UDim2.new(1, -5, 1, 0)
                            Title.Font = Enum.Font.GothamBold
                            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Title.TextSize = 14.000
                            Title.TextXAlignment = Enum.TextXAlignment.Left
                            Title.Text = v
							
							Button.MouseButton1Click:Connect(function()

                                isbusy = not isbusy

                                if Search_Setting then
                                    Dropbox.PlaceholderText = Name..': '..v
                                else
                                    DropTitle.Text = Name..': '..v
                                end

								TweenService:Create(InDrop,TweenInfo.new(.5),{Size = UDim2.new(1, 0,0, 0)}):Play()
								TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = UDim2.new(1,-10 ,0, 25)}):Play()

                                local DropCRotation = isbusy and -90 or -180
                                TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()

								refreshlist()
								if Callback then 
									Callback(v)
								end

							end)
						end
				else 	

						for i,v in pairs (ListNew) do
							
							local cSelected, cnotSelected = Color3.fromRGB(79, 141, 255), Color3.fromRGB(255, 65, 65)

							local colorSelecteda = v and cSelected or cnotSelected

                            local Object = Instance.new("Frame")
                            local UICorner = Instance.new("UICorner")
                            local Button = Instance.new("TextButton")
                            local Title = Instance.new("TextLabel")


                            Object.Name = string.lower(i)
                            Object.Parent = ListF
                            Object.BackgroundColor3 = colorSelecteda
                            Object.Size = UDim2.new(1, 0, 0, 25)

                            UICorner.CornerRadius = UDim.new(0, 4)
                            UICorner.Parent = Object

                            Button.Name = "Button"
                            Button.Parent = Object
                            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Button.BackgroundTransparency = 1.000
                            Button.Size = UDim2.new(1, 0, 1, 0)
                            Button.Font = Enum.Font.GothamBold
                            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Button.TextSize = 14.000
                            Button.Text =''

                            Title.Name = "Title"
                            Title.Parent = Object
                            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Title.BackgroundTransparency = 1.000
                            Title.Position = UDim2.new(0, 5, 0, 0)
                            Title.Size = UDim2.new(1, -5, 1, 0)
                            Title.Font = Enum.Font.GothamBold
                            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Title.TextSize = 14.000
                            Title.TextXAlignment = Enum.TextXAlignment.Left
                            Title.Text = i
							
							Button.MouseButton1Click:Connect(function()
								v = not v 

								local colorSelected = v and cSelected or cnotSelected

								TweenService:Create(Object,TweenInfo.new(.5),{BackgroundColor3 = colorSelected}):Play()

								if Callback then
									Callback(i,v)
                                    List[i] = v
								end
							end)
						end

				end 
						
						
						
					end
					
                Dropbox.Changed:Connect(function()
					edit()
					Search()
				end)


				Dropbox.Focused:Connect(function()
					refreshlist()
					isbusy = not isbusy 
					local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
					local dropframesize = isbusy and UDim2.new(1,-10 ,0, 200) or UDim2.new(1, -10,0, 25)
                    local DropCRotation = isbusy and -90 or -180

                    TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
					TweenService:Create(InDrop,TweenInfo.new(.5),{Size = listsize}):Play()
					TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
				end)

				DropButton.MouseButton1Click:Connect(function()
					isbusy = not isbusy 
					local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
					local dropframesize = isbusy and UDim2.new(1,-10 ,0, 200) or UDim2.new(1, -10,0, 25)
                    local DropCRotation = isbusy and -90 or -180

					refreshlist()
                    TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
					TweenService:Create(InDrop,TweenInfo.new(.5),{Size = listsize}):Play()
					TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()

				end)
				
				local dropdown_function = {}
						function dropdown_function:GetNewList(List)
						    
						    refreshlist()
					        isbusy = false
					        local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
					        local dropframesize = isbusy and UDim2.new(1,-10 ,0, 200) or UDim2.new(1, -10,0, 25)
					        TweenService:Create(InDrop,TweenInfo.new(.5),{Size = listsize}):Play()
					        TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
						    
							ListNew = {}
							ListNew = List

						end
						
				return dropdown_function
                
            end

            function section_func.AddBox(Name,Setting,Callback)

                local Number_Only = Setting.Number_Only or false
                local DefaultVal = Setting.DefaultValue
                local Callback = Callback or function() end
                local BgColor = Color3.fromRGB(79, 141, 255)
                local TextColor = Color3.fromRGB(255,255,255)
                local BgTransparen = 0

                local BoxFrame = Instance.new("Frame")
                local BoxlMain = Instance.new("Frame")
                local BoxMainCorner = Instance.new("UICorner")
                local Box = Instance.new("TextBox")


                BoxFrame.Name = Name.."BoxFrame"
                BoxFrame.Parent = Section
                BoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BoxFrame.BackgroundTransparency = 1
                BoxFrame.Size = UDim2.new(1, 0, 0, 25)

                BoxlMain.Name = "BoxlMain"
                BoxlMain.Parent = BoxFrame
                BoxlMain.AnchorPoint = Vector2.new(0.5, 0)
                BoxlMain.BackgroundColor3 = BgColor
                BoxlMain.Position = UDim2.new(0.5, 0, 0, 0)
                BoxlMain.Size = UDim2.new(1, -10, 1, 0)
                BoxlMain.BackgroundTransparency = BgTransparen

                BoxMainCorner.CornerRadius = UDim.new(0, 4)
                BoxMainCorner.Name = "BoxMainCorner"
                BoxMainCorner.Parent = BoxlMain

                Box.Name = "Box"
                Box.Parent = BoxFrame
                Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Box.BackgroundTransparency = 1.000
                Box.Position = UDim2.new(0, 10, 0, 0)
                Box.Size = UDim2.new(1, -10, 1, 0)
                Box.Font = Enum.Font.GothamBold
                Box.TextColor3 = TextColor
                Box.TextSize = 14.000
                Box.TextXAlignment = Enum.TextXAlignment.Left
                Box.ClearTextOnFocus = true
                Box.PlaceholderText = Name

                local valuecall
				local isbucac = true

				if DefaultVal then Callback(DefaultVal) end

				Box:GetPropertyChangedSignal("Text"):Connect(function()
					if string.len(Box.Text) > 43 then
						if isbucac then 
							isbucac = false
							valuecall = Box.Text
							game:GetService("RunService").Heartbeat:Wait()
							Box.Text = string.match(Box.Text,'...........................................').."..."
						end
					else 
						isbucac = true
					end
				end)


				if Number_Only then 
					Box:GetPropertyChangedSignal("Text"):Connect(function()
						if tonumber(Box.Text) then 
						else 
							Box.PlaceholderText = 'Number only -.-'
							Box.Text = ''
						end
					end)
				end

				Box.FocusLost:Connect(function()
					if Box.Text ~= '' then
						if isbucac then 
							Callback(Box.Text)
						else 
							Callback(valuecall)
						end
					end
				end)

				local textbox_function = {}

				function textbox_function.SetValue(Value)
					Box.Text = Value
					Callback(Value)
				end 

				return textbox_function;

            end

            function section_func.AddKeybind(Name,Setting,Callback)

                local Callback = Callback or function() end
				local keycodename = Setting.KeyDefault or Setting.Key or Setting.Default
				local Default = Setting.KeyDefault or Setting.Key or Setting.Default
				local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
				keycodename = tostring(keycodename):gsub("Enum.UserInputType.", "")
				keycodename = tostring(keycodename):gsub("Enum.KeyCode.", "")
                
                local KeybindFrame = Instance.new("Frame")
                local KeybindMain = Instance.new("Frame")
                local KeybindMainCorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local BindFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local BindButton = Instance.new("TextButton")

                KeybindFrame.Name = Name.."KeybindFrame"
                KeybindFrame.Parent = Section
                KeybindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeybindFrame.BackgroundTransparency = 1.000
                KeybindFrame.Size = UDim2.new(1, 0, 0, 30)

                KeybindMain.Name = "KeybindMain"
                KeybindMain.Parent = KeybindFrame
                KeybindMain.AnchorPoint = Vector2.new(0.5, 0)
                KeybindMain.BackgroundColor3 = Color3.fromRGB(99, 99, 99)
                KeybindMain.Position = UDim2.new(0.5, 0, 0, 0)
                KeybindMain.Size = UDim2.new(1, -10, 1, 0)

                KeybindMainCorner.CornerRadius = UDim.new(0, 4)
                KeybindMainCorner.Name = "KeybindMainCorner"
                KeybindMainCorner.Parent = KeybindMain

                Title.Name = "Title"
                Title.Parent = KeybindFrame
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.Position = UDim2.new(0, 15, 0, 0)
                Title.Size = UDim2.new(1, -10, 1, 0)
                Title.Font = Enum.Font.GothamBold
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.Text = Name

                BindFrame.Name = "BindFrame"
                BindFrame.Parent = KeybindFrame
                BindFrame.AnchorPoint = Vector2.new(0, 0.5)
                BindFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
                BindFrame.BorderSizePixel = 0
                BindFrame.Position = UDim2.new(1, -90, 0.5, 0)
                BindFrame.Size = UDim2.new(0, 80, 0, 20)

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = BindFrame

                BindButton.Name = "BindButton"
                BindButton.Parent = BindFrame
                BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BindButton.BackgroundTransparency = 1.000
                BindButton.Size = UDim2.new(1, 0, 1, 0)
                BindButton.Font = Enum.Font.GothamBold
                BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                BindButton.TextSize = 14.000
                BindButton.Text = tostring(Default):gsub("Enum.KeyCode.", "");

                local WhitelistedType = {
					[Enum.UserInputType.MouseButton1] = "Mouse1";
					[Enum.UserInputType.MouseButton2] = "Mouse2";
					[Enum.UserInputType.MouseButton3] = "Mouse3";
				};

				BindButton.MouseButton1Click:Connect(function()
					local Connection;

					BindButton.Text = "...";

					Connection = UIS.InputBegan:Connect(function(i)
						if WhitelistedType[i.UserInputType] then
							BindButton.Text = WhitelistedType[i.UserInputType];
							spawn(function()
								wait(0.1)
								Default = i.UserInputType;
								Type = "UserInputType";
							end);
						elseif i.KeyCode ~= Enum.KeyCode.Unknown then
							BindButton.Text = tostring(i.KeyCode):gsub("Enum.KeyCode.", "");
							spawn(function()
								wait(0.1)
								Default = i.KeyCode;
								Type = "KeyCode";
							end);
						else
							warn("Exception: " .. i.UserInputType .. " " .. i.KeyCode);
						end;


						Connection:Disconnect();
					end);
				end);

				UIS.InputBegan:Connect(function(i)
					if (Default == i.UserInputType or Default == i.KeyCode) then
						Callback(Default);
					end;
				end);
                
            end

            return section_func
        end
        return page_func
    end
    return page
end
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
 vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
 wait(1)
 vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local FolderName = "Banana Hub"
local ConfigFile = game.Players.LocalPlayer.Name.."-Pet99.json"
local function LoadPreset()
    return game:GetService("HttpService"):JSONDecode(readfile(FolderName .. "/"  .. ConfigFile))
end
local function SavePreset()
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
if isfile(FolderName .. "/"  .. ConfigFile) then
local Decode = LoadPreset()
for i,v in pairs(Decode) do
    Config[i] = v
end
elseif  not isfile(FolderName .. "/"  .. ConfigFile) then
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end

local function mapselect()
    local map = {}
    for i,v in pairs(workspace.Map:GetChildren()) do  
        if not table.find(map,v.Name) and v.Name ~= "Shop" then 
            table.insert(map,v.Name) 
        end
    end
  return map
end
local a = library.CreateMain('Vin Hub - Blox Fruit')
local FarmPage = a.AddPage('Farm')

local FSectionMics = FarmPage.AddSection("Mics")

local DropWp = FSectionMics.AddDropdown("Select Weapon",{List = mapselect(), Search = true, Selected = false, DefaultValue = Config.map}, function(v)
    Config.map = v
    SavePreset()
end)
