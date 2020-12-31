local Sowd = {}

local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new

function Sowd:DraggingEnabled(frame, parent)
	
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function Sowd.Create()
    local SowdLib = Instance.new("ScreenGui")
    local mainShadow = Instance.new("ImageLabel")
    local main = Instance.new("Frame")
    local mainCorner = Instance.new("UICorner")
    local heading = Instance.new("Frame")
    local headingCorner = Instance.new("UICorner")
    local headingCover = Instance.new("Frame")
    local sowdlogo = Instance.new("ImageLabel")
    local minHub = Instance.new("ImageButton")
    local sowd = Instance.new("TextLabel")
    local Hub = Instance.new("TextLabel")
    local closeLib = Instance.new("ImageButton")
    local side = Instance.new("Frame")
    local sideCorner = Instance.new("UICorner")
    local sideCover = Instance.new("Frame")
    local allTabs = Instance.new("ScrollingFrame")
    local tabListing = Instance.new("UIListLayout")
    local settings = Instance.new("ImageButton")
    local wave = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local allPages = Instance.new("Frame")

    local pageFolder = Instance.new("Folder")

    local wdrpped = false
    pageFolder.Name = "pageFolder"
    pageFolder.Parent = allPages

    SowdLib.Name = "SowdLib"
    SowdLib.Parent = game.CoreGui
    SowdLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SowdLib.ResetOnSpawn = false

    mainShadow.Name = "mainShadow"
    mainShadow.Parent = SowdLib
    mainShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainShadow.BackgroundTransparency = 1.000
    mainShadow.Position = UDim2.new(0.319562584, 0, 0.139563113, 0)
    mainShadow.Size = UDim2.new(0, 593,0, 513)
    mainShadow.Image = "http://www.roblox.com/asset/?id=6105530152"
    mainShadow.ImageColor3 = Color3.fromRGB(0,0,0)

    main.Name = "main"
    main.Parent = mainShadow
    main.BackgroundColor3 = Color3.fromRGB(28, 32, 34)
    main.Position = UDim2.new(0.048, 0,0.08, 0)
    main.Size = UDim2.new(0, 538, 0, 434)
    main.ClipsDescendants = true

    mainCorner.Name = "mainCorner"
    mainCorner.Parent = main

    heading.Name = "heading"
    heading.Parent = main
    heading.BackgroundColor3 = Color3.fromRGB(17, 21, 24)
    heading.Position = UDim2.new(-0.000403308513, 0, -0.00134439068, 0)
    heading.Size = UDim2.new(0, 538, 0, 39)
    heading.ZIndex = 5
    Sowd:DraggingEnabled(main, mainShadow)
    headingCorner.Name = "headingCorner"
    headingCorner.Parent = heading

    headingCover.Name = "headingCover"
    headingCover.Parent = heading
    headingCover.BackgroundColor3 = Color3.fromRGB(17, 21, 24)
    headingCover.BorderSizePixel = 0
    headingCover.Position = UDim2.new(0, 0, 0.641025662, 0)
    headingCover.Size = UDim2.new(0, 538, 0, 14)

    sowdlogo.Name = "sowdlogo"
    sowdlogo.Parent = heading
    sowdlogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sowdlogo.BackgroundTransparency = 1.000
    sowdlogo.Position = UDim2.new(0.00999999978, 0, 0.0500000007, 0)
    sowdlogo.Size = UDim2.new(0, 35, 0, 35)
    sowdlogo.Image = "http://www.roblox.com/asset/?id=6108156363"

    minHub.Name = "minHub"
    minHub.Parent = heading
    minHub.BackgroundTransparency = 1.000
    minHub.Position = UDim2.new(0.875, 0, 0.15384616, 0)
    minHub.Size = UDim2.new(0, 25, 0, 25)
    minHub.ZIndex = 2
    minHub.Image = "rbxassetid://3926305904"
    minHub.ImageRectOffset = Vector2.new(44, 404)
    minHub.ImageRectSize = Vector2.new(36, 36)
    minHub.MouseButton1Click:Connect(function()
        if wdrpped then
            game.TweenService:Create(mainShadow, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                ImageTransparency = 1
            }):Play()
            side.Visible = false
            wait(0.1)
            game.TweenService:Create(minHub, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                Rotation = 180
            }):Play()
            game.TweenService:Create(headingCover, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                BackgroundTransparency = 1
            }):Play()
            main:TweenSize(UDim2.new(0, 538, 0, 39), "InOut", "Linear", 0.1)
            wdrpped = false
        else
            side.Visible = true
            wait(0.1)
            game.TweenService:Create(minHub, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                Rotation = 0
            }):Play()
            game.TweenService:Create(headingCover, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                BackgroundTransparency = 0
            }):Play()
            main:TweenSize(UDim2.new(0, 538, 0, 434), "InOut", "Linear", 0.1)
            wait(0.1)
            game.TweenService:Create(mainShadow, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                ImageTransparency = 0
            }):Play()
            wdrpped = true
        end
    end)

    sowd.Name = "sowd"
    sowd.Parent = heading
    sowd.BackgroundColor3 = Color3.fromRGB(20, 25, 29)
    sowd.BackgroundTransparency = 1.000
    sowd.Position = UDim2.new(0.0895522386, 0, 0, 0)
    sowd.Size = UDim2.new(0, 50, 0, 39)
    sowd.Font = Enum.Font.GothamSemibold
    sowd.Text = "Sowd"
    sowd.TextColor3 = Color3.fromRGB(64, 169, 243)
    sowd.TextSize = 18.000
    sowd.TextXAlignment = Enum.TextXAlignment.Left

    Hub.Name = "Hub"
    Hub.Parent = heading
    Hub.BackgroundColor3 = Color3.fromRGB(20, 25, 29)
    Hub.BackgroundTransparency = 1.000
    Hub.Position = UDim2.new(0.182835817, 0, 0, 0)
    Hub.Size = UDim2.new(0, 50, 0, 39)
    Hub.Font = Enum.Font.GothamSemibold
    Hub.Text = "Hub"
    Hub.TextColor3 = Color3.fromRGB(255, 255, 255)
    Hub.TextSize = 18.000
    Hub.TextXAlignment = Enum.TextXAlignment.Left

    closeLib.Name = "closeLib"
    closeLib.Parent = heading
    closeLib.BackgroundTransparency = 1.000
    closeLib.Position = UDim2.new(0.936999977, 0, 0.179000005, 0)
    closeLib.Size = UDim2.new(0, 25, 0, 25)
    closeLib.ZIndex = 2
    closeLib.Image = "rbxassetid://3926305904"
    closeLib.ImageColor3 = Color3.fromRGB(126, 22, 22)
    closeLib.ImageRectOffset = Vector2.new(44, 364)
    closeLib.ImageRectSize = Vector2.new(36, 36)
    closeLib.MouseButton1Click:Connect(function()
        SowdLib:Destroy()
    end)
    side.Name = "side"
    side.Parent = main
    side.BackgroundColor3 = Color3.fromRGB(25, 29, 31)
    side.Position = UDim2.new(-0.000403308513, 0, -0.00134439068, 0)
    side.Size = UDim2.new(0, 165, 0, 434)

    sideCorner.Name = "sideCorner"
    sideCorner.Parent = side

    sideCover.Name = "sideCover"
    sideCover.Parent = side
    sideCover.BackgroundColor3 = Color3.fromRGB(25, 29, 31)
    sideCover.BorderSizePixel = 0
    sideCover.Position = UDim2.new(0.933333337, 0, 0, 0)
    sideCover.Size = UDim2.new(0, 11, 0, 394)

    allTabs.Name = "allTabs"
    allTabs.Parent = side
    allTabs.Active = true
    allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    allTabs.BackgroundTransparency = 1.000
    allTabs.BorderSizePixel = 0
    allTabs.Position = UDim2.new(0.0484848469, 0, 0.107355773, 0)
    allTabs.Size = UDim2.new(0, 149, 0, 347)
    allTabs.ScrollBarThickness = 0

    tabListing.Name = "tabListing"
    tabListing.Parent = allTabs
    tabListing.SortOrder = Enum.SortOrder.LayoutOrder

    settings.Name = "settings"
    settings.Parent = side
    settings.BackgroundTransparency = 1.000
    settings.Position = UDim2.new(0.0484848469, 0, 0.921999991, 0)
    settings.Size = UDim2.new(0, 25, 0, 25)
    settings.ZIndex = 2
    settings.Image = "rbxassetid://3926307971"
    settings.ImageColor3 = Color3.fromRGB(57, 74, 85)
    settings.ImageRectOffset = Vector2.new(324, 124)
    settings.ImageRectSize = Vector2.new(36, 36)

    wave.Name = "wave"
    wave.Parent = main
    wave.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    wave.BackgroundTransparency = 1.000
    wave.Position = UDim2.new(0.306288153, 0, 0.0875576064, 0)
    wave.Size = UDim2.new(0, 373, 0, 396)
    wave.Image = "http://www.roblox.com/asset/?id=6108173455"
    wave.ImageColor3 = Color3.fromRGB(137, 172, 199)
    wave.ImageTransparency = 1.000

    UICorner.Parent = wave

    allPages.Name = "allPages"
    allPages.Parent = main
    allPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    allPages.BackgroundTransparency = 1.000
    allPages.BorderSizePixel = 0
    allPages.Position = UDim2.new(0.317843854, 0, 0.103686638, 0)
    allPages.Size = UDim2.new(0, 355, 0, 381)

    local TabHandling = {}

    function TabHandling:SowdTab(tabName, logoId)
        local tabFrame = Instance.new("Frame")
        local tabLogo = Instance.new("ImageLabel")
        local tabButton = Instance.new("TextButton")
        local newPage = Instance.new("ScrollingFrame")
        local sectionList = Instance.new("UIListLayout")

        tabName = tabName or "Tab" + 1
        logoId = logoId or ""

        newPage.Name = "newPage"..tabName
        newPage.Parent = pageFolder
        newPage.Active = true
        newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        newPage.BackgroundTransparency = 1.000
        newPage.BorderSizePixel = 0
        newPage.Size = UDim2.new(1, 0, 1, 0)
        newPage.ZIndex = 1
        newPage.ScrollBarThickness = 6
        newPage.Visible = false
        newPage.ScrollBarImageColor3 = Color3.fromRGB(17, 21, 24)
        newPage.ClipsDescendants = true
    
        sectionList.Name = "sectionList"
        sectionList.Parent = newPage
        sectionList.SortOrder = Enum.SortOrder.LayoutOrder
        sectionList.Padding = UDim.new(0, 3)
            
        tabFrame.Name = "tabFrame"..tabName
        tabFrame.Parent = allTabs
        tabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabFrame.BackgroundTransparency = 1.000
        tabFrame.BorderSizePixel = 0
        tabFrame.Size = UDim2.new(1, 0, -0.00564971752, 37)

        tabLogo.Name = "tabLogo"
        tabLogo.Parent = tabFrame
        tabLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabLogo.BackgroundTransparency = 1.000
        tabLogo.BorderColor3 = Color3.fromRGB(27, 42, 53)
        tabLogo.Size = UDim2.new(0, 32, 0, 32)
        tabLogo.Image = "http://www.roblox.com/asset/?id="..logoId
        tabLogo.ImageColor3 = Color3.fromRGB(57, 74, 85)

        tabButton.Name = "tabButton"..tabName
        tabButton.Parent = tabFrame
        tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.BackgroundTransparency = 1.000
        tabButton.Position = UDim2.new(0.214765102, 0, 0, 0)
        tabButton.Size = UDim2.new(0, 117, 0, 32)
        tabButton.Font = Enum.Font.Gotham
        tabButton.Text = tabName
        tabButton.TextColor3 = Color3.fromRGB(57, 74, 85)
        tabButton.TextSize = 14.000
        tabButton.TextXAlignment = Enum.TextXAlignment.Left

        local function UpdateSize()
            local cS = sectionList.AbsoluteContentSize

            game.TweenService:Create(newPage, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
            }):Play()
        end
        UpdateSize()
        newPage.ChildAdded:Connect(UpdateSize)
        newPage.ChildRemoved:Connect(UpdateSize)

        tabButton.MouseButton1Click:Connect(function()
            UpdateSize()
            for i,v in next, pageFolder:GetChildren() do
                UpdateSize()
                v.Visible = false
            end
            newPage.Visible = true
            for i,v in next, allTabs:GetChildren() do
                if v:IsA("Frame") then
                    for i,v in next, v:GetChildren() do
                        if v:IsA("TextButton") then
                            game.TweenService:Create(v, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                TextColor3 = Color3.fromRGB(57, 74, 85)
                            }):Play()
                        end
                        if v:IsA("ImageLabel") then
                            game.TweenService:Create(v, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageColor3 = Color3.fromRGB(57, 74, 85)
                            }):Play()
                        end
                    end
                end
            end
            game.TweenService:Create(tabLogo, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                ImageColor3 = Color3.fromRGB(255,255,255)
            }):Play()
            game.TweenService:Create(tabButton, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                TextColor3 = Color3.fromRGB(255,255,255)
            }):Play()
        end)

        local sectionStuff = {}

        function sectionStuff:SowdSection(secName)
            secName = secName or "Section"
            local section = Instance.new("Frame")
            local sectionCorner = Instance.new("UICorner")
            local sectionHead = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local minSection = Instance.new("ImageButton")
            local sectionTitle = Instance.new("TextLabel")
            local itemsListing = Instance.new("UIListLayout")

            local iss = true

            section.Name = "section"
            section.Parent = newPage
            section.BackgroundColor3 = Color3.fromRGB(25, 29, 31)
            section.ClipsDescendants = true

            sectionCorner.Name = "sectionCorner"
            sectionCorner.Parent = section

            sectionHead.Name = "sectionHead"
            sectionHead.Parent = section
            sectionHead.BackgroundColor3 = Color3.fromRGB(25, 29, 31)
            sectionHead.Size = UDim2.new(0, 342, 0, 34)

            UICorner.Parent = sectionHead

            minSection.Name = "minSection"
            minSection.Parent = sectionHead
            minSection.BackgroundTransparency = 1.000
            minSection.Position = UDim2.new(0.904683113, 0, 0.120663658, 0)
            minSection.Size = UDim2.new(0, 25, 0, 25)
            minSection.ZIndex = 2
            minSection.Rotation = 0
            minSection.Image = "rbxassetid://3926305904"
            minSection.ImageRectOffset = Vector2.new(44, 404)
            minSection.ImageRectSize = Vector2.new(36, 36)
            minSection.MouseButton1Click:Connect(function()
                if iss then
                    game.TweenService:Create(minSection, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 180
                    }):Play()
                    section:TweenSize(UDim2.new(0, 341, 0, 34), "InOut", "Linear", 0.1)
                    iss = false
                    wait(0.1)
                    UpdateSize()
                else

                    game.TweenService:Create(minSection, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 0
                    }):Play()
                    section:TweenSize(UDim2.new(0, 341, 0, itemsListing.AbsoluteContentSize.Y + 7), "InOut", "Linear", 0.1)
                    iss = true
                    wait(0.1)
                    UpdateSize()
                end
            end)

            sectionTitle.Name = "sectionTitle"
            sectionTitle.Parent = sectionHead
            sectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionTitle.BackgroundTransparency = 1.000
            sectionTitle.Position = UDim2.new(0.0231883619, 0, 0, 0)
            sectionTitle.Size = UDim2.new(0, 192, 0, 33)
            sectionTitle.Font = Enum.Font.GothamSemibold
            sectionTitle.Text = secName
            sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            sectionTitle.TextSize = 14.000
            sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

            itemsListing.Name = "itemsListing"
            itemsListing.Parent = section
            itemsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
            itemsListing.SortOrder = Enum.SortOrder.LayoutOrder
            itemsListing.Padding = UDim.new(0, 3)


            local sowdStuff = {}

            function sowdStuff:SowdButton(bText, callback)
                bText = bText or "Click Me!"
                callback = callback or function() end

                local buttonFrame = Instance.new("Frame")
                local bFrameCorner = Instance.new("UIListLayout")
                local TextButtonFrame = Instance.new("Frame")
                local TextButton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")

                buttonFrame.Name = "buttonFrame"
                buttonFrame.Parent = section
                buttonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                buttonFrame.BackgroundTransparency = 1.000
                buttonFrame.BorderSizePixel = 0
                buttonFrame.Position = UDim2.new(0.0248538014, 0, 0.17289719, 0)
                buttonFrame.Size = UDim2.new(0, 325, 0, 37)

                bFrameCorner.Name = "bFrameCorner"
                bFrameCorner.Parent = buttonFrame
                bFrameCorner.HorizontalAlignment = Enum.HorizontalAlignment.Center
                bFrameCorner.SortOrder = Enum.SortOrder.LayoutOrder
                bFrameCorner.VerticalAlignment = Enum.VerticalAlignment.Center
                bFrameCorner.Padding = UDim.new(0, 3)

                TextButtonFrame.Name = "TextButtonFrame"
                TextButtonFrame.Parent = buttonFrame
                TextButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButtonFrame.BackgroundTransparency = 1.000
                TextButtonFrame.Size = UDim2.new(0, 325, 0, 37)

                TextButton.Parent = TextButtonFrame
                TextButton.BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                TextButton.Size = UDim2.new(1, 0, 1, 0)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Gotham
                TextButton.Text = bText
                TextButton.TextColor3 = Color3.fromRGB(25, 29, 31)
                TextButton.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = TextButton

                local clickDe = false
                local De = false

                TextButton.MouseButton1Down:Connect(function()
                    if not clickDe then
                        clickDe = true
                        TextButton.Parent:TweenSize(UDim2.new(0, 289,0, 30), "Out", "Quint", 0.18, true)
                        wait(0.8)
                        clickDe = false
                    end
                end)

                TextButton.MouseButton1Click:Connect(function()
                    if not De then
                        De = true
                        callback()
                        wait(0.8)
                        De = false
                    end
                end)

                TextButton.MouseButton1Up:Connect(function()
                    TextButton.Parent:TweenSize(UDim2.new(0, 325,0, 37), "Out", "Quint", 0.18, true)
                end)
                
                TextButton.MouseEnter:Connect(function()
                    game.TweenService:Create(TextButton, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(44, 118, 167)
                    }):Play()
                end)
                TextButton.MouseLeave:Connect(function()
                    game.TweenService:Create(TextButton, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                    }):Play()
                end)
            end

            function sowdStuff:SowdToggle(sInf, callback)
                sInf = sInf or "Toggle Me!"
                callback = callback or function() end

                local toggleFrame = Instance.new("Frame")
                local togList = Instance.new("UIListLayout")
                local ToggleFrame = Instance.new("Frame")
                local checkToggle = Instance.new("ImageButton")
                local toggleInfo = Instance.new("TextLabel")
                local togInnerList = Instance.new("UIListLayout")

                toggleFrame.Name = "toggleFrame"
                toggleFrame.Parent = section
                toggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleFrame.BackgroundTransparency = 1.000
                toggleFrame.BorderSizePixel = 0
                toggleFrame.Position = UDim2.new(0.0248538014, 0, 0.17289719, 0)
                toggleFrame.Size = UDim2.new(0, 325, 0, 37)

                togList.Name = "togList"
                togList.Parent = toggleFrame
                togList.FillDirection = Enum.FillDirection.Horizontal
                togList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                togList.SortOrder = Enum.SortOrder.LayoutOrder
                togList.VerticalAlignment = Enum.VerticalAlignment.Center
                togList.Padding = UDim.new(0, 5)

                ToggleFrame.Name = "ToggleFrame"
                ToggleFrame.Parent = toggleFrame
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleFrame.BackgroundTransparency = 1.000
                ToggleFrame.Size = UDim2.new(0, 325, 0, 37)

                checkToggle.Name = "checkToggle"
                checkToggle.Parent = ToggleFrame
                checkToggle.BackgroundTransparency = 1.000
                checkToggle.Size = UDim2.new(0, 25, 0, 25)
                checkToggle.ZIndex = 2
                checkToggle.Image = "rbxassetid://3926311105"
                checkToggle.ImageColor3 = Color3.fromRGB(58, 67, 72)
                checkToggle.ImageRectOffset = Vector2.new(940, 784)
                checkToggle.ImageRectSize = Vector2.new(48, 48)

                toggleInfo.Name = "toggleInfo"
                toggleInfo.Parent = ToggleFrame
                toggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleInfo.BackgroundTransparency = 1.000
                toggleInfo.Position = UDim2.new(0.0769230798, 0, 0.216216221, 0)
                toggleInfo.Size = UDim2.new(0, 295, 0, 21)
                toggleInfo.Font = Enum.Font.Gotham
                toggleInfo.Text = "Toggle"
                toggleInfo.TextColor3 = Color3.fromRGB(58, 67, 72)
                toggleInfo.TextSize = 14.000
                toggleInfo.TextXAlignment = Enum.TextXAlignment.Left

                togInnerList.Name = "togInnerList"
                togInnerList.Parent = ToggleFrame
                togInnerList.FillDirection = Enum.FillDirection.Horizontal
                togInnerList.SortOrder = Enum.SortOrder.LayoutOrder
                togInnerList.VerticalAlignment = Enum.VerticalAlignment.Center
                togInnerList.Padding = UDim.new(0, 5)

                local tog = false
                local debounce = false
                local clickDe = false

                checkToggle.MouseButton1Down:Connect(function()
                    if not debounce then
                        debounce = true
                        checkToggle.Parent:TweenSize(UDim2.new(0, 314,0, 36), "Out", "Linear", 0.18, true)
                        wait(0.5)
                        debounce = false
                    end
                end)
                checkToggle.MouseButton1Up:Connect(function()
                    checkToggle.Parent:TweenSize(UDim2.new(0, 325,0, 37), "Out", "Linear", 0.18, true)
                end)

                checkToggle.MouseButton1Click:Connect(function()
                    if not clickDe then
                        clickDe = true
                        callback(tog)
                        tog =  not tog
                        if  tog then
                            checkToggle.Image = "rbxassetid://3926311105"
                            checkToggle.ImageRectOffset = Vector2.new(4, 836)
                            checkToggle.ImageRectSize = Vector2.new(48, 48)
                            game.TweenService:Create(checkToggle, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageColor3 = Color3.fromRGB(64, 169, 243)
                            }):Play()
                            game.TweenService:Create(checkToggle.Parent.toggleInfo, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                TextColor3 = Color3.fromRGB(64, 169, 243)
                            }):Play()
                        else
                            checkToggle.Image = "rbxassetid://3926311105"
                            checkToggle.ImageRectOffset = Vector2.new(940, 784)
                            checkToggle.ImageRectSize = Vector2.new(48, 48)
                            game.TweenService:Create(checkToggle, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageColor3 = Color3.fromRGB(39, 45, 48)
                            }):Play()
                            game.TweenService:Create(checkToggle.Parent.toggleInfo, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                TextColor3 = Color3.fromRGB(39, 45, 48)
                            }):Play()
                        end
                        wait(0.5)
                        clickDe = false
                    end
                end)
            end

            function sowdStuff:SowdTextBox(plText, callback)
                plText = plText or "Type Here"
                callback = callback or function() end

                local textBoxFrame = Instance.new("Frame")
                local togList = Instance.new("UIListLayout")
                local TextBoxFrame = Instance.new("Frame")
                local togInnerList = Instance.new("UIListLayout")
                local TextBox = Instance.new("TextBox")
                local UICorner = Instance.new("UICorner")
                local textBoxListInner = Instance.new("UIListLayout")
                local textboxLine = Instance.new("Frame")
                local lineList = Instance.new("UIListLayout")
                local textboxLine1 = Instance.new("Frame")

                textBoxFrame.Name = "textBoxFrame"
                textBoxFrame.Parent = section
                textBoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                textBoxFrame.BackgroundTransparency = 1.000
                textBoxFrame.BorderSizePixel = 0
                textBoxFrame.Position = UDim2.new(0.0248538014, 0, 0.17289719, 0)
                textBoxFrame.Size = UDim2.new(0, 325, 0, 37)

                togList.Name = "togList"
                togList.Parent = textBoxFrame
                togList.FillDirection = Enum.FillDirection.Horizontal
                togList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                togList.SortOrder = Enum.SortOrder.LayoutOrder
                togList.VerticalAlignment = Enum.VerticalAlignment.Center
                togList.Padding = UDim.new(0, 5)

                TextBoxFrame.Name = "TextBoxFrame"
                TextBoxFrame.Parent = textBoxFrame
                TextBoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxFrame.BackgroundTransparency = 1.000
                TextBoxFrame.Size = UDim2.new(0, 325, 0, 37)

                togInnerList.Name = "togInnerList"
                togInnerList.Parent = TextBoxFrame
                togInnerList.FillDirection = Enum.FillDirection.Horizontal
                togInnerList.SortOrder = Enum.SortOrder.LayoutOrder
                togInnerList.VerticalAlignment = Enum.VerticalAlignment.Center
                togInnerList.Padding = UDim.new(0, 5)

                TextBox.Parent = TextBoxFrame
                TextBox.BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                TextBox.BackgroundTransparency = 1.000
                TextBox.ClipsDescendants = true
                TextBox.Position = UDim2.new(0, 0, 0.148648649, 0)
                TextBox.Size = UDim2.new(0, 324, 0, 26)
                TextBox.ClearTextOnFocus = false
                TextBox.Font = Enum.Font.Gotham
                TextBox.PlaceholderColor3 = Color3.fromRGB(58, 67, 72)
                TextBox.PlaceholderText = plText
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(64, 169, 243)
                TextBox.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = TextBox

                textBoxListInner.Name = "textBoxListInner"
                textBoxListInner.Parent = TextBox
                textBoxListInner.HorizontalAlignment = Enum.HorizontalAlignment.Center
                textBoxListInner.SortOrder = Enum.SortOrder.LayoutOrder
                textBoxListInner.VerticalAlignment = Enum.VerticalAlignment.Bottom

                textboxLine.Name = "textboxLine"
                textboxLine.Parent = TextBox
                textboxLine.BackgroundColor3 = Color3.fromRGB(58, 67, 72)
                textboxLine.BorderSizePixel = 0
                textboxLine.Position = UDim2.new(0, 0, 0.961538434, 0)
                textboxLine.Size = UDim2.new(1, 0, 0.0384615399, 0)

                lineList.Name = "lineList"
                lineList.Parent = textboxLine
                lineList.FillDirection = Enum.FillDirection.Horizontal
                lineList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                lineList.SortOrder = Enum.SortOrder.LayoutOrder
                lineList.VerticalAlignment = Enum.VerticalAlignment.Center

                textboxLine1.Name = "textboxLine1"
                textboxLine1.Parent = textboxLine
                textboxLine1.BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                textboxLine1.BorderSizePixel = 0
                textboxLine1.Position = UDim2.new(0.405405402, 0, 0, 0)
                textboxLine1.Size = UDim2.new(0, 0, 1, 0)
                textboxLine1.ZIndex = 2

                TextBox.Focused:Connect(function()
                    game.TweenService:Create(TextBox.textboxLine.textboxLine1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(1,0,1,0)
                    }):Play()
                    game.TweenService:Create(TextBox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextColor3 = Color3.fromRGB(64, 169, 243)
                    }):Play()
                end)

                TextBox.FocusLost:Connect(function(EnterPressed)
                    if not EnterPressed then 
                        game.TweenService:Create(TextBox.textboxLine.textboxLine1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Size = UDim2.new(0, 0,1, 0)
                        }):Play()
                        game.TweenService:Create(TextBox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            TextColor3 = Color3.fromRGB(58, 67, 72)
                        }):Play()
                    else
                        game.TweenService:Create(TextBox.textboxLine.textboxLine1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Size = UDim2.new(0, 0,1, 0)
                        }):Play()
                        game.TweenService:Create(TextBox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            TextColor3 = Color3.fromRGB(58, 67, 72)
                        }):Play()
                        callback(TextBox.Text)
                        wait(0.18)
                        TextBox.Text = ""  
                    end
                end)
            end

            function sowdStuff:SowdKeyBind(kin, first, callback)
                kin = kin or "Key"
                local oldKey = first.Name
                callback = callback or function() end

                local keybindFrame = Instance.new("Frame")
                local togList = Instance.new("UIListLayout")
                local KeyBindFrame = Instance.new("Frame")
                local togInnerList = Instance.new("UIListLayout")
                local keybindFrameOutline = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local keyBind = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local keyinnerList = Instance.new("UIListLayout")
                local keyinfo = Instance.new("TextLabel")

                keybindFrame.Name = "keybindFrame"
                keybindFrame.Parent = section
                keybindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                keybindFrame.BackgroundTransparency = 1.000
                keybindFrame.BorderSizePixel = 0
                keybindFrame.Position = UDim2.new(0.0248538014, 0, 0.17289719, 0)
                keybindFrame.Size = UDim2.new(0, 325, 0, 37)

                togList.Name = "togList"
                togList.Parent = keybindFrame
                togList.FillDirection = Enum.FillDirection.Horizontal
                togList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                togList.SortOrder = Enum.SortOrder.LayoutOrder
                togList.VerticalAlignment = Enum.VerticalAlignment.Center
                togList.Padding = UDim.new(0, 5)

                KeyBindFrame.Name = "KeyBindFrame"
                KeyBindFrame.Parent = keybindFrame
                KeyBindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeyBindFrame.BackgroundTransparency = 1.000
                KeyBindFrame.Size = UDim2.new(0, 325, 0, 37)

                togInnerList.Name = "togInnerList"
                togInnerList.Parent = KeyBindFrame
                togInnerList.FillDirection = Enum.FillDirection.Horizontal
                togInnerList.SortOrder = Enum.SortOrder.LayoutOrder
                togInnerList.VerticalAlignment = Enum.VerticalAlignment.Center
                togInnerList.Padding = UDim.new(0, 7)

                keybindFrameOutline.Name = "keybindFrameOutline"
                keybindFrameOutline.Parent = KeyBindFrame
                keybindFrameOutline.BackgroundColor3 = Color3.fromRGB(58, 67, 72)
                keybindFrameOutline.Position = UDim2.new(0, 0, 0.148648649, 0)
                keybindFrameOutline.Size = UDim2.new(0, 68, 0, 26)

                UICorner.CornerRadius = UDim.new(0, 3)
                UICorner.Parent = keybindFrameOutline

                keyBind.Name = "keyBind"
                keyBind.Parent = keybindFrameOutline
                keyBind.BackgroundColor3 = Color3.fromRGB(25, 29, 31)
                keyBind.Position = UDim2.new(0.0125000002, 0, 0.0384615399, 0)
                keyBind.Size = UDim2.new(0, 64, 0, 22)
                keyBind.AutoButtonColor = false
                keyBind.Font = Enum.Font.GothamSemibold
                keyBind.Text = oldKey
                keyBind.TextColor3 = Color3.fromRGB(58, 67, 72)
                keyBind.TextSize = 18.000

                UICorner_2.CornerRadius = UDim.new(0, 1)
                UICorner_2.Parent = keyBind

                keyinnerList.Name = "keyinnerList"
                keyinnerList.Parent = keybindFrameOutline
                keyinnerList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                keyinnerList.SortOrder = Enum.SortOrder.LayoutOrder
                keyinnerList.VerticalAlignment = Enum.VerticalAlignment.Center

                keyinfo.Name = "keyinfo"
                keyinfo.Parent = KeyBindFrame
                keyinfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                keyinfo.BackgroundTransparency = 1.000
                keyinfo.Position = UDim2.new(0.22461538, 0, 0.216216221, 0)
                keyinfo.Size = UDim2.new(0, 243, 0, 21)
                keyinfo.Font = Enum.Font.Gotham
                keyinfo.Text = kin
                keyinfo.TextColor3 = Color3.fromRGB(58, 67, 72)
                keyinfo.TextSize = 14.000
                keyinfo.TextXAlignment = Enum.TextXAlignment.Left

                keyBind.MouseButton1Click:connect(function(e) 
                    keyBind.Text = ". . ."
                    game.TweenService:Create(keybindFrameOutline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                        BackgroundColor3 = Color3.fromRGB(58, 67, 72)
                    }):Play()
                    game.TweenService:Create(keyBind, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                        TextColor3 = Color3.fromRGB(58, 67, 72)
                    }):Play()
                    local a, b = game:GetService('UserInputService').InputBegan:wait();
                    if a.KeyCode.Name ~= "Unknown" then
                        keyBind.Text = a.KeyCode.Name
                        oldKey = a.KeyCode.Name;
                        game.TweenService:Create(keybindFrameOutline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                        }):Play()
                        game.TweenService:Create(keyBind, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            TextColor3 = Color3.fromRGB(64, 169, 243)
                        }):Play()
                    end
                end)
        
                game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
                    if not ok then 
                        if current.KeyCode.Name == oldKey then 
                            callback()
                        end
                    end
                end)
            end

            function sowdStuff:SowdSlider(sIn, maxvalue, minvalue, callback)
                sIn = sIn or "SLider"
                maxvalue = maxvalue or 500
                minvalue = minvalue or 0

                local sliderFrame = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local SliderFrame = Instance.new("Frame")
                local sliderBtn = Instance.new("TextButton")
                local sliderDrag = Instance.new("Frame")
                local sliderDragList = Instance.new("UIListLayout")
                local sliderValueTriangle = Instance.new("ImageLabel")
                local value = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")
                local slidervallList = Instance.new("UIListLayout")
                local sliderdragvalpad = Instance.new("UIPadding")
                local sliderDragPadding = Instance.new("UIPadding")
                local UICorner_2 = Instance.new("UICorner")
                local sliderListInner = Instance.new("UIListLayout")
                local UICorner_3 = Instance.new("UICorner")
                local sliderList = Instance.new("UIListLayout")
                local sliderInfo = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")

                sliderFrame.Name = "sliderFrame"
                sliderFrame.Parent = section
                sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sliderFrame.BackgroundTransparency = 1.000
                sliderFrame.BorderSizePixel = 0
                sliderFrame.Position = UDim2.new(0.0234604105, 0, 0.617760599, 0)
                sliderFrame.Size = UDim2.new(0, 325, 0, 37)

                UIListLayout.Parent = sliderFrame
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                UIListLayout.Padding = UDim.new(0, 3)

                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = sliderFrame
                SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderFrame.BackgroundTransparency = 1.000
                SliderFrame.Size = UDim2.new(0, 325, 0, 37)

                sliderBtn.Name = "sliderBtn"
                sliderBtn.Parent = SliderFrame
                sliderBtn.BackgroundColor3 = Color3.fromRGB(29, 33, 36)
                sliderBtn.BorderSizePixel = 0
                sliderBtn.Position = UDim2.new(0, 0, 0.378378391, 0)
                sliderBtn.Size = UDim2.new(0, 135, 0, 9)
                sliderBtn.AutoButtonColor = false
                sliderBtn.Font = Enum.Font.SourceSans
                sliderBtn.Text = ""
                sliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                sliderBtn.TextSize = 14.000
                sliderBtn.ZIndex = 3

                sliderDrag.Name = "sliderDrag"
                sliderDrag.Parent = sliderBtn
                sliderDrag.BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                sliderDrag.BorderColor3 = Color3.fromRGB(64, 169, 243)
                sliderDrag.BorderSizePixel = 0
                sliderDrag.Size = UDim2.new(0, 0, 0, 9)
                sliderBtn.ZIndex = 2

                sliderDragList.Name = "sliderDragList"
                sliderDragList.Parent = sliderDrag
                sliderDragList.HorizontalAlignment = Enum.HorizontalAlignment.Right
                sliderDragList.SortOrder = Enum.SortOrder.LayoutOrder
                sliderDragList.VerticalAlignment = Enum.VerticalAlignment.Bottom

                sliderValueTriangle.Name = "sliderValueTriangle"
                sliderValueTriangle.Parent = sliderDrag
                sliderValueTriangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sliderValueTriangle.BackgroundTransparency = 1.000
                sliderValueTriangle.Size = UDim2.new(0, 35, 0, 26)
                sliderValueTriangle.Image = "rbxassetid://3926307971"
                sliderValueTriangle.ImageColor3 = Color3.fromRGB(64, 169, 243)
                sliderValueTriangle.ImageRectOffset = Vector2.new(324, 524)
                sliderValueTriangle.ImageRectSize = Vector2.new(36, 36)
                sliderValueTriangle.ImageTransparency = 1.000

                value.Name = "value"
                value.Parent = sliderValueTriangle
                value.BackgroundColor3 = Color3.fromRGB(64, 169, 243)
                value.BackgroundTransparency = 1.000
                value.Position = UDim2.new(0.0285714287, 0, -0.192307696, 0)
                value.Size = UDim2.new(0, 32, 0, 16)
                value.Font = Enum.Font.Gotham
                value.Text = "0%"
                value.TextColor3 = Color3.fromRGB(25, 29, 31)
                value.TextSize = 11.000
                value.TextTransparency = 1.000

                UICorner.CornerRadius = UDim.new(0, 2)
                UICorner.Parent = value

                slidervallList.Name = "slidervallList"
                slidervallList.Parent = sliderValueTriangle
                slidervallList.HorizontalAlignment = Enum.HorizontalAlignment.Right
                slidervallList.SortOrder = Enum.SortOrder.LayoutOrder
                slidervallList.VerticalAlignment = Enum.VerticalAlignment.Bottom

                sliderdragvalpad.Name = "sliderdragvalpad"
                sliderdragvalpad.Parent = sliderValueTriangle
                sliderdragvalpad.PaddingBottom = UDim.new(0, 14)
                sliderdragvalpad.PaddingRight = UDim.new(0, 2)

                sliderDragPadding.Name = "sliderDragPadding"
                sliderDragPadding.Parent = sliderDrag
                sliderDragPadding.PaddingRight = UDim.new(0, -15)

                UICorner_2.CornerRadius = UDim.new(0, 99)
                UICorner_2.Parent = sliderDrag

                sliderListInner.Name = "sliderListInner"
                sliderListInner.Parent = sliderBtn
                sliderListInner.SortOrder = Enum.SortOrder.LayoutOrder
                sliderListInner.VerticalAlignment = Enum.VerticalAlignment.Center

                UICorner_3.CornerRadius = UDim.new(0, 99)
                UICorner_3.Parent = sliderBtn

                sliderList.Name = "sliderList"
                sliderList.Parent = SliderFrame
                sliderList.FillDirection = Enum.FillDirection.Horizontal
                sliderList.SortOrder = Enum.SortOrder.LayoutOrder
                sliderList.VerticalAlignment = Enum.VerticalAlignment.Center
                sliderList.Padding = UDim.new(0, 5)

                sliderInfo.Name = "sliderInfo"
                sliderInfo.Parent = SliderFrame
                sliderInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sliderInfo.BackgroundTransparency = 1.000
                sliderInfo.Position = UDim2.new(0.430769235, 0, 0.229729727, 0)
                sliderInfo.Size = UDim2.new(0, 185, 0, 20)
                sliderInfo.Font = Enum.Font.Gotham
                sliderInfo.Text = "Slider"
                sliderInfo.TextColor3 = Color3.fromRGB(64, 169, 243)
                sliderInfo.TextSize = 14.000
                sliderInfo.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding.Parent = sliderFrame
                UIPadding.PaddingTop = UDim.new(0, 12)

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Value;

                sliderBtn.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 135) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    sliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 135), 0, 9)
                    moveconnection = mouse.Move:Connect(function()
                        local Percentage = (Value/ maxvalue) * 100
                        value.Text = math.floor(Percentage).."%"
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 135) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Value)
                        end)
                        sliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 135), 0, 9)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 135) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                callback(Value)
                            end)
                            Percentage = (Value/ maxvalue) * 100
                            value.Text = math.floor(Percentage).."%"
                            sliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 135), 0, 9)
                            game.TweenService:Create(value, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In),{
                                BackgroundTransparency = 1,
                                TextTransparency = 1
                            }):Play()
                            game.TweenService:Create(sliderValueTriangle, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In),{
                                ImageTransparency = 1
                            }):Play()
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                
                sliderBtn.MouseButton1Down:Connect(function()
                    game.TweenService:Create(value, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In),{
                        BackgroundTransparency = 0,
                        TextTransparency = 0
                    }):Play()
                    game.TweenService:Create(sliderValueTriangle, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.In),{
                        ImageTransparency = 0
                    }):Play()
                end)
            end

            function sowdStuff:SowdLabel(lin)
                lin = lin or "Okjei"

                local labelFrame = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local TextLabelFrame = Instance.new("Frame")
                local TextLabel = Instance.new("TextLabel")

                labelFrame.Name = "labelFrame"
                labelFrame.Parent = section
                labelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                labelFrame.BackgroundTransparency = 1.000
                labelFrame.BorderSizePixel = 0
                labelFrame.Position = UDim2.new(0.0248538014, 0, 0.17289719, 0)
                labelFrame.Size = UDim2.new(0, 325, 0, 37)

                UIListLayout.Parent = labelFrame
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                UIListLayout.Padding = UDim.new(0, 3)

                TextLabelFrame.Name = "TextLabelFrame"
                TextLabelFrame.Parent = labelFrame
                TextLabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabelFrame.BackgroundTransparency = 1.000
                TextLabelFrame.Size = UDim2.new(0, 325, 0, 37)

                TextLabel.Parent = TextLabelFrame
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Font = Enum.Font.Gotham
                TextLabel.Text = lin
                TextLabel.TextColor3 = Color3.fromRGB(64, 169, 243)
                TextLabel.TextSize = 16.000
            end

            function sowdStuff:SowdDropdown(din, list, callback)
                din = din or "Favorite Dick"
                list = list or {}
                callback = callback or function() end

                local dropdownFrame = Instance.new("Frame")
                local dropbtnslisting = Instance.new("UIListLayout")
                local dropDownFrameMain = Instance.new("Frame")
                local dropdownItem = Instance.new("TextLabel")
                local minHub = Instance.new("ImageButton")
                local UICorner = Instance.new("UICorner")

                local isDrop = false
                dropdownFrame.Name = "dropdownFrame"
                dropdownFrame.Parent = section
                dropdownFrame.BackgroundColor3 = Color3.fromRGB(29, 33, 36)
                dropdownFrame.BorderSizePixel = 0
                dropdownFrame.ClipsDescendants = true
                dropdownFrame.Position = UDim2.new(0.0234604105, 0, 0.457528949, 0)
                dropdownFrame.Size = UDim2.new(0, 325, 0, 37)

                dropbtnslisting.Name = "dropbtnslisting"
                dropbtnslisting.Parent = dropdownFrame
                dropbtnslisting.HorizontalAlignment = Enum.HorizontalAlignment.Center
                dropbtnslisting.SortOrder = Enum.SortOrder.LayoutOrder
                dropbtnslisting.Padding = UDim.new(0, 3)

                dropDownFrameMain.Name = "dropDownFrameMain"
                dropDownFrameMain.Parent = dropdownFrame
                dropDownFrameMain.BackgroundColor3 = Color3.fromRGB(29, 33, 36)
                dropDownFrameMain.BackgroundTransparency = 1.000
                dropDownFrameMain.Size = UDim2.new(0, 325, 0, 37)

                dropdownItem.Name = "dropdownItem"
                dropdownItem.Parent = dropDownFrameMain
                dropdownItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdownItem.BackgroundTransparency = 1.000
                dropdownItem.Position = UDim2.new(0.0399999991, 0, 0, 0)
                dropdownItem.Size = UDim2.new(0, 265, 0, 37)
                dropdownItem.Font = Enum.Font.Gotham
                dropdownItem.Text = din
                dropdownItem.TextColor3 = Color3.fromRGB(64, 169, 243)
                dropdownItem.TextSize = 14.000
                dropdownItem.TextXAlignment = Enum.TextXAlignment.Left

                minHub.Name = "minHub"
                minHub.Parent = dropDownFrameMain
                minHub.BackgroundTransparency = 1.000
                minHub.Position = UDim2.new(0.89538461, 0, 0.16216217, 0)
                minHub.Rotation = 180.000
                minHub.Size = UDim2.new(0, 25, 0, 25)
                minHub.ZIndex = 2
                minHub.Image = "rbxassetid://3926305904"
                minHub.ImageRectOffset = Vector2.new(44, 404)
                minHub.ImageRectSize = Vector2.new(36, 36)
                minHub.MouseButton1Click:Connect(function()
                    if not isDrop then
                        dropdownFrame:TweenSize(UDim2.new(0, 325, 0, dropbtnslisting.AbsoluteContentSize.Y + 7), "InOut", "Linear", 0.1)
                        game.TweenService:Create(minHub, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Rotation = 0
                        }):Play()
                        wait(0.1)
                        section:TweenSize(UDim2.new(0, 341, 0, itemsListing.AbsoluteContentSize.Y + 7), "InOut", "Linear", 0.1)
                        isDrop = true
                        wait(0.1)
                        UpdateSize()
                    else
                        dropdownFrame:TweenSize(UDim2.new(0, 325, 0, 37), "InOut", "Linear", 0.1)
                        game.TweenService:Create(minHub, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Rotation = 180
                        }):Play()
                        wait(0.1)
                        section:TweenSize(UDim2.new(0, 341, 0, itemsListing.AbsoluteContentSize.Y + 7), "InOut", "Linear", 0.1)
                        isDrop = false
                        wait(0.1)
                        UpdateSize()
                    end
                end)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = dropdownFrame

                for i,v in next, list do
                    local dropDownButtonFrame = Instance.new("Frame")
                    local dropdownButton = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")
                    local UIListLayout = Instance.new("UIListLayout")

                    dropDownButtonFrame.Name = "dropDownButtonFrame"
                    dropDownButtonFrame.Parent = dropdownFrame
                    dropDownButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    dropDownButtonFrame.BackgroundTransparency = 1.000
                    dropDownButtonFrame.Size = UDim2.new(0, 313, 0, 32)

                    dropdownButton.Name = "dropdownButton"
                    dropdownButton.Parent = dropDownButtonFrame
                    dropdownButton.BackgroundColor3 = Color3.fromRGB(25, 29, 31)
                    dropdownButton.BorderSizePixel = 0
                    dropdownButton.Position = UDim2.new(0.0184615385, 0, 0.718580842, 0)
                    dropdownButton.Size = UDim2.new(0, 313, 0, 32)
                    dropdownButton.AutoButtonColor = false
                    dropdownButton.Font = Enum.Font.Gotham
                    dropdownButton.Text = "  "..v
                    dropdownButton.TextColor3 = Color3.fromRGB(64, 169, 243)
                    dropdownButton.TextSize = 14.000
                    dropdownButton.TextXAlignment = Enum.TextXAlignment.Left
                    dropdownButton.MouseButton1Click:Connect(function()
                        dropdownItem.Text = v
                        callback(v)
                        dropdownFrame:TweenSize(UDim2.new(0, 325, 0, 37), "InOut", "Linear", 0.1)
                        game.TweenService:Create(minHub, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Rotation = 180
                        }):Play()
                        wait(0.1)
                        section:TweenSize(UDim2.new(0, 341, 0, itemsListing.AbsoluteContentSize.Y + 7), "InOut", "Linear", 0.1)
                        isDrop = false
                        wait(0.1)
                        UpdateSize()
                    end)

                    UICorner_2.CornerRadius = UDim.new(0, 5)
                    UICorner_2.Parent = dropdownButton

                    UIListLayout.Parent = dropDownButtonFrame
                    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    
                    local downDe = false

                    dropdownButton.MouseButton1Down:Connect(function()
                        if not downDe then
                            downDe = true
                            game.TweenService:Create(dropdownButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                Size = UDim2.new(0, 298,0, 28)
                            }):Play()
                            wait(0.5)
                            downDe = false
                        end
                    end)
                    dropdownButton.MouseButton1Up:Connect(function()
                        game.TweenService:Create(dropdownButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Size = UDim2.new(0, 313,0, 32)
                        }):Play()
                    end)
                    
                    dropdownButton.MouseEnter:Connect(function()
                        game.TweenService:Create(dropdownButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(21, 25, 27)
                        }):Play()
                    end)
                    
                    dropdownButton.MouseLeave:Connect(function()
                        game.TweenService:Create(dropdownButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(25, 29, 31)
                        }):Play()
                    end)
                end
            end
            return sowdStuff
        end
        return sectionStuff
    end
    return TabHandling
end

return Sowd
