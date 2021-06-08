local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, Engine = ...
local _G = _G
local ElvUI_EltreumUI = E:NewModule(addon, 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceConsole-3.0')

-- This whole plugin uses LuckyoneUI as a base, full credits to him for it and allowing its use!
Engine[1] = ElvUI_EltreumUI
Engine[2] = E -- ElvUI Engine
Engine[3] = L -- ElvUI Locales
Engine[4] = V -- ElvUI PrivateDB
Engine[5] = P -- ElvUI ProfileDB
Engine[6] = G -- ElvUI GlobalDB
_G[addon] = Engine

-- Constants
ElvUI_EltreumUI.Version = GetAddOnMetadata(addon, 'Version')
ElvUI_EltreumUI.CreditsList = {}
ElvUI_EltreumUI.Config = {}
ElvUI_EltreumUI.Name = '|cff82B4ffEltruism|r'

-- Check WoW Project ID
ElvUI_EltreumUI.Retail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
ElvUI_EltreumUI.Classic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
ElvUI_EltreumUI.TBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC

function ElvUI_EltreumUI:PLAYER_ENTERING_WORLD()
	if E.private["nameplates"]["enable"] == true then
		ElvUI_EltreumUI:NamePlateOptions()
		ElvUI_EltreumUI:DynamicLevelStyleFilter()
	end
	ElvUI_EltreumUI:LoadCommands()
	ElvUI_EltreumUI:FriendlyNameplates()
	ElvUI_EltreumUI:AFKmusic()
	if ElvUI_EltreumUI.Retail then
		ElvUI_EltreumUI:WaypointTimeToArrive()
		ElvUI_EltreumUI:SkillGlow()
	end
	if ElvUI_EltreumUI.Classic or ElvUI_EltreumUI.TBC then
		ElvUI_EltreumUI:DynamicClassicDatatext()
	end
	ElvUI_EltreumUI:LootText()
	ElvUI_EltreumUI:OldVersionCheck()
	ElvUI_EltreumUI:NewVersionCheck()
	ElvUI_EltreumUI:CastCursor()
	ElvUI_EltreumUI:CurrentTypeofCursor()
	ElvUI_EltreumUI:Skins()
	--if ElvUI_EltreumUI.Classic or ElvUI_EltreumUI.TBC then
	--	ElvUI_EltreumUI:RoleIcons()
	--end
end

function ElvUI_EltreumUI:Initialize()
	if E.private.install_complete and E.private.ElvUI_EltreumUI.install_version == nil then
		E:GetModule('PluginInstaller'):Queue(ElvUI_EltreumUI.InstallerData)
	end
	EP:RegisterPlugin(addon, ElvUI_EltreumUI.Configtable)
	--Register Events
	ElvUI_EltreumUI:RegisterEvent('PLAYER_ENTERING_WORLD')
	ElvUI_EltreumUI:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
	ElvUI_EltreumUI:RegisterEvent('UPDATE_STEALTH')
	ElvUI_EltreumUI:RegisterEvent('PLAYER_FLAGS_CHANGED')
	ElvUI_EltreumUI:RegisterEvent('GROUP_ROSTER_UPDATE')
	ElvUI_EltreumUI:RegisterEvent('ENCOUNTER_START')
	ElvUI_EltreumUI:RegisterEvent('PLAYER_REGEN_ENABLED')
    ElvUI_EltreumUI:RegisterEvent('PLAYER_REGEN_DISABLED')
	if ElvUI_EltreumUI.Retail then
		ElvUI_EltreumUI:RegisterEvent('SUPER_TRACKING_CHANGED')
		ElvUI_EltreumUI:RegisterEvent('NAVIGATION_FRAME_CREATED')
		ElvUI_EltreumUI:RegisterEvent('NAVIGATION_FRAME_DESTROYED')
	end
	ElvUI_EltreumUI:RegisterEvent('ZONE_CHANGED_INDOORS')
	ElvUI_EltreumUI:RegisterEvent('ZONE_CHANGED')
	ElvUI_EltreumUI:RegisterEvent('ZONE_CHANGED_NEW_AREA')
	ElvUI_EltreumUI:RegisterEvent('PLAYER_TARGET_CHANGED')
	ElvUI_EltreumUI:RegisterEvent('GROUP_ROSTER_UPDATE')
	ElvUI_EltreumUI:RegisterEvent('PLAYER_LEVEL_UP')
	--SetCVars at start
	SetCVar('nameplateOtherBottomInset', 0.02)
	SetCVar('nameplateOtherTopInset', 0.1)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('nameplateTargetRadialPosition', 1)

	if ElvUI_EltreumUI.Classic or ElvUI_EltreumUI.TBC then
		SetCVar("clampTargetNameplateToScreen", 1)
		SetCVar("nameplateOtherBottomInset", 0.02)
	end
end

function ElvUI_EltreumUI:PLAYER_LEVEL_UP()
	ElvUI_EltreumUI:DynamicLevelStyleFilter()
end

function ElvUI_EltreumUI:PLAYER_REGEN_ENABLED()
	ElvUI_EltreumUI:StopCombatMusic()
end

function ElvUI_EltreumUI:PLAYER_REGEN_DISABLED()
	ElvUI_EltreumUI:CombatMusic()
end

function ElvUI_EltreumUI:ZONE_CHANGED()
	ElvUI_EltreumUI:FriendlyNameplates()
	if ElvUI_EltreumUI.Retail then
		ElvUI_EltreumUI:ArenaQuest()
	end
end

function ElvUI_EltreumUI:ZONE_CHANGED_INDOORS()
	ElvUI_EltreumUI:FriendlyNameplates()

end

function ElvUI_EltreumUI:ZONE_CHANGED_NEW_AREA()
	ElvUI_EltreumUI:FriendlyNameplates()
end

function ElvUI_EltreumUI:ENCOUNTER_START()
	if ElvUI_EltreumUI.Retail then
		ElvUI_EltreumUI:QuestEncounter()
	end
	ElvUI_EltreumUI:CombatMusic()
end

function ElvUI_EltreumUI:SUPER_TRACKING_CHANGED()
	ElvUI_EltreumUI:WaypointTimeToArrive()
end

function ElvUI_EltreumUI:NAVIGATION_FRAME_CREATED()
	ElvUI_EltreumUI:WaypointTimeToArrive()
end

function ElvUI_EltreumUI:NAVIGATION_FRAME_DESTROYED()
	ElvUI_EltreumUI:WaypointTimeToArrive()
end

function ElvUI_EltreumUI:UPDATE_STEALTH()
	ElvUI_EltreumUI:StealthOptions()
end

function ElvUI_EltreumUI:COMBAT_LOG_EVENT_UNFILTERED()
	ElvUI_EltreumUI:RaidDeath()
end

function ElvUI_EltreumUI:GROUP_ROSTER_UPDATE()
	ElvUI_EltreumUI:GroupRoster()
end


function ElvUI_EltreumUI:PLAYER_FLAGS_CHANGED()
	ElvUI_EltreumUI:AFKmusic()
end

function ElvUI_EltreumUI:PLAYER_TARGET_CHANGED()
	ElvUI_EltreumUI:NamePlateOptions()
end

local function CallbackInitialize()
	ElvUI_EltreumUI:Initialize()
end
E:RegisterModule(addon, CallbackInitialize)
