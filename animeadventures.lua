local Atlas = loadstring(game:HttpGet("https://raw.githubusercontent.com/KeremHuba/AtlasUILib/main/AtlasUI3.lua"))()
local UI = Atlas.new({
    Name = "Anime Adventures - Xno Hub";
    ConfigFolder = "AAXnoHub";
    Credit = "Made By G.O.A.T";
    Color = Color3.fromRGB(255,0,0);
    Bind = "LeftControl";
    UseLoader = true;
    FullName = "Anime Adventures Auto Farm";
    CheckKey = function(inputtedKey)
        return inputtedKey=="kerem"
    end;
    Discord = "https://discord.gg/xnohub";
})

local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace") 
local plr = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")

getgenv().savefilename = "XNOHUBANIMEADVENTURES_10 "..game.Players.LocalPlayer.Name..".json"
getgenv().door = "_lobbytemplategreen1"

task.wait(2)
repeat  task.wait() until game:IsLoaded()
if game.PlaceId == 8304191830 then
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
else
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
    repeat task.wait() until game:GetService("Workspace")["_waves_started"].Value == true
end

getgenv().UnitCache = {}

for _, Module in next, game:GetService("ReplicatedStorage"):WaitForChild("src"):WaitForChild("Data"):WaitForChild("Units"):GetDescendants() do
    if Module:IsA("ModuleScript") and Module.Name ~= "UnitPresets" then
        for UnitName, UnitStats in next, require(Module) do
            getgenv().UnitCache[UnitName] = UnitStats
        end
    end
end

function sex()
    local jsonData = readfile(savefilename)
    local data = HttpService:JSONDecode(jsonData)

    getgenv().AutoLeave = data.AutoLeave
    getgenv().AutoReplay = data.AutoReplay
    getgenv().AutoChallenge = data.AutoChallenge  
    getgenv().selectedreward = data.selectedreward
    getgenv().AutoChallengeAll = data.AutoChallengeAll
    getgenv().disableatuofarm = false
    getgenv().sellatwave = data.sellatwave 
    getgenv().autosell = data.autosell
    getgenv().AutoFarm = data.autofarm
    getgenv().AutoFarmIC = data.autofarmic
    getgenv().AutoFarmTP = data.autofarmtp
    getgenv().AutoLoadTP = data.autoloadtp
    getgenv().weburl = data.webhook
    getgenv().autostart = data.autostart
    getgenv().autoupgrade = data.autoupgrade
    getgenv().difficulty = data.difficulty
    getgenv().world = data.world
    getgenv().level = data.level

    getgenv().SpawnUnitPos = data.xspawnUnitPos
    getgenv().SelectedUnits = data.xselectedUnits
    getgenv().autoabilities = data.autoabilities
end

function updatejson()

    local xdata = {
        portalnameX = getgenv().portalnameX,
        farmportal = getgenv().farmprotal,
        buyportal = getgenv().buyportal,
        PortalID = getgenv().PortalID,

        -- unitname = getgenv().unitname,
        -- unitid = getgenv().unitid,
        autoloadtp = getgenv().AutoLoadTP,
        AutoLeave = getgenv().AutoLeave,
        AutoReplay = getgenv().AutoReplay,
        AutoChallenge  = getgenv().AutoChallenge, 
        selectedreward = getgenv().selectedreward,
        AutoChallengeAll = getgenv().AutoChallengeAll, 
        sellatwave = getgenv().sellatwave,
        autosell = getgenv().autosell,
        webhook = getgenv().weburl,
        autofarm = getgenv().AutoFarm,
        autofarmic = getgenv().AutoFarmIC,
        autofarmtp = getgenv().AutoFarmTP,
        autostart = getgenv().autostart,
        autoupgrade = getgenv().autoupgrade,
        difficulty = getgenv().difficulty,
        world = getgenv().world,
        level = getgenv().level,

        xspawnUnitPos = getgenv().SpawnUnitPos,
        xselectedUnits = getgenv().SelectedUnits,
        autoabilities = getgenv().autoabilities
    }

    local json = HttpService:JSONEncode(xdata)
    writefile(savefilename, json)
end

local exec = tostring(identifyexecutor())
print(exec)


local settings = {
    unit1 = nil,
    unit2 = nil,
    unit3 = nil,
    unit4 = nil,
    unit5 = nil,
    unit6 = nil,
}

local Units = {}

        local function loadUnit()
            repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
            task.wait(2)
            table.clear(Units)
            for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                if v.Name == "CollectionUnitFrame" then
                    repeat task.wait() until v:FindFirstChild("_uuid")
                    table.insert(Units, v.name.Text .. " #" .. v._uuid.Value)
                end
            end
        end

        loadUnit()

        --[[local function Check(x, y)
            for i, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                if v:IsA("ImageButton") then
                    if v.EquippedList.Equipped.Visible == true then
                        if v.Main.petimage:GetChildren()[2].Name == x then
                            --print(v.name.Text.." #"..v._uuid.Value)
                            getgenv().SelectedUnits["U"..tostring(y)] = tostring(v.name.Text.." #"..v._uuid.Value)
                            updatejson()
                            return true
                        end
                    end
                end
            end
        end]]

        local function Equip()
            game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
            
            for i = 1, 6 do
                local unitinfo = getgenv().SelectedUnits["U"..i]
                warn(unitinfo)
                if unitinfo ~= nil then
                    local unitinfo_ = unitinfo:split(" #")
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.equip_unit:InvokeServer(unitinfo_[2])
                end
            end
            updatejson()
        end

local AutoFarm = UI:CreatePage("Units")
local AutoFa = AutoFarm:CreateSection("Select Units")

local worlddd = UI:CreatePage("World")
local SelectWorld = worlddd:CreateSection("Select World")

local af = UI:CreatePage("Auto Farm")
local AutoSet = af:CreateSection("Auto Farm Settings")

local autoch = UI:CreatePage("Auto Challenge")
local autochh = autoch:CreateSection("Auto Challenge")

local posit = UI:CreatePage("Positions")
local positio = posit:CreateSection("Set Positions")

local drop = AutoFa:CreateDropdown({
    Name = "Select Unit 1";
    Callback = function(bool)
        getgenv().SelectedUnits["U1"] = bool
        Equip()
    end;
    Options = Units; 
    ItemSelecting = true;
    DefaultItemSelected = ""; 
    Warning = "";
    WarningIcon = 12345;
})

local drop2 = AutoFa:CreateDropdown({
    Name = "Select Unit 2";
    Callback = function(bool)
        getgenv().SelectedUnits["U2"] = bool
        Equip()
    end;
    Options = Units; 
    ItemSelecting = true;
    DefaultItemSelected = ""; 
    Warning = "";
    WarningIcon = 12345;
})

local drop3 = AutoFa:CreateDropdown({
    Name = "Select Unit 3";
    Callback = function(bool)
        getgenv().SelectedUnits["U3"] = bool
        Equip()
    end;
    Options = Units; 
    ItemSelecting = true;
    DefaultItemSelected = ""; 
    Warning = "";
    WarningIcon = 12345;
})

local drop4 = AutoFa:CreateDropdown({
    Name = "Select Unit 4";
    Callback = function(bool)
        getgenv().SelectedUnits["U4"] = bool
        Equip()
    end;
    Options = Units; 
    ItemSelecting = true;
    DefaultItemSelected = ""; 
    Warning = "";
    WarningIcon = 12345;
})

local ax = game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text:split(" ")
_G.drop5 = nil
_G.drop6 = nil

if tonumber(ax[2]) >= 20 then
    _G.drop5 = AutoFa:CreateDropdown({
        Name = "Select Unit 5";
        Callback = function(bool)
            getgenv().SelectedUnits["U5"] = bool
            Equip()
        end;
        Options = Units; 
        ItemSelecting = true;
        DefaultItemSelected = ""; 
        Warning = "";
        WarningIcon = 12345;
    })
end

if tonumber(ax[2]) >= 50 then
    _G.drop6 = AutoFa:CreateDropdown({
        Name = "Select Unit 6";
        Callback = function(bool)
            getgenv().SelectedUnits["U6"] = bool
            Equip()
        end;
        Options = Units; 
        ItemSelecting = true;
        DefaultItemSelected = ""; 
        Warning = "";
        WarningIcon = 12345;
    })
end

--------------------------------------------------
-------------SELECT WORLD-------------------------
--------------------------------------------------
--------------------------------------------------

getgenv().levels = {"nill"}

getgenv().diff = SelectWorld:CreateDropdown({
    Name = "Select Difficulty";
    Callback = function(diff)
        getgenv().difficulty = diff
        updatejson()
    end;
    Options = {"Normal","Hard"};
    ItemSelecting = true; 
    DefaultItemSelected = getgenv().difficulty;
    Warning = "";
    WarningIcon = 12345;
})

local worlddrop = SelectWorld:CreateDropdown({
    Name = "Select World";
    Callback = function(world)
        getgenv().world = world
        updatejson()
        wait(0.1)
        if world == "Plannet Namak" then
            table.clear(levels)
            getgenv().levels = {"namek_infinite", "namek_level_1", "namek_level_2", "namek_level_3",
                                "namek_level_4", "namek_level_5", "namek_level_6"}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Shiganshinu District" then
            table.clear(levels)
            getgenv().levels = {"aot_infinite", "aot_level_1", "aot_level_2", "aot_level_3", "aot_level_4",
                                "aot_level_5", "aot_level_6"}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Snowy Town" then
            table.clear(levels)
            getgenv().levels = {"demonslayer_infinite", "demonslayer_level_1", "demonslayer_level_2",
                                "demonslayer_level_3", "demonslayer_level_4", "demonslayer_level_5",
                                "demonslayer_level_6"}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Hidden Sand Village" then
            table.clear(levels)
            getgenv().levels = {"naruto_infinite", "naruto_level_1", "naruto_level_2", "naruto_level_3",
                                "naruto_level_4", "naruto_level_5", "naruto_level_6"}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Marine's Ford" then
            table.clear(levels)
            getgenv().levels = {"marineford_infinite","marineford_level_1","marineford_level_2","marineford_level_3",
            "marineford_level_4","marineford_level_5","marineford_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Ghoul City" then
            table.clear(levels)
            getgenv().levels = {"tokyoghoul_infinite","tokyoghoul_level_1","tokyoghoul_level_2","tokyoghoul_level_3",
                                "tokyoghoul_level_4","tokyoghoul_level_5","tokyoghoul_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Hollow World" then
            table.clear(levels)
            getgenv().levels = {"hueco_infinite","hueco_level_1","hueco_level_2","hueco_level_3",
                                "hueco_level_4","hueco_level_5","hueco_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Ant Kingdom" then
            table.clear(levels)
            getgenv().levels = {"hxhant_infinite","hxhant_level_1","hxhant_level_2","hxhant_level_3",
                                "hxhant_level_4","hxhant_level_5","hxhant_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
           
        elseif world == "Magic Town" then
            table.clear(levels)
            getgenv().levels = {"magnolia_infinite","magnolia_level_1","magnolia_level_2","magnolia_level_3",
                                "magnolia_level_4","magnolia_level_5","magnolia_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Cursed Academy" then
            table.clear(levels)
            getgenv().levels = {"jjk_infinite","jjk_level_1","jjk_level_2","jjk_level_3",
                                "jjk_level_4","jjk_level_5","jjk_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Clover Kingdom" then
            table.clear(levels)
            getgenv().levels = {"clover_infinite","clover_level_1","clover_level_2","clover_level_3",
                                "clover_level_4","clover_level_5","clover_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Clover Legend - HARD" then
            table.clear(levels)
            getgenv().levels = {"clover_legend_1","clover_legend_2","clover_legend_3",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world == "Hollow Legend - HARD" then
            table.clear(levels)
            getgenv().levels = {"bleach_legend_1","bleach_legend_2","bleach_legend_3","bleach_legend_4","bleach_legend_5",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world =="Cape Canaveral" then
            table.clear(levels)
            getgenv().levels = {"jojo_infinite","jojo_level_1","jojo_level_2","jojo_level_3","jojo_level_4","jojo_level_5","jojo_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        elseif world =="Alien Spaceship" then
            table.clear(levels)
            getgenv().levels = {"opm_infinite","opm_level_1","opm_level_2","opm_level_3","opm_level_4","opm_level_5","opm_level_6",}
            for i, v in ipairs(getgenv().levels) do
                getgenv().leveldrop:Update(getgenv().levels)
            end
        end
    end;
    Options = {"Plannet Namak", "Shiganshinu District", "Snowy Town","Hidden Sand Village", "Marine's Ford","Ghoul City", "Hollow World", "Ant Kingdom", "Magic Town", "Cursed Academy","Clover Kingdom", "Clover Legend - HARD","Hollow Legend - HARD","Cape Canaveral","Alien Spaceship"};
    ItemSelecting = true; 
    DefaultItemSelected = getgenv().world;
    Warning = "";
    WarningIcon = 12345;
})

getgenv().leveldrop = SelectWorld:CreateDropdown({
    Name = "Select Level";
    Callback = function(levell)
        getgenv().level = levell
        updatejson()
    end;
    Options = levels;
    ItemSelecting = true; 
    DefaultItemSelected = getgenv().level;
    Warning = "";
    WarningIcon = 12345;
})

--------------------------------------
--------------------------------------
---------AUTOFARM---------------------
--------------------------------------
--------------------------------------

AutoSet:CreateToggle({
    Name = "Auto Replay";
    Flag = "replay";
    Default = getgenv().AutoReplay;
    Callback = function(bool)
        getgenv().AutoReplay = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Leave";
    Flag = "leave";
    Default = getgenv().AutoLeave;
    Callback = function(bool)
        getgenv().AutoLeave = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Farm Event";
    Flag = "farmev";
    Default = getgenv().AutoFarmTP;
    Callback = function(bool)
        getgenv().AutoFarmTP = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Infinity Castle";
    Flag = "infinitycastle";
    Default = getgenv().AutoFarmIC;
    Callback = function(bool)
        getgenv().AutoFarmIC = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Farm";
    Flag = "farm";
    Default = getgenv().AutoFarm;
    Callback = function(bool)
        getgenv().AutoFarm = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Start";
    Flag = "start";
    Default = getgenv().autostart;
    Callback = function(bool)
        getgenv().autostart = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Abilities";
    Flag = "ability";
    Default = getgenv().autoabilities;
    Callback = function(bool)
        getgenv().autoabilities = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Upgrade Units";
    Flag = "upgrade";
    Default = getgenv().autoupgrade;
    Callback = function(bool)
        getgenv().autoupgrade = bool
        updatejson()
    end;
    SavingDisabled = true;
})

AutoSet:CreateToggle({
    Name = "Auto Sell At Spectic Wave";
    Flag = "wave";
    Default = getgenv().autosell;
    Callback = function(x)
        getgenv().autosell = x
        updatejson()
        if getgenv().autosell == false then
            getgenv().disableatuofarm = false
        end
    end;
    SavingDisabled = true;
})

AutoSet:CreateTextBox({
    Name = "Wave";
    Flag = "wavee"; 
    Callback = function(inputtedText,enterPressed)
        print("TextBox:",inputtedText,enterPressed)
    end;
    DefaultText = "";
    PlaceholderText = "Write Wave Number";
    TabComplete = function(inputtedText)
        getgenv().sellatwave = tonumber(inputtedText)
        updatejson()
    end;
    ClearTextOnFocus = false;
    Warning = "";
    WarningIcon = 12345;
})


-----------------------------------------------------------
---------------------AUTOCHALLENGE--------------------------
-------------------------------------------------------------
------------------------------------------------------------

autochh:CreateToggle({
    Name = "Auto Challenge";
    Flag = "challenge";
    Default = getgenv().AutoChallenge;
    Callback = function(x)
        getgenv().AutoChallenge = x
    end;
    SavingDisabled = true;
})

local dropchallenge = autochh:CreateDropdown({
    Name = "Select Challenge";
    Callback = function(reward)
        getgenv().selectedreward = reward
    end;
    Options = {"star_fruit_random","star_remnant","gems", "gold"};
    ItemSelecting = true;
    DefaultItemSelected = getgenv().selectedreward;
    Warning = "";
    WarningIcon = 12345;
})

autochh:CreateToggle({
    Name = "Farm All Rewards";
    Flag = "challengeall";
    Default = getgenv().AutoChallengeAll;
    Callback = function(x)
        getgenv().AutoChallengeAll = bool
    end;
    SavingDisabled = true;
})

function MouseClick(UnitPos)
    local connection
    local _map = game:GetService("Workspace")["_BASES"].player.base["fake_unit"]:WaitForChild("HumanoidRootPart")
    connection = UserInputService.InputBegan:Connect(
        function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                connection:Disconnect()
                local a = Instance.new("Part", game.Workspace)
                a.Size = Vector3.new(1, 1, 1)
                a.Material = Enum.Material.Neon
                a.Position = mouse.hit.p
                task.wait()
                a.Anchored = true
                DiscordLib:Notification("Spawn Unit Posotion:", tostring(a.Position), "Okay!")
                a.CanCollide = false
                for i = 0, 1, 0.1 do
                    a.Transparency = i
                    task.wait()
                end
                a:Destroy()

                if game.Workspace._map:FindFirstChild("namek mushroom model") then
                    print("Namak")
                    SpawnUnitPos["Namak"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Namak"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Namak"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("houses_new") then
                    print("Aot")
                    SpawnUnitPos["Aot"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Aot"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Aot"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("Snow Particles") then
                    print("Snowy")
                    SpawnUnitPos["Snowy"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Snowy"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Snowy"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("sand_gate") then
                    warn("Sand")
                    SpawnUnitPos["Sand"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Sand"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Sand"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("icebergs") then
                    print("Marine")
                    SpawnUnitPos["Marine"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Marine"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Marine"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("Helicopter Pad") then
                    print("Ghoul")
                    SpawnUnitPos["Ghoul"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Ghoul"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Ghoul"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("Bones/dust") then
                    print("Hollow")
                    SpawnUnitPos["Hollow"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Hollow"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Hollow"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("Ant Nest") then
                    print("Ant")
                    SpawnUnitPos["Ant"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Ant"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Ant"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("light poles") then
                    print("Magic")
                    SpawnUnitPos["Magic"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Magic"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Magic"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("LanternsGround") then
                    print("Cursed")    
                    SpawnUnitPos["Cursed"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["Cursed"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["Cursed"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("pumpkins") then
                    print("thriller_park")    
                    SpawnUnitPos["thriller_park"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["thriller_park"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["thriller_park"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("skeleton") then
                    print("black_clover")    
                    SpawnUnitPos["black_clover"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["black_clover"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["black_clover"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("graves") then
                    print("hollow_leg")    
                    SpawnUnitPos["hollow_leg"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["hollow_leg"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["hollow_leg"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("SpaceCenter") then
                    print("Cape Canaveral")    
                    SpawnUnitPos["jojo"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["jojo"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["jojo"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("vending machines") then
                    print("chainsaw")    
                    SpawnUnitPos["chainsaw"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["chainsaw"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["chainsaw"][UnitPos]["z"] = a.Position.Z
                elseif game.Workspace._map:FindFirstChild("secret") then
                    print("opm")    
                    SpawnUnitPos["opm"][UnitPos]["x"] = a.Position.X
                    SpawnUnitPos["opm"][UnitPos]["y"] = a.Position.Y
                    SpawnUnitPos["opm"][UnitPos]["z"] = a.Position.Z
                end

                updatejson()
            end
        end)
end

positio:CreateButton({
    Name = "Set Unit 1 Position";
    Callback = function()
        MouseClick("UP1")
    end
})

positio:CreateButton({
    Name = "Set Unit 2 Position";
    Callback = function()
        MouseClick("UP2")
    end
})

positio:CreateButton({
    Name = "Set Unit 3 Position";
    Callback = function()
        MouseClick("UP3")
    end
})

positio:CreateButton({
    Name = "Set Unit 1 Position";
    Callback = function()
        MouseClick("UP4")
    end
})

local axxc = game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")

if tonumber(axxc[2]) >= 20 then
    positio:CreateButton({
        Name = "Set Unit 5 Position";
        Callback = function()
            MouseClick("UP5")
        end
    })
end

if tonumber(axxc[2]) >= 50 then
    positio:CreateButton({
        Name = "Set Unit 6 Position";
        Callback = function()
            MouseClick("UP6")
        end
    })
end







if isfile(savefilename) then 
    local jsonData = readfile(savefilename)
    local data = HttpService:JSONDecode(jsonData)
    print("asdada")

    sex()

else
--#region CREATES JSON
    local xdata = {
        --Devil City
        portalnameX = "csm_contract_0",
        farmportal = false,
        buyportal = false,
        PortalID = "nil",
        
        -- unitname = "name",
        -- unitid = "id",
        AutoReplay = false,
        AutoLeave = true,
        AutoChallenge = false,
        selectedreward = "star_fruit_random",
        AutoChallengeAll = false,
        autoabilities = false,
        autofarmtp = false,
        webhook = "",
        sellatwave = 0,
        autosell = false,
        autofarm = false,
        autofarmic = false,
        autostart = false,
        autoloadtp = false,
        autoupgrade = false,
        difficulty = "nil",
        world = "nil",
        level = "nil",
        door = "nil",
    
        xspawnUnitPos  = {
            black_clover  = {
              UP1  = {
                y  = 1.4244641065597535,
                x  = -109.30056762695313,
                z  = -54.575347900390628
             },
              UP3  = {
                y  = 1.4322717189788819,
                x  = -114.2433853149414,
                z  = -55.260982513427737
             },
              UP2  = {
                y  = 1.7082736492156983,
                x  = -127.53932189941406,
                z  = -55.277626037597659
             },
              UP6  = {
                y  = 1.4487617015838624,
                x  = -107.07078552246094,
                z  = -51.333045959472659
             },
              UP5  = {
                y  = 1.8965977430343629,
                x  = -118.5692138671875,
                z  = -57.20484161376953
             },
              UP4  = {
                y  = 1.4205386638641358,
                x  = -105.46223449707031,
                z  = -51.20615005493164
             }
           },
           hollow_leg = {
            UP1 = {
                x = -168.71795654296875,
                y = 36.04443359375, 
                z = 564.4705810546875 
            },
            UP2 = {
                x = -161.105712890625, 
                y = 36.04443359375, 
                z = 558.4195556640625 
            },
            UP3 = {
                x = -161.05670166015625, 
                y = 36.04443359375, 
                z = 546.204833984375 
               
            },
            UP4 = {
                x = -163.51824951171875, 
                y = 36.04443359375, 
                z = 534.6953735351562 
            },
            UP5 = {
                x = -170.02479553222656, 
                y = 36.04443359375, 
                z = 528.9660034179688
            },
            UP6 = {
                x = -160.92405700683594, 
                y = 36.04443359375, 
                z = 565.2430419921875 
            }
           },
            Cursed  = {
              UP1  = {
                y  = 122.78201293945313,
                x  = 361.69732666015627,
                z  = -89.76468658447266
             },
              UP3  = {
                y  = 122.73872375488281,
                x  = 372.2068786621094,
                z  = -62.877601623535159
             },
              UP2  = {
                y  = 122.73872375488281,
                x  = 391.6465759277344,
                z  = -62.87253189086914
             },
              UP6  = {
                y  = 121.5274887084961,
                x  = 399.4963684082031,
                z  = -60.31044387817383
             },
              UP5  = {
                y  = 121.6282958984375,
                x  = 400.8389587402344,
                z  = -64.46269226074219
             },
              UP4  = {
                y  = 122.73872375488281,
                x  = 362.14788818359377,
                z  = -77.3993148803711
             }
           },
            Sand  = {
              UP1  = {
                y  = 25.514015197753908,
                x  = -919.7685546875,
                z  = 290.9293518066406
             },
              UP3  = {
                y  = 25.518001556396486,
                x  = -919.7103881835938,
                z  = 288.1217346191406
             },
              UP2  = {
                y  = 26.06340980529785,
                x  = -920.3797607421875,
                z  = 300.7817077636719
             },
              UP6  = {
                y  = 25.528093338012697,
                x  = -916.4822998046875,
                z  = 287.9609069824219
             },
              UP5  = {
                y  = 25.71731185913086,
                x  = -920.7069091796875,
                z  = 296.8504943847656
             },
              UP4  = {
                y  = 25.508501052856447,
                x  = -919.2952270507813,
                z  = 294.7797546386719
             }
           },
            Namak  = {
              UP1  = {
                y  = 92.14557647705078,
                x  = -2931.182861328125,
                z  = -698.5640869140625
             },
              UP3  = {
                y  = 92.5256118774414,
                x  = -2950.3916015625,
                z  = -697.1671142578125
             },
              UP2  = {
                y  = 93.32953643798828,
                x  = -2940.813720703125,
                z  = -697.09326171875
             },
              UP6  = {
                y  = 92.16944885253906,
                x  = -2946.967041015625,
                z  = -710.122802734375
             },
              UP5  = {
                y  = 92.15478515625,
                x  = -2947.684326171875,
                z  = -699.6248779296875
             },
              UP4  = {
                y  = 92.5256118774414,
                x  = -2950.408935546875,
                z  = -709.8072509765625
             }
           },
            Hollow  = {
              UP1  = {
                y  = 133.10752868652345,
                x  = -168.9812774658203,
                z  = -692.3645629882813
             },
              UP3  = {
                y  = 133.09632873535157,
                x  = -167.3197021484375,
                z  = -695.4755249023438
             },
              UP2  = {
                y  = 133.50978088378907,
                x  = -160.6356964111328,
                z  = -709.1862182617188
             },
              UP6  = {
                y  = 133.08169555664063,
                x  = -176.02857971191407,
                z  = -691.7825317382813
             },
              UP5  = {
                y  = 133.0151824951172,
                x  = -161.20188903808595,
                z  = -702.9484252929688
             },
              UP4  = {
                y  = 133.17193603515626,
                x  = -172.60714721679688,
                z  = -691.3147583007813
             }
           },
            Ant  = {
              UP1  = {
                y  = 23.502197265625,
                x  = -180.23072814941407,
                z  = 2961.130126953125
             },
              UP3  = {
                y  = 23.855152130126954,
                x  = -167.0123748779297,
                z  = 2954.2958984375
             },
              UP2  = {
                y  = 23.637359619140626,
                x  = -205.69203186035157,
                z  = 2964.095947265625
             },
              UP6  = {
                y  = 23.31997299194336,
                x  = -163.1376953125,
                z  = 2959.968017578125
             },
              UP5  = {
                y  = 23.598222732543947,
                x  = -170.1063232421875,
                z  = 2955.477294921875
             },
              UP4  = {
                y  = 23.855152130126954,
                x  = -156.4979705810547,
                z  = 2959.6123046875
             }
           },
            Aot  = {
              UP1  = {
                y  = 34.25483703613281,
                x  = -3016.723388671875,
                z  = -682.4714965820313
             },
              UP3  = {
                y  = 34.442054748535159,
                x  = -3024.1181640625,
                z  = -682.2401123046875
             },
              UP2  = {
                y  = 34.387603759765628,
                x  = -3035.071533203125,
                z  = -683.9107055664063
             },
              UP6  = {
                y  = 34.25492477416992,
                x  = -3019.5390625,
                z  = -681.8257446289063
             },
              UP5  = {
                y  = 34.25492477416992,
                x  = -3030.930419921875,
                z  = -683.3449096679688
             },
              UP4  = {
                y  = 34.442054748535159,
                x  = -3013.065185546875,
                z  = -681.4302368164063
             }
           },
            Snowy  = {
              UP1  = {
                y  = 34.8720588684082,
                x  = -2884.6103515625,
                z  = -139.17750549316407
             },
              UP3  = {
                y  = 35.055450439453128,
                x  = -2871.251708984375,
                z  = -131.86231994628907
             },
              UP2  = {
                y  = 34.86832046508789,
                x  = -2863.6240234375,
                z  = -120.90508270263672
             },
              UP6  = {
                y  = 34.79566192626953,
                x  = -2853.62548828125,
                z  = -123.30137634277344
             },
              UP5  = {
                y  = 34.79277038574219,
                x  = -2853.63232421875,
                z  = -119.10173034667969
             },
              UP4  = {
                y  = 34.86832046508789,
                x  = -2878.749755859375,
                z  = -138.48580932617188
             }
           },
            Ghoul  = {
              UP1  = {
                y  = 59.36590576171875,
                x  = -3008.964111328125,
                z  = -56.00475311279297
             },
              UP3  = {
                y  = 59.03008270263672,
                x  = -3008.75732421875,
                z  = -58.37107849121094
             },
              UP2  = {
                y  = 59.382938385009769,
                x  = -2998.44140625,
                z  = -42.68498992919922
             },
              UP6  = {
                y  = 59.03008270263672,
                x  = -3009.03125,
                z  = -67.12299346923828
             },
              UP5  = {
                y  = 59.03008270263672,
                x  = -3007.1025390625,
                z  = -52.12919998168945
             },
              UP4  = {
                y  = 59.03008270263672,
                x  = -3008.94580078125,
                z  = -63.67665100097656
             }
           },
            Magic  = {
              UP1  = {
                y  = 7.411101341247559,
                x  = -606.7291259765625,
                z  = -815.5218505859375
             },
              UP3  = {
                y  = 7.411093711853027,
                x  = -589.5305786132813,
                z  = -814.8512573242188
             },
              UP2  = {
                y  = 7.413991928100586,
                x  = -578.809814453125,
                z  = -814.5386962890625
             },
              UP6  = {
                y  = 7.372146129608154,
                x  = -605.3615112304688,
                z  = -820.8731079101563
             },
              UP5  = {
                y  = 7.413986682891846,
                x  = -597.8843383789063,
                z  = -814.5377807617188
             },
              UP4  = {
                y  = 7.4139862060546879,
                x  = -600.348388671875,
                z  = -814.8621215820313
             }
           },
            Marine  = {
              UP1  = {
                y  = 25.521255493164064,
                x  = -2566.733642578125,
                z  = -62.77167892456055
             },
              UP3  = {
                y  = 25.5211124420166,
                x  = -2565.930419921875,
                z  = -57.89338684082031
             },
              UP2  = {
                y  = 25.210872650146486,
                x  = -2560.966796875,
                z  = -44.40180969238281
             },
              UP6  = {
                y  = 25.676485061645509,
                x  = -2566.796142578125,
                z  = -67.01408386230469
             },
              UP5  = {
                y  = 25.5211238861084,
                x  = -2563.39990234375,
                z  = -63.74509811401367
             },
              UP4  = {
                y  = 24.990556716918947,
                x  = -2570.3349609375,
                z  = -69.34259033203125
             }
           },
            thriller_park  = {
              UP1  = {
                y  = 113.23728942871094,
                x  = -224.14295959472657,
                z  = -657.738037109375
             },
              UP3  = {
                y  = 109.37400817871094,
                x  = -224.78709411621095,
                z  = -640.7178955078125
             },
              UP2  = {
                y  = 109.37401580810547,
                x  = -229.42715454101563,
                z  = -649.636474609375
             },
              UP6  = {
                y  = 109.37400817871094,
                x  = -214.7626190185547,
                z  = -632.3900146484375
             },
              UP5  = {
                y  = 109.37401580810547,
                x  = -230.53053283691407,
                z  = -657.9769287109375
             },
              UP4  = {
                y  = 109.37400817871094,
                x  = -220.0915985107422,
                z  = -636.2127075195313
             }
           },
           chainsaw  = {
            UP1  = {
                x = -332.51287841796875, 
                y = 1.0000009536743164,
                z = -554.8867797851562
                
           },
            UP3  = {
                x = -326.1617126464844,
                y = 1.0000009536743164,
                z = -554.5086669921875
           },
            UP2  = {
                x = -317.24713134765625,
                y = 1.0000007152557373,
                z = -553.8807983398438
           },
            UP6  = {
                x = -327.2223815917969,
                y = 1.0000004768371582,
                z = -550.3519287109375
           },
            UP5  = {
                x = -342.5332946777344,
                y = 1.0000004768371582,
                z = -551.2924194335938
           },
            UP4  = {
                x = -320.3905944824219,
                y = 1.0000004768371582,
                z = -550.587890625
           }
         },
           jojo = {
            UP1  = {
                x = -111.61297607421875, 
                y = 15.255210876464844, 
                z = -513.5579833984375
             },
              UP3  = {
                x = -120.01858520507812, 
                y = 15.255210876464844, 
                z = -522.66650390625
             },
              UP2  = {
                x = -124.42668151855469, 
                y = 15.255210876464844, 
                z = -530.7169799804688
             },
              UP6  = {
                x = -120.38040161132812, 
                y = 15.255212783813477, 
                z = -536.6077270507812
             },
              UP5  = {
                x = -115.62987518310547, 
                y = 15.255210876464844, 
                z = -518.679931640625                
             },
              UP4  = {
                x = -118.3056411743164, 
                y = 15.255210876464844, 
                z = -529.9589233398438
             }
           },
           opm = {
            UP1 = {
              y = 361.61859130859377,
              x = -302.2696228027344,
              z = 1434.5257568359376
            },
            UP3 = {
              y = 361.61859130859377,
              x = -295.8048095703125,
              z = 1441.3121337890626
            },
            UP2 = {
              y = 367.15777587890627,
              x = -286.0375671386719,
              z = 1450.30908203125
            },
            UP6 = {
              y = 361.61859130859377,
              x = -315.8988037109375,
              z = 1420.7376708984376
            },
            UP5 = {
              y = 361.6484375,
              x = -320.0697937011719,
              z = 1430.2279052734376
            },
            UP4 = {
              y = 361.61859130859377,
              x = -279.85382080078127,
              z = 1441.7813720703126
            }
           }
         },

        xselectedUnits = {
            U1 = nil,
            U2 = nil,
            U3 = nil,
            U4 = nil,
            U5 = nil,
            U6 = nil
        }
    
    }

    local json = HttpService:JSONEncode(xdata)
    writefile(savefilename, json)

    sex()
end

function placesex()
    if getgenv().AutoFarm and not getgenv().disableatuofarm then
        print("a")
        if game.PlaceId ~= 8304191830 then
            x = 1.7
            y = 0
            z = 1.7
            print("AutoFarming")
            if game.Workspace._map:FindFirstChild("namek mushroom model") then
                print("Namak")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Namak"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("houses_new") then
                print("Aot")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Aot"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y , pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("Snow Particles") then
                print("Snowy")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Snowy"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("sand_gate") then
                print("Sand")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Sand"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("icebergs") then
                print("Marine")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Marine"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("Helicopter Pad") then
                print("Ghoul")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Ghoul"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("Bones/dust") then
                print("Hollow")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Hollow"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("Ant Nest") then
                print("Ant")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Ant"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("light poles") then
                print("Magic")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Magic"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("LanternsGround") then
                print("Cursed")    
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["Cursed"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("pumpkins") then
                    print("thriller_park")    
                    for i = 1, 6 do
                        local unitinfo = getgenv().SelectedUnits["U" .. i]
                        if unitinfo ~= nil then
                            local unitinfo_ = unitinfo:split(" #")
                            local pos = getgenv().SpawnUnitPos["thriller_park"]["UP" .. i]
    
                            --place units 0
                            local args = {
                                [1] = unitinfo_[2],
                                [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
    
                            --place units 1
                            local args = {
                                [1] = unitinfo_[2],
                                [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
    
                            --place units 2 
                            local args = {
                                [1] = unitinfo_[2],
                                [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
    
                            --place units 3 
                            local args = {
                                [1] = unitinfo_[2],
                                [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
    
                            --place units 4
                            local args = {
                                [1] = unitinfo_[2],
                                [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
    
                            --place units 5
                            local args = {
                                [1] = unitinfo_[2],
                                [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                        end
                    end
            elseif game.Workspace._map:FindFirstChild("skeleton") then
                print("black_clover")    
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["black_clover"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("graves") then
                print("Hollow Legend")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["hollow_leg"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("vending machines") then
                print("chainsaw")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["chainsaw"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("SpaceCenter") then
                print("Cape Canaveral")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["jojo"]["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            elseif game.Workspace._map:FindFirstChild("secret") then
                print("opm")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["opm"]["UP" .. i]
                        task.wait()
                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"] - y, pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] - y, pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end


--AUTOFARM LOOPER--

coroutine.resume(coroutine.create(function()
    while task.wait(1.5) do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
        repeat task.wait() until game:GetService("Workspace"):WaitForChild("_map")

        placesex()
    end
end))


local PlaceID = 8304191830
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local last

local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("SameServers.json"))
 end)
 if not File then
    table.insert(AllIDs, actualHour)
    writefile("SameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
 end

 function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    local extranum = 0
    for i,v in pairs(Site.data) do
        extranum = extranum + 1
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            if extranum ~= 1 and tonumber(v.playing) < last or extranum == 1 then
                last = tonumber(v.playing)
            elseif extranum ~= 1 then
                continue
            end
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
 end

 function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
 end

 coroutine.resume(coroutine.create(function()
	local GameFinished = game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished")
    GameFinished:GetPropertyChangedSignal("Value"):Connect(function()
        print("Changed", GameFinished.Value == true)
        if GameFinished.Value == true then
            repeat task.wait() until  game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true
            task.wait()
            pcall(function() webhook() end)
            task.wait(2.1)
            if getgenv().AutoReplay then
                local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
                local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
            elseif getgenv().AutoLeave and getgenv().AutoReplay ~= true then
                --
                Teleport()
                -- game:GetService("TeleportService"):Teleport(8304191830, game.Players.LocalPlayer)
            end
        end
	end)
end))

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if getgenv().UnitSellTog then
    
            for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                if v.Name == "CollectionUnitFrame" then
                    repeat task.wait() until v:FindFirstChild("name")
                    for _, Info in next, getgenv().UnitCache do
                        if Info.name == v.name.Text and Info.rarity == getgenv().UnitToSell then
                            local args = {
                                [1] = {
                                    [1] = tostring(v._uuid.Value)
                                }
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_units:InvokeServer(unpack(args))
                         end
                    end
                end
            end
            
        end
    end
    end))

    getgenv().autoupgradeerr = false

function autoupgradefunc()
    local success, err = pcall(function() --///

        repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
        for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
           if v:FindFirstChild("_stats") then
                if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value >= 0 then
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                end
            end
        end

    end)

    if err then
        warn("//////////////////////////////////////////////////")
        warn("//////////////////////////////////////////////////")
        getgenv().autoupgradeerr = true
        error(err)
    end
end

coroutine.resume(coroutine.create(function()
    while task.wait(2) do
        if getgenv().autoupgrade then
            if game.PlaceId ~= 8304191830 then
                pcall(function()
                    autoupgradefunc()
                end)
            end
            if  getgenv().autoupgradeerr == true then
                task.wait()
                autoupgradefunc()
                getgenv().autoupgradeerr = false
            end
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while task.wait() do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
        if getgenv().autosell and tonumber(getgenv().sellatwave) <= _wave.Value then
            getgenv().disableatuofarm = true
            if game.PlaceId ~= 8304191830 then
                repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
                for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                    repeat
                        task.wait()
                    until v:WaitForChild("_stats")
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        repeat
                            task.wait()
                        until v:WaitForChild("_stats"):WaitForChild("upgrade")
            
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
                    end
                end
            end
        end
    end
end))

getgenv().autoabilityerr = false

function autoabilityfunc()
    local success, err = pcall(function() --///
        repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
        for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
            if v:FindFirstChild("_stats") then
                if v._stats:FindFirstChild("player") and v._stats:FindFirstChild("xp") then
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value > 0 then
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
                    end
                end
            end
        end
    end)
     
     if err then
         warn("//////////////////////////////////////////////////")
         warn("//////////////////////////////////////////////////")
         getgenv().autoabilityerr = true
         error(err)
     end

end

coroutine.resume(coroutine.create(function()

    while task.wait(2) do
        if getgenv().autoabilities then
            if game.PlaceId ~= 8304191830 then
                pcall(function()
                    autoabilityfunc()
                end)
            end
            if  getgenv().autoabilityerr == true then
                task.wait()
                autoabilityfunc()
                getgenv().autoabilityerr = false
            end
        end
    end   

end))

getgenv().teleporting = true

------// Auto Start \\------
--#region Auto Start loop

local function checkChallenge()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("SurfaceGui") then
            if v:FindFirstChild("ChallengeCleared") then
                --print(v.ChallengeCleared.Visible)
                return v.ChallengeCleared.Visible
            end
        end
    end
end

local function checkReward()
    if checkChallenge() == false then
        if getgenv().selectedreward == game:GetService("Workspace")["_LOBBIES"]["_DATA"]["_CHALLENGE"]["current_reward"].Value then
            return true
        elseif getgenv().AutoChallengeAll then
            return true
        else
            return false
        end
    else
        return false
    end
end

local function startfarming()
    if getgenv().farmprotal == false and getgenv().autostart and getgenv().AutoFarm and getgenv().teleporting 
                           and getgenv().AutoFarmTP == false and getgenv().AutoFarmIC == false then

        if game.PlaceId == 8304191830 then
            local cpos = plr.Character.HumanoidRootPart.CFrame

            if tostring(Workspace._LOBBIES.Story[getgenv().door].Owner.Value) ~= plr.Name then
                for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetDescendants()) do
                    if v.Name == "Owner" and v.Value == nil then

                        local args = {
                            [1] = tostring(v.Parent.Name)
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))
                    
                        task.wait()
                    
                        if getgenv().level:match("infinite") then
                            local args = {
                                [1] = tostring(v.Parent.Name), -- Lobby 
                                [2] = getgenv().level, -- World
                                [3] = true, -- Friends Only or not
                                [4] = "Hard"
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
                        else
                            local args = {
                                [1] = tostring(v.Parent.Name), -- Lobby 
                                [2] = getgenv().level, -- World
                                [3] = true, -- Friends Only or not
                                [4] = getgenv().difficulty
                            }
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
                        end

                        local args = { 
                            [1] =tostring(v.Parent.Name)
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
                        getgenv().door = v.Parent.Name print(v.Parent.Name) --v.Parent:GetFullName()
                        plr.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
                        break
                    end
                end
            end

            task.wait()

            plr.Character.HumanoidRootPart.CFrame = cpos

            if Workspace._LOBBIES.Story[getgenv().door].Owner == plr.Name then
                if Workspace._LOBBIES.Story[getgenv().door].Teleporting.Value == true then
                    getgenv().teleporting = false
                else
                    getgenv().teleporting = true
                end
            end

            warn("farming")
            task.wait(3)
        end
    elseif getgenv().autostart and getgenv().AutoFarm and getgenv().teleporting 
                           and getgenv().AutoFarmTP == false and getgenv().AutoFarmIC == false and getgenv().farmprotal or getgenv().farmprotal then

        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer.ItemFrames:GetChildren()) do
            if v.Name == "portal_csm" or v.Name == "portal_csm1" or v.Name == "portal_csm2" or v.Name == "portal_csm3" or v.Name == "portal_csm4" or v.Name == "portal_csm5"  then
                print(v._uuid_or_id.value)
                getgenv().PortalID = v._uuid_or_id.value
                break;
            end
        end
          task.wait(1.5)

          local args = {
            [1] = tostring(getgenv().PortalID),
            [2] = {
                ["friends_only"] = true
            }
        }
        
        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_portal:InvokeServer(unpack(args))

        task.wait(1.5)

        for i,v in pairs(game:GetService("Workspace")["_PORTALS"].Lobbies:GetDescendants()) do
            if v.Name == "Owner" then
                if tostring(v.value) == game.Players.LocalPlayer.Name then
                    local args = {
                        [1] = tostring(v.Parent.Name)
                    }
                    
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
                    break;
                end
            end 
        end
        

        task.wait(7)
    end
end

local function startChallenge()
    if game.PlaceId == 8304191830 then
        local cpos = plr.Character.HumanoidRootPart.CFrame

        if getgenv().AutoChallenge and getgenv().autostart and getgenv().AutoFarm  and checkReward() == true then

            for i, v in pairs(game:GetService("Workspace")["_CHALLENGES"].Challenges:GetDescendants()) do
                if v.Name == "Owner" and v.Value == nil then
                    --print(v.Parent.Name.." "..v.Parent:GetFullName())
                    local args = { 
                        [1] = tostring(v.Parent.Name)
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))

                    getgenv().chdoor = v.Parent.Name
                    break
                end
            end
            task.wait()
            plr.Character.HumanoidRootPart.CFrame = cpos
           
        end
    end
end

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if getgenv().AutoFarmIC == false and getgenv().AutoFarmTP == false then
            if checkChallenge() == false  then --challenge is not cleared
                if  getgenv().AutoChallenge and checkReward() == true then
                    startChallenge() --start challenge
                else
                    startfarming()--regular farming
                end
            elseif checkChallenge() == true then
                startfarming()--regular farming
            end
        end
    end
end))

local function FarmCastlePark()
    if getgenv().AutoFarmIC and getgenv().AutoFarm then
        if game.PlaceId == 8304191830 then

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12423.1855, 155.24025, 3198.07593, -1.34111269e-06, -2.02512282e-08, 1, 3.91705386e-13, 1, 2.02512282e-08, -1, 4.18864542e-13, -1.34111269e-06)
            
            getgenv().infinityroom = 0

            for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.InfiniteTowerUI.LevelSelect.InfoFrame.LevelButtons:GetChildren()) do
                if v.Name == "FloorButton" then
                    if v.clear.Visible == false and v.Locked.Visible == false then
                        local room = string.split(v.Main.text.Text, " ")

                        local args = {
                            [1] = tonumber(room[2])
                        }
                        
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower:InvokeServer(unpack(args))
                        getgenv().infinityroom = tonumber(room[2])
                        break
                    end
                end
            end
            
            task.wait(6)
        end
    elseif getgenv().AutoFarmTP and getgenv().AutoFarm then
        if game.PlaceId == 8304191830 then

            local cpos = plr.Character.HumanoidRootPart.CFrame

            for i, v in pairs(game:GetService("Workspace")["_EVENT_CHALLENGES"].Lobbies:GetDescendants()) do
                    if v.Name == "Owner" and v.Value == nil then

                        local args = {
                            [1] = tostring(v.Parent.Name)
                        }
                        
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))

                        task.wait()

                        plr.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
                        break
                    end
                end

            task.wait()

            plr.Character.HumanoidRootPart.CFrame = cpos
            warn("farming")
            task.wait(5)

        end
    end
end

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if checkChallenge() == false  then --challenge is not cleared
            if  getgenv().AutoChallenge and checkReward() == true then
                startChallenge() --start challenge
            else
                FarmCastlePark()--regular farming
            end
        elseif checkChallenge() == true then
            FarmCastlePark()--regular farming
        end
    end
end))

if getgenv().AutoLoadTP == true then
    local exec = tostring(identifyexecutor())

    if exec == "Synapse X" then
        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/KeremHuba/AnimAdventures/main/animeadventures.lua'))()")
    else
        queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/KeremHuba/AnimAdventures/main/animeadventures.lua'))()")
    end

end

task.spawn(function()  -- Hides name for yters (not sure if its Fe)
    while task.wait() do
        pcall(function()
            if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
               workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
            end
        end)
    end
end)

pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

    game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_daily_reward:InvokeServer()
end)
