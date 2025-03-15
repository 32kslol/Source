-- // coded a long time ago for "average day in america" or something like that



if not game:IsLoaded() then
    task.wait(15)
    printing("Waiting for game to load...")
end

_G.Kill = false
_G.KillAll = false
local User = game.Players.LocalPlayer

local getinfo = getinfo or debug.getinfo
local DEBUG = false
local Hooked = {}
local Detected, Kill

local function manipulate(Name, Value, Weapon)
    if Weapon and Value and Name then
    setreadonly(require(game:GetService("Players").LocalPlayer.Character[Weapon].Setting["1"]), false)
    local setting = require(game:GetService("Players").LocalPlayer.Character[Weapon].Setting["1"])
    setting[Name] = Value
    setreadonly(require(game:GetService("Players").LocalPlayer.Character[Weapon].Setting["1"]), true)
    end
end

function IsNetworkOwner2(Part)
    if Part.ReceiveAge == 0 and gethiddenproperty(Part,"NetworkIsSleeping") == true then
        return false
    elseif Part.ReceiveAge == 0 and gethiddenproperty(Part,"NetworkIsSleeping") == false then
        return true
    end
end


setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
    
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            
            local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    if DEBUG then
                        warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
                    end
                end
                
                return true
            end)

            table.insert(Hooked, Detected)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            local Old; Old = hookfunction(Kill, function(Info)
                if DEBUG then
                    warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
                end
            end)

            table.insert(Hooked, Kill)
        end
    end
end

local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...

    if Detected and LevelOrFunc == Detected then
        if DEBUG then
            warn(`zins | adonis bypassed`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return Old(...)
end))
-- setthreadidentity(9)
setthreadidentity(7)




oldcframe = User.Character.HumanoidRootPart.CFrame;
User.Character.HumanoidRootPart.CFrame = CFrame.new(6266.466796875, 7455.5791015625, 9259.4736328125);
task.wait(1.5)
User.Character.HumanoidRootPart.CFrame = CFrame.new(5621.4873, 7465.35742, 8900.54395);
User.Character.HumanoidRootPart.Anchored = true;
task.wait(1.5);
User.Character.HumanoidRootPart.CFrame = CFrame.new(6585.31201, 7488.58936, 9134.98242);
task.wait(1.5);
User.Character.HumanoidRootPart.CFrame = CFrame.new(3511.18677, 7502.60205, 13566.6211);
task.wait(1)
task.wait(0.5)
User.Character.HumanoidRootPart.CFrame = oldcframe;
User.Character.HumanoidRootPart.Anchored = false; --/ temp fix for load full map until bypass :(

for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == "Image" and v:FindFirstChild("ProximityPrompt") and v:FindFirstChild("ProximityPrompt").ObjectText == "Spray Paint" then
v.Name = "SprayPaintBuy"
elseif v.Name == "Image" and v:FindFirstChild("ProximityPrompt") and v:FindFirstChild("ProximityPrompt").ObjectText == "Lockpick" then
v.Name = "LockpickBuy"
end
end

-- // yes i realize this is unoptimized but i will learn it over time and fix it step by step

local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles


Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)
Library.ShowCustomCursor = false -- Toggles the Linoria cursor globaly (Default value = true)
Library.NotifySide = "Left" -- Changes the side of the notifications globaly (Left, Right) (Default value = Left)

local Window = Library:CreateWindow({
	Title = 'Velocity.lua | Build: Private | User: '..game:GetService('Players').LocalPlayer.Name,
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = false,
	NotifySide = "Left",
	TabPadding = 8,
	MenuFadeTime = 0.2
})

local Tabs = {
	-- Creates a new tab titled Main
	Main = Window:AddTab('AutoFarm'),
    Exploit = Window:AddTab('Exploits'),
    Misc = Window:AddTab('Misc'),
	['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('AutoFarms')
local ExploitLeftGroupBox = Tabs.Exploit:AddLeftGroupbox('Exploits')
local MiscLeftGroupBox = Tabs.Misc:AddLeftGroupbox('Misc')


Library:Notify("Welcome to Velocity.lua! User", nil, 4590657391)








MiscLeftGroupBox:AddSlider('MySlider', {
	Text = 'FastFlag Desync',
	Default = 15,
	Min = 0,
	Max = 15,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
        setfflag("S2PhysicsSenderRate", tostring(Value))
	end,

	Tooltip = 'Desync Slider', -- Information shown when you hover over the slider
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})





local DropdownGroupBox = Tabs.Main:AddRightGroupbox('Dropdowns')


DropdownGroupBox:AddDropdown('FeGiver', {
	Values = {  'pitch fork','armory', 'fire poker' ,'Brick','wood bat', 'hammer', 'axe', 'pan', 'baton', 'broom', 'cleaver', 'crowbar', 'eve', 'frying pan', 'hunting knife', 'kana-ta', 'kitchen knife', 'machete', 'mail box', 'metal pipe', 'metal bat', 'officer rifle','stone','sledge','shovel' },
	Default = 1, 
	Multi = false, 

	Text = 'Tool Grabber',
	Tooltip = 'attempts to Grab the tool',
	DisabledTooltip = 'Patched',

	Searchable = true, -- true / false, makes the dropdown searchable (great for a long list of values)

	Callback = function(Value)
		if Value ~= "Brick" or "Game" and game.Workspace:FindFirstChild(Value.." spawn") then
            fireclickdetector(game.Workspace[Value.." spawn"]:FindFirstChildOfClass("ClickDetector"))
            Library:Notify("Sucessfully spawned", nil, 4590657391)
        elseif Value == "officer rifle" then
            fireclickdetector(game.Workspace["officer rifle spawn"]:FindFirstChildOfClass("ClickDetector"))
            Library:Notify("Sucessfully spawned", nil, 4590657391)
        elseif Value == "Brick" or "Game" and game.Workspace:FindFirstChild(Value.." Spawn") then
            fireclickdetector(game.Workspace[Value.." Spawn"]:FindFirstChildOfClass("ClickDetector"))
            Library:Notify("Sucessfully spawned", nil, 4590657391)
        end
	end,

	Disabled = false,
	Visible = true,
})





local MyButton = LeftGroupBox:AddButton({
	Text = 'Grub money',
	Func = function()
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "Cash" then
            fireclickdetector(v.CD)
            end
            end
	end,
	DoubleClick = false,

	Tooltip = 'Grab money thats on the ground',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = LeftGroupBox:AddButton({
	Text = 'Nan money',
	Func = function()
        local args = {
            [1] = "NaN"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("DropCash"):FireServer(unpack(args))
        
	end,
	DoubleClick = false,

	Tooltip = 'Drop -9 BILLION DOLLARS',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Buy Spray Paint (35)',
	Func = function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.SprayPaintBuy.CFrame - Vector3.new(0,5,0)
        task.wait(0.3)
        fireproximityprompt(game.Workspace.SprayPaintBuy.ProximityPrompt)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
	end,
	DoubleClick = false,

	Tooltip = 'Buys spray paint (TPS BLATANT)',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})





local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Buy Fire Cracker (7)',
	Func = function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["purchase fire cracker"].CFrame - Vector3.new(0,5,0)
        fireproximityprompt(game.Workspace.FireCrackerBuy.ProximityPrompt)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
	end,
	DoubleClick = false,

	Tooltip = 'Buys Fire Cracker (TPS BLATANT)',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})







local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Become Jolly',
	Func = function()

        if game.Workspace.Map["cane spawn"] then
        fireclickdetector(game.Workspace.Map["cane spawn"].ClickDetector)
        fireclickdetector(game.Workspace.AcessoryBuy.ClickDetector)
        Library:Notify("Have a jolly christmas", nil, 4590657391)
        else
        Library:Notify("Cane not found", nil, 4590657391)



        end
	end,
	DoubleClick = false,

	Tooltip = 'Grab a candy cane',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})



local MyButton = LeftGroupBox:AddButton({
	Text = 'ROB REGISTERS',
	Func = function()
        local oldpos = User.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.Parent.Parent.Parent.Name == "Cash Register" then
        User.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.Parent.Parent.WorldPivot.Position) - Vector3.new(0,6,0)
        User.Character.HumanoidRootPart.Anchored = true
        task.wait(0.2)
        fireproximityprompt(v)
        fireproximityprompt(v)
        fireproximityprompt(v)
        task.wait(0.1)
        fireproximityprompt(v)
        end
        end
        User.Character.HumanoidRootPart.Anchored = false
        User.Character.HumanoidRootPart.CFrame = oldpos
	end,
	DoubleClick = false,

	Tooltip = 'Grab money thats on the ground',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})



local MyButton = LeftGroupBox:AddButton({
	Text = 'Box job (FROM ANYWHERE)',
	Func = function()
        for i,v in pairs(game.Workspace:FindFirstChild("MODELS?"):GetDescendants()) do
            if v.Name == "Box" then
            fireclickdetector(v.ClickDetector)
            repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Box")
            game.Players.LocalPlayer.Backpack:FindFirstChild("Box").Parent = game.Players.LocalPlayer.Character
            task.wait(0.1)
            firetouchinterest(workspace["Box Job"].HitBox,game.Players.LocalPlayer.Character.Head,0)
            task.wait(0.1)
            firetouchinterest(workspace["Box Job"].HitBox,game.Players.LocalPlayer.Character.Head,1)
            end
        end
	end,
	DoubleClick = false,

	Tooltip = 'Box job from anywhere no Tp',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = LeftGroupBox:AddButton({
	Text = 'Post Box Job (no tp & OP)',
	Func = function()
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "Box" and v.Material == Enum.Material.Plastic then
            fireclickdetector(v.ClickDetector)
            task.wait(1)
            for i,v in pairs(User.Backpack:GetChildren()) do
                v.Parent = User.Character
            end
            for i,v in pairs(game.Workspace["Box Job"]:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    firetouchinterest(v,User.Character.Head,0)
                    firetouchinterest(v,User.Character.Head,1)
                end
            end
            end
        end
	end,
	DoubleClick = false,

	Tooltip = 'Post Box job from anywhere no Tp',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Infinite ammo',
	Func = function()
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting["1"] then
            manipulate("Ammo", math.huge, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            manipulate("AmmoPerMag", math.huge, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            manipulate("AmmoCost", 0, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
        end
        end,
    
	DoubleClick = false,

	Tooltip = 'Infinite ammo for your gun',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})
    
local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'RapidFire',
	Func = function()
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting["1"] then
            manipulate("Auto", true, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            manipulate("FireRate", 0.005, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            manipulate("BulletSpeed", 9e97, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
        end
        end,
    
	DoubleClick = false,

	Tooltip = 'FastBullets',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Instant equip',
	Func = function()
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting["1"] then
            manipulate("EquipTime", 0, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            end
        end,
    
	DoubleClick = false,

	Tooltip = 'FastBullets',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})



local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Experimental player raper',
	Func = function()
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting["1"] then
            manipulate("AmmoCost", 0, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            manipulate("ShotgunEnabled", true, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
            manipulate("BulletsPerShot", 50000, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name);
        end
        end,
    
	DoubleClick = false,

	Tooltip = 'Shoot 50k bullets at the same time',
	DisabledTooltip = 'Under Development!', -- Information shown when you hover over the button while it's disabled

	Disabled = true, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


ExploitLeftGroupBox:AddInput('MyTextbox', {
    Default = '142376088',
    Numeric = false,
    Finished = false, 

    Text = 'SONGID',
    Tooltip = 'Put song id here',

    Placeholder = '142376088',

    Callback = function(Value)
        _G.SongID = Value
    end
})


_G.SongID = 142376088
local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Play any song',
	Func = function()
        local nc;
        nc = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        if tostring(self) == "AC6_FE_Sounds" and method == "FireServer" and args[1] == "updateSound" then
            args[1] = "updateSound"
            args[2] = "Rev"
            args[3] = "rbxassetid://".._G.SongID
            args[4] = 1
            args[5] = 100
		return nc(self, unpack(args))
        end
        return nc(self, unpack(args))
        end)




        end,
    
	DoubleClick = false,

	Tooltip = 'Play AnySong',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})




ExploitLeftGroupBox:AddInput('MyTextbox', {
    Default = '79240462672905',
    Numeric = false,
    Finished = false, 

    Text = 'PATCHED INSTANT KICK',
    Tooltip = 'Put sign id here',

    Placeholder = '79240462672905',

    Callback = function(Value)
        _G.ExploitSign = Value
    end
})



_G.ExploitSign = 79240462672905
local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Sign Exploit',
	Func = function()
        local args = {
            [1] = "2011",
            [2] = _G.ExploitSign
        }
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spray Paint") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spray Paint").Spray:FireServer(unpack(args))
        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spray Paint") then
        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spray Paint").Spray:FireServer(unpack(args))
        end
        end,
    
	DoubleClick = false,

	Tooltip = 'Any Decal u want',
	DisabledTooltip = 'PATCHED :(', -- Information shown when you hover over the button while it's disabled

	Disabled = true, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Buy LockPick',
	Func = function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.LockPickBuy.CFrame
        task.wait(0.3)
        fireproximityprompt(game.Workspace.LockPickBuy.ProximityPrompt)
        task.wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
        end,
    
	DoubleClick = false,

	Tooltip = 'Buy Lockpick',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})






local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Sign Lag Exploit',
	Func = function()
        local args = {
            [1] = "2005",
            [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,3,0)
        }
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spray Paint") then
        for i=1,1000 do
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spray Paint").Spray:FireServer(unpack(args));
        end
        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spray Paint") then
        for i=1,1000 do
            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spray Paint").Spray:FireServer(unpack(args));
        end
        end
        end,
    
	DoubleClick = false,

	Tooltip = 'Any Decal u want',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})

local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Deposit all your money in ATM',
	Func = function()
        local args = {
            [1] = game.Players.LocalPlayer.leaderstats.Cash,
            [2] = "deposit"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("ATMEvent"):FireServer(unpack(args))
        
        end,
    
	DoubleClick = false,

	Tooltip = 'Deposit all money',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


ExploitLeftGroupBox:AddInput('MyTextbox', {
    Default = '400',
    Numeric = true,
    Finished = false, 

    Text = 'Vehicle Modifier',
    Tooltip = 'horsepower mod',

    Placeholder = '400',

    Callback = function(Value)
        _G.HorsePower = Value
    end
})


_G.HorsePower = 400
local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'Modify Vehicle',
	Func = function()
            local car = game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent
            local req = require(car:FindFirstChild("A-Chassis Tune"))
            req.Horsepower = _G.HorsePower          
        end,
    
	DoubleClick = false,

	Tooltip = 'Sit in a car',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})






local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'NPC stop',
	Func = function()
        
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and IsNetworkOwner2(v:FindFirstChild("HumanoidRootPart")) == true and v:FindFirstChild("Baton") then
        v.HumanoidRootPart.Anchored = true
    end
end
        
        end,
    
	DoubleClick = false,

	Tooltip = 'Manipulate NPCS',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})







local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'NPC DIE',
	Func = function()
        
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and IsNetworkOwner2(v:FindFirstChild("HumanoidRootPart")) == true and v:FindFirstChild("Baton") then
        v.HumanoidRootPart.Anchored = false
        v.Humanoid.Health = 0
    end
end
        
        end,
    
	DoubleClick = false,

	Tooltip = 'Manipulate NPCS',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})


local MyButton = ExploitLeftGroupBox:AddButton({
	Text = 'NPC BRING',
	Func = function()
        
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and IsNetworkOwner2(v:FindFirstChild("HumanoidRootPart")) == true and v:FindFirstChild("Baton") then
        v.HumanoidRootPart.Anchored = false
        v.HumanoidRootPart.CFrame = User.Character.HumanoidRootPart.CFrame
    end
end
        
        end,
    
	DoubleClick = false,

	Tooltip = 'Manipulate NPCS',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})







local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Anti Carhit',
	Func = function()
        for i,v in pairs(game.Workspace.Vehicles:GetDescendants()) do
            if v.Name == "RunOver" then
            v.TouchInterest:Destroy()
            end
            end
	end,
	DoubleClick = false,

	Tooltip = 'Become immune to car damage',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})
    

local MyButton = MiscLeftGroupBox:AddButton({
	Text = 'Smoke Cars',
	Func = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Smoke_FE" and v:IsA("RemoteEvent") then
        local args = {
            [1] = "UpdateSmoke",
            [2] = math.huge,
            [3] = math.huge,
            [4] = math.huge,
            [5] = math.huge
        }
        
        v:FireServer(unpack(args))
        end
        end
	end,
	DoubleClick = false,

	Tooltip = 'Smoke all cars that are not being driven FE',
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the button while it's disabled

	Disabled = false, -- Will disable the button (true / false)
	Visible = true -- Will make the button invisible (true / false)
})






--[[
DropdownGroupBox:AddDropdown('MyPlayerDropdown', {
	SpecialType = 'Player',
	ExcludeLocalPlayer = true, -- true / false, excludes the localplayer from the Player type
	Text = 'SOON',
	Tooltip = 'SOON FE KILL', -- Information shown when you hover over the dropdown

	Callback = function(Value)
		print('[cb] Player dropdown got changed:', Value)
	end
})


DropdownGroupBox:AddToggle('KillToggle', {
    Text = 'Kill',
    Default = false, -- Default value (true / false)
    Tooltip = 'Bring them infront of u', -- Information shown when you hover over the toggle

    Callback = function(Value11)
        local Target = Options.MyPlayerDropdown.Value
        _G.Kill = Value11
        if Target and _G.Kill == true then
            while Value11 == true and _G.Kill == true do
            local target = game.Players:FindFirstChild(Target)
            task.wait();target.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2,1,0)
            
            end
        end
    end
})



DropdownGroupBox:AddToggle('KillToggle', {
    Text = 'Kill All',
    Default = false, -- Default value (true / false)
    Tooltip = 'Bring them infront of u', -- Information shown when you hover over the toggle

    Callback = function(Value)
        
    end
})
]]

Library:SetWatermarkVisibility(false) -- // useless for now added back in future update

Library:OnUnload(function()
	Library.Unloaded = true
end)



-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddToggle("KeybindMenuOpen", { Default = Library.KeybindFrame.Visible, Text = "Open Keybind Menu", Callback = function(value) Library.KeybindFrame.Visible = value end})
MenuGroup:AddToggle("ShowCustomCursor", {Text = "Custom Cursor", Default = false, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("Unload", function() Library:Unload() end)
Library.ToggleKeybind = Options.MenuKeybind 
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:SetSubFolder('Amerika')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])





