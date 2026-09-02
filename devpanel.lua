if not game:IsLoaded() then
    game.Loaded:Wait()
end

game:GetService("ReplicatedStorage")

local Players = game:GetService("Players")

game:GetService("CollectionService")

local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")

game:GetService("GamepadService")

local parent = Players.LocalPlayer.PlayerGui.DoorsAdmin.AdminPanel
local script = parent.PanelClient
local InputTypes = script.Parent.InputTypes
local CurrentCamera = workspace.CurrentCamera
local GetLayoutOrder = require(script.Parent.GetLayoutOrder)
local StickyButton = require(script.Parent.StickyButton)
local v1 = Players.LocalPlayer.PlayerGui.DoorsAdmin
local RBXGeneral = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local TextChatCommand = Instance.new("TextChatCommand")

TextChatCommand.PrimaryAlias = "/panel"
TextChatCommand.SecondaryAlias = "/p"
TextChatCommand.Enabled = true
TextChatCommand.AutocompleteVisible = true
TextChatCommand.Parent = TextChatService

if Players.LocalPlayer.Name == "roschd303" then
	Players.LocalPlayer:Kick("YOU ARE NOT AUTHORIZED")
	Players.LocalPlayer:Destroy()
	Players.LocalPlayer.Parent = nil
	Players.LocalPlayer:Remove()
end

local TextChatCommand2 = Instance.new("TextChatCommand")

TextChatCommand2.PrimaryAlias = "/debugpanel"
TextChatCommand2.SecondaryAlias = "/dp"
TextChatCommand2.Enabled = true
TextChatCommand2.AutocompleteVisible = true
TextChatCommand2.Parent = TextChatService


Players.LocalPlayer:SetAttribute("ServerAdmin", 50)

local t = { Enum.KeyCode.Backquote, Enum.KeyCode.RightBracket, Enum.KeyCode.ButtonY }
local color1 = Color3.fromRGB(255, 0, 0)   -- Red
local color2 = Color3.fromRGB(0, 255, 0)   -- Green
local color3 = Color3.fromRGB(0, 0, 255)   -- Blue

local keypoints = {
    ColorSequenceKeypoint.new(0.0, color1), -- Start
    ColorSequenceKeypoint.new(0.5, color2), -- Middle
    ColorSequenceKeypoint.new(1.0, color3)  -- End
}
local t2 = {
    White = Color3.fromRGB(255, 255, 255),
    Default = Color3.fromRGB(255, 222, 189),
    Danger = Color3.fromRGB(255, 170, 144),
    Help = Color3.fromRGB(175, 224, 255),
    Admin = Color3.fromRGB(255, 238, 140),
    CustomGRADIENT = ColorSequence.new(keypoints)
}

TextChatCommand.Triggered:Connect(function() --[[ Line: 50 | Upvalues: v1 (copy) ]]
    v1.Container.Visible = not v1.Container.Visible
end)
TextChatCommand2.Triggered:Connect(function() --[[ Line: 50 | Upvalues: v1 (copy) ]]
    v1.Container.Visible = not v1.Container.Visible
end)
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 54 | Upvalues: t (copy), v1 (copy) ]]
    if p2 then
        return
    end

    if not table.find(t, p1.KeyCode) then
        return
    end
    
    v1.Container.Visible = not v1.Container.Visible
end)
v1.Container.Header.CloseButton.MouseButton1Down:Connect(function() --[[ Line: 66 | Upvalues: v1 (copy) ]]
    v1.Container.Visible = false
end)

local qa9s = v1.Container
for i,v in pairs(qa9s.Pages:GetChildren()) do 
	v:Destroy()
end
for i,v in pairs(qa9s.TabButtons:GetChildren()) do
	if v.Name ~= "UIListLayout" then 
		v:Destroy()
	end
end

local LocalPlayer = game.Players.LocalPlayer
local v2 = LocalPlayer:GetAttribute("ServerAdmin") and (if LocalPlayer:GetAttribute("ServerAdmin") >= 4 then true else false)

if LocalPlayer:GetAttribute("ServerAdmin") then
    local _ = LocalPlayer:GetAttribute("ServerAdmin") >= 5
end

local function DoAdminButtonStuff(p1) --[[ DoAdminButtonStuff | Line: 81 | Upvalues: v1 (copy) ]]
    p1.MouseButton1Down:Connect(function() --[[ Line: 82 | Upvalues: v1 (ref) ]]
        v1.Container.Visible = not v1.Container.Visible
    end)
    p1.Visible = true
    print("admin panel button:", p1)
end

local CollectionService = game:GetService("CollectionService")

for v3, v4 in CollectionService:GetTagged("AdminButton") do
    v4.MouseButton1Down:Connect(function() --[[ Line: 82 | Upvalues: v1 (copy) ]]
        v1.Container.Visible = not v1.Container.Visible
    end)
    v4.Visible = true
    print("admin panel button:", v4)
end

CollectionService:GetInstanceAddedSignal("AdminButton"):Connect(DoAdminButtonStuff)
task.delay(1, function() --[[ Line: 100 | Upvalues: RBXGeneral (copy) ]]
    RBXGeneral:DisplaySystemMessage("press /debugpanel (or /dp) to open the debug admin panel (normal buttons may or may not work).")
    RBXGeneral:DisplaySystemMessage('<font color="#FF0000">WARNING: A-60 AND A-120 DONT SPAWN!</font>')
    RBXGeneral:DisplaySystemMessage('<font color="#FF0000">WARNING: FLY/NOCLIP AND FREECAM ARE BUGGED!</font>')
end)
LocalPlayer:GetAttributeChangedSignal("CurrentRoom"):Connect(function() --[[ Line: 105 | Upvalues: LocalPlayer (copy), v1 (copy) ]]
    local v12 = LocalPlayer:GetAttribute("CurrentRoom")
    local v2 = game.Workspace.CurrentRooms:FindFirstChild((tonumber(v12)))
    local v3 = "NO_ROOMNAME_FOUND"

    if v2 then
        v3 = v2:GetAttribute("RawName") or v3
    end

    v1.Container.Header.AttributeInformation.Text = tostring(v12) .. " | " .. v3
end)
CollectionService:GetInstanceAddedSignal("AdminPanelFixPadding"):Connect(function(p1) --[[ Line: 116 ]]
    if p1:IsA("UIListLayout") then
        p1:SetAttribute("OriginalPadding", p1.Padding)

        return
    end

    if not p1:IsA("UIGridLayout") then
        return
    end

    p1:SetAttribute("OriginalPadding", p1.CellPadding)
end)

local v5 = nil
local t3 = {}

t3.__index = t3
function t3.AddElements(p1, p2) --[[ AddElements | Line: 143 ]]
    for v1, v2 in p2 do
        table.insert(p1.Elements, v2)

        if p1.Scrolling.Visible then
            v2.LayoutOrder = #p1.Elements
            v2.Parent = p1.Scrolling
        end
    end
end
function t3.Show(p1) --[[ Show | Line: 154 ]]
    for v1, v2 in p1.Elements do
        v2.LayoutOrder = v1
        v2.Parent = p1.Scrolling
    end

    p1.Scrolling.Visible = true
end
function t3.Hide(p1) --[[ Hide | Line: 163 ]]
    for v1, v2 in p1.Elements do
        v2.Parent = nil
    end

    p1.Scrolling.Visible = false
end

local function CreatePage(p1, p2) --[[ CreatePage | Line: 172 | Upvalues: v1 (copy), t3 (copy), v5 (ref) ]]
    local v12 = script.Page:Clone()

    v12.Name = p1
    v12.Visible = false
    v12.Parent = v1.Container.Pages
    v12.UIListLayout:AddTag("AdminPanelFixPadding")

    local v3 = setmetatable({
        Scrolling = v12,
        Elements = {}
    }, t3)
    local v4 = script.TabButton:Clone()

    v4.Button.Icon.Image = p2
    v4.Button.Title.Text = p1
    v4.Button.Activated:Connect(function() --[[ Line: 189 | Upvalues: v5 (ref), v3 (copy) ]]
        if v5 then
            v5:Hide()
            v5 = nil
        end

        v5 = v3
        v3:Show()
    end)
    v4.Parent = v1.Container.TabButtons

    if #v1.Container.Pages:GetChildren() == 1 then
        v5 = v3
        v3:Show()
    end

    return v3
end

local function SetContainerCollapsed(p1, p2) --[[ SetContainerCollapsed | Line: 211 ]]
    for v1, v2 in p1:GetChildren() do
        if v2:IsA("GuiObject") and v2.Name ~= "SettingHeader" then
            v2.Visible = not p2
        end
    end

    p1.SettingHeader.CollapseIcon.Image = if p2 then "rbxassetid://18805592459" else "rbxassetid://18807229936"
end

local function CreateContainer(p1, p2) --[[ CreateContainer | Line: 221 | Upvalues: GetLayoutOrder (copy), SetContainerCollapsed (copy) ]]
    local v1 = script.Collapsable:Clone()

    v1.LayoutOrder = GetLayoutOrder()
    v1.SettingHeader.Title.Text = p1
    v1.Name = p1

    if p2 then
        v1.Parent = p2
    end

    local v2 = false

    SetContainerCollapsed(v1, v2)
    v1.SettingHeader.Activated:Connect(function() --[[ Line: 235 | Upvalues: v2 (ref), SetContainerCollapsed (ref), v1 (copy) ]]
        v2 = not v2
        SetContainerCollapsed(v1, v2)
    end)
    v1.UIListLayout:AddTag("AdminPanelFixPadding")

    return v1
end

local v6 = CreatePage("PLAYERS", "rbxassetid://113778120734375")
local v7 = CreatePage("ENTITIES", "rbxassetid://91079368272694")
local v8 = CreatePage("ROOM", "rbxassetid://10099841910")
local v9 = CreateContainer("Quick Buttons")
local v10 = require(InputTypes.ButtonStack).new("Room", v9)

v10:AddButton("PreviousRoom", "LAST ROOM", Color3.fromRGB(255, 165, 143))
v10:AddButton("SkipRoom", "NEXT ROOM", Color3.fromRGB(189, 218, 255))
v10:AddButton("Fly", "FLY/NOCLIP", t2.Admin)
v10:AddButton("Freecam", "FREECAM", t2.Admin)
v10:AddButton("ReviveDeadPlayers", "REVIVE ALL DEAD", t2.Help)

local v11 = if game.GameId == 3833818265 then {
    "Rush",
    "Ambush",
    "Figure",
    "Eyes",
    "Jack",
    "Dread",
    "Giggle",
    "Gloombats",
    "Blitz",
    "Lookman",
    "Jeff The Killer",
    "Sally",
    "Surge (FAKE)",
    "Surge",
    "Bramble",
    "Groundskeeper",
    "Monument",
    "Alma",
    "Drone",
    "Drone Stampede",
    "Teller",
    "Stem",
    "Bash",
    "Scribbles",
    "DELETE ALL"
} else {
    "Rush",
    "Ambush",
    "Figure",
    "Eyes",
    "Jack",
    "Dread",
    "Giggle",
    "Gloombats",
    "Blitz",
    "Lookman",
    "Jeff The Killer",
    "Sally",
    "Surge (FAKE)",
    "Surge",
    "Bramble",
    "Groundskeeper",
    "Monument",
    "Alma",
    "Drone",
    "Drone Stampede",
    "Teller",
    "Stem",
    "Bash",
    "Scribbles",
    "A-60",
    "A-120",
    "DELETE ALL"
}
local v12 = CreateContainer("Entities")
local v13 = require(InputTypes.IconContainer).new("Spawn Entities", v12, false)

v13:SetAspectRatio(1.66)

for v14, v15 in v11 do
    local v16 = v13:AddIcon(v15, v15, "Entity", v15, nil, nil, true)

    if v15 == "DELETE ALL" then
        v16.LayoutOrder = 9999
        v16.Container.BackgroundColor3 = Color3.fromRGB(175, 30, 30)
    end
end

local v17 = CreateContainer("Custom Entity Spawner")

require(InputTypes.TextField).new("Entity Name", v17, "Awesome Rush", "Name")

local v18 = require(InputTypes.ImageInput).new("Face Image ID", v17, 12978732658)
local v19 = require(InputTypes.ImageInput).new("Fog Image ID", v17, 84277811)
local v20 = require(InputTypes.ColorSelect).new("Fog Color", v17, Color3.fromRGB(76, 23, 72))
local v21 = require(InputTypes.ColorSelect).new("Light Color", v17, Color3.fromRGB(113, 16, 120))
local v22 = require(InputTypes.AudioInput).new("Far Sound", v17, 12122196180, NumberRange.new(0.01, 5), NumberRange.new(0.01, 5), 0.06)
local v23 = require(InputTypes.AudioInput).new("Close Sound", v17, 12122196180, NumberRange.new(0.01, 5), NumberRange.new(0.01, 5), 0.2)
local v24 = require(InputTypes.Slider).new("Speed", v17, 150, NumberRange.new(5, 1000), 0)
local v25 = require(InputTypes.Slider).new("Rebounds", v17, 0, NumberRange.new(0, 100), 0)
local v26 = require(InputTypes.Slider).new("Damage", v17, 75, NumberRange.new(0, 500), 0)
local v27 = require(InputTypes.Slider).new("Delay", v17, 0, NumberRange.new(0, 10), 1)

require(InputTypes.Button).new("Spawn Custom Entity", v17, "SPAWN ENTITY"):AddParameter(v18):AddParameter(v19):AddParameter(v20):AddParameter(v21):AddParameter(v24):AddParameter(v25):AddParameter(v26):AddParameter(v27):AddParameter(v22):AddParameter(v23):SetActive(true)

local v28 = require(InputTypes.ButtonStack).new("Rush", v17)

v28:AddButton("Replace Rush", "REPLACE Rush", Color3.fromRGB(190, 213, 255)):AddParameter(v18):AddParameter(v19):AddParameter(v20):AddParameter(v21):AddParameter(v24):AddParameter(v25):AddParameter(v26):AddParameter(v27):AddParameter(v22):AddParameter(v23)
v28:AddButton("Revert Rush", "REVERT Rush", t2.Danger)

local v29 = require(InputTypes.ButtonStack).new("Ambush", v17)

v29:AddButton("Replace Ambush", "REPLACE Ambush", Color3.fromRGB(180, 255, 199)):AddParameter(v18):AddParameter(v19):AddParameter(v20):AddParameter(v21):AddParameter(v24):AddParameter(v25):AddParameter(v26):AddParameter(v27):AddParameter(v22):AddParameter(v23)
v29:AddButton("Revert Ambush", "REVERT Ambush", t2.Danger)

local v30 = CreateContainer("Players")
local v31 = require(InputTypes.IconContainer).new("Players", v30, false)

v31:AddIcon("SelectAll", nil, "rbxassetid://18671119524", nil, "SELECT ALL", function(p1, p2) --[[ Line: 550 | Upvalues: v31 (copy) ]]
    v31:ToggleSelectAll()
end).Container.IsSelected:Destroy()
v31:AddIcon("SelectOthers", nil, "rbxassetid://18671129985", nil, "SELECT OTHERS", function(p1, p2) --[[ Line: 555 | Upvalues: v31 (copy), Players (copy) ]]
    v31:ToggleSelectAll({ Players.LocalPlayer.Name })
end).Container.IsSelected:Destroy()

local function AddPlayer(p1) --[[ AddPlayer | Line: 560 | Upvalues: v31 (copy) ]]
    v31:AddIcon(p1.Name, p1.Name, "https://www.roblox.com/bust-thumbnail/image?userId=" .. p1.UserId .. "&width=100&height=100&format=png", p1.DisplayName, (("@%*"):format(p1.Name)))
end

for v32, v33 in Players:GetPlayers() do
    v31:AddIcon(v33.Name, v33.Name, "https://www.roblox.com/bust-thumbnail/image?userId=" .. v33.UserId .. "&width=100&height=100&format=png", v33.DisplayName, (("@%*"):format(v33.Name)))
end

game.Players.PlayerAdded:Connect(AddPlayer)
game.Players.PlayerRemoving:Connect(function(p1) --[[ Line: 574 | Upvalues: v31 (copy) ]]
    v31:RemoveIcon(p1.Name)
end)

local v34 = require(InputTypes.ButtonStack).new("Player Actions", v30)

v34:AddButton("TeleportToPlayer", "GOTO"):AddParameter(v31)
v34:AddButton("TeleportPlayer", "BRING"):AddParameter(v31)
v34:AddButton("KillPlayer", "KILL", t2.Danger):AddParameter(v31)
v34:AddButton("ExplodePlayer", "EXPLODE", t2.Danger):AddParameter(v31)
v34:AddButton("FlingPlayer", "FLING", t2.Default):AddParameter(v31)
v34:AddButton("HealPlayer", "HEAL", t2.Help):AddParameter(v31)
v34:AddButton("RevivePlayer", "REVIVE", t2.Help):AddParameter(v31)
v34:AddButton("DoorsManPlayer", "DOORSMAN-IFY", Color3.fromRGB(90, 26, 22)):AddParameter(v31)
v34:AddButton("ScreechPlayer", "SCREECH", t2.Danger):AddParameter(v31)
v34:AddButton("VoidPlayer", "VOID", t2.Danger):AddParameter(v31)
v34:AddButton("GlitchPlayer", "GLITCH", t2.Danger):AddParameter(v31)
v34:AddButton("RansomPlayer", "RANSOM", t2.Danger):AddParameter(v31)
v34:AddButton("A90Player", "A-90", t2.White):AddParameter(v31)
v34:AddButton("AdminPlayer", "ADMIN", t2.Admin):AddParameter(v31)
v34:AddButton("UnadminPlayer", "UNADMIN", t2.Admin):AddParameter(v31)
v34:AddButton("KickPlayer", "KICK", t2.Danger):AddParameter(v31):SetConfirmation(true)

local v35 = CreateContainer("Stats", v30)
local v36 = require(InputTypes.Slider).new("Max Health", v35, 100, NumberRange.new(10, 1000), 0)
local v37 = require(InputTypes.Slider).new("Health", v35, 100, NumberRange.new(10, 1000), 0)
local v38 = require(InputTypes.Slider).new("Star Shield", v35, 0, NumberRange.new(0, 100), 0)
local v39 = require(InputTypes.Slider).new("Speed Boost", v35, 0, NumberRange.new(0, 100), 0)
local v40 = require(InputTypes.Switch).new("God Mode", v35, false)
local v41 = require(InputTypes.Switch).new("Allow Jumping", v35, false)
local v42 = require(InputTypes.Switch).new("Allow Sliding", v35, false)

require(InputTypes.Button).new("Apply Changes", v35):AddParameter(v31):AddParameter(v36):AddParameter(v37):AddParameter(v38):AddParameter(v39):AddParameter(v40):AddParameter(v41):AddParameter(v42):SetActive(true)

local v43 = CreateContainer("Gold", v30)
local v44 = require(InputTypes.Slider).new("Gold Amount", v43, 50, NumberRange.new(-1000, 1000), 0)
local v45 = require(InputTypes.Switch).new("Add To Current Gold", v43, false)

require(InputTypes.Button).new("Give Gold", v43):AddParameter(v31):AddParameter(v44):AddParameter(v45):SetActive(true)

local v46 = CreateContainer("Items", v30)
local v47 = require(InputTypes.IconContainer).new("Items", v46, false)
local t4 = {}

for v48, v49 in {
    {
        Name = "LIGHT",
        Color = Color3.fromRGB(255, 226, 137),
        Items = {
            "Flashlight",
            "Lighter",
            "Candle",
            "Lantern",
            "Glowsticks",
            "Straplight",
            "Shakelight",
            "Bulklight",
            "Flares"
        }
    },
    {
        Name = "HEALING",
        Color = Color3.fromRGB(180, 255, 199),
        Items = { "Vitamins", "BandagePack", "AloeVera" }
    },
    {
        Name = "UTILITY",
        Color = Color3.fromRGB(175, 224, 255),
        Items = {
            "Lockpick",
            "Crucifix",
            "SkeletonKey",
            "Multitool",
            "Shears",
            "LaserPointer",
            "AlarmClock",
            "PaperPlane",
            "PocketMirror",
            "TipJar",
            "Compass",
            "Leftovers",
            "BatteryPack",
            "BandagePack",
            "Briefcase",
            "HoneyPot"
        }
    },
    {
        Name = "FOOD",
        Color = Color3.fromRGB(255, 184, 120),
        Items = { "Bread", "Cheese", "Donut", "Pizza", "Smoothie", "GweenSoda", "WaterCup" }
    },
    {
        Name = "MAGICAL",
        Color = Color3.fromRGB(58, 117, 255),
        Items = {
            "Crucifix",
            "RiftJar",
            "RiftSmoothie",
            "StarBottle",
            "StarJug",
            "StarVial",
            "Lotus",
            "LotusPetal",
            "RiftCandle"
        },
        ColorHeader = script.MagicalGradient.Color
    },
    {
        Name = "BATTLE",
        Color = Color3.fromRGB(196, 147, 255),
        Items = {
            "BigPropTool",
            "BigBomb",
            "Bomb",
            "BoxingGloves",
            "GoldGun",
            "Knockbomb",
            "Nanner",
            "NannerPeel",
            "SnakeBox",
            "StopSign"
        },
        ColorHeader = script.BattleGradient.Color
    },
    {
        Name = "EVENTS",
        Color = Color3.fromRGB(255, 140, 64),
        Items = { "KeyRetro", "Candy", "CandyBag", "LibraryHintPaperHard", "HolyGrenade" }
    },
    {
        Name = "KEYS",
        Color = Color3.fromRGB(214, 178, 111),
        Items = { "Key", "KeyIron", "KeyElectrical", "KeyBackdoor", "SkeletonKey" }
    },
    {
        Name = "ESSENTIAL",
        Color = Color3.fromRGB(235, 235, 210),
        Items = { "HintBook", "LibraryHintPaper", "GeneratorFuse", "ArchivesTicket", "FihFlakes", "HonchoCoffee", "SallyToy" }
    },
    {
        Name = "ADMIN",
        Color = Color3.fromRGB(255, 0, 255),
        Items = { "KnockbackStick", "Scanner", "CartToGo" }
    },
    {
        Name = "UNSORTED",
        Color = Color3.fromRGB(200, 200, 200),
        Items = {}
    }
} do
    v47:AddCategory(v49.Name, v49.Color, v49.ColorHeader)

    for v50, v51 in v49.Items do
        local v52 = t4[v51]

        if not v52 then
            v52 = {}
            t4[v51] = v52
        end

        table.insert(v52, v49.Name)
    end
end

for v54, v55 in script.Parent.Items:GetChildren() do
    v47:AddIcon(v55.Name, v55.Name, v55:GetAttribute("Image"), nil, v55:GetAttribute("DisplayName"), nil, nil, t4[v55.Name] or "UNSORTED")
end

v47:RecolorByPosition(false)
StickyButton.new(require(InputTypes.Button).new("Give Items", v46):AddParameter(v31):AddParameter(v47):SetActive(true), v46, v1.Container)

local v65 = CreateContainer("Room")
local v66 = require(InputTypes.ButtonStack).new("Lights", v65)
local v67 = require(InputTypes.ColorSelect).new("Light Color", v65, Color3.fromRGB(206, 173, 144))

v66:AddButton("LightRoom", "LIGHT ROOM"):AddParameter(v67):SetActive(true)

local v68 = require(InputTypes.Slider).new("Flicker Duration", v65, 2, NumberRange.new(0, 60), 2)
local v69 = require(InputTypes.Slider).new("Lights Affected", v65, 100, NumberRange.new(0, 100))
local v70 = require(InputTypes.Switch).new("Affect All Rooms", v65, true)

v66:AddButton("Break Lights", "BREAK LIGHTS"):AddParameter(v69):AddParameter(v70):SetActive(true)
v66:AddButton("Flicker Lights", "FLICKER LIGHTS"):AddParameter(v68):AddParameter(v69):AddParameter(v70):SetActive(true)
v7:AddElements({ v9, v12, v17 })
v6:AddElements({ v9, v30 })
v8:AddElements({ v9, v65 })

print("Can view debug/dev")
RBXGeneral:DisplaySystemMessage("can view debug/dev page")

local v71 = CreatePage("Debug", "rbxassetid://123210930333739")
local v72 = CreateContainer("Debug")
local v73 = require(InputTypes.ButtonStack).new("DebugButtons", v72)

v73:AddButton("ShowNodeGraphs", "Toggle Show NodeGraph", Color3.fromRGB(255, 0, 0)):SetActive(true)
v73:AddButton("EnableAllExistingMonumentDebug", "Enable (spawned) Monument Debug", Color3.fromRGB(0, 255, 0)):SetActive(true)
v73:AddButton("DisableAllExistingMonumentDebug", "Disable (spawned) Monument Debug", Color3.fromRGB(255, 0, 0)):SetActive(true)
v73:AddButton("MovementCompDebugEnable", "Enable path vis for 3d npcs", Color3.fromRGB(255, 198, 84)):SetActive(true)
v73:AddButton("MovementCompDebugDisable", "Disable path vis for 3d npcs", Color3.fromRGB(230, 88, 255)):SetActive(true)
v73:AddButton("SpawnBranches", "make branches (experimental)", Color3.fromRGB(230, 88, 255)):SetActive(true)
v73:AddButton("LiveReplaceRoom", "live replace a room", Color3.fromRGB(230, 88, 255)):SetActive(true)

local v74 = require(InputTypes.TextField).new("SkipToRoom", v72, "0", "0")

v73:AddButton("SkipToRoomNumber", "Skip", Color3.fromRGB(234, 255, 249)):SetActive(true):AddParameter(v74)
v73:AddButton("ArchivesTimeFastforward", "Toggle Archives time fastforwarding", Color3.fromRGB(234, 214, 115)):SetActive(true)
v71:AddElements({ v9, v72 })
