
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
------------------------------
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace") 
local plr = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")

getgenv().savefilename = "XnoHUBANIMEADVENTURES_"..game.Players.LocalPlayer.Name..".json"
getgenv().door = "_lobbytemplategreen1"

--#region Webhook Sender
local function webhook()
	pcall(function()
		local url = tostring(getgenv().weburl)
		if url == "" then
			return
		end 
			
    	XP = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.XPReward.Main.Amount.Text)
		gems = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.GemReward.Main.Amount.Text)
		cwaves = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.WavesCompleted.Text
		ctime = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text
		waves = cwaves:split(": ")
		ttime = ctime:split(": ")

		local data = {
			["content"] = "",
			["username"] = "Xno Hub - Anime Adventures",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Results",
					},
					["description"] = "||**"..game:GetService("Players").LocalPlayer.Name.."**||",
					["color"] = tonumber("FF0000"),

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},

					["fields"] = {
						{
							["name"] = "Completed Waves",
							["value"] = tostring(waves[2]),
							["inline"] = true
						}, {
							["name"] = "Recieved Gems:",
							["value"] = gems,
							["inline"] = true
						}, {
                            ["name"] = "Received XP:",
                            ["value"] = XP,
                            ["inline"] = true
                        }, {
                            ["name"] = "Monkey's Level:",
                            ["value"] = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text).. " ✨",
                            ["inline"] = true
                        }
					};
					["footer"] = {
                        ["text"] = "Anime Adventures - Xno Hub",
                        ["icon_url"] = "https://i.imgur.com/qfTZMup.jpeg",
                    }
				}
			}
		}

		local porn = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local sex = {Url = url, Body = porn, Method = "POST", Headers = headers}
		request(sex)
	end)
end
--#endregion

getgenv().UnitCache = {}

for _, Module in next, game:GetService("ReplicatedStorage"):WaitForChild("src"):WaitForChild("Data"):WaitForChild("Units"):GetDescendants() do
    if Module:IsA("ModuleScript") and Module.Name ~= "UnitPresets" then
        for UnitName, UnitStats in next, require(Module) do
            getgenv().UnitCache[UnitName] = UnitStats
        end
    end
end

--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

function sex()
    -- reads jsonfile
    local jsonData = readfile(savefilename)
    local data = HttpService:JSONDecode(jsonData)

--#region global values

    --DEVIL CITY
    getgenv().portalnameX = data.portalnameX
    getgenv().farmprotal = data.farmportal
    getgenv().buyportal = data.buyportal
    getgenv().PortalID = data.PortalID
    getgenv().AutoNextLevelIC = data.AutoNextLevelIC

    getgenv().autostartStory = data.autostartStory
    getgenv().questtoday = data.questtoday
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
    getgenv().MerchBuyPot = data.autobuypotion

    function updatejson()
        local xdata = {
            portalnameX = getgenv().portalnameX,
            farmportal = getgenv().farmprotal,
            buyportal = getgenv().buyportal,
            PortalID = getgenv().PortalID,
            AutoNextLevelIC = getgenv().AutoNextLevelIC

            -- unitname = getgenv().unitname,
            -- unitid = getgenv().unitid,
            autoloadtp = getgenv().AutoLoadTP,
            AutoLeave = getgenv().AutoLeave,
            AutoReplay = getgenv().AutoReplay,
            autostartStory = getgenv().autostartStory,
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
            autobuypotion = getgenv().MerchBuyPot,
            --door = getgenv().door,

            xspawnUnitPos = getgenv().SpawnUnitPos,
            xselectedUnits = getgenv().SelectedUnits,
            autoabilities = getgenv().autoabilities
        }

        local json = HttpService:JSONEncode(xdata)
        writefile(savefilename, json)
    end
--#endregion

    --\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
    --\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

    -- Uilib Shits

    local exec = tostring(identifyexecutor())

    local Atlas = loadstring(game:HttpGet("https://raw.githubusercontent.com/KeremHuba/AtlasUILib/main/AtlasUI3.lua"))()
    local UI = Atlas.new({
        Name = "Anime Adventures - Xno Hub";
        ConfigFolder = "AAXnoHub";
        Credit = "Made By G.O.A.T";
        Color = Color3.fromRGB(255,0,0);
        Bind = "LeftControl";
        UseLoader = false;
        FullName = "Anime Adventures Auto Farm";
        CheckKey = false;
        Discord = "https://discord.gg/xnohub";
    })

    if game.PlaceId == 8304191830 then
        local AutoFarm = UI:CreatePage("Select Units")
        local selworld = UI:CreatePage("Select World")
    
        local dev = UI:CreatePage("Devil City")
    
        local afset = UI:CreatePage("Auto Farm Settings")
    
        local autoch = UI:CreatePage("Auto Challenge")
    
        local Webhook = UI:CreatePage("Webhook")
        
        local misco = UI:CreatePage("Misc")

        local unitselecttab = AutoFarm:CreateSection("Units")
        local slectworld = selworld:CreateSection("Select World")
        local devilcity = dev:CreateSection("Devil City")
        local autofarmtab = afset:CreateSection("Auto Farm")
        local autoclngtab = autoch:CreateSection("Auto Challenge")
        local webhookserver = Webhook:CreateSection("Webhook")

--------------------------------------------------
--------------- Select Units Tab -----------------
--------------------------------------------------
--#region Select Units Tab
        local Units = {}
        local feeduni = {}

        local function loadUnit()
            repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
            task.wait(2)
            table.clear(Units)
            for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                if v.Name == "CollectionUnitFrame" then
                    repeat task.wait() until v:FindFirstChild("_uuid")
                    table.insert(Units, v.name.Text .. " #" .. v._uuid.Value)
                    table.insert(feeduni, "#" .. v._uuid.Value)
                end
            end
        end

        loadUnit()

        local function Check(x, y)
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
        end

        local function Equip()
            game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
            
            for i = 1, 6 do
                local unitinfo = getgenv().SelectedUnits["U" .. i]
                warn(unitinfo)
                if unitinfo ~= nil then
                    local unitinfo_ = unitinfo:split(" #")
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.equip_unit:InvokeServer(unitinfo_[2])
                end
            end
            updatejson()
        end

        unitselecttab:CreateButton({
            Name = "Select Equipped Units";
            Callback = function()
                for i, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui["spawn_units"].Lives.Frame.Units:GetChildren()) do
                    if v:IsA("ImageButton") then
                        local unitxx = v.Main.petimage.WorldModel:GetChildren()[1]
                        if unitxx ~= nil then
                            if Check(unitxx.Name,v) then
                                print(unitxx, v)
                                end
                            end
                        end
                    end
            end
        })

        local drop = unitselecttab:CreateDropdown({
            Name = "Unit 1";
            Callback = function(bool)
                getgenv().SelectedUnits["U1"] = bool
                Equip()
            end;
            Options = Units;
            ItemSelecting = true;
            DefaultItemSelected = getgenv().SelectedUnits["U1"];
            Warning = "Select Unit 1 Monkey";
            WarningIcon = 12345;
        })

        local drop2 = unitselecttab:CreateDropdown({
            Name = "Unit 2";
            Callback = function(bool)
                getgenv().SelectedUnits["U2"] = bool
                Equip()
            end;
            Options = Units;
            ItemSelecting = true;
            DefaultItemSelected = getgenv().SelectedUnits["U2"];
            Warning = "Select Unit 2 Monkey";
            WarningIcon = 12345;
        })

        local drop3 = unitselecttab:CreateDropdown({
            Name = "Unit 3";
            Callback = function(bool)
                getgenv().SelectedUnits["U3"] = bool
                Equip()
            end;
            Options = Units;
            ItemSelecting = true;
            DefaultItemSelected = getgenv().SelectedUnits["U3"];
            Warning = "Select Unit 3 Monkey";
            WarningIcon = 12345;
        }) 

        local drop4 = unitselecttab:CreateDropdown({
            Name = "Unit 4";
            Callback = function(bool)
                getgenv().SelectedUnits["U4"] = bool
                Equip()
            end;
            Options = Units;
            ItemSelecting = true;
            DefaultItemSelected = getgenv().SelectedUnits["U4"];
            Warning = "Select Unit 4 Monkey";
            WarningIcon = 12345;
        })

        local axx =  game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")
        _G.drop5 = nil
        _G.drop6 = nil
        if tonumber(axx[2]) >= 20 then
            local drop5 = unitselecttab:CreateDropdown({
                Name = "Unit 5";
                Callback = function(bool)
                    getgenv().SelectedUnits["U5"] = bool
                    Equip()
                end;
                Options = Units;
                ItemSelecting = true;
                DefaultItemSelected = getgenv().SelectedUnits["U5"];
                Warning = "Select Unit 5 Monkey";
                WarningIcon = 12345;
            })
        end

        if tonumber(axx[2]) >= 50 then
            local drop6 = unitselecttab:CreateDropdown({
                Name = "Unit 6";
                Callback = function(bool)
                    getgenv().SelectedUnits["U6"] = bool
                    Equip()
                end;
                Options = Units;
                ItemSelecting = true;
                DefaultItemSelected = getgenv().SelectedUnits["U6"];
                Warning = "Select Unit 6 Monkey";
                WarningIcon = 12345;
            })
        end
--------------// Refresh Unit List \\------------- 
unitselecttab:CreateButton({
    Name = "Refresh List"; 
    Callback = function()
        loadUnit()
            game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
            for i, v in ipairs(Units) do
                drop:Update(v)
                drop2:Update(v)
                drop3:Update(v)
                drop4:AUpdatedd(v)
                if _G.drop5 ~= nil then
                    _G.drop5:Update(v)
                end
                if _G.drop6 ~= nil then
                    _G.drop6:Update(v)
                end 
            end
            getgenv().SelectedUnits = {
                U1 = nil,
                U2 = nil,
                U3 = nil,
                U4 = nil,
                U5 = nil,
                U6 = nil
            }
    end
})
--#endregion

--------------------------------------------------
--------------- Select World Tab -----------------
--------------------------------------------------
--#region Select world tab
        getgenv().levels = {"nill"}

        getgenv().diff = slectworld:CreateDropdown({
            Name = "Select Difficulty";
            Callback = function(diff)
            getgenv().difficulty = diff
            updatejson()
            end;
            Options = {"Normal", "Hard"};
            ItemSelecting = true;
            DefaultItemSelected = getgenv().difficulty;
            Warning = "Select Difficulty";
            WarningIcon = 12345;
        })

        local worlddrop = slectworld:CreateDropdown({
            Name = "Select World";
            Callback = function(world)
                getgenv().world = world
                updatejson()

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
                elseif world == "Fabled Kingdom" then
                    table.clear(levels)
                    getgenv().levels = {"7ds_infinite","7ds_level_1","7ds_level_2","7ds_level_3","7ds_level_4","7ds_level_5","7ds_level_6"}
                    for i,v in ipairs(getgenv().levels) do
                        getgenv().leveldrop:Update(getgenv().levels)
                    end
                end
            end;
            Options = {"Plannet Namak", "Shiganshinu District", "Snowy Town","Hidden Sand Village", "Marine's Ford","Ghoul City", "Hollow World", "Ant Kingdom", "Magic Town", "Cursed Academy","Clover Kingdom", "Clover Legend - HARD","Hollow Legend - HARD","Cape Canaveral","Alien Spaceship","Fabled Kingdom"};
            ItemSelecting = true;
            DefaultItemSelected = getgenv().world;
            Warning = "Select World";
            WarningIcon = 12345;
        })

        
        getgenv().leveldrop = slectworld:CreateDropdown({
            Name = "Select Act";
            Callback = function(level)
                getgenv().level = level
                updatejson()
            end;
            Options = {"Kerem","is","best","myman"};
            ItemSelecting = true;
            DefaultItemSelected = getgenv().level;
            Warning = "Select Act";
            WarningIcon = 12345;
        })
--#endregion

getgenv().portalname = devilcity:CreateDropdown({
    Name = "Select Portal";
    Callback = function(pornname)
        getgenv().portalnameX = pornname
        updatejson()
    end;
    Options = {"csm_contract_0", "csm_contract_1","csm_contract_2","csm_contract_3","csm_contract_4","csm_contract_5"};
    ItemSelecting = true;
    DefaultItemSelected = getgenv().portalnameX;
    Warning = "Select Portal";
    WarningIcon = 12345;
})

devilcity:CreateButton({
    Name = "Buy Portal"; 
    Callback = function()
        local args = {
            [1] = tostring(getgenv().portalnameX)
        }
        game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_csmportal_shop_item:InvokeServer(unpack(args))
    end
})

devilcity:CreateToggle({
    Name = "Auto Farm Devil Portal";
    Flag = "devilqwd";
    Default = getgenv().farmportal;
    Callback = function(bool)
        getgenv().farmprotal = bool
        updatejson()
    end;
    SavingDisabled = true;
})

--------------------------------------------------
------------------ Auto Farm Tab -----------------
--------------------------------------------------
--#region Auto Farm Tab
autofarmtab:CreateToggle({
    Name = "Auto Replay";
    Flag = "wqdasdqd";
    Default = getgenv().AutoReplay;
    Callback = function(bool)
        getgenv().AutoReplay = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Leave";
    Flag = "leaasdqdave";
    Default = getgenv().AutoLeave;
    Callback = function(bool)
        getgenv().AutoLeave = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Start Story";
    Flag = "leaasd31qdave";
    Default = getgenv().autostartStory;
    Callback = function(bool)
        getgenv().autostartStory = bool
		updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Infinity Castle";
    Flag = "infinitgfhycastle";
    Default = getgenv().AutoFarmIC;
    Callback = function(bool)
        getgenv().AutoFarmIC = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Infinity Next Level";
    Flag = "infinseksitgfhycastle";
    Default = getgenv().AutoNextLevelIC;
    Callback = function(bool)
        getgenv().AutoNextLevelIC = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Farm";
    Flag = "farghjghjm";
    Default = getgenv().AutoFarm;
    Callback = function(bool)
        getgenv().AutoFarm = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Start";
    Flag = "sthjkhart";
    Default = getgenv().autostart;
    Callback = function(bool)
        getgenv().autostart = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Abilities";
    Flag = "abilwefsdfity";
    Default = getgenv().autoabilities;
    Callback = function(bool)
        getgenv().autoabilities = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Upgrade Units";
    Flag = "upgertegdfgrade";
    Default = getgenv().autoupgrade;
    Callback = function(bool)
        getgenv().autoupgrade = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmtab:CreateToggle({
    Name = "Auto Sell At Spectic Wave";
    Flag = "wergdfgave";
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

autofarmtab:CreateTextBox({
    Name = "Wave";
    Flag = "wavergdfggee"; 
    Callback = function(inputtedText,enterPressed)
        getgenv().sellatwave = tonumber(inputtedText)
        updatejson()
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

webhookserver:CreateToggle({
    Name = "Auto Load Script";
    Flag = "wergcadfgave";
    Default = true;
    Callback = function(x)
        getgenv().AutoLoadTP = x
        updatejson()
        if exec == "Synapse X" and getgenv().AutoLoadTP then
            syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/KeremHuba/AnimAdventures/main/animeadventures.lua'))()")
        elseif exec ~= "Synapse X" and getgenv().AutoLoadTP then
            queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/KeremHuba/AnimAdventures/main/animeadventures.lua'))()")
        end
    end;
    SavingDisabled = true;
})
		
        webhookserver:CreateTextBox({
            Name = "Webhook URL";
            Flag = "waveg3fhe"; 
            Callback = function(inputtedText,enterPressed)
                getgenv().weburl = tostring(inputtedText)
                updatejson()
            end;
            DefaultText = "";
            PlaceholderText = "Write Webhook URL";
            TabComplete = function(inputtedText)
                getgenv().weburl = tostring(inputtedText)
                updatejson()
            end;
            ClearTextOnFocus = false;
            Warning = "";
            WarningIcon = 12345;
        })
--#endregion
--------------------------------------------------
-------------------- Auto Challenge --------------
--------------------------------------------------
--#region Auto Challenge
autoclngtab:CreateToggle({
    Name = "Auto Challenge";
    Flag = "chfghal";
    Default = getgenv().AutoChallenge;
    Callback = function(bool)
        getgenv().AutoChallenge = bool
        updatejson()
    end;
    SavingDisabled = true;
})

local worlddrop = autoclngtab:CreateDropdown({
    Name = "Select Reward";
    Callback = function(reward)
        getgenv().selectedreward = reward
        updatejson()
    end;
    Options = {"star_fruit_random","star_remnant","gems", "gold"};
    ItemSelecting = true;
    DefaultItemSelected = getgenv().selectedreward;
    Warning = "Select Reward";
    WarningIcon = 12345;
})

autoclngtab:CreateToggle({
    Name = "Farm All Rewards";
    Flag = "alrhjkhew";
    Default = getgenv().AutoChallengeAll;
    Callback = function(bool)
        getgenv().AutoChallengeAll = bool
        updatejson()
    end;
    SavingDisabled = true;
})
--#endregion
--------------------------------------------------
-------------------- Auto Buy/Sell ---------------
--------------------------------------------------
--#region Auto Buy/Sell
        getgenv().UnitSellTog = false
        getgenv().autosummontickets = false
        getgenv().autosummongem = false
        getgenv().autosummongem10 = false
        getgenv().useluckpotion = false

        getgenv().autosummonticketse = false
        getgenv().autosummongeme = false
        getgenv().autosummongem10e = false

        local misc = misco:CreateSection("Auto Summon")


        local function autobuyfunc(xx, item)
            task.wait()

            local args = {
                [1] = xx,
                [2] = item
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_from_banner:InvokeServer(unpack(args))
            
        end

        local MyParagraph = misc:CreateParagraph("2X Mythic")

        misc:CreateButton({
            Name = "Use Luck Potion"; 
            Callback = function()
            local args = {
                [1] = "LuckPotion"
            }

            game:GetService("ReplicatedStorage").endpoints.client_to_server.use_item:InvokeServer(unpack(args))
            end
        })

        misc:CreateToggle({
            Name = "Auto Summon {Use Ticket 1}";
            Flag = "autorgegfd1";
            Default = getgenv().autosummonticketse;
            Callback = function(bool)
            getgenv().autosummonticketse = bool
            updatejson()
            pcall(function()
                while getgenv().autosummonticketse do
                    autobuyfunc("EventClover", "ticket")
                end
            end)
            end;
            SavingDisabled = true;
        })

        misc:CreateToggle({
            Name = "Auto Summon {Buy 1}";
            Flag = "asergdfgd";
            Default = getgenv().autosummongeme;
            Callback = function(bool)
                getgenv().autosummongeme = bool
                updatejson()
                pcall(function()
                    while getgenv().autosummongeme do
                        autobuyfunc("EventClover", "gems")
                    end
                end)
            end;
            SavingDisabled = true;
        })

        misc:CreateToggle({
            Name = "Auto Summon {Buy 10}";
            Flag = "asdqwdasddf";
            Default = getgenv().autosummongem10e;
            Callback = function(bool)
                getgenv().autosummongem10e = bool
                updatejson()
                pcall(function()
                    while getgenv().autosummongem10e do
                        autobuyfunc("EventClover", "gems")
                    end
                end)
            end;
            SavingDisabled = true;
        })

        local MyParagraph = misc:CreateParagraph("Standart")

        misc:CreateToggle({
            Name = "Auto Summon {Use Ticket 1}";
            Flag = "asdfghfrdfh";
            Default = getgenv().autosummontickets;
            Callback = function(bool)
                getgenv().autosummontickets = bool
                updatejson()
                pcall(function()
                    while getgenv().autosummontickets do
                        autobuyfunc("Standard", "ticket")
                    end
                end)
            end;
            SavingDisabled = true;
        })

        misc:CreateToggle({
            Name = "Auto Summon {Buy 1}";
            Flag = "asdwqdasddffg";
            Default = getgenv().autosummongem;
            Callback = function(bool)
                getgenv().autosummongem = bool
                updatejson()
                pcall(function()
                    while getgenv().autosummongem do
                        autobuyfunc("Standard", "gems")
                    end
                end)
            end;
            SavingDisabled = true;
        })

        misc:CreateToggle({
            Name = "Auto Summon {Buy 10}";
            Flag = "asddffqwdghasdgha";
            Default = getgenv().autosummongem10;
            Callback = function(bool)
                getgenv().autosummongem10 = bool
                pcall(function()
                    while getgenv().autosummongem10 do
                        autobuyfunc("Standard", "gems10")
                    end
                end)
                updatejson()
            end;
            SavingDisabled = true;
        })

        local MyParagraph = misc:CreateParagraph("Sell Units")

        local utts = misc:CreateDropdown({
            Name = "Select Rarity";
            Callback = function(u)
                getgenv().UnitToSell = u
                updatejson()
            end;
            Options = {"Rare", "Epic"};
            ItemSelecting = true;
            DefaultItemSelected = getgenv().UnitToSell;
            Warning = "Select Rarity noob";
            WarningIcon = 12345;
        })

        
        misc:CreateToggle({
            Name = "Auto Sell Units";
            Flag = "autoselghjlasd";
            Default = getgenv().UnitSellTog;
            Callback = function(bool)
                getgenv().UnitSellTog = bool
                updatejson()
            end;
            SavingDisabled = true;
        })

        local feed = misco:CreateSection("Auto Feed")
        local merch = misco:CreateSection("Auto Buy Merchant")
        local miscoo = misco:CreateSection("Misc")

        feed:CreateDropdown({
            Name = "Select Unit to feed";
            Callback = function(u)
                getgenv().FeedUnit = u
            end;
            Options = feeduni;
            ItemSelecting = true;
            DefaultItemSelected = getgenv().FeedUnit;
            Warning = "Select Ur Unit NOOOB";
            WarningIcon = 12345;
        })

        feed:CreateToggle({
            Name = "Auto Feed Unit";
            Flag = "qwdqdaas2d";
            Default = getgenv().AutoFeed;
            Callback = function(bool)
                getgenv().AutoFeed = bool
                updatejson()
            end;
            SavingDisabled = true;
        })

        merch:CreateToggle({
            Name = "Auto Buy Luck Potion";
            Flag = "qwdqdaasqw2d";
            Default = getgenv().MerchBuyPot;
            Callback = function(bool)
                getgenv().MerchBuyPot = bool
                updatejson()
            end;
            SavingDisabled = true;
        })

        merch:CreateToggle({
            Name = "Auto Buy Summon Tickets";
            Flag = "qwdqda31qw2d";
            Default = getgenv().MerchTicket;
            Callback = function(bool)
                getgenv().MerchTicket = bool
                updatejson()
            end;
            SavingDisabled = true;
        })

        local MyParagraph2 = misc:CreateParagraph("Misc")

        miscoo:CreateButton({
            Name = "Use All Codes"; 
            Callback = function()
                local redeem_code = {
					"HERO",
					"UCHIHA",
					"CLOUD",
					"CHAINSAW",
					"NEWYEAR2023",
					"kingluffy",
					"toadboigaming",
					"noclypso",
					"fictionthefirst",
					"subtomaokuma",
					"subtokelvingts",
					"subtoblamspot",
                    "SINS",
                    "SINS2"
				}
				for i, v in ipairs(redeem_code) do
					local args = {
						[1] = tostring(v),
					}
					game:GetService("ReplicatedStorage").endpoints.client_to_server.redeem_code:InvokeServer(unpack(args))
				end
            end
        })

        spawn(function()
            while wait(5) do
                if game.Workspace:FindFirstChild("travelling_merchant"):FindFirstChild("is_open").Value == true then
                    if MerchBuyPot == true then
                            for i,v in pairs(game.Workspace:FindFirstChild("travelling_merchant"):FindFirstChild("stand").items:GetChildren()) do
                                if string.find(v.Name,"Luck") then
                                    local args = {
                                        [1] = v.Name
                                    }
                                    
                                    game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(unpack(args))
                                end
                            end
                    else
                        if MerchTicket == true then
                            for i,v in pairs(game.Workspace:FindFirstChild("travelling_merchant"):FindFirstChild("stand").items:GetChildren()) do
                                if string.find(v.Name,"summon") then
                                    local args = {
                                        [1] = v.Name
                                    }
                                    
                                    game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(unpack(args))
                                end
                            end
                        end
                    end
                end
            end
        end)


        spawn(function()
            if getgenv().AutoFeed then
                repeat task.wait(5)
                    local senzu = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["senzu_bean"].OwnedAmount.Text
                    local beam = senzu:match("%d+")
    
                    local talisman = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["jjk_talisman"].OwnedAmount.Text
                    local jjk = talisman:match("%d+")
    
                    local hxh = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["hxh_fish"].OwnedAmount.Text
                    local hxhh = hxh:match("%d+")
    
                    local aot = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["aot_fluid"].OwnedAmount.Text
                    local aut = aot:match("%d+")
    
                    local soul = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["soul_candy"].OwnedAmount.Text
                    local candy = soul:match("%d+")
    
                    local black = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["black_clover_stone"].OwnedAmount.Text
                    local niga = black:match("%d+")
    
                    local xpdf = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["xp_devil_fruit"].OwnedAmount.Text
                    local df = xpdf:match("%d+")
    
                    local ramen = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["ramen_xp"].OwnedAmount.Text
                    local nardo = ramen:match("%d+")
    
                    local jojo =game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["jojo_pendant"].OwnedAmount.Text
                    local gay = jojo:match("%d+")
    
                    local fairy = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["fairy_tail_exp"].OwnedAmount.Text
                    local tail = fairy:match("%d+")
    
                    local flower = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["wisteria_flower"].OwnedAmount.Text
                    local cicek = flower:match("%d+")
    
                    local coffe = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["coffee"].OwnedAmount.Text
                    local kahve = coffe:match("%d+")
    
                    local opm = game:GetService("Players").LocalPlayer.PlayerGui.items.grid.List.Outer:FindFirstChild("ItemFrames")["opm_core"].OwnedAmount.Text
                    local saitama = opm:match("%d+")
    
                    if getgenv().AutoFeed == true then
                        task.wait(0.5)
    
    
    
                    local args = {
                        [1] = FeedUnit,
                        [2] = {
                            ["jjk_talisman"] = jjk,
                            ["hxh_fish"] = hxhh,
                            ["aot_fluid"] = aut,
                            ["soul_candy"] = candy,
                            ["black_clover_stone"] = niga,
                            ["xp_devil_fruit"] = df,
                            ["senzu_bean"] = beam,
                            ["ramen_xp"] = nardo,
                            ["jojo_pendant"] = gay,
                            ["fairy_tail_exp"] = tail,
                            ["wisteria_flower"] = cicek,
                            ["coffee"] = kahve,
                            ["opm_core"] = saitama
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.level_up_feed:InvokeServer(unpack(args))
                    end
                until not AutoFeed
            end
        end)


--#endregion
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
    else
        spawn(function()
            for i,v in pairs(game.Workspace._UNITS:GetChildren()) do
                if v:FindFirstChild("_hitbox") then
                    v:FindFirstChild("_hitbox").Size = Vector3.new(0.1,0.1,0.1)
                end
            end
        end)
        
        game.Workspace._UNITS.ChildAdded:Connect(function(child)
            if child:FindFirstChild("_hitbox") then
                child:FindFirstChild("_hitbox").Size = Vector3.new(0.1,0.1,0.1)
            end
        end)

        game.Players.LocalPlayer.PlayerGui.MessageGui.Enabled = false
        game:GetService("ReplicatedStorage").packages.assets["ui_sfx"].error.Volume = 0
        game:GetService("ReplicatedStorage").packages.assets["ui_sfx"].error_old.Volume = 0

    local menu = UI:CreatePage("Main")      
    local autofarmtab = menu:CreateSection("Main")
    
    local asdfg = UI:CreatePage("Settings")
    local autofarmset = asdfg:CreateSection("Settings")

    local Webhook = UI:CreatePage("Webhook")
    local webhooktab = Webhook:CreateSection("Webhook")
    
    webhooktab:CreateToggle({
        Name = "Auto Load Script";
        Flag = "loaghqejgdd";
        Default = true;
        Callback = function(bool)
            getgenv().AutoLoadTP = bool
            updatejson()
            if exec == "Synapse X" and getgenv().AutoLoadTP then
                syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/KeremHuba/AnimAdventures/main/animeadventures.lua'))()")
            elseif exec ~= "Synapse X" and getgenv().AutoLoadTP then
                queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/KeremHuba/AnimAdventures/main/animeadventures.lua'))()")
            end
        end;
        SavingDisabled = true;
    })

    webhooktab:CreateSlider({
    Name = "Lag Time";
    Flag = "LagTime"; 
    Min = 0;
    Max = 3;
    AllowOutOfRange = true; 
    Digits = 2; 
    Default = getgenv().takeTime;
    Callback = function(Value)
        if game.PlaceId ~= 8304191830 then
            if getgenv().timelock then
                getgenv().takeTime = Value
                updatejson()
            end
        end
    end;
    Warning = "";
    WarningIcon = 12345;
})

    webhooktab:CreateToggle({
        Name = "Lag";
        Flag = "loaghqejgsaddd";
        Default = getgenv().timelock;
        Callback = function(bool)
            getgenv().timelock = bool
            updatejson()
        end;
        SavingDisabled = true;
    })

    spawn(function()
        coroutine.resume(coroutine.create(function()
            while task.wait(1) do
                if game.PlaceId ~= 8304191830 then
                    if getgenv().timelock then
                        while wait(getgenv().takeTime) do
                            if getgenv().timelock == false then
                                break
                            end
                            local table1 = {}
                            local table2 = {}
                            local function loop(v1,v2)
                                for i = v1,v2 do
                                    table.insert(table1, table2)
                                end
                            end
                            local function crash(v1) 
                                for i = 1,v1 do
                                    table.insert(table2[1], {})
                                end 
        
                                if 499999/(v1+2) then
                                    loop(1,499999/(v1+2))
                                else
                                    loop(1,499999)
                                end
                                game:GetService("RobloxReplicatedStorage").SetPlayerBlockList:FireServer(table1)
                            end
                            table.insert(table2, {})
                            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
                            crash(250)
                        end
                    end
                end
            end
        end))
    end)

    --[[getgenv().portalname = devilcity:CreateDropdown({
        Name = "Select Portal";
        Callback = function(pornname)
            getgenv().portalnameX = pornname
            updatejson()
        end;
        Options = {"csm_contract_0", "csm_contract_1","csm_contract_2","csm_contract_3","csm_contract_4","csm_contract_5"};
        ItemSelecting = true;
        DefaultItemSelected = getgenv().portalnameX;
        Warning = "Select Portal";
        WarningIcon = 12345;
    })
    
    devilcity:CreateButton({
        Name = "Buy Portal"; 
        Callback = function()
            local args = {
                [1] = tostring(getgenv().portalnameX)
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_csmportal_shop_item:InvokeServer(unpack(args))
        end
    })
    
    devilcity:CreateToggle({
        Name = "Auto Farm Devil Portal";
        Flag = "devilghjgh";
        Default = getgenv().farmportal;
        Callback = function(bool)
            getgenv().farmprotal = bool
            updatejson()
        end;
        SavingDisabled = true;
    })
]]

        
--#region Auto Farm Tab

autofarmtab:CreateButton({
    Name = "Set Unit 1 Posit"; 
    Callback = function()
        warn(1)
        MouseClick("UP1")
        warn(2)
    end
})

autofarmtab:CreateButton({
    Name = "Set Unit 2 Posit"; 
    Callback = function()
        warn(1)
        MouseClick("UP2")
        warn(2)
    end
})

autofarmtab:CreateButton({
    Name = "Set Unit 3 Posit"; 
    Callback = function()
        warn(1)
        MouseClick("UP3")
        warn(2)
    end
})

autofarmtab:CreateButton({
    Name = "Set Unit 4 Posit"; 
    Callback = function()
        warn(1)
        MouseClick("UP4")
        warn(2)
    end
})


local axxc = game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")

if tonumber(axxc[2]) >= 20 then
    autofarmtab:CreateButton({
        Name = "Set Unit 5 Posit"; 
        Callback = function()
            warn(1)
            MouseClick("UP5")
            warn(2)
        end
    })
end

if tonumber(axxc[2]) >= 50 then
    autofarmtab:CreateButton({
        Name = "Set Unit 6 Posit"; 
        Callback = function()
            warn(1)
            MouseClick("UP6")
            warn(2)
        end
    })
end

autofarmset:CreateToggle({
    Name = "Auto Replay";
    Flag = "repfhglay";
    Default = getgenv().AutoReplay;
    Callback = function(bool)
        getgenv().AutoReplay = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Start Story";
    Flag = "leaasd311qdave";
    Default = getgenv().autostartStory;
    Callback = function(bool)
        getgenv().autostartStory = bool
		updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Leave";
    Flag = "leregdfgave";
    Default = getgenv().AutoLeave;
    Callback = function(bool)
        getgenv().AutoLeave = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Farm Event";
    Flag = "ftyhgrmev";
    Default = getgenv().AutoFarmTP;
    Callback = function(bool)
        getgenv().AutoFarmTP = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Infinity Castle";
    Flag = "infinityrtghfcastle";
    Default = getgenv().AutoFarmIC;
    Callback = function(bool)
        getgenv().AutoFarmIC = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Farm";
    Flag = "farrthfgh";
    Default = getgenv().AutoFarm;
    Callback = function(bool)
        getgenv().AutoFarm = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Start";
    Flag = "starrthfght";
    Default = getgenv().autostart;
    Callback = function(bool)
        getgenv().autostart = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Abilities";
    Flag = "abilrthfghity";
    Default = getgenv().autoabilities;
    Callback = function(bool)
        getgenv().autoabilities = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Upgrade Units";
    Flag = "upgrarthfghde";
    Default = getgenv().autoupgrade;
    Callback = function(bool)
        getgenv().autoupgrade = bool
        updatejson()
    end;
    SavingDisabled = true;
})

autofarmset:CreateToggle({
    Name = "Auto Sell At Spectic Wave";
    Flag = "wavrthfghe";
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
                        a.CanCollide = false
                        a.Transparency = 1
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
                        elseif game.Workspace._map:FindFirstChild("fence") then
                            print("7ds")
                            SpawnUnitPos["seven"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["seven"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["seven"][UnitPos]["z"] = a.Position.Z
                        end
                        updatejson()
                    end
                end)
        end

--#endregion

--#region Auto Challenge 
--[[autoclngtab:CreateToggle({
    Name = "Auto Challenge";
    Flag = "charthfghl";
    Default = getgenv().AutoChallenge;
    Callback = function(bool)
        getgenv().AutoChallenge = bool
        updatejson()
    end;
    SavingDisabled = true;
})

local worlddrop = autoclngtab:CreateDropdown({
    Name = "Select Reward";
    Callback = function(reward)
        getgenv().selectedreward = reward
        updatejson()
    end;
    Options = {"star_fruit_random","star_remnant","gems", "gold"};
    ItemSelecting = true;
    DefaultItemSelected = "Deez";
    Warning = "Select Reward";
    WarningIcon = 12345;
})

autoclngtab:CreateToggle({
    Name = "Farm All Rewards";
    Flag = "altyjhthfgrew";
    Default = getgenv().AutoChallengeAll;
    Callback = function(bool)
        getgenv().AutoChallengeAll = bool
        updatejson()
    end;
    SavingDisabled = true;
})]]
--#endregion

--#region Auto Sell Tab
autofarmset:CreateTextBox({
    Name = "Select Wave Number For Auto Sell"; 
    Flag = "MyTfghfhextBox";
    Callback = function(inputtedText,enterPressed)
        getgenv().sellatwave = tonumber(inputtedText)
        updatejson()
    end;
    DefaultText = getgenv().sellatwave;
    PlaceholderText = "";
    TabComplete = function(inputtedText)
        getgenv().sellatwave = tonumber(inputtedText)
            updatejson()
    end;
    ClearTextOnFocus = false;
    Warning = "";
    WarningIcon = 12345;
})

--#endregion
end
end

--------------------------------------------------
--------------------------------------------------

---// Checks if file exist or not\\---
if isfile(savefilename) then 
    local jsonData = readfile(savefilename)
    local data = HttpService:JSONDecode(jsonData)
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
        nextLevelINF = false,
        autostartStory = false,
        AutoBuyLockPotion = false,
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
           seven  = {
            UP1  = {
              y  = 212,9611053466797,
              x  = -85.12884521484375,
              z  = -167.95156860351562
           },
            UP3  = {
              y  = 212,9611053466797,
              x  = -79.12884521484375,
              z  = -168.95156860351562
           },
            UP2  = {
              y  = 212,9611053466797,
              x  = -75.12884521484375,
              z  = -174.95156860351562
           },
            UP6  = {
              y  = 212,9611053466797,
              x  = -92.12884521484375,
              z  = -155.95156860351562
           },
            UP5  = {
              y  = 212,9611053466797,
              x  = -95.12884521484375,
              z  = -165.95156860351562
           },
            UP4  = {
              y  = 212,9611053466797,
              x  = -62.12884521484375,
              z  = -171.95156860351562
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
--#endregion
end

--#region ----------------------
--#endregion
--------------------------------------------------


function placesex()
    if getgenv().AutoFarm and not getgenv().disableatuofarm then
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
            elseif game.Workspace._map:FindFirstChild("fence") then
                print("7ds")
                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["seven"]["UP"..i]
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


------// Auto Farm \\------
--#region Auto Farm Loop
coroutine.resume(coroutine.create(function()
    while task.wait(1.5) do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
        repeat task.wait() until game:GetService("Workspace"):WaitForChild("_map")

        placesex()
    end
end))
--#endregion



------// Auto Leave \\------
--#region Auto Leave 



--- Made by "CharWar" # Modified by "binsfr" (V3rm)
local PlaceID = 8304191830
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local last

local File = pcall(function()
   AllIDs = game:GetService('HttpService'):JSONDecode(readfile("SameServer.json"))
end)
if not File then
   table.insert(AllIDs, actualHour)
   writefile("SameServer.json", game:GetService('HttpService'):JSONEncode(AllIDs))
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
                           delfile("SameServer.json")
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
                   writefile("SameServer.json", game:GetService('HttpService'):JSONEncode(AllIDs))
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
-------------------------------------------

coroutine.resume(coroutine.create(function()
	local GameFinished = game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished")
    GameFinished:GetPropertyChangedSignal("Value"):Connect(function()
        print("Changed", GameFinished.Value == true)
        if GameFinished.Value == true then
            repeat task.wait() until  game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true
            task.wait()
            pcall(function() webhook() end)

        if getgenv().autostartStory and getgenv().AutoNextLevelIC == false then
            local args = {
                [1] = "next_story"
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(args))
        elseif getgenv().AutoNextLevelIC == true and getgenv().autostartStory == false then
            task.wait(2.1)
            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower_from_game:InvokeServer()
        else
            if getgenv().AutoReplay and getgenv().autostartStory == false then
                local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
                local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
            elseif getgenv().AutoLeave and getgenv().AutoReplay ~= true and getgenv().autostartStory == false then
                Teleport()
                -- game:GetService("TeleportService"):Teleport(8304191830, game.Players.LocalPlayer)
            end
        end
        end
	end)
end))
--#endregion

------// Auto Sell Units \\------
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

------// Auto Upgrade \\------
--#region Auto Upgrade Loop
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
--#endregion

tp_check = true
local function startfarming_Story()
	if getgenv().autostartStory and getgenv().teleporting and getgenv().AutoFarmTP == false and getgenv().AutoFarmIC == false then
		if game.PlaceId == 8304191830 then
			local cpos = plr.Character.HumanoidRootPart.CFrame
			if tp_check then
				for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetChildren()) do
					check_door = tostring(game:GetService("Workspace")["_LOBBIES"].Story[v.Name].Owner.Value)
					if check_door == "nil"  then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_LOBBIES"].Story[v.Name].Door.CFrame * CFrame.new(0, 0, 1)
						wait(1)
						if getgenv().autostartStory then
							broke = false
							for g, j in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.LevelSelectGui.MapSelect.Main.Wrapper.Container :GetChildren()) do
								if j:IsA("ImageButton") then
									if j.Name == "ComingSoon" then
										
									else
										local ClearStory = j.Main.Container.LevelsCleared:GetChildren()
										for l, s in pairs(ClearStory) do
											if s.Name == "V" then
												chLevel = s.Text
												waves = chLevel:split("/")
												if waves[1] == "6" then
													wait(1)
												else
													
													st_farm = j.Name .. "_level_" .. waves[1] + 1
													broke = true
													wait(1)
													local args = {
														[1] = tostring(v.Name), -- Lobby
														[2] = tostring(st_farm), -- World
														[3] = getgenv().friendOnly, -- Friends Only or not
														[4] = "Normal",
													}
													game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
													task.wait(13)
													local args = {
														[1] = tostring(v.Name),
													}
													game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
													break
												end
											end
										end
									end
								end
								if broke then
									break
								end
							end
						end
						tp_check = false
						break
					end
				end
			end
			wait(2)
		end
	end
end

------// Auto Sell \\------
--#region Auto Sell loop
coroutine.resume(coroutine.create(function()
    while task.wait() do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
        if getgenv().autosell and tonumber(getgenv().sellatwave) <= _wave.Value then
            getgenv().disableatuofarm = false
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
--#endregion

--//Auto Abilities--
--#region Auto Abilities loop
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
--#endregion


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
    if getgenv().farmprotal == false and getgenv().autostart and getgenv().AutoFarm and getgenv().teleporting and getgenv().AutoFarmIC == false then

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

            warn("Farm Started")
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
            [2] = {["friends_only"] = true}
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
--#endregion

coroutine.resume(coroutine.create(function()
	while task.wait() do
		if getgenv().autostartStory then
			wait(3)
			local checkmatch = game:GetService("Workspace"):FindFirstChild("_PORTALS")
			if checkmatch then
				startfarming_Story()
				wait(62)
			end
			--break
		end
	end
end))

------// Auto Start Infiniy Castle && Thriller Park \\------

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

--hide name
task.spawn(function()
    while task.wait() do
        pcall(function()
            if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
               workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
            end
        end)
    end
end)


--anti afk
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

    game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_daily_reward:InvokeServer()
end)
