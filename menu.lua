------ LIBRARY [MENU Linoria]
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/NovazUwU/SharkHub/main/Theme'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Project Slayers // Water Hub // By 0Windycaketi ,Synx ,David!?',
    Center = true,
    AutoShow = true,
})


local Tabs = {
   Main = Window:AddTab('Project Slayers'),
   ['Settings'] = Window:AddTab('Settings'),

}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('          [SPINS]')

LeftGroupBox:AddButton("Cracked By Novaz | gg/EEzVUN35R", function()
    setclipboard("https://discord.gg/EEzVUN35R") 
end)

LeftGroupBox:AddButton("Auto Daily Spin", function()
    while task.wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end
 end)

 LeftGroupBox:AddButton("Spin Supreme/Mythic Clan", function()
    local clan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan
    local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Soyama","Tokito","Tomioka","Hashibira"}
    
    repeat wait(0.001)
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin", game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, clan)
    until table.find(wanted, clan.Value)
end)


LeftGroupBox:AddButton("Spin Supreme Clan ONLY", function()
    local clan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan
		local wanted = {"Kamado","Agatsuma","Rengoku","Uzui"}
		
		repeat wait(0.001)
		   game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin", game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, clan)
		until table.find(wanted,clan.Value)    
end)

LeftGroupBox:AddButton("Check What You Got (F9)", function()
    local player = game.Players.LocalPlayer
    local path = game:GetService("ReplicatedStorage").Player_Data[player.Name].Clan

    path.Changed:Connect(function(newValue)
        print("Value changed to:", newValue)
    end)
end)

local function sendCode(code, waitTime)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code)
    wait(waitTime)
end

LeftGroupBox:AddButton("Auto SPIN CODES", function()
    sendCode("ThanksForLikes600K", 12)
    sendCode("ThanksForLikes600K2", 12)
    sendCode("ThanksFor350MVisits2", 12)
    sendCode("Thx4300MNOuwohanaIsBack", 12)
    sendCode("ThanksFor350MVisits", 12)
    sendCode("!ThanksFor250MVisits", 12)
    sendCode("!Upd295MiniCode", 12)
end)


Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
 end)
 
-- UI Settings
local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu Key Bind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('WaterHubCommunity')
SaveManager:SetFolder('WaterHubCommunity/ProjectSlayers')
SaveManager:BuildConfigSection(Tabs['Settings'])
ThemeManager:ApplyToTab(Tabs['Settings'])
