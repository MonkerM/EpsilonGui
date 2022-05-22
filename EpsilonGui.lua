local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
--[[getgenv().test = Value
		if not test then return end]]--
local Window = OrionLib:MakeWindow({Name = "Epsilon Gui", HidePremium = false, SaveConfig = true, ConfigFolder = "EpsilonGui"})

local Tab = Window:MakeTab({
	Name = "Local Cheats",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddToggle({
	Name = "Mod Detection",
	Default = false,
	Callback = function(Value)
	getgenv().Mod = Value
	if not Mod then return end
	local plrs = game.Players:GetChildren()
	print("=============================== - "..#plrs.." Players")
	for i, v in pairs(game.Players:GetChildren()) do
		print(v.Name.."'s Rank is: "..v:GetRoleInGroup(12832629))
		if v:GetRoleInGroup(12832629) ~= "Guest" and v:GetRoleInGroup(12832629) ~= "Member" then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Mod Notifier";
				Text = "Mod, "..v.Name.." is in your game";
				Icon = "";
				Duration = 99999;
				Callback = bindableFunction;
				Button1 = "Leave";
				Button2 = "Ignore";
			})
		end
	end
	
	game.Players.PlayerAdded:Connect(function(player)
	    if not Mod then return end
		local plrs = game.Players:GetChildren()
		print("=============================== - "..#plrs.." Players")
		print(player.Name.."'s Rank is: "..player:GetRoleInGroup(12832629))
		if player:GetRoleInGroup(12832629) ~= "Guest" and player:GetRoleInGroup(12832629) ~= "Member" then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Mod Notifier";
				Text = "Mod, "..player.Name.." is in your game";
				Icon = "";
				Duration = 99999;
				Callback = bindableFunction;
				Button1 = "Leave";
				Button2 = "Ignore";
			})
		end
	end)
	end
}) --moddetector

Tab:AddToggle({
	Name = "No Fall",
	Default = false,
	Callback = function(Value)
		getgenv().noFall = Value
		if not noFall then game.Players.LocalPlayer.Character.FallDamage.Disabled = false; return end
		
		while noFall do
		task.wait()
        pcall(function()
        if not noFall then game.Players.LocalPlayer.Character.FallDamage.Disabled = false; return end
        repeat task.wait() if not noFall then game.Players.LocalPlayer.Character.FallDamage.Disabled = false; return end until game.Players.LocalPlayer.Character.FallDamage.Disabled == false
        game.Players.LocalPlayer.Character.FallDamage.Disabled = true
        end)
        end
	end    
}) --nofall

pcall(function() if real then return else getgenv().real = {} end end)
pcall(function() if copies then return else getgenv().copies = {} end end)
pcall(function() if nokb then return else getgenv().nokb = 0 end end)

Tab:AddToggle({
	Name = "No KillBricks",
	Default = false,
	Callback = function(Value)
    getgenv().noKillbricks = Value
	if not noKillbricks and nokb == 0 then return elseif not noKillbricks and nokb ~= 0 then reverse_1() return end
	local realParent = workspace.Map.KillBricks
	
	nokb = nokb + 1

    for i,v in pairs(workspace.Map.KillBricks:GetDescendants()) do
    if v:IsA("TouchTransmitter") or v:IsA("Script") then
        local copy = v.Parent:Clone()
        local temp = v.Parent
        copy.Parent = temp.Parent
        table.insert(copies, copy)
        temp.Parent = nil;
        table.insert(real, temp)
        print("hi")
    end
    end

    function reverse_1()
    --table.foreach(copies, function(a) a:Destroy() end)
    for i,v in pairs(copies) do
        v:Destroy()
        print("bye")
    end
    for i,v in pairs(real) do
        v.Parent = realParent
    end
    end
	end    
}) --nokb

Tab:AddToggle({
	Name = "AutoGrab Trinkets",
	Default = false,
	Callback = function(Value)
	
	getgenv().autoT = Value
	if not autoT then return end
	
	local rs = game:GetService("RunService")
	local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
	pcall(function() rs.RenderStepped:Connect(function()
	    if not autoT then return end
		for i, v in pairs(workspace.MouseIgnore:GetChildren()) do
			if v:IsA("Model") and v.Name ~= "Entity" then
				for _, g in pairs(v:GetDescendants()) do
					if g:IsA("ClickDetector") then
						if (plr.Position - g.Parent.Position).Magnitude <=18 then
							fireclickdetector(g)
						end
					end
				end
			end
		end
	end)
	end)
	end    
}) --AutoGrab Trinkets

Tab:AddToggle({
	Name = "No Fog",
	Default = false,
	Callback = function(Value)
		getgenv().noFog = Value
		if not noFog then return end
		
		pcall(function()
		while noFog do
		if not noFog then return end
        task.wait()
        game.Lighting.FogEnd = 1000000
        task.wait()
		end
        end)
	end    
}) --noFog

Tab:AddButton({
	Name = "Rejoin Server",
	Callback = function()
      		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
  	end    
})

Tab:AddButton({
	Name = "Unnamed-ESP",
	Callback = function()
      		loadstring(game:HttpGet(('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua')))()
  	end    
}) --Unnamed Esp

local Tab1 = Window:MakeTab({
	Name = "Movement",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

getgenv().flyHigh = 0
getgenv().flyBind = Enum.KeyCode.LeftAlt
getgenv().bananass = 6

Tab1:AddButton({
	Name = "Fly",
	Callback = function()
		if flyHigh == 0 then flyHigh = flyHigh + 1 elseif flyHigh ~= 0 then return end
		pcall(function() 
for i,v in pairs(getconnections(game:service'ScriptContext'.Error)) do 
    v:Disable();
end 
end)

local Settings = {
	
	Speed = bananass,
	SprintSpeed = 30,
	ToggleKey = flyBind,
	SprintKey = Enum.KeyCode.LeftControl,
	
	ForwardKey = Enum.KeyCode.W,
	LeftKey = Enum.KeyCode.A,
	BackwardKey = Enum.KeyCode.S,
	RightKey = Enum.KeyCode.D,
	UpKey = Enum.KeyCode.E,
	DownKey = Enum.KeyCode.Q,
	
}

local Screen = Instance.new("ScreenGui",game.CoreGui)
local Distance = Instance.new("TextLabel",Screen)
Distance.BackgroundTransparency = 1
Distance.Size = UDim2.new(0,10,0,10)
Distance.ZIndex = 2
Distance.Text = "0"
Distance.TextStrokeTransparency = .5
Distance.TextSize = 20
Distance.TextStrokeColor3 = Color3.fromRGB(33, 33, 33)
Distance.Font = Enum.Font.Gotham
Distance.TextColor3 = Color3.new(1,1,1)
Distance.TextXAlignment = Enum.TextXAlignment.Left
Distance.TextYAlignment = Enum.TextYAlignment.Top


local Mouse = game.Players.LocalPlayer:GetMouse()
local Direction = Vector3.new(0,0,0)
local InterpolatedDir = Direction
local Tilt = 0
local InterpolatedTilt = Tilt
local RunService = game:GetService("RunService")
local Toggled = false
local Sprinting = false
local CameraPos = game.Workspace.CurrentCamera.CFrame.Position

function Lerp(a, b, t)
    return a + (b - a) * t
end

local LastPos = nil

function KeyHandler(actionName, userInputState)
	if true and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		if actionName == "Toggle" and userInputState == Enum.UserInputState.Begin then
			Toggled = not Toggled
			if Toggled then
				LastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				--game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true 
			else
				LastPos = nil
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
				--game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		elseif actionName == "Forward" then
			Tilt = userInputState == Enum.UserInputState.Begin and -20 or 0
			Direction = Vector3.new(Direction.x,Direction.y,userInputState == Enum.UserInputState.Begin and -1 or 0)
		elseif actionName == "Left" then
			Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.y,Direction.z)
		elseif actionName == "Backward" then
			Tilt = userInputState == Enum.UserInputState.Begin and 20 or 0
			Direction = Vector3.new(Direction.x,Direction.y,userInputState == Enum.UserInputState.Begin and 1 or 0)
		elseif actionName == "Right" then
			Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and 1 or 0,Direction.y,Direction.z)
		elseif actionName == "Up" then
			Direction = Vector3.new(Direction.x,userInputState == Enum.UserInputState.Begin and 1 or 0,Direction.z)
		elseif actionName == "Down" then
			Direction = Vector3.new(Direction.x,userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.z)
		elseif actionName == "Sprint" then
			Sprinting = userInputState == Enum.UserInputState.Begin
		end
	end
end



game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	
	if inputObject.KeyCode == Settings.ToggleKey then
		KeyHandler("Toggle", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.ForwardKey then
		KeyHandler("Forward", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.LeftKey then
		KeyHandler("Left", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.BackwardKey then
		KeyHandler("Backward", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.RightKey then
		KeyHandler("Right", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.UpKey then	
		KeyHandler("Up", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.DownKey then
		KeyHandler("Down", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.SprintKey then
		KeyHandler("Sprint", Enum.UserInputState.Begin, inputObject)
	end
	
	
end)


game:GetService("UserInputService").InputEnded:connect(function(inputObject, gameProcessedEvent)
	
	if inputObject.KeyCode == Settings.ToggleKey then
		KeyHandler("Toggle", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.ForwardKey then
		KeyHandler("Forward", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.LeftKey then
		KeyHandler("Left", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.BackwardKey then
		KeyHandler("Backward", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.RightKey then
		KeyHandler("Right", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.UpKey then	
		KeyHandler("Up", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.DownKey then
		KeyHandler("Down", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.SprintKey then
		KeyHandler("Sprint", Enum.UserInputState.End, inputObject)
	end
	
	
end)


RunService.RenderStepped:Connect(function()
	if Toggled and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Velocity = Vector3.new(0,0,0)
			end
		end
		local RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
		if LastPos then
			Distance.Text = math.floor((LastPos-RootPart.Position).Magnitude+.5)
			if (LastPos-RootPart.Position).Magnitude >= 350 then
				Distance.TextColor3 = Color3.new(1,0,0)
			else
				Distance.TextColor3 = Color3.new(1,1,1)	
			end
		else
			Distance.TextColor3 = Color3.new(1,1,1)
			Distance.Text = 0
		end
		InterpolatedDir = InterpolatedDir:Lerp((Direction * (Sprinting and Settings.SprintSpeed or Settings.Speed)),.2)
		InterpolatedTilt = Lerp(InterpolatedTilt ,Tilt* (Sprinting and 2 or 1),Tilt == 0 and .2 or .1)
		RootPart.CFrame = RootPart.CFrame:Lerp(CFrame.new(RootPart.Position,RootPart.Position + Mouse.UnitRay.Direction) * CFrame.Angles(0,math.rad(00),0) * CFrame.new(InterpolatedDir)  * CFrame.Angles(math.rad(InterpolatedTilt),0,0),.2)
	else
		Distance.TextColor3 = Color3.new(1,1,1)
		Distance.Text = 0
	end	
end)
	end    
})

Tab1:AddButton({
	Name = "Set Fly Bind",
	Callback = function()
      		game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
    	   		if inputObject.KeyCode ~= Enum.KeyCode.Unknown then 
    	   		    flyBind = inputObject.KeyCode
    	   		    return
    	   		end
	        end)
  	end    
})

Tab:AddSlider({
	Name = "Fly Speed",
	Min = 0,
	Max = 20,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
		bananass = Value
	end    
})

Tab1:AddParagraph("Fly Info","Default: LeftAlt for Fly (SET BIND BEFORE PRESSING FLY)")

getgenv().noCliph = false

Tab1:AddBind({
	Name = "NoClip",
	Default = Enum.KeyCode.H,
	Hold = false,
	Save = true,
	Flag = "noClipBind",
	Callback = function()
	        getgenv().noCliph = not getgenv().noCliph
      		local nckey = "h";
local nclip = false;
local lp = game.Players.LocalPlayer
local ms = lp:GetMouse()
local rm = getrawmetatable(game)
local index = rm.__index
local bv = Instance.new("BoolValue");
bv.Value = false;
setreadonly(rm,false)

rm.__index = function(self,j)
   if tostring(self) == "Part" and tostring(j) == "Anchored" then
       return index(bv,"Value")
end
   return index(self,j)
end


game:GetService("RunService").Stepped:Connect(function()
   if noCliph == true then
       --[[lp.Character.PlayerHair.Handle.CanCollide = false
       lp.Character.Head.CanCollide = false
       lp.Character.Torso.CanCollide = false]]--
        for i,v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                v.CanCollide = false
            end
        end
   end
end);

--[[ms.KeyDown:Connect(function(k)
   if k == nckey then
       nclip = not nclip
   end
end)]]--
  	end    
})

Tab1:AddParagraph("Noclip Info","Bind is h")

local Tab2 = Window:MakeTab({
	Name = "Automation",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddLabel("ALWAYS HAVE NO KILLBRICKS ON WHEN USING THESE")

Tab2:AddButton({
	Name = "Auto-Catacomb",
	Callback = function()
      		local speed = 200
local captchaArea = CFrame.new(-1298,-1554,-326)
local triMid = CFrame.new(-457,-1501,-143)
local diaDoor = {CFrame.new(-367,-1554,-300),CFrame.new(-450,-1570,-331)}
local squareGame = CFrame.new(-204,-1716,-603)
local ancientWind = CFrame.new(118,-1711,-530)
local firstRoom = {CFrame.new(-114,-1588,-201),CFrame.new(-116,-1588,-146),CFrame.new(-769,-1577,-196),CFrame.new(-769,-1577,-135),CFrame.new(-428,-1499,-44),CFrame.new(-485,-1499,-43)}
local midHall = {CFrame.new(-456,-1570,-375),CFrame.new(-390,-1570,-361),CFrame.new(-447,-1570,-414),CFrame.new(-419,-1696,-459),CFrame.new(-430,-1705,-471),CFrame.new(-399,-1690,-461)}
local squareRoom = {CFrame.new(-223,-1714,-493),CFrame.new(-170,-1698,-442),CFrame.new(-20,-1692,-401),CFrame.new(-26,-1685,-479),CFrame.new(6,-1689,-460),CFrame.new(0,-1688,-459),CFrame.new(22,-1690,-413)}
local preBall = {CFrame.new(-5,-1700,-504),CFrame.new(-22,-1700,-503),CFrame.new(-26,-1675,-519)}
local ballRoom = {CFrame.new(327,-1733,-558),CFrame.new(365,-1727,-563),CFrame.new(366,-1727,-487)}
  local player = game.Players.LocalPlayer
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local orgPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame


local function tweenLoc(loc)
    local destination = loc
    local NewPoint = destination.Position
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart

    local tween = game:GetService('TweenService'):Create(hrp, TweenInfo.new((hrp.Position - NewPoint).magnitude / speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out, 0,false,0), {CFrame = destination})
    tween:Play()
    tween.Completed:wait()
end

local function getDia()
    local current = ""
local current1 = ""
local currentp1 = ""
local currentp2 = ""
local currentp3 = ""
local full = ""
local function closeDia()
    local b = game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option.OptionButton

    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, true, game, 0)
    task.wait()
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, false, game, 0)
end
local function parse()
    current1 = current1:gsub("...<i><b>", "")
    current1 = current1:gsub("<i><b>", "")
    current1 = current1:gsub("</b></i>...", "")
    current1 = current1:gsub("</b></i>", "")
end
local function thing(w)
local wh = 0
fireclickdetector(game:GetService("Workspace").Map.dungeonThingIdk[w].ClickDetector)
pcall(function() repeat task.wait() until game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
task.wait(0.3)
closeDia()
current = game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.DialogueText.Text
current1 = game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.DialogueText.Text
parse()

if current:match("...<i><b>") and current:match("</b></i>...") then currentp2 = current1 elseif current:match("...<i><b>") then currentp3 = current1 elseif current:match("</b></i>...") then currentp1 = current1 end
end

thing("BoardA")
closeDia()
pcall(function() repeat task.wait() until not game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
thing("BoardB")
closeDia()
pcall(function() repeat task.wait() until not game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
thing("BoardC")
closeDia()

full = currentp1..currentp2..currentp3

require(game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain).MessagePosted:fire(full)
end

local function doSquare()
    -- game:GetService("Workspace").Map.dungeonThingIdk.touchBricks
-- game:GetService("Workspace").Map.dungeonThingIdk.touchLegend

local orgpos = game.Players.LocalPlayer.Character.Head.CFrame
local player = game.Players.LocalPlayer
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local fbrick = game:GetService("Workspace").Map.dungeonThingIdk.touchBricks[1]
function Tween(Destination, speed)
    if not typeof(Destination) == "CFrame" then New_CFrame = Destination.CFrame else New_CFrame = Destination end 

    local ts = game:GetService('TweenService')
    local char = game.Players.LocalPlayer.Character
    local part = char.HumanoidRootPart
    local ti = TweenInfo.new((part.Position-Destination.Position).magnitude/speed, Enum.EasingStyle.Linear) 
    local tp = {CFrame = New_CFrame}
    ts:Create(part, ti, tp):Play()
end

orgpos = hrp.CFrame

for i,v in pairs(game:GetService("Workspace").Map.dungeonThingIdk.touchLegend:GetChildren()) do
    if v:IsA("BasePart") and v.Color and v.Color == Color3.fromRGB(255, 102, 204) then
        if game:GetService("Workspace").Map.dungeonThingIdk.touchBricks[v.Name].Color ~= Color3.fromRGB(255, 102, 204) then
        local brick = game:GetService("Workspace").Map.dungeonThingIdk.touchBricks[v.Name].CFrame
        pcall(function() repeat task.wait(); hrp.CFrame = CFrame.new(brick.X, hrp.Position.Y + 16, brick.Z); task.wait(0.25) until game:GetService("Workspace").Map.dungeonThingIdk.touchBricks[v.Name].Color == Color3.fromRGB(255, 102, 204) end)
        hrp.CFrame = orgpos
        end
    end
end
        pcall(function() repeat task.wait(); hrp.CFrame = CFrame.new(fbrick.Position.X, hrp.Position.Y + 16, fbrick.Position.Z); task.wait(0.25) until fbrick.Color == Color3.fromRGB(0, 255, 0) end)
end

local function openCas()
    wait(0.075)
    for i,v in pairs(game.Workspace.Map.dungeonThingIdk.Caskets:GetDescendants()) do 
    if v.Name == "Casket" and (hrp.Position - v.MainPartCasket.Position).magnitude <= 71 then 
    fireproximityprompt(v.casketTOP.Union.ProximityPrompt)
    end
    end 
    wait(0.1)
end

if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-367,-1554,-300)).magnitude > 200 then
    tweenLoc(captchaArea)
    return
end

tweenLoc(diaDoor[1])
wait(0.1)
tweenLoc(diaDoor[2])
getDia()
wait(0.25)
tweenLoc(diaDoor[1])
openCas()
tweenLoc(triMid)

for i,v in pairs(firstRoom) do
    tweenLoc(v)
    openCas()
    tweenLoc(triMid)
    wait(0.1)
end

tweenLoc(diaDoor[2])

for i,v in pairs(midHall) do
    tweenLoc(v)
    openCas()
end

tweenLoc(squareGame)
doSquare()

for i,v in pairs(squareRoom) do
    tweenLoc(v)
    openCas()
end

tweenLoc(ancientWind)

for i,v in pairs(preBall) do
    tweenLoc(v)
    openCas()
end

tweenLoc(ancientWind)

for i,v in pairs(ballRoom) do
    tweenLoc(v)
    openCas()
end

tweenLoc(ancientWind)

fireproximityprompt(game:GetService("Workspace").Map.dungeonThingIdk.ancientWind.ProximityPrompt)
  	end    
})

Tab2:AddParagraph("Auto-Catacomb","Brings to Catpcha from anywhere & runs up until ball while collecting all caskets")

Tab2:AddButton({
	Name = "Entrance Eyes",
	Callback = function()
      		fireclickdetector(game:GetService("Workspace").EYEBALLS.ClickEyes.Eye1.ClickDetector)

            fireclickdetector(game:GetService("Workspace").EYEBALLS.ClickEyes.Eye2.ClickDetector)

            fireclickdetector(game:GetService("Workspace").EYEBALLS.ClickEyes.Eye3.ClickDetector)
  	end    
})

Tab2:AddButton({
	Name = "Ceeris Eyes",
	Callback = function()
      		function CreateESPPart(BodyPart,color)
local ESPPartparent = BodyPart
local Box = Instance.new("BoxHandleAdornment")
Box.Size = BodyPart.Size + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPartMe"
Box.Adornee = ESPPartparent
Box.Color3 = color
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = BodyPart
end

for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "ESPPartMe" then
        v:Destroy()
    end
end

pcall(function()
for i,v in pairs(game:GetService("Workspace").EyeList:GetDescendants()) do
    if v:IsA("ClickDetector") then
        for i2,v2 in pairs(v.Parent:GetDescendants()) do
            if v2:IsA("Part") or v2:IsA("UnionOperation") then
            CreateESPPart(v2, Color3.fromRGB(255,0,0))
            end
        end
    end
end
end)
  	end    
})

Tab2:AddButton({
	Name = "Eth Race Reroll",
	Callback = function()
      		local function closeDia()
    local b = game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option.OptionButton

    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, true, game, 0)
    task.wait()
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, false, game, 0)
end

if game:GetService("Players").LocalPlayer.Data.Silver >= 6000 then
pcall(function()
fireclickdetector(game:GetService("Workspace").Map.Eth.Reroller2.ClickDetector)
pcall(function() repeat task.wait() until game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
end)
end
  	end    
})

Tab2:AddButton({
	Name = "Purg Race Reroll (THIS WIPES YOU)",
	Callback = function()
      		local function closeDia()
    local b = game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option.OptionButton

    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, true, game, 0)
    task.wait()
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, false, game, 0)
end

if game:GetService("Players").LocalPlayer.Data.Silver >= 6000 and game:GetService("Players").LocalPlayer.Data.Lives == 0 then
pcall(function()
fireclickdetector(game:GetService("Workspace").NPCs.Misc.Reroller.ClickDetector)
pcall(function() repeat task.wait() until game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
end)
end
  	end    
})

Tab2:AddButton({
	Name = "Auto Kizaru (3100 Silver)",
	Callback = function()
      		local function closeDia()
    local b = game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option.OptionButton

    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, true, game, 0)
    task.wait()
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b.AbsolutePosition.X+b.AbsoluteSize.X/2, b.AbsolutePosition.Y+36+b.AbsoluteSize.Y/2, 0, false, game, 0)
end

pcall(function()
fireclickdetector(game:GetService("Workspace").NPCs.Trainers.Gordon.ClickDetector)
pcall(function() repeat task.wait() until game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
end)

pcall(function() repeat task.wait() until not game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
task.wait(1)

pcall(function()
fireclickdetector(game:GetService("Workspace").NPCs.Trainers.pika["m\\"].ClickDetector)
pcall(function() repeat task.wait() until game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Option end)
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
task.wait(0.225)
closeDia()
end)
  	end    
})

Tab2:AddToggle({
	Name = "Auto Artifact",
	Default = false,
	Callback = function(Value)
		getgenv().autoArti = Value
		if not autoArti then return end
		while task.wait() do
		game:GetService("ReplicatedStorage").RerollArtifact:FireServer()
		if not autoArti then return end
		end
	end    
})

--[[Tab2:AddToggle({
	Name = "Auto Bulk-Sell",
	Default = false,
	Callback = function(Value)
		getgenv().autoBulk = Value
		if not autoBulk then return end
		while task.wait() do
		game:GetService("ReplicatedStorage").BulkSell:FireServer()
		if not autoBulk then return end
		end
	end    
})]]--

Tab2:AddButton({
	Name = "Drop (Quicker than normal but don't spam)",
	Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild(what) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(what),
        }

        game:GetService("Players").LocalPlayer.PlayerGui.Main.Drop.DropItem:FireServer(unpack(args))

  	end    
})

Tab2:AddTextbox({
	Name = "Item to Drop",
	Default = "Heirloom",
	TextDisappear = true,
	Callback = function(Value)
		getgenv().what = Value
	end	  
})

--[[local Tab3 = Window:MakeTab({
	Name = "Spectate",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

getgenv().OptionsP = {}

for i,v in pairs(game.Players:GetChildren()) do
    table.insert(OptionsP, v)
end

Tab3:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = OptionsP,
	Callback = function(Value)
		print(Value)
	end    
})]]--

OrionLib:Init()
