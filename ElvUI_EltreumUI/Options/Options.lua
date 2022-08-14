local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local tinsert = _G.table.insert
local tconcat = _G.table.concat
local unpack = _G.unpack
local select = _G.select
local sort = _G.sort
local pairs = _G.pairs
local table = _G.table
local format = _G.format
local MINIMAP_LABEL = _G.MINIMAP_LABEL
local AURAS = _G.AURAS
local BINDING_HEADER_CHAT = _G.BINDING_HEADER_CHAT
local HONOR = _G.HONOR
local CURRENCY = _G.CURRENCY
local tostring = _G.tostring
local PlaySoundFile = _G.PlaySoundFile
local tonumber = _G.tonumber
local SetCVar = _G.SetCVar
local C_CVar = _G.C_CVar
local OKAY = _G.OKAY
local Item = _G.Item
local tremove = _G.tremove
local AceGUIWidgetLSMlists = _G.AceGUIWidgetLSMlists

--Author list
local AUTHORS = {
	'|cff82B4ffEltreum|r',
}

-- Credits and Thank yous list
local THANKYOU = {
	'|cff0070DEAzilroka|r',
	'|cffC41F3BKringel|r',
	'|cFF99CCFFAftermathh|r',
	'|cffF58CBARepooc|r Especially for the huge helps',
	'Blazeflack',
	'Botanica',
	'|cffFFC44DHydra|r',
	'|T134297:15:15:0:0:64:64:5:59:5:59|t |cffff7d0aMerathilis|r',
	'|cff9482c9Darth Predator|r',
	'Caedis',
	'Elv',
	E:TextGradient('Simpy but his name might be shorter sometimes even though he fixes a lot of things', 0.27,0.72,0.86, 0.51,0.36,0.80, 0.69,0.28,0.94, 0.94,0.28,0.63, 1.00,0.51,0.00, 0.27,0.96,0.43),
	'Shrom',
	'Pat',
	'|cff00c0faBenik|r',
	'|T136012:15:15:0:0:64:64:5:59:5:59|t |cff006fdcRubgrsch|r',
	'|cff8788EENihilistzsche|r',
	'|TInterface/AddOns/ElvUI/Core/Media/ChatLogos/Clover:15:15:0:0:64:64:5:59:5:59|t |cffFF7D0ALuckyone|r Especially for allowing the usage of his installer/plugin as a model',
	'|TInterface/AddOns/ElvUI_EltreumUI/Media/Textures/releaf:15:15:0:0:64:64:5:59:5:59|t |cffFF7D0AReleaf|r for the alternate class icons',
	'|TInterface/AddOns/ElvUI_EltreumUI/Media/Textures/tukuidiscord:15:15:0:0:64:64:5:59:5:59|t Tukui Community for all the help and motivation',
	'|TInterface/AddOns/ElvUI_EltreumUI/Media/Textures/addonsdiscord:15:15:0:0:64:64:5:59:5:59|t WoW AddOns; for answering a lot of questions',
	'AcidWeb |TInterface/AddOns/ElvUI/Core/Media/ChatLogos/Gem:15:15:-1:2:64:64:6:60:8:60|t',
	'|cff8E44ADB|r|cff2ECC71lin|r|cff3498DBkii|r',
}

local SUPPORTER = {
	'|cffB50909Artan|r',
	'|cffB50909Brovenn|r',
	'|cffB50909Dreandor|r',
	'|cffB50909Morthart|r',
	'|cffB50909Nekator|r',
}

local TRANSLATORS = {
	'|cffCC3333Khornan|r - German Translation',
	'|cffCC3333Dlarge|r - German Translation',
	'|cffCC3333Neo|r - Chinese Translation',
	'Spanish translation by DeepL',
}

-- SortList
local function SortList(a, b)
	return E:StripString(a) < E:StripString(b)
end

sort(AUTHORS, SortList)
sort(THANKYOU, SortList)
sort(SUPPORTER, SortList)
sort(TRANSLATORS, SortList)

-- Author table
for _, name in pairs(AUTHORS) do
	tinsert(ElvUI_EltreumUI.CreditsList, name)
end
local AUTHORS_STRING = tconcat(AUTHORS, '|n')

-- Thank you table
for _, name in pairs(THANKYOU) do
	tinsert(ElvUI_EltreumUI.CreditsList, name)
end
local THANKYOU_STRING = tconcat(THANKYOU, '|n')

-- Supporter table
for _, name in pairs(SUPPORTER) do
	tinsert(ElvUI_EltreumUI.CreditsList, name)
end
local SUPPORTER_STRING = tconcat(SUPPORTER, '|n')

-- Translators table
for _, name in pairs(TRANSLATORS) do
	tinsert(ElvUI_EltreumUI.CreditsList, name)
end
local TRANSLATORS_STRING = tconcat(TRANSLATORS, '|n')

-- Eltruism ingame options Retail
function ElvUI_EltreumUI:Configtable()
	-- Add Eltruism version on top of the ElvUI config
	E.Options.name = E.Options.name .. " + " .. ElvUI_EltreumUI.Name .. format(" |cffffffff%s|r", ElvUI_EltreumUI.Version)
	E.Options.args.ElvUI_EltreumUI = {
		order = 6,
		type = 'group',
		name = "|TInterface\\Addons\\ElvUI_EltreumUI\\Media\\Textures\\tinylogo.tga:18:18:0:0|t" .. ElvUI_EltreumUI.Name,
		args = {
			logo = {
				type = 'description',
				name = "",
				order = 6,
				image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\logohq', 320, 80 end,
			},
			installer = {
				order = 7,
				type = 'group',
				name = L["Installer"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\install',
				args = {
					header5 = {
						order = 1,
						type = "description",
						name = L["Eltruism Installer"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					install = {
						order = 2,
						type = 'group',
						inline = true,
						name = "",
						args = {
							pluginagain = {
								order = 1,
								type = 'execute',
								name = L["Launch Eltruism Installer"],
								width = 'full',
								desc = L["Launches the Eltruism install prompt"],
								func = function() E:GetModule('PluginInstaller'):Queue(ElvUI_EltreumUI.InstallerData) E:ToggleOptionsUI() end,
							},
							eltruismsettings = {
								order = 2,
								type = 'execute',
								name = L["Reset/Update Eltruism Settings"],
								width = 'full',
								desc = L["Resets/Updates Eltruism Settings to Eltreum's Defaults"],
								func = function() ElvUI_EltreumUI:UpdateSettings() E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					header6 = {
						order = 3,
						type = "description",
						name = L["Nameplates"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					resetnameplates = {
						order = 4,
						type = 'group',
						inline = true,
						name = "",
						args = {
							nameplateagain = {
								order = 1,
								type = 'execute',
								name = L["Reset nameplates to Eltruism settings"],
								width = 'full',
								func = function() ElvUI_EltreumUI:SetupNamePlates('ElvUI') ElvUI_EltreumUI:ResolutionOutline() end,
							},
						},
					},
					header7 = {
						order = 5,
						type = "description",
						name = L["Chat"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					resetchat = {
						order = 6,
						type = 'group',
						inline = true,
						name = "",
						args = {
							resetchatagain = {
								order = 1,
								type = 'execute',
								name = L["Reset Chat to ElvUI Settings"],
								width = 'full',
								func = function() E:SetupChat() ElvUI_EltreumUI:Print(L["ElvUI Chat has been set."]) end,
							},
						},
					},
					header8 = {
						order = 7,
						type = "description",
						name = L["Layouts"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					resetlayout = {
						order = 8,
						type = 'group',
						inline = true,
						name = "",
						args = {
							resetdps = {
								order = 1,
								type = 'execute',
								name = L["Reset layout to Eltruism DPS/Tank"],
								width = 'full',
								func = function() E.data:SetProfile('Eltreum DPS/Tank ('..E.mynameRealm..')') ElvUI_EltreumUI:SetupGeneralLayout() ElvUI_EltreumUI:SetupLayoutDPS() end,
							},
							resethealer = {
								order = 1,
								type = 'execute',
								name = L["Reset layout to Eltruism Healer"],
								width = 'full',
								func = function() E.data:SetProfile('Eltreum Healer ('..E.mynameRealm..')') ElvUI_EltreumUI:SetupGeneralLayout() ElvUI_EltreumUI:SetupLayoutHealer() end,
							},
						},
					},
					header9 = {
						order = 9,
						type = "description",
						name = L["Skip Plugins"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					skipplugin = {
						order = 10,
						type = 'group',
						inline = true,
						name = "",
						args = {
							resethealer = {
								order = 1,
								type = 'execute',
								name = L["Skip Plugins install message"],
								desc = L["Make the warnings to install profiles for other plugins stop"],
								width = 'full',
								func = function()
									E.private.ElvUI_EltreumUI.isInstalled.sle = true
									E.private.ElvUI_EltreumUI.isInstalled.windtools = true
									E.private.ElvUI_EltreumUI.isInstalled.projectazilroka = true
								end,
							},
						},
					},
					header10 = {
						order = 11,
						type = "description",
						name = L["Clear Details! Damage Meter tables to free up memory"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					detailstable = {
						order = 12,
						type = 'group',
						name = "",
						width = "full",
						inline = true,
						args = {
							detailstableexecute = {
								order = 12,
								type = 'execute',
								name = L["Clear Details Tables"],
								desc = L["Set Details tables to be empty"],
								width = 'full',
								confirm = true,
								func = function() ElvUI_EltreumUI:EmptyDetailsTable() end,
							},
						},
					},
				},
			},
			afk = {
				type = 'group',
				name = L["A.F.K"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\afk',
				order = 85,
				args = {
					header7 = {
						order = 1,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					afkmusic = {
						order = 2,
						type = 'group',
						inline = true,
						name = L["Play music while you are AFK"],
						hidden = function() if E.Retail then return false else return true end end,
						args = {
							enable = {
							type = 'toggle',
							name = L["Enable"],
							order = 1,
							get = function() return E.db.ElvUI_EltreumUI.afkmusic.enable end,
							set = function(_, value) E.db.ElvUI_EltreumUI.afkmusic.enable = value end,
							},
							addagaphere = {
							order = 2,
							type = "description",
							name = "",
							width = 'full',
							},
							afksoundtype = {
							order = 2,
							type = 'group',

							name = L["Select a type of music"],
								args = {
									yetanothergap = {
									order = 2,
									type = "description",
									name = "",
									},
									racial = {
										type = 'toggle',
										name = L["Racial Music"],
										order = 5,
										disabled = function() return not E.db.ElvUI_EltreumUI.afkmusic.enable or E.db.ElvUI_EltreumUI.afkmusic.playerclass end,
										get = function() return E.db.ElvUI_EltreumUI.afkmusic.racial end,
										set = function(_, value) E.db.ElvUI_EltreumUI.afkmusic.racial = value end,
									},
									playerclass = {
										type = 'toggle',
										name = L["Class Music"],
										order = 5,
										disabled = function() return not E.db.ElvUI_EltreumUI.afkmusic.enable or E.db.ElvUI_EltreumUI.afkmusic.racial end,
										get = function() return E.db.ElvUI_EltreumUI.afkmusic.playerclass end,
										set = function(_, value) E.db.ElvUI_EltreumUI.afkmusic.playerclass = value end,
									},
								}
							}
						}
					},
					afkmusicclassic = {
						order = 2,
						type = 'group',
						inline = true,
						name = L["Play music while you are AFK"],
						hidden = function() if E.Retail then return true else return false end end,
						args = {
							enable = {
							type = 'toggle',
							name = L["Enable"],
							order = 1,
							get = function() return E.db.ElvUI_EltreumUI.afkmusic.enable end,
							set = function(_, value) E.db.ElvUI_EltreumUI.afkmusic.enable = value end,
							},
						},
					},
					header1 = {
						order = 3,
						type = "description",
						name = E.NewSign.."Eltruism Logo",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					enablelogo = {
						type = 'toggle',
						name = L["Enable"],
						width = "full",
						order = 4,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.afklogo end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.afklogo = value end,
					},
				},
			},
			addonsprofiles = {
				type = 'group',
				name = L["Addons"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\addon',
				order = 85,
				childGroups = "tab",
				args = {
					elvui = {
						type = 'group',
						name = L["ElvUI Plugins"],
						order = 1,
						args = {
							header1 = {
								order = 1,
								type = "description",
								name = "Azilroka Addons",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							addonskins = {
								order = 2,
								type = 'execute',
								name = '|cff16C3F2AddOn|r|cFFFFFFFFSkins|r',
								desc = L["Reset to Eltruism defaults."],
								confirm = true,
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupAS() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header2 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
							},
							projectazilroka = {
								order = 3,
								type = 'execute',
								name = '|cFF16C3F2Project|r|cFFFFFFFFAzilroka|r',
								desc = L["Reset to Eltruism defaults."],
								confirm = true,
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupPA() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header3 = {
								order = 4,
								type = "description",
								name = "Shadow and Light",
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							shadowandlight = {
								order = 5,
								type = 'execute',
								name = E:TextGradient(L["Shadow and Light"], 0.2,0,0.6,0.2,0.2,0.8,0.2,1,0),
								desc = L["Reset to Eltruism defaults."],
								confirm = true,
								width = 'double',
								hidden = function() if E.Retail then return false else return true end end,
								func = function() ElvUI_EltreumUI:GetSLEProfile() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header4 = {
								order = 6,
								type = "description",
								name = "Windtools",
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							windtools = {
								order = 7,
								type = 'execute',
								name = "|cff45aaf2W|r|cff4795efi|r|cff4a80ecn|r|cff498aedd|r|cff469ff0T|r|cff60b1e8o|r|cff98c0d5o|r|cffc1ccc6l|r|cffc1ccc6s|r",
								desc = L["Reset to Eltruism defaults."],
								confirm = true,
								width = 'double',
								hidden = function() if E.Retail then return false else return true end end,
								func = function() ElvUI_EltreumUI:GetWindToolsProfile() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header5 = {
								order = 8,
								type = "description",
								name = "Dynamic Status Icons",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							dynamicstatusicons = {
								order = 9,
								type = 'execute',
								name = '|cFF16C3F2Dynamic Status |r|cFFFFFFFFIcons|r',
								desc = L["Reset to Eltruism defaults."],
								confirm = true,
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDynamicStatusIcons() E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					bossmods = {
						type = 'group',
						name = L["BossMods Profiles"],
						order = 2,
						args = {
							header1 = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bigwigs = {
								order = 2,
								type = 'execute',
								name = 'BigWigs',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupBW() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header2 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
							},
							dbm = {
								order = 3,
								type = 'execute',
								name = 'DBM',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupDBM() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header4 = {
								order = 4,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							mrt = {
								order = 4,
								type = 'execute',
								name = 'Method Raid Tools',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupMRT() E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					addons = {
						type = 'group',
						name = L["Addon Profiles"],
						order = 3,
						args = {
							header1 = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							dynamiccam = {
								order = 1,
								type = 'execute',
								name = 'Dynamic Cam',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupDynamicCam() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header2 = {
								order = 2,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							immersion = {
								order = 2,
								type = 'execute',
								name = 'Immersion',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupImmersion() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header9521 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							warpdeplete = {
								order = 4,
								type = 'execute',
								name = 'WarpDeplete',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								hidden = function() if E.Retail then return false else return true end end,
								func = function() ElvUI_EltreumUI:GetWarpDepleteProfile() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header5411questie = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							questie = {
								order = 4,
								type = 'execute',
								name = 'Questie',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								hidden = function() if E.Retail then return true else return false end end,
								func = function() ElvUI_EltreumUI:AddonSetupQuestie() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header3pvp = {
								order = 5,
								type = "description",
								name = "PvP Addons",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							battlegroundenemies = {
								order = 6,
								type = 'execute',
								name = 'BattleGroundEnemies',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:GetBattleGroundEnemiesProfile() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header465 = {
								order = 7,
								type = "description",
								name = "",
								width = 'full',
							},
							capping = {
								order = 7,
								type = 'execute',
								name = 'Capping',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:GetCappingProfile() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header4655 = {
								order = 8,
								type = "description",
								name = "",
								width = 'full',
							},
							gladiusex = {
								order = 8,
								type = 'execute',
								name = 'Gladius Ex',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								hidden = function() if E.Retail then return false else return true end end,
								func = function() ElvUI_EltreumUI:AddonSetupGladiusEx() E:StaticPopup_Show('CONFIG_RL') end,
							},
							gladdy = {
								order = 9,
								type = 'execute',
								name = 'Gladddy',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								hidden = function() if E.Retail or E.Classic then return true else return false end end,
								func = function() ElvUI_EltreumUI:SetupGladdy() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header4651 = {
								order = 10,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail or E.Classic then return true else return false end end,
							},
							gladius = {
								order = 10,
								type = 'execute',
								name = 'Gladius',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								hidden = function() if E.Retail or E.Classic then return true else return false end end,
								func = function() ElvUI_EltreumUI:SetupGladius() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header5 = {
								order = 93,
								type = "description",
								name = "Combat Text Addons",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							nameplatesct = {
								order = 94,
								type = 'execute',
								name = 'NameplateSCT',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupNameplateSCT() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header21 = {
								order = 95,
								type = "description",
								name = "",
								width = 'full',
							},
							fct = {
								order = 95,
								type = 'execute',
								name = 'ElvUI Floating Combat Text',
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupFCT() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header6 = {
								order = 96,
								type = "description",
								name = "Details Profiles",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							details = {
								order = 97,
								type = 'execute',
								name = L["Details v1 - Blizzard Flat Icons"],
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupDT() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header29 = {
								order = 98,
								type = "description",
								name = "",
								width = 'full',
							},
							details2 = {
								order = 98,
								type = 'execute',
								name = L["Details v2 - Releaf Transparent Icons"],
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupDTReleaf() E:StaticPopup_Show('CONFIG_RL') end,
							},
							header28 = {
								order = 99,
								type = "description",
								name = "",
								width = 'full',
							},
							details3 = {
								order = 99,
								type = 'execute',
								name = L["Details v3 - Releaf Solid Icons"],
								desc = L["Reset to Eltruism defaults."],
								width = 'double',
								func = function() ElvUI_EltreumUI:AddonSetupDTReleafv3() E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
				},
			},
			aurafilters = {
				type = 'group',
				name = L["Aura Filters"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\aurafilter',
				childGroups = "tab",
				order = 85,
				args = {
					player = {
						type = 'group',
						name = L["Player"],
						order = 2,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Select how auras will be displayed for Player"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							playerallbuffs = {
								order = 6,
								type = 'execute',
								name = L["All Player Buffs"],
								desc = L["Set filters to show more buffs on Player"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('player', 'Everything') end,
							},
							playeralldebuffs = {
								order = 6,
								type = 'execute',
								name = L["All Player Debuffs"],
								desc = L["Set filters to show more debuffs on Player"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('player', 'Everything') end,
							},
							playerEltruismbuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Player Buffs"],
								desc = L["Set filters to be Eltruism defaults on Player"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('player', 'Eltruism') end,
							},
							playerEltruismdebuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Player Debuffs"],
								desc = L["Set filters to be Eltruism defaults on Player"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('player', 'Eltruism') end,
							},
						},
					},
					target = {
						type = 'group',
						name = L["Target"],
						order = 2,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Select how auras will be displayed for Target"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							targetalldebuffs = {
								order = 6,
								type = 'execute',
								name = L["All Target Debuffs"],
								desc = L["Set filters to show more debuffs on Target"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('target', 'Everything') end,
							},
							targetallbuffs = {
								order = 6,
								type = 'execute',
								name = L["All Target Buffs"],
								desc = L["Set filters to show more buffs on Target"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('target', 'Everything') end,
							},
							targetEltruismdebuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Target Debuffs"],
								desc = L["Set filters to be Eltruism defaults on Target"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('target', 'Eltruism') end,
							},
							targetEltruismbuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Target Buffs"],
								desc = L["Set filters to be Eltruism defaults on Target"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('target', 'Eltruism') end,
							},
						},
					},
					focus= {
						type = 'group',
						name = L["Focus"],
						order = 2,
						hidden = function() if E.Retail or E.Wrath or E.TBC then return false else return true end end,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Select how auras will be displayed for Focus"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							focusallbuffs = {
								order = 6,
								type = 'execute',
								name = L["All Focus Buffs"],
								desc = L["Set filters to show more buffs on Focus"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('focus', 'Everything') end,
							},
							focusalldebuffs = {
								order = 6,
								type = 'execute',
								name = L["All Focus Debuffs"],
								desc = L["Set filters to show more debuffs on Focus"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('focus', 'Everything') end,
							},
							focusEltruismbuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Focus Buffs"],
								desc = L["Set filters to be Eltruism defaults on Focus"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('focus', 'Eltruism') end,
							},
							focusEltruismdebuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Focus Debuffs"],
								desc = L["Set filters to be Eltruism defaults on Focus"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('focus', 'Eltruism') end,
							},
						}
					},
					boss = {
						type = 'group',
						name = L["Boss"],
						order = 2,
						hidden = function() if E.Retail then return false else return true end end,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Select how auras will be displayed for Boss"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bossallbuffs = {
								order = 6,
								type = 'execute',
								name = L["All Boss Buffs"],
								desc = L["Set filters to show more buffs on Boss"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('boss', 'Everything') end,
							},
							bossalldebuffs = {
								order = 6,
								type = 'execute',
								name = L["All Boss Debuffs"],
								desc = L["Set filters to show more debuffs on Boss"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('boss', 'Everything') end,
							},
							bossEltruismbuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Boss Buffs"],
								desc = L["Set filters to be Eltruism defaults on Boss"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('boss', 'Eltruism') end,
							},
							bossEltruismdebuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Boss Debuffs"],
								desc = L["Set filters to be Eltruism defaults on Boss"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('boss', 'Eltruism') end,
							},
						}
					},
					nameplate= {
						type = 'group',
						name = L["Nameplates"],
						order = 2,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Select how auras will be displayed for Nameplates"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							nameplateallbuffs = {
								order = 6,
								type = 'execute',
								name = L["All Nameplate Buffs"],
								desc = L["Set filters to show more buffs on Nameplates"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('nameplate', 'Everything') end,
							},
							nameplatealldebuffs = {
								order = 6,
								type = 'execute',
								name = L["All Nameplate Debuffs"],
								desc = L["Set filters to show more debuffs on Nameplates"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('nameplate', 'Everything') end,
							},
							nameplateEltruismbuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Nameplate Buffs"],
								desc = L["Set filters to be Eltruism defaults on Nameplates"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupBuffs('nameplate', 'Eltruism') end,
							},
							nameplateEltruismdebuffs = {
								order = 9,
								type = 'execute',
								name = L["Eltruism Nameplate Debuffs"],
								desc = L["Set filters to be Eltruism defaults on Nameplates"],
								width = 'double',
								func = function() ElvUI_EltreumUI:SetupDebuffs('nameplate', 'Eltruism') end,
							},
						}
					},
				},
			},
			borders = {
				type = 'group',
				name = L["Borders"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\border',
				order = 85,
				childGroups = "tab",
				args = {
					general = {
						type = 'group',
						name = L["General"],
						order = 1,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Enable Borders"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enable = {
								type = 'toggle',
								name = L["Enable"],
								width = "full",
								order = 2,
								get = function() return E.db.ElvUI_EltreumUI.borders.borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.borders = value ElvUI_EltreumUI:Borders() E:StaticPopup_Show('CONFIG_RL') end,
							},
							enableautoadjust = {
								type = 'toggle',
								name = L["Enable Auto-adjusting the actionbar spacing and position"],
								desc = L["Adjusts actionbar spacing and position based on borders being enabled or not"],
								width = "full",
								order = 3,
								get = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.borderautoadjust = value ElvUI_EltreumUI:Borders() E:StaticPopup_Show('CONFIG_RL') end,
							},
							headerline2 = {
								order = 93,
								type = "description",
								name = L["Choose the Border Texture to be used:"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							sharedmediatexture = {
								order = 94,
								type = 'select',
								width = "full",
								dialogControl = 'LSM30_Border',
								name = "",
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.border,
								get = function() return E.db.ElvUI_EltreumUI.borders.texture end,
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								set = function(self,key) E.db.ElvUI_EltreumUI.borders.texture = key ElvUI_EltreumUI:Borders() end,
							},
							classcolors = {
								type = 'toggle',
								name = L["Use Class Colors"],
								--width = "full",
								order = 95,
								get = function() return E.db.ElvUI_EltreumUI.borders.classcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.classcolor = value ElvUI_EltreumUI:Borders() E:StaticPopup_Show('CONFIG_RL') end,
							},
							colorborders = {
								order = 96,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.borders.classcolor end,
								get = function()
									local customcolorborders = E.db.ElvUI_EltreumUI.bordercolors
									local d = P.ElvUI_EltreumUI.bordercolors
									return customcolorborders.r, customcolorborders.g, customcolorborders.b, customcolorborders.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local customcolorborders = E.db.ElvUI_EltreumUI.bordercolors
									customcolorborders.r, customcolorborders.g, customcolorborders.b = r, g, b E:StaticPopup_Show('CONFIG_RL') ElvUI_EltreumUI:Borders()
								end,
							},
							headerline3 = {
								order = 97,
								type = "description",
								name = L["Change the size of the borders:"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							borderABsize = {
								type = 'range',
								name = L["Actionbar Thickness"],
								order = 98,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.actionbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.baredgesize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.baredgesize = value ElvUI_EltreumUI:Borders() end,
							},
							borderUFsize = {
								type = 'range',
								name = L["Unitframe Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.unitframe.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.playertargetsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.playertargetsize = value ElvUI_EltreumUI:Borders() end,
							},
							bordergroupUFsize = {
								type = 'range',
								name = L["Group Unitframe Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.unitframe.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.groupsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.groupsize = value ElvUI_EltreumUI:Borders() end,
							},
							bordercastbarsize = {
								type = 'range',
								name = L["Castbar Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.unitframe.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.playertargetcastsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.playertargetcastsize = value ElvUI_EltreumUI:Borders() end,
							},
							borderpetsize = {
								type = 'range',
								name = L["Pet Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.unitframe.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petsize = value ElvUI_EltreumUI:Borders() end,
							},
							borderfocussize = {
								type = 'range',
								name = L["Focus Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.unitframe.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.focussize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.focussize = value ElvUI_EltreumUI:Borders() end,
							},
							borderbosssize = {
								type = 'range',
								name = L["Boss Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders or not E.private.unitframe.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bosssize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bosssize = value ElvUI_EltreumUI:Borders() end,
							},
							bordertotemsize = {
								type = 'range',
								name = L["Shaman Totem Thickness"],
								order = 99,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								hidden = function() if E.Wrath then return false else return true end end,
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.totemedgesize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.totemedgesize = value ElvUI_EltreumUI:Borders() end,
							},
							borderaurasize = {
								type = 'range',
								name = L["Aura Thickness"],
								order = 100,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.aurasize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.aurasize = value ElvUI_EltreumUI:AuraBorders() end,
							},
							borderchatsize = {
								type = 'range',
								name = L["Chat Thickness"],
								order = 101,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.chatsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.chatsize = value ElvUI_EltreumUI:Borders() end,
							},
							borderminimapsize = {
								type = 'range',
								name = L["Minimap Thickness"],
								order = 102,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.minimapsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.minimapsize = value ElvUI_EltreumUI:Borders() end,
							},
							borderstancesize = {
								type = 'range',
								name = L["Stance Bar Thickness"],
								order = 102,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.stanceedgesize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.stanceedgesize = value ElvUI_EltreumUI:Borders() end,
							},
							borderpetabsize = {
								type = 'range',
								name = L["Pet Action Bar Thickness"],
								order = 102,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petactionedgesize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petactionedgesize = value ElvUI_EltreumUI:Borders() end,
							},
						},
					},
					actionbarsborders = {
						order = 2,
						type = 'group',
						--inline = true,
						disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
						name = L["ActionBars"],
						childGroups = "tab",
						args = {
							gap0 = {
								order = 1,
								type = "description",
								name = L["(All settings require a reload)"],
								width = 'full',
								--image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},


							gap1 = {
								order = 5,
								type = "description",
								name = L["Action Bar 1"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bar1enable = {
								type = 'toggle',
								name = L["Enable"],
								order = 6,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar1.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar1borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar1borders = value ElvUI_EltreumUI:Borders() end,
							},
							bar1xsize = {
								type = 'range',
								name = L["Bar 1 X offset"],
								order = 7,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar1.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar1xborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar1xborder = value ElvUI_EltreumUI:Borders() end,
							},
							bar1ysize = {
								type = 'range',
								name = L["Bar 1 Y offset"],
								order = 7,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar1.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar1yborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar1yborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap2 = {
								order = 8,
								type = "description",
								name = L["Action Bar 2"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bar2enable = {
								type = 'toggle',
								name = L["Enable"],
								order = 9,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar2.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar2borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar2borders = value ElvUI_EltreumUI:Borders() end,
							},
							bar2xsize = {
								type = 'range',
								name = L["Bar 2 X offset"],
								order = 10,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar2.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar2xborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar2xborder = value ElvUI_EltreumUI:Borders() end,
							},
							bar2ysize = {
								type = 'range',
								name = L["Bar 2 Y offset"],
								order = 10,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar2.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar2yborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar2yborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap3 = {
								order = 11,
								type = "description",
								name = L["Action Bar 3"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bar3enable = {
								type = 'toggle',
								name = L["Enable"],
								order = 12,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar3.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar3borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar3borders = value ElvUI_EltreumUI:Borders() end,
							},
							bar3xsize = {
								type = 'range',
								name = L["Bar 3 X offset"],
								order = 13,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar3.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar3xborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar3xborder = value ElvUI_EltreumUI:Borders() end,
							},
							bar3ysize = {
								type = 'range',
								name = L["Bar 3 Y offset"],
								order = 13,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar3.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar3yborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar3yborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap4 = {
								order = 14,
								type = "description",
								name = L["Action Bar 4"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bar4enable = {
								type = 'toggle',
								name = L["Enable"],
								order = 15,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar4.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar4borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar4borders = value ElvUI_EltreumUI:Borders() end,
							},
							bar4xsize = {
								type = 'range',
								name = L["Bar 4 X offset"],
								order = 16,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar4.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar4xborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar4xborder = value ElvUI_EltreumUI:Borders() end,
							},
							bar4ysize = {
								type = 'range',
								name = L["Bar 4 Y offset"],
								order = 16,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar4.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar4yborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar4yborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap5 = {
								order = 17,
								type = "description",
								name = L["Action Bar 5"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bar5enable = {
								type = 'toggle',
								name = L["Enable"],
								order = 18,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar5.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar5borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar5borders = value ElvUI_EltreumUI:Borders() end,
							},
							bar5xsize = {
								type = 'range',
								name = L["Bar 5 X offset"],
								order = 19,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar5.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar5xborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar5xborder = value ElvUI_EltreumUI:Borders() end,
							},
							bar5ysize = {
								type = 'range',
								name = L["Bar 5 Y offset"],
								order = 19,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar5.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar5yborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar5yborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap6 = {
								order = 20,
								type = "description",
								name = L["Action Bar 6"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bar6enable = {
								type = 'toggle',
								name = L["Enable"],
								order = 21,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar6.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar6borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar6borders = value ElvUI_EltreumUI:Borders() end,
							},
							bar6xsize = {
								type = 'range',
								name = L["Bar 6 X offset"],
								order = 22,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar6.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar6xborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar6xborder = value ElvUI_EltreumUI:Borders() end,
							},
							bar6ysize = {
								type = 'range',
								name = L["Bar 6 Y offset"],
								order = 22,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar6.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bar6yborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bar6yborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap7totem = {
								order = 23,
								type = "description",
								name = L["Shaman Totem Bar"],
								width = 'full',
								hidden = function() if E.Wrath then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							totemenable = {
								type = 'toggle',
								name = L["Enable"],
								order = 24,
								width = "full",
								hidden = function() if E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.totembar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.totembar = value ElvUI_EltreumUI:Borders() end,
							},
							totemxsize = {
								type = 'range',
								name = L["Totem X offset"],
								order = 25,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								hidden = function() if E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar6.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.totemxborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.totemxborder = value ElvUI_EltreumUI:Borders() end,
							},
							totemysize = {
								type = 'range',
								name = L["Totem Y offset"],
								order = 25,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								hidden = function() if E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.bar6.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.totemyborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.totemyborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap8 = {
								order = 26,
								type = "description",
								name = L["Stance Bar"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							stanceenable = {
								type = 'toggle',
								name = L["Enable"],
								order = 27,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.stanceborders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.stanceborders = value ElvUI_EltreumUI:Borders() end,
							},
							stancexsize = {
								type = 'range',
								name = L["Stance X offset"],
								order = 28,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.stanceBar.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.stancexborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.stancexborder = value ElvUI_EltreumUI:Borders() end,
							},
							stanceysize = {
								type = 'range',
								name = L["Stance Y offset"],
								order = 28,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.stanceBar.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.stanceyborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.stanceyborder = value ElvUI_EltreumUI:Borders() end,
							},
							gap9 = {
								order = 29,
								type = "description",
								name = L["Pet Action Bar"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							petactionenable = {
								type = 'toggle',
								name = L["Enable"],
								order = 30,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petactionborders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petactionborders = value ElvUI_EltreumUI:Borders() end,
							},
							petactionxsize = {
								type = 'range',
								name = L["Pet Action Bar X offset"],
								order = 31,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.barPet.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petactionxborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petactionxborder = value ElvUI_EltreumUI:Borders() end,
							},
							petactionysize = {
								type = 'range',
								name = L["Pet Action Bar Y offset"],
								order = 31,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.actionbar.barPet.enabled end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petactionyborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petactionyborder = value ElvUI_EltreumUI:Borders() end,
							},
						},
					},
					ufborders = {
						type = 'group',
						disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
						name = L["Unitframes"],
						order = 2,
						args = {
							gap0 = {
								order = 1,
								type = "description",
								name = L["(All settings require a reload)"],
								width = 'full',
								--image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gapplayer = {
								order = 2,
								type = "description",
								name = L["Player Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barplayer = {
								type = 'toggle',
								name = L["Enable"],
								order = 3,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.player.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.playerborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.playerborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxplayer = {
								type = 'range',
								name = L["Border X offset"],
								order = 4,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.player.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xplayer end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xplayer = value ElvUI_EltreumUI:Borders() end,
							},
							borderyplayer = {
								type = 'range',
								name = L["Border Y offset"],
								order = 4,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.player.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.yplayer end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.yplayer = value ElvUI_EltreumUI:Borders() end,
							},
							gapplayercast = {
								order = 5,
								type = "description",
								name = L["Player Castbar Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barcastplayer = {
								type = 'toggle',
								name = L["Enable"],
								order = 6,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.player.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.playercastborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.playercastborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxcastplayer = {
								type = 'range',
								name = L["Border X offset"],
								order = 7,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.player.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xplayercast end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xplayercast = value ElvUI_EltreumUI:Borders() end,
							},
							borderycastplayer = {
								type = 'range',
								name = L["Border Y offset"],
								order = 7,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.player.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.yplayercast end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.yplayercast = value ElvUI_EltreumUI:Borders() end,
							},
							gaptarget = {
								order = 29,
								type = "description",
								name = L["Target Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bartarget = {
								type = 'toggle',
								name = L["Enable"],
								order = 30,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.target.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.targetborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.targetborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxtarget = {
								type = 'range',
								name = L["Border X offset"],
								order = 31,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.target.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xtarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xtarget = value ElvUI_EltreumUI:Borders() end,
							},
							borderytarget = {
								type = 'range',
								name = L["Border Y offset"],
								order = 31,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.target.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.ytarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.ytarget = value ElvUI_EltreumUI:Borders() end,
							},
							gaptargetcast = {
								order = 32,
								type = "description",
								name = L["Target Castbar Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bartargetcast = {
								type = 'toggle',
								name = L["Enable"],
								order = 33,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.target.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.targetcastborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.targetcastborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxcasttarget = {
								type = 'range',
								name = L["Border X offset"],
								order = 34,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.target.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xcasttarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xcasttarget = value ElvUI_EltreumUI:Borders() end,
							},
							borderycasttarget = {
								type = 'range',
								name = L["Border Y offset"],
								order = 34,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.target.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.ycasttarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.ycasttarget = value ElvUI_EltreumUI:Borders() end,
							},
							gaptargettarget = {
								order = 35,
								type = "description",
								name = L["Target of Target Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bartargettarget = {
								type = 'toggle',
								name = L["Enable"],
								order = 36,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.targettarget.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.targettargetborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.targettargetborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxtargettarget = {
								type = 'range',
								name = L["Border X offset"],
								order = 37,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.targettarget.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xtargettarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xtargettarget = value ElvUI_EltreumUI:Borders() end,
							},
							borderytargettarget = {
								type = 'range',
								name = L["Border Y offset"],
								order = 38,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.targettarget.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.ytargettarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.ytargettarget = value ElvUI_EltreumUI:Borders() end,
							},
							gapparty = {
								order = 39,
								type = "description",
								name = L["Party Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barparty = {
								type = 'toggle',
								name = L["Enable"],
								order = 40,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.party.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.partyborders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.partyborders = value ElvUI_EltreumUI:Borders() end,
							},
							borderxparty = {
								type = 'range',
								name = L["Border X offset"],
								order = 41,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.party.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.partysizex end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.partysizex = value ElvUI_EltreumUI:Borders() end,
							},
							borderyparty = {
								type = 'range',
								name = L["Border Y offset"],
								order = 42,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.party.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.partysizey end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.partysizey = value ElvUI_EltreumUI:Borders() end,
							},
							gapraid = {
								order = 43,
								type = "description",
								name = L["Raid Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barraid = {
								type = 'toggle',
								name = L["Enable"],
								order = 44,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.raid.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.raidborders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.raidborders = value ElvUI_EltreumUI:Borders() end,
							},
							borderxraid = {
								type = 'range',
								name = L["Border X offset"],
								order = 45,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.raid.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.raidsizex end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.raidsizex = value ElvUI_EltreumUI:Borders() end,
							},
							borderyraid = {
								type = 'range',
								name = L["Border Y offset"],
								order = 46,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.raid.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.raidsizey end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.raidsizey = value ElvUI_EltreumUI:Borders() end,
							},
							gapraid40 = {
								order = 47,
								type = "description",
								name = L["Raid40 Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barraid40 = {
								type = 'toggle',
								name = L["Enable"],
								order = 48,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.raid40.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.raid40borders end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.raid40borders = value ElvUI_EltreumUI:Borders() end,
							},
							borderxraid40 = {
								type = 'range',
								name = L["Border X offset"],
								order = 49,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.raid40.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.raid40sizex end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.raid40sizex = value ElvUI_EltreumUI:Borders() end,
							},
							borderyraid40 = {
								type = 'range',
								name = L["Border Y offset"],
								order = 50,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.raid40.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.raid40sizey end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.raid40sizey = value ElvUI_EltreumUI:Borders() end,
							},
							gapfocus = {
								order = 51,
								type = "description",
								name = L["Focus Border"],
								width = 'full',
								hidden = function() if E.Classic then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barfocus= {
								type = 'toggle',
								name = L["Enable"],
								order = 52,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.focus.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.focusborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.focusborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxfocus = {
								type = 'range',
								name = L["Border X offset"],
								order = 53,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.focus.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xfocus end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xfocus = value ElvUI_EltreumUI:Borders() end,
							},
							borderyfocus = {
								type = 'range',
								name = L["Border Y offset"],
								order = 54,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.focus.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.yfocus end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.yfocus = value ElvUI_EltreumUI:Borders() end,
							},
							gapfocuscast = {
								order = 55,
								type = "description",
								name = L["Focus Castbar Border"],
								width = 'full',
								hidden = function() if E.Classic then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barfocuscast = {
								type = 'toggle',
								name = L["Enable"],
								order = 56,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.focus.enable or not E.db.unitframe.units.focus.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.focuscastborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.focuscastborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxcastfocus = {
								type = 'range',
								name = L["Border X offset"],
								order = 57,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.focus.enable or not E.db.unitframe.units.focus.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xcastfocus end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xcastfocus = value ElvUI_EltreumUI:Borders() end,
							},
							borderycastfocus = {
								type = 'range',
								name = L["Border Y offset"],
								order = 58,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.focus.enable or not E.db.unitframe.units.focus.castbar.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.ycastfocus end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.ycastfocus = value ElvUI_EltreumUI:Borders() end,
							},
							gapboss = {
								order = 95,
								type = "description",
								name = L["Boss Border"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barboss= {
								type = 'toggle',
								name = L["Enable"],
								order = 96,
								width = "full",
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.boss.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.bossborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.bossborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxboss = {
								type = 'range',
								name = L["Border X offset"],
								order = 97,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.boss.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xboss end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xboss = value ElvUI_EltreumUI:Borders() end,
							},
							borderyboss = {
								type = 'range',
								name = L["Border Y offset"],
								order = 98,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.boss.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.yboss end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.yboss = value ElvUI_EltreumUI:Borders() end,
							},
							gappet = {
								order = 100,
								type = "description",
								name = L["Pet Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							petenable = {
								type = 'toggle',
								name = L["Enable"],
								order = 101,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.pet.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderxpet = {
								type = 'range',
								name = L["Border X offset"],
								order = 102,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.pet.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petsizex end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petsizex = value ElvUI_EltreumUI:Borders() end,
							},
							borderypet = {
								type = 'range',
								name = L["Border Y offset"],
								order = 102,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.unitframe.units.pet.enable end,
								get = function() return E.db.ElvUI_EltreumUI.borders.petsizey end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.petsizey = value ElvUI_EltreumUI:Borders() end,
							},
						},
					},
					npborder = {
						type = 'group',
						disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
						name = L["Nameplate"],
						order = 3,
						args = {
							gap0 = {
								order = 1,
								type = "description",
								name = L["(All settings require a reload)"],
								width = 'full',
								--image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gappowerbar = {
								order = 35,
								type = "description",
								name = L["Nameplate Power Bar Border"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							barpowerbar = {
								type = 'toggle',
								name = L["Enable"],
								order = 36,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.private.ElvUI_EltreumUI.nameplatepower end,
								get = function() return E.db.ElvUI_EltreumUI.borders.powerbarborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.powerbarborder = value ElvUI_EltreumUI:Borders() end,
							},
							borderpowerbarsize = {
								type = 'range',
								name = L["Nameplate Power Bar Thickness"],
								order = 37,
								min = 1,
								max = 200,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.private.ElvUI_EltreumUI.nameplatepower end,
								get = function() return E.db.ElvUI_EltreumUI.borders.powerbarsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.powerbarsize = value ElvUI_EltreumUI:Borders() end,
							},
							borderxpowerbar = {
								type = 'range',
								name = L["Border X offset"],
								order = 38,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.private.ElvUI_EltreumUI.nameplatepower end,
								get = function() return E.db.ElvUI_EltreumUI.borders.xpowerbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.xpowerbar = value ElvUI_EltreumUI:Borders() end,
							},
							borderypowerbar = {
								type = 'range',
								name = L["Border Y offset"],
								order = 39,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.private.ElvUI_EltreumUI.nameplatepower end,
								get = function() return E.db.ElvUI_EltreumUI.borders.ypowerbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.ypowerbar = value ElvUI_EltreumUI:Borders() end,
							},
						},
					},
					otherborder = {
						type = 'group',
						name = L["Other"],
						disabled = function() return E.db.ElvUI_EltreumUI.borders.borderautoadjust or not E.db.ElvUI_EltreumUI.borders.borders end,
						order = 4,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = MINIMAP_LABEL,
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enableminimap = {
								type = 'toggle',
								name = L["Enable"].." "..MINIMAP_LABEL,
								width = "full",
								order = 2,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.minimapborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.minimapborder = value E:StaticPopup_Show('CONFIG_RL') ElvUI_EltreumUI:Borders() end,
							},

							mapbordersizex = {
								type = 'range',
								name = MINIMAP_LABEL.." "..L["Border X offset"],
								order = 3,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.ElvUI_EltreumUI.borders.minimapborder end,
								get = function() return E.db.ElvUI_EltreumUI.borders.minimapsizex end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.minimapsizex = value ElvUI_EltreumUI:Borders() end,
							},
							mapbordersizey = {
								type = 'range',
								name = MINIMAP_LABEL.." "..L["Border Y offset"],
								order = 4,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.ElvUI_EltreumUI.borders.minimapborder end,
								get = function() return E.db.ElvUI_EltreumUI.borders.minimapsizey end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.minimapsizey = value ElvUI_EltreumUI:Borders() end,
							},
							headerline2 = {
								order = 91,
								type = "description",
								name = AURAS,
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enableaura = {
								type = 'toggle',
								name = L["Enable"].." "..AURAS,
								width = "full",
								order = 92,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.auraborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.auraborder = value E:StaticPopup_Show('CONFIG_RL') ElvUI_EltreumUI:AuraBorders() end,
							},
							aurabordersizex = {
								type = 'range',
								name = L["Aura Border X offset"],
								order = 93,
								min = 1,
								max = 100,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.ElvUI_EltreumUI.borders.auraborder end,
								get = function() return E.db.ElvUI_EltreumUI.borders.aurasizex end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.aurasizex = value ElvUI_EltreumUI:AuraBorders() end,
							},
							aurabordersizey = {
								type = 'range',
								name = L["Aura Border Y offset"],
								order = 94,
								min = 1,
								max = 100,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders or not E.db.ElvUI_EltreumUI.borders.auraborder end,
								get = function() return E.db.ElvUI_EltreumUI.borders.aurasizey end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.aurasizey = value ElvUI_EltreumUI:AuraBorders() end,
							},
							headerline3 = {
								order = 95,
								type = "description",
								name = BINDING_HEADER_CHAT,
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enablechat = {
								type = 'toggle',
								name = L["Enable"].." "..BINDING_HEADER_CHAT,
								width = "full",
								order = 96,
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.chatborder end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.chatborder = value E:StaticPopup_Show('CONFIG_RL') ElvUI_EltreumUI:Borders() end,
							},
							leftchatbordersizex = {
								type = 'range',
								name = L["Left Chat Border X offset"],
								order = 97,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.leftchatborderx end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.leftchatborderx = value ElvUI_EltreumUI:Borders() end,
							},
							leftchatbordersizey = {
								type = 'range',
								name = L["Left Chat Border Y offset"],
								order = 98,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.leftchatbordery end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.leftchatbordery = value ElvUI_EltreumUI:Borders() end,
							},
							rightchatbordersizex = {
								type = 'range',
								name = L["Right Chat Border X offset"],
								order = 99,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.rightchatborderx end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.rightchatborderx = value ElvUI_EltreumUI:Borders() end,
							},
							rightchatbordersizey = {
								type = 'range',
								name = L["Right Chat Border Y offset"],
								order = 100,
								min = 1,
								max = 800,
								step = 0.1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.borders.borders end,
								get = function() return E.db.ElvUI_EltreumUI.borders.rightchatbordery end,
								set = function(_, value) E.db.ElvUI_EltreumUI.borders.rightchatbordery = value ElvUI_EltreumUI:Borders() end,
							},
						},
					}
				},
			},
			chat = {
				type = 'group',
				name = L["Chat"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\chat',
				order = 85,
				args = {
					chatOptions = {
						order = 1,
						type = 'group',
						inline = true,
						name = L["Chat Options"],
						args = {
							chatfadeenable = {
								order = 1,
								type = 'toggle',
								name = L["Enable ElvUI Chat modifications"],
								width = 'full',
								desc = L["Add fade over time, and mouse over to left and right chat panels"],
								get = function() return E.db.ElvUI_EltreumUI.chat.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header1 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gap1 = {
								order = 4,
								type = "description",
								name = "",
								width = 'full',
							},
							description2 = {
								order = 4,
								type = "description",
								name = L["Add mouse over to the left chat panel"],
							},
							leftmouseover = {
								order = 5,
								type = 'toggle',
								name = L["Left Chat Mouse Over"],
								desc = L["Toggle the option"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.leftmouseover end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.leftmouseover = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap2 = {
								order = 6,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							description3 = {
								order = 6,
								type = "description",
								name = L["Add a fade to the left chat panel, controlled by ElvUI Chat > Text Fade > Inactivity Timer"],
								width = 'full',
							},
							leftfade = {
								order = 7,
								type = 'toggle',
								name = L["Left Inactivity Fader"],
								width = 'full',
								desc = L["Toggle the option"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.leftfader end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.leftfader = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap3 = {
								order = 8,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							description4 = {
								order = 8,
								type = "description",
								name = L["Add mouse over to the left chat panel"],
							},
							rightmouseover = {
								order = 9,
								type = 'toggle',
								name = L["Right Chat Mouse Over"],
								desc = L["Toggle the option"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.rightmouseover end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.rightmouseover = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap4 = {
								order = 10,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							description5 = {
								order = 10,
								type = "description",
								name = L["Add a fade to the right chat panel, controlled by ElvUI Chat > Text Fade > Inactivity Timer"],
							},
							rightfade = {
								order = 11,
								type = 'toggle',
								name = L["Right Inactivity Fader"],
								desc = L["Toggle the option"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.rightfader end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.rightfader = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap5 = {
								order = 12,
								type = "description",
								name = L["Combat Hide"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							leftcombathide = {
								order = 13,
								type = 'toggle',
								name = L["Hide Left Chat in Combat"],
								width = 'full',
								desc = L["Toggle the option"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.leftcombathide end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.leftcombathide = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							rightcombathide = {
								order = 14,
								type = 'toggle',
								name = L["Hide Right Chat in Combat"],
								width = 'full',
								desc = L["Toggle the option"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.rightcombathide end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.rightcombathide = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap6 = {
								order = 15,
								type = "description",
								name = L["Invert left mouse click so that chat starts faded and mouse click will make it stop fading"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							invertmouse = {
								order = 16,
								type = 'toggle',
								name = L["Invert Mouse Click"],
								width = 'full',
								desc = L["Toggle the option on"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.invertclick end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.invertclick = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap7 = {
								order = 17,
								type = "description",
								name = L["Add color to some chat messages"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							colorsysmsgs = {
								order = 18,
								type = 'toggle',
								name = L["Enable"],
								width = 'full',
								desc = L["Toggle the option on"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.colorsysmsg end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.colorsysmsg = value end,
							},
							headerkeys = {
								order = 19,
								type = "description",
								name = L["!key Chat Command"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							mpluskeys = {
								order = 20,
								type = 'toggle',
								name = L["Enable !key and !keys chat command"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								desc = L["Will link your key and covenant in guild or party chat"],
								get = function() return E.db.ElvUI_EltreumUI.otherstuff.mpluskeys end,
								set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.mpluskeys = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							gap8 = {
								order = 21,
								type = "description",
								name = L["Enhance Item Links in Chat"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							chatlooticons = {
								order = 22,
								type = 'toggle',
								name = L["Enable Chat Icons"],
								width = 'full',
								desc = L["Toggle the option on"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable end,
								get = function() return E.db.ElvUI_EltreumUI.chat.looticons end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.looticons = value end,
							},
							chatitemlevels = {
								order = 23,
								type = 'toggle',
								name = L["Enable Item Levels"],
								width = 'full',
								desc = L["Toggle the option on"],
								disabled = function() return not E.db.ElvUI_EltreumUI.chat.enable or not E.db.ElvUI_EltreumUI.chat.looticons end,
								get = function() return E.db.ElvUI_EltreumUI.chat.itemlevels end,
								set = function(_, value) E.db.ElvUI_EltreumUI.chat.itemlevels = value end,
							},
							gap9 = {
								order = 24,
								type = "description",
								name = L["Customize the Chat tabs"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							darkchat = {
								order = 25,
								type = 'execute',
								name = L["Dark Chat"],
								--width = 'double',
								func = function() ElvUI_EltreumUI:DarkChat() E:StaticPopup_Show('CONFIG_RL') end,
							},
							lightchat = {
								order = 26,
								type = 'execute',
								name = L["Transparent Chat"],
								--width = 'double',
								func = function() ElvUI_EltreumUI:TransparentChat() E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
				},
			},
			combatmusic = {
				type = 'group',
				name = L["Combat Music"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\music',
				order = 85,
				args = {
					header1 = {
						order = 11,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					moremusicsettings = {
						order = 1,
						type = 'group',
						inline = true,
						name = L["Play music during combat"],
						args = {
							enable = {
								order = 1,
								type = 'toggle',
								name = L["Enable Combat Music"],
								desc = L["Enable music during combat"],
								width = 'full',
								get = function() return E.private.ElvUI_EltreumUI.combatmusic.enable end,
								set = function(_, value) E.private.ElvUI_EltreumUI.combatmusic.enable = value E:StaticPopup_Show('PRIVATE_RL') end,
							},
							enableboss = {
								order = 1,
								type = 'toggle',
								name = L["Enable Boss Music"],
								desc = L["Enable music during combat"],
								width = 'full',
								get = function() return E.private.ElvUI_EltreumUI.combatmusic.bossmusic end,
								set = function(_, value) E.private.ElvUI_EltreumUI.combatmusic.bossmusic = value E:StaticPopup_Show('PRIVATE_RL') end,
							},
							instancemusic = {
								order = 2,
								type = 'toggle',
								name = L["Disable Combat Music in Instances"],
								desc = L["Disable music during combat in instances"],
								width = 'full',
								disabled = function() return not E.private.ElvUI_EltreumUI.combatmusic.enable end,
								get = function() return E.private.ElvUI_EltreumUI.combatmusic.disableinstance end,
								set = function(_, value) E.private.ElvUI_EltreumUI.combatmusic.disableinstance = value E:StaticPopup_Show('PRIVATE_RL') end,
							},
							header2 = {
								order = 2,
								type = "description",
								name = L["Normal Combat Music"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							combatpathtofile = {
								order = 3,
								type = 'group',
								inline = true,
								name = L["Name of file inside Interface\\Addons"],
								args = {
									howtomusic = {
									order = 2,
									type = "description",
									name = L["Example: "].."mymusic.mp3",
									},
									somegap = {
										order = 3,
										type = "description",
										name = "",
									},
									soundpath = {
										order = 6,
										icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\music',
										type = 'input',
										name = '',
										desc = '',
										width = 'full',
										get = function() return E.private.ElvUI_EltreumUI.combatmusic.musicfile end,
										set = function(_, value) E.private.ElvUI_EltreumUI.combatmusic.musicfile = value E:StaticPopup_Show('PRIVATE_RL') end,
									}
								}
							},
							header3 = {
								order = 6,
								type = "description",
								name = L["Boss Combat Music"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bosspathtofile = {
								order = 7,
								type = 'group',
								inline = true,
								name = L["Name of file inside Interface\\Addons"],
								args = {
									howtomusic = {
									order = 2,
									type = "description",
									name = L["Example: "].."mymusic.mp3",
									},
									somegap = {
										order = 3,
										type = "description",
										name = "",
									},
									soundpath = {
										order = 6,
										icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\music',
										type = 'input',
										name = '',
										desc = '',
										width = 'full',
										get = function() return E.private.ElvUI_EltreumUI.combatmusic.bossfile end,
										set = function(_, value) E.private.ElvUI_EltreumUI.combatmusic.bossfile = value E:StaticPopup_Show('PRIVATE_RL') end,
									}
								}
							},
						},
					},
				},
			},
			cursor = {
				type = 'group',
				name = L["Cursor"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\cursor',
				order = 85,
				childGroups = "tab",
				args = {
					cursorgeneral = {
						order = 1,
						type = 'group',
						name= "General",
						args = {
							header1 = {
								order = 20,
								type = "description",
								name= L["Change the size of the World of Warcraft Cursor"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							setsize = {
								order = 21,
								type = 'select',
								name = L["Select a size"],
								desc = L["Choose this size"],
								values = {
									["-1"] = L["Autodetect"],
									["0"] = '32x32',
									["1"] = '48x48',
									["2"] = '64x64',
									["3"] = '128x128',
								},
								style = 'radio',
								get = function() return E.db.ElvUI_EltreumUI.cursor.size end,
								set = function(_, value) ElvUI_EltreumUI:CursorSize(value) end,
							},
							enable = {
								order = 1,
								type = 'toggle',
								name = L["Enable cursor rings for Casts, GCD and Combat"],
								desc = L["Add a rings around the mouse cursor for GCD, casts and combat"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.cursor.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursor.enable = value end,
							},
							enablecombat = {
								order = 2,
								type = 'toggle',
								name = L["Enable cursor only during combat"],
								desc = L["Cursor will only show during combat"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursor.combat end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursor.combat = value E:StaticPopup_Show('PRIVATE_RL') end,
							},
							enablecd = {
								order = 3,
								type = 'toggle',
								name = L["Enable cooldown tracking"],
								desc = L["Add a cooldown icon when trying to use skills that are on cooldown, and a cooldown flash when they are ready"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursor.cooldown end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursor.cooldown = value E:StaticPopup_Show('PRIVATE_RL') end,
							},
							enablepetcd = {
								order = 4,
								type = 'toggle',
								name = L["Enable pet cooldown tracking"],
								desc = L["Add a cooldown icon when trying to use skills that are on cooldown, and a cooldown flash when they are ready"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursor.petcooldown end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursor.petcooldown = value E:StaticPopup_Show('PRIVATE_RL') end,
							},
							fixlag = {
								order = 5,
								type = 'select',
								name = L["Attempt to fix Cursor Lag"],
								desc = L["Software cursor is how the cursor was before Battle for Azeroth, Hardware cursor is faster but will cause problems with addons that attach to it"],
								--width = 'full',
								values = {
									["0"] = L["Software Cursor"],
									["1"] = L["Hardware Cursor"],
								},
								style = 'radio',
								get = function() return C_CVar.GetCVar('HardwareCursor') end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursor.fixlag = value SetCVar('HardwareCursor', value) end,
							},
							header99 = {
								order = 97,
								type = "description",
								name= L["Cooldown Sound"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enablecdsound = {
								order = 98,
								type = 'toggle',
								name = E.NewSign..L["Play a Sound when attempting to use a skill that is on cooldown."],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.cooldown end,
								get = function() return E.db.ElvUI_EltreumUI.cursor.cooldownsound end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursor.cooldownsound = value SetCVar('Sound_EnableErrorSpeech', 0) E:StaticPopup_Show('PRIVATE_RL') end,
							},
							cdsound = {
								order = 99,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Sound',
								name = L["Select a Sound"],
								desc = L["Choose a Sound from SharedMedia files"],
								values = AceGUIWidgetLSMlists.sound,
								get = function() return E.db.ElvUI_EltreumUI.cursor.cooldownfile end,
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.cooldownsound or not E.db.ElvUI_EltreumUI.cursor.cooldown end,
								set = function(self,key) E.db.ElvUI_EltreumUI.cursor.cooldownfile = key E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					cursorcolors = {
						order = 6,
						type = 'group',
						name = L["Cursor Colors"],
						args = {
							nicegap17 = {
								order = 11,
								type = "description",
								name = L["Cursor Colors "]..'|cffff0000('..L["Requires a Reload"]..")|r",
								width = 'full',
							},
							header12 = {
								order = 11,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							castclasscolor = {
								type = 'toggle',
								name = L["Class Colored Casts"],
								order = 12,
								desc = L["Use Class Colors for Cast"],
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorcast.classcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorcast.classcolor = value ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							colorcast = {
								order = 13,
								type = 'color',
								name = L["Custom Color Cast"],
								hasAlpha = false,
								disabled = function() return (not E.db.ElvUI_EltreumUI.cursor.enable) or E.db.ElvUI_EltreumUI.cursorcast.classcolor end,
								get = function()
									local cursorcast = E.db.ElvUI_EltreumUI.cursorcast
									local d = P.ElvUI_EltreumUI.cursorcast
									return cursorcast.r, cursorcast.g, cursorcast.b, cursorcast.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local cursorcast = E.db.ElvUI_EltreumUI.cursorcast
									cursorcast.r, cursorcast.g, cursorcast.b = r, g, b ElvUI_EltreumUI:CastCursor()
								end,
							},
							nicegap1 = {
								order = 14,
								type = "description",
								name = "",
								width = 'full',
							},
							gcdclasscolor = {
								type = 'toggle',
								name = L["Class Colored GCD"],
								order = 14,
								desc = L["Use Class Colors for GCD"],
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorgcd.classcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorgcd.classcolor = value ElvUI_EltreumUI:CastCursor()  E:StaticPopup_Show('CONFIG_RL') end,
							},
							colorgcd = {
								order = 15,
								type = 'color',
								name = L["Custom Color GCD"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.cursorgcd.classcolor or (not E.db.ElvUI_EltreumUI.cursor.enable ) end,
								get = function()
									local cursorgcd = E.db.ElvUI_EltreumUI.cursorgcd
									local d = P.ElvUI_EltreumUI.cursorgcd
									return cursorgcd.r, cursorgcd.g, cursorgcd.b, cursorgcd.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local cursorgcd = E.db.ElvUI_EltreumUI.cursorgcd
									cursorgcd.r, cursorgcd.g, cursorgcd.b = r, g, b ElvUI_EltreumUI:CastCursor()
								end,
							},
							nicegap2 = {
								order = 16,
								type = "description",
								name = "",
								width = 'full',
							},
							cursorcursorclasscolor = {
								type = 'toggle',
								name = L["Class Colored Combat"],
								order = 16,
								desc = L["Use Class Colors for Cursor"],
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorcursor.classcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorcursor.classcolor = value ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							cursorcursorcolor = {
								order = 17,
								type = 'color',
								name = L["Custom Color Combat"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.cursorcursor.classcolor or (not E.db.ElvUI_EltreumUI.cursor.enable) end,
								get = function()
									local cursorcursor = E.db.ElvUI_EltreumUI.cursorcursor
									local d = P.ElvUI_EltreumUI.cursorcursor
									return cursorcursor.r, cursorcursor.g, cursorcursor.b, cursorcursor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local cursorcursor = E.db.ElvUI_EltreumUI.cursorcursor
									cursorcursor.r, cursorcursor.g, cursorcursor.b = r, g, b ElvUI_EltreumUI:CastCursor()
								end,
							},
						},
					},
					cursortype = {
						order = 7,
						type = 'group',
						name = L["Cursor Type"],
						args = {
							topbar = {
								order = 0,
								type = "description",
								name = L["Choose a type of cursor by clicking it"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gap = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
							},
							gap2 = {
								order = 2,
								type = "description",
								name = "",
								width = 'full',
							},
							gap3 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
							},
							currentring = {
								order = 5,
								type = 'description',
								name = function() return L["Currently selected cursor: "]..ElvUI_EltreumUI:CurrentTypeofCursor() end,
								desc = L["Choose a type of cursor by clicking it"],
							},
							showring1 = {
								order = 90,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring1',
								name = L["Type 1"],
								desc = L["The Cursor will use this type as its texture"],
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring1.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring2 = {
								order = 91,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring2',
								name = L["Type 2"],
								desc = 'The Cursor will use this type as its texture',
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring2.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring3 = {
								order = 92,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring3',
								name = L["Type 3"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring3.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring4 = {
								order = 93,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring4',
								name = L["Type 4"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring4.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring5 = {
								order = 94,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring5',
								name = L["Type 5"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring5.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring6 = {
								order = 95,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring6',
								name = L["Type 6"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring6.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring7 = {
								order = 96,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring7',
								name = L["Type 7"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring7.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring8 = {
								order = 97,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring8',
								name = L["Type 8"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring8.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring9 = {
								order = 98,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring9',
								name = L["Type 9"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring9.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
							showring10 = {
								order = 99,
								type = "execute",
								image = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring10',
								name = L["Type 10"],
								desc = L["The Cursor will use this type as its texture"],
								confirm = true,
								func = function() E.db.ElvUI_EltreumUI.cursor.ring = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring10.tga' ElvUI_EltreumUI:CastCursor() E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					cursorsize = {
						order = 3,
						type = 'group',
						name = L["Cursor Sizes"],
						args = {
							header1 = {
								order = 18,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							nicegap3 = {
								order = 18,
								type = "description",
								name = L["Cursor Sizes "]..'|cffff0000('..L["Requires a Reload"]..")|r",
								width = 'full',
							},
							castradius = {
								type = 'range',
								name = L["Cast Radius (Default: 25)"],
								desc = L["Set the radius of the cast cursor"],
								order = 19,
								min = 10,
								max = 50,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorcast.radius end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorcast.radius = value ElvUI_EltreumUI:CastCursor() end,
							},
							castthickness = {
								type = 'range',
								name = L["Cast Thickness (Default: 5)"],
								desc = L["Set the radius of the cast cursor"],
								order = 19,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorcast.thickness end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorcast.thickness = value ElvUI_EltreumUI:CastCursor() end,
							},
							gcdradius = {
								type = 'range',
								name = L["GCD Radius (Default: 20)"],
								desc = L["Set the radius of the gcd cursor"],
								order = 19,
								min = 10,
								max = 50,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorgcd.radius end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorgcd.radius = value ElvUI_EltreumUI:CastCursor() end,
							},
							gcdthickness = {
								type = 'range',
								name = L["GCD Thickness (Default: 5)"],
								desc = L["Set the thickness of the gcd cursor"],
								order = 19,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorgcd.thickness end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorgcd.thickness = value ElvUI_EltreumUI:CastCursor() end,
							},
							cursorcursorradius = {
								type = 'range',
								name = L["Combat Cursor Radius (Default: 15)"],
								desc = L["Set the radius of the combat cursor"],
								order = 19,
								min = 10,
								max = 50,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorcursor.radius end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorcursor.radius = value ElvUI_EltreumUI:CastCursor() end,
							},
							cursorcursorthickness = {
								type = 'range',
								name = L["Combat Cursor Thickness (Default: 5)"],
								desc = L["Set the thickness of the combat cursor"],
								order = 19,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.cursor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.cursorcursor.thickness end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cursorcursor.thickness = value ElvUI_EltreumUI:CastCursor() end,
							},
						},
					},
				},
			},
			customglow = {
				type = 'group',
				name = L["Custom Glow"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\customglow',
				order = 85,
				childGroups = "tab",
				args = {
					general = {
						type = 'group',
						name = L["General"],
						order = 1,
						args = {
							generalglowop1 = {
								order = 1,
								type = "description",
								name = L["Replace Blizzards Default Glow with a Custom Glow"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enable = {
								type = 'toggle',
								name = L["Enable on Action Bars"],
								order = 2,
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.glow.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.enable = value end,
							},
							enablepet = {
								type = 'toggle',
								name = L["Enable on Pet Bar"],
								order = 3,
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.glow.enablepet end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.enablepet = value end,
							},
							enablenp = {
								order = 4,
								type = 'toggle',
								name = L["Enable on Nameplate"],
								desc = L["Add a glow when buffs or debuffs are expiring on nameplates"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.widenameplate.npglow end,
								set = function(_, value) E.db.ElvUI_EltreumUI.widenameplate.npglow = value end,
							},
							debuffduration = {
								type = 'range',
								name = L["Debuff Timer"],
								desc = L["Time at which the glow will start"],
								order = 5,
								min = 1,
								max = 30,
								step = 1,
								width = "double",
								get = function() return E.db.ElvUI_EltreumUI.glow.numberdebuff end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.numberdebuff = value end,
							},
							headerlinetotemsglow = {
								order = 6,
								type = "description",
								name = L["Shaman Totems"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enabletotem = {
								type = 'toggle',
								name = L["Enable on Shaman Totems"],
								order = 7,
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable end,
								get = function() return E.db.ElvUI_EltreumUI.glow.enabletotem end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.enabletotem = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enabletotem1 = {
								type = 'toggle',
								name = L["Enable on Shaman Fire Totem"],
								order = 8,
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or not E.db.ElvUI_EltreumUI.glow.enabletotem end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totem1 end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totem1 = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enabletotem2 = {
								type = 'toggle',
								name = L["Enable on Shaman Earth Totem"],
								order = 9,
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or not E.db.ElvUI_EltreumUI.glow.enabletotem end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totem2 end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totem2 = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enabletotem3 = {
								type = 'toggle',
								name = L["Enable on Shaman Water Totem"],
								order = 10,
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or not E.db.ElvUI_EltreumUI.glow.enabletotem end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totem3 end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totem3 = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enabletotem4 = {
								type = 'toggle',
								name = L["Enable on Shaman Air Totem"],
								order = 11,
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or not E.db.ElvUI_EltreumUI.glow.enabletotem end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totem4 end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totem4 = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headerline1 = {
								order = 99,
								type = "description",
								name = L["Select a Type"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							autocast = {
								type = 'toggle',
								name = L["Autocast"],
								order = 100,
								desc = L["Adds an autocast style glow using class color"],
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or E.db.ElvUI_EltreumUI.glow.pixel or E.db.ElvUI_EltreumUI.glow.blizzard end,
								get = function() return E.db.ElvUI_EltreumUI.glow.autocast end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.autocast = value end,
							},
							pixel = {
								type = 'toggle',
								name = L["Pixel"],
								order = 101,
								desc = L["Adds a pixel style glow using class color"],
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or E.db.ElvUI_EltreumUI.glow.autocast or E.db.ElvUI_EltreumUI.glow.blizzard end,
								get = function() return E.db.ElvUI_EltreumUI.glow.pixel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.pixel = value end,
							},
							blizzard = {
								type = 'toggle',
								name = 'Blizzard',
								order = 102,
								desc = L["Adds a Blizzard style glow using class color"],
								disabled = function() return not E.db.ElvUI_EltreumUI.glow.enable or E.db.ElvUI_EltreumUI.glow.autocast or E.db.ElvUI_EltreumUI.glow.pixel end,
								get = function() return E.db.ElvUI_EltreumUI.glow.blizzard end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.blizzard = value end,
							},
							previewgap = {
								order = 103,
								type = "description",
								name = L["Preview the Glow"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							preview ={
								order = 104,
								type = "execute",
								name = L["Preview"],
								desc = L["Preview the Glow, you will need to toggle it off and on to update the glow"],
								func = function() ElvUI_EltreumUI:PreviewGlow() end,
							},
						},
					},
					glowcolor = {
						type = 'group',
						name = L["Glow Colors"],
						order = 2,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Action Bars"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolorab = {
								type = 'toggle',
								name = L["Use Class Colors"],
								order = 3,
								desc = L["Toggle Class Colored glows"],
								get = function() return E.db.ElvUI_EltreumUI.glow.colorclass end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.colorclass = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colorab = {
								order = 4,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.colorclass end,
								get = function()
									local glowcustomcolor = E.db.ElvUI_EltreumUI.glowcustomcolor
									local d = P.ElvUI_EltreumUI.glowcustomcolor
									return glowcustomcolor.r, glowcustomcolor.g, glowcustomcolor.b, glowcustomcolor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowcustomcolor = E.db.ElvUI_EltreumUI.glowcustomcolor
									glowcustomcolor.r, glowcustomcolor.g, glowcustomcolor.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							headerline2 = {
								order = 5,
								type = "description",
								name = L["Pet Bar"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolorpet = {
								type = 'toggle',
								name = L["Use Class Colors"],
								order = 6,
								desc = L["Toggle Class Colored glows"],
								get = function() return E.db.ElvUI_EltreumUI.glow.colorclasspet end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.colorclasspet = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colorpet = {
								order = 7,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.colorclasspet end,
								get = function()
									local glowcustomcolorpet = E.db.ElvUI_EltreumUI.glowcustomcolorpet
									local d = P.ElvUI_EltreumUI.glowcustomcolorpet
									return glowcustomcolorpet.r, glowcustomcolorpet.g, glowcustomcolorpet.b, glowcustomcolorpet.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowcustomcolorpet = E.db.ElvUI_EltreumUI.glowcustomcolorpet
									glowcustomcolorpet.r, glowcustomcolorpet.g, glowcustomcolorpet.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							headerline3 = {
								order = 8,
								type = "description",
								name = L["Nameplate Buff/Debuff"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolornp = {
								type = 'toggle',
								name = L["Use Class Colors"],
								order = 9,
								desc = L["Toggle Class Colored glows"],
								get = function() return E.db.ElvUI_EltreumUI.glow.colorclassnp end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.colorclassnp = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colornp = {
								order = 10,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.colorclassnp end,
								get = function()
									local glowcustomcolornp = E.db.ElvUI_EltreumUI.glowcustomcolornp
									local d = P.ElvUI_EltreumUI.glowcustomcolornp
									return glowcustomcolornp.r, glowcustomcolornp.g, glowcustomcolornp.b, glowcustomcolornp.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowcustomcolornp = E.db.ElvUI_EltreumUI.glowcustomcolornp
									glowcustomcolornp.r, glowcustomcolornp.g, glowcustomcolornp.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							headertotem1 = {
								order = 11,
								type = "description",
								name = L["Shaman Fire Totem"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolortotem1 = {
								type = 'toggle',
								name = L["Use Type Colors"],
								order = 12,
								desc = L["Toggle Totem to use it's own Type Colors"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totemtypecolor = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colortotem1 = {
								order = 13,
								type = 'color',
								name = L["Custom Color"],
								hidden = function() if E.Retail then return true else return false end end,
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								get = function()
									local glowtotem1customcolor = E.db.ElvUI_EltreumUI.glowtotem1customcolor
									local d = P.ElvUI_EltreumUI.glowtotem1customcolor
									return glowtotem1customcolor.r, glowtotem1customcolor.g, glowtotem1customcolor.b, glowtotem1customcolor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowtotem1customcolor = E.db.ElvUI_EltreumUI.glowtotem1customcolor
									glowtotem1customcolor.r, glowtotem1customcolor.g, glowtotem1customcolor.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							headertotem2 = {
								order = 14,
								type = "description",
								name = L["Shaman Earth Totem"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolortotem2 = {
								type = 'toggle',
								name = L["Use Type Colors"],
								order = 15,
								desc = L["Toggle Totem to use it's own Type Colors"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totemtypecolor = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colortotem2 = {
								order = 16,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								get = function()
									local glowtotem2customcolor = E.db.ElvUI_EltreumUI.glowtotem2customcolor
									local d = P.ElvUI_EltreumUI.glowtotem2customcolor
									return glowtotem2customcolor.r, glowtotem2customcolor.g, glowtotem2customcolor.b, glowtotem2customcolor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowtotem2customcolor = E.db.ElvUI_EltreumUI.glowtotem2customcolor
									glowtotem2customcolor.r, glowtotem2customcolor.g, glowtotem2customcolor.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							headertotem3 = {
								order = 17,
								type = "description",
								name = L["Shaman Water Totem"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolortotem3 = {
								type = 'toggle',
								name = L["Use Type Colors"],
								order = 18,
								desc = L["Toggle Totem to use it's own Type Colors"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totemtypecolor = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colortotem3 = {
								order = 19,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								get = function()
									local glowtotem3customcolor = E.db.ElvUI_EltreumUI.glowtotem3customcolor
									local d = P.ElvUI_EltreumUI.glowtotem3customcolor
									return glowtotem3customcolor.r, glowtotem3customcolor.g, glowtotem3customcolor.b, glowtotem3customcolor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowtotem3customcolor = E.db.ElvUI_EltreumUI.glowtotem3customcolor
									glowtotem3customcolor.r, glowtotem3customcolor.g, glowtotem3customcolor.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							headertotem4 = {
								order = 20,
								type = "description",
								name = L["Shaman Air Totem"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classcolortotem4 = {
								type = 'toggle',
								name = L["Use Type Colors"],
								order = 21,
								desc = L["Toggle Totem to use it's own Type Colors"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.totemtypecolor = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colortotem4 = {
								order = 22,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								hidden = function() if E.Retail then return true else return false end end,
								disabled = function() return E.db.ElvUI_EltreumUI.glow.totemtypecolor end,
								get = function()
									local glowtotem4customcolor = E.db.ElvUI_EltreumUI.glowtotem4customcolor
									local d = P.ElvUI_EltreumUI.glowtotem4customcolor
									return glowtotem4customcolor.r, glowtotem4customcolor.g, glowtotem4customcolor.b, glowtotem4customcolor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowtotem4customcolor = E.db.ElvUI_EltreumUI.glowtotem4customcolor
									glowtotem4customcolor.r, glowtotem4customcolor.g, glowtotem4customcolor.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
						},
					},
					pixelglow = {
						type = 'group',
						name = L["Pixel Glow"],
						order = 3,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							borderpixel = {
								type = 'toggle',
								name = L["Enable Pixel Border"],
								desc = L["Enable a border for the Pixel Glow"],
								order = 83,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.borderpixel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.borderpixel = value end,
							},
							addagapherepixel2 = {
								order = 85,
								type = "description",
								name = "",
								width = "full",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							numberpixel = {
								type = 'range',
								name = L["Number of Pixels (Default is 9)"],
								desc = L["Set the number of pixels in pixel glow"],
								order = 85,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.numberpixel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.numberpixel = value end,
							},
							addagapherepixel3 = {
								order = 86,
								type = "description",
								width = "full",
								name = "",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							frequencypixel = {
								type = 'range',
								name = L["Pixel Frequency (Default is 1)"],
								desc = L["Set the frequency pixel glow"],
								order = 86,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.frequencypixel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.frequencypixel = value end,
							},
							addagapherepixel4 = {
								order = 87,
								type = "description",
								width = "full",
								name = "",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							lengthpixel = {
								type = 'range',
								name = L["Pixel Length (Default is 3)"],
								desc = L["Set the length of pixels"],
								order = 87,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.lengthpixel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.lengthpixel = value end,
							},
							addagapherepixel5 = {
								order = 88,
								type = "description",
								width = "full",
								name = "",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							thicknesspixel = {
								type = 'range',
								name = L["Pixel Thickness (Default is 5)"],
								desc = L["Set the thickness of pixels"],
								order = 88,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.thicknesspixel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.thicknesspixel = value end,
							},
							addagapherepixel6 = {
								order = 89,
								type = "description",
								width = "full",
								name = "",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							pixelxOffset = {
								type = 'range',
								name = L["Pixel Horizontal Offset (Default is 5)"],
								desc = L["Set the horizontal offset of pixels"],
								order = 89,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.pixelxOffset end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.pixelxOffset = value end,
							},
							addagapherepixel7 = {
								order = 90,
								type = "description",
								width = "full",
								name = "",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							pixelyOffset = {
								type = 'range',
								name = L["Pixel Vertical Offset (Default is 5)"],
								desc = L["Set the vertical offset of pixels"],
								order = 90,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.pixelyOffset end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.pixelyOffset = value end,
							},
						}
					},
					autocast = {
						type = 'group',
						name = L["Autocast Glow"],
						order = 3,
						args = {
							headerline1 = {
								order = 1,
								type = "description",
								name = L["Autocast Glow"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							numberauto = {
								type = 'range',
								name = L["Autocast Particle Groups (Default is 8)"],
								desc = L["Set the number of groups for autocast, for each group you get 4 particles"],
								order = 92,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.numberauto end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.numberauto = value end,
							},
							headerline2 = {
								order = 93,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							frequencyauto = {
								type = 'range',
								name = L["Autocast Frequency (Default is 0.8)"],
								desc = L["Speed for Autocast, set to negative to inverse direction of rotation"],
								order = 93,
								min = -3,
								max = 3,
								step = 0.1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.frequencyauto end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.frequencyauto = value end,
							},
							headerline3 = {
								order = 94,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							autoscale = {
								type = 'range',
								name = L["Autocast Scale (Default is 2)"],
								desc = L["Change the size of Autocast"],
								order = 94,
								min = -3,
								max = 3,
								step = 0.1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.autoscale end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.autoscale = value end,
							},
							headerline4 = {
								order = 95,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							autoxOffset = {
								type = 'range',
								name = L["Autocast Horizontal Offset (Default is 5)"],
								desc = L["Set the horizontal offset of autocast"],
								order = 96,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.autoxOffset end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.autoxOffset = value end,
							},
							headerline5 = {
								order = 97,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							autoyOffset = {
								type = 'range',
								name = L["Autocast Vertical Offset (Default is 5)"],
								desc = L["Set the vertical offset of autocast"],
								order = 97,
								min = 1,
								max = 10,
								step = 1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.autoyOffset end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.autoyOffset = value end,
							},
						}
					},
					blizz = {
						type = 'group',
						name = L["Blizzard Glow"],
						order = 3,
						args = {
							headerline2 = {
								order = 93,
								type = "description",
								name = L["Blizzard Glow"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							frequencyblizz = {
								type = 'range',
								name = L["Blizzard Frequency (Default is 0.5)"],
								desc = L["Speed for Blizzard glow"],
								order = 99,
								min = 0.1,
								max = 3,
								step = 0.1,
								width = "full",
								get = function() return E.db.ElvUI_EltreumUI.glow.frequencyblizz end,
								set = function(_, value) E.db.ElvUI_EltreumUI.glow.frequencyblizz = value end,
							},
						}
					},
				},
			},
			cvars = {
				order = 85,
				type = 'group',
				name = L["CVars"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\cvar',
				args = {
					header2 = {
						order = 4,
						type = "description",
						name = L["Customize CVars"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					nameplateOtherBottomInset = {
						type = 'range',
						name = L["Nameplate Other Bottom Inset"],
						desc = L["In screen % the inset from the Bottom"],
						order = 5,
						min = 0.01,
						max = 1,
						step = 0.01,
						width = "full",
						get = function() return E.db.ElvUI_EltreumUI.cvars.nameplateOtherBottomInset end,
						set = function(_, value) E.db.ElvUI_EltreumUI.cvars.nameplateOtherBottomInset = value SetCVar('nameplateOtherBottomInset', value) end,
					},
					nameplateOtherTopInset = {
						type = 'range',
						name = L["Nameplate Other Top Inset"],
						desc = L["In screen % the inset from the Top"],
						order = 5,
						min = 0.01,
						max = 1,
						step = 0.01,
						width = "full",
						get = function() return E.db.ElvUI_EltreumUI.cvars.nameplateOtherTopInset end,
						set = function(_, value) E.db.ElvUI_EltreumUI.cvars.nameplateOtherTopInset = value SetCVar('nameplateOtherTopInset', value) end,
					},
					nameplateTargetRadialPosition = {
						order = 5,
						type = 'select',
						name = L["Nameplate Target Radial Position"],
						desc = L["When target is off screen, position its nameplate radially around sides and bottom."],
						width = "full",
						values = {
							["1"] = L["Target Only"],
							["2"] = L["All in Combat"],
						},
						style = 'radio',
						get = function() return C_CVar.GetCVar('nameplateTargetRadialPosition') end,
						set = function(_, value) E.db.ElvUI_EltreumUI.cvars.nameplateTargetRadialPosition = value SetCVar('nameplateTargetRadialPosition', value) end,
					},
					cameraDistanceMaxZoomFactor = {
						type = 'range',
						name = L["Camera Distance Max Zoom Factor"],
						desc = L["Maximum Camera Zoom Out"],
						order = 5,
						min = 1,
						max = 2.6,
						step = 0.1,
						width = "full",
						get = function() return E.db.ElvUI_EltreumUI.cvars.cameraDistanceMaxZoomFactor end,
						set = function(_, value) E.db.ElvUI_EltreumUI.cvars.cameraDistanceMaxZoomFactor = value SetCVar('cameraDistanceMaxZoomFactor', value) end,
					},
					cameraFOV = {
						type = 'range',
						name = L["Camera Field of Vision"],
						desc = L["Camera Field of Vision"],
						order = 1,
						min = 50,
						max = 90,
						step = 1,
						width = "full",
						hidden = function() if E.Retail or E.Wrath then return false else return true end end,
						get = function() return E.db.ElvUI_EltreumUI.cvars.cameraFOV end,
						set = function(_, value) E.db.ElvUI_EltreumUI.cvars.cameraFOV = value SetCVar('camerafov', value) end,
					},
					header1 = {
						order = 97,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					setup = {
						order = 98,
						type = 'group',
						inline = true,
						name = L["Setup CVars"],
						args = {
							generalVars = {
								order = 1,
								type = 'execute',
								name = L["General CVars"],
								func = function() ElvUI_EltreumUI:SetupCVars() ElvUI_EltreumUI:NameplateCVars() end,
								confirm = true,
							},
						},
					},
					generalDesc = {
						order = 99,
						type = 'group',
						inline = true,
						name = L["It will set these CVars:"],
						args = {
							cvars = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = '- autoLootDefault 1\n- ShowClassColorInFriendlyNameplate 1\n- removeChatDelay 1\n- autoQuestWatch 1\n- cameraDistanceMaxZoomFactor 2.6\n- nameplateLargerScale 1.2\n- nameplateMaxDistance 60\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 0\n- nameplateOverlapH 0.8\n- nameplateOverlapV 1.1\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n- nameplateShowFriendlyMinions 0\n- nameplateOtherBottomInset 0.02\n- nameplateOtherTopInset 0.1\n- nameplateTargetRadialPosition 1\n- nameplateTargetBehindMaxDistance 40\n- nameplateShowEnemies 1\n- nameplateShowFriends 1\n- UnitNameEnemyGuardianName 0\n- UnitNameEnemyMinionName 0\n- UnitNameEnemyPetName 0\n- UnitNameEnemyPlayerName 1\n- UnitNameEnemyTotemName 1\n- UnitNameFriendlyPetName 0\n- UnitNameNPC 1\n- statusTextDisplay BOTH\n- screenshotQuality 10\n- chatMouseScroll 1\n- wholeChatWindowClickable 0\n- showTutorials 0\n- UberTooltips 1\n- alwaysCompareItems 0\n- allowCompareWithToggle 1\n- instantQuestText 1\n- autoLootRate 1\n- showQuestTrackingTooltips 1\n- lootUnderMouse 1\n- equipmentManager 1\n- previewTalents 1',
							},
						},
					},
				},
			},
			gradient = {
				type = 'group',
				name = L["Gradient Colors"],
				order = 85,
				childGroups = "tab",
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\gradient',
				args = {
					class = {
						order = 1,
						type = 'group',
						name = L["Custom Class Colors"],
						args = {
							headernp = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enablecustomcolornp = {
								order = 2,
								type = 'toggle',
								name = L["Nameplate Custom Color"],
								desc = L["Enable Custom Colors for Nameplates"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor = value ElvUI_EltreumUI:GradientColorTableUpdate() end,
							},
							headeruf = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enablecustomcoloruf = {
								order = 4,
								type = 'toggle',
								name = L["Unitframe Custom Color"],
								desc = L["Enable Custom Colors for Unitframes"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.customcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.customcolor = value ElvUI_EltreumUI:GradientColorTableUpdate() end,
							},
							header2 = {
								order = 64,
								type = "description",
								name = L["Death Knight"],
								width = 'full',
								hidden = function() if E.Retail or E.Wrath then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientdeathknight1 = {
								order = 65,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								hidden = function() if E.Retail or E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientdeathknight2 = {
								order = 66,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								hidden = function() if E.Retail or E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.deathknightcustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header3 = {
								order = 67,
								type = "description",
								name = L["Demon Hunter"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientdemonhunter1 = {
								order = 68,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientdemonhunter2 = {
								order = 69,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.demonhuntercustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header4 = {
								order = 70,
								type = "description",
								name = L["Druid"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientdruid1 = {
								order = 71,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.druidcustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.druidcustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.druidcustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientdruid2 = {
								order = 72,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.druidcustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.druidcustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.druidcustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.druidcustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header5 = {
								order = 73,
								type = "description",
								name = L["Hunter"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradienthunter1 = {
								order = 74,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.huntercustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.huntercustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.huntercustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradienthunter2 = {
								order = 75,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.huntercustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.huntercustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.huntercustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.huntercustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header6 = {
								order = 76,
								type = "description",
								name = L["Mage"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientmage1 = {
								order = 77,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.magecustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.magecustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.magecustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientmage2 = {
								order = 78,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.magecustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.magecustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.magecustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.magecustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header7 = {
								order = 79,
								type = "description",
								name = L["Monk"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientmonk1 = {
								order = 80,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.monkcustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.monkcustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.monkcustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientmonk2 = {
								order = 81,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.monkcustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.monkcustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.monkcustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.monkcustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header8 = {
								order = 82,
								type = "description",
								name = L["Paladin"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientpaladin1 = {
								order = 83,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.paladincustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.paladincustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.paladincustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientpaladin2 = {
								order = 84,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.paladincustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.paladincustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.paladincustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.paladincustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header9 = {
								order = 85,
								type = "description",
								name = L["Priest"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientpriest1 = {
								order = 86,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.priestcustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.priestcustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.priestcustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientpriest2 = {
								order = 87,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.priestcustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.priestcustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.priestcustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.priestcustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header10 = {
								order = 88,
								type = "description",
								name = L["Rogue"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientrogue1 = {
								order = 89,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.roguecustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.roguecustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.roguecustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientrogue2 = {
								order = 90,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.roguecustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.roguecustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.roguecustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.roguecustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header11 = {
								order = 91,
								type = "description",
								name = L["Shaman"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientshaman1 = {
								order = 92,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.shamancustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.shamancustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.shamancustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientshaman2 = {
								order = 93,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.shamancustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.shamancustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.shamancustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.shamancustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header12 = {
								order = 94,
								type = "description",
								name = L["Warlock"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientwarlock1 = {
								order = 95,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.warlockcustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.warlockcustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.warlockcustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientwarlock2 = {
								order = 96,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.warlockcustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.warlockcustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.warlockcustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.warlockcustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header13 = {
								order = 97,
								type = "description",
								name = L["Warrior"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientwarrior1 = {
								order = 98,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.warriorcustomcolorR1
									local dg = P.ElvUI_EltreumUI.gradientmode.warriorcustomcolorG1
									local db = P.ElvUI_EltreumUI.gradientmode.warriorcustomcolorB1
									return E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorR1, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorG1, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							gradientwarrior2 = {
								order = 99,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.warriorcustomcolorR2
									local dg = P.ElvUI_EltreumUI.gradientmode.warriorcustomcolorG2
									local db = P.ElvUI_EltreumUI.gradientmode.warriorcustomcolorB2
									return E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorR2, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorG2, E.db.ElvUI_EltreumUI.gradientmode.warriorcustomcolorB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header14 = {
								order = 100,
								type = "description",
								name = L["Friendly NPC"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							friendlynpc1 = {
								order = 101,
								type = 'color',
								name = L["Color 1"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npcfriendlyR1
									local dg = P.ElvUI_EltreumUI.gradientmode.npcfriendlyG1
									local db = P.ElvUI_EltreumUI.gradientmode.npcfriendlyB1
									return E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyR1, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyG1, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyR1, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyG1, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							friendlynpc2 = {
								order = 102,
								type = 'color',
								name = L["Color 2"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npcfriendlyR2
									local dg = P.ElvUI_EltreumUI.gradientmode.npcfriendlyG2
									local db = P.ElvUI_EltreumUI.gradientmode.npcfriendlyB2
									return E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyR2, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyG2, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyR2, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyG2, E.db.ElvUI_EltreumUI.gradientmode.npcfriendlyB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header15 = {
								order = 103,
								type = "description",
								name = L["Neutral NPC"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							neutralnpc1 = {
								order = 104,
								type = 'color',
								name = L["Color 1"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npcneutralR1
									local dg = P.ElvUI_EltreumUI.gradientmode.npcneutralG1
									local db = P.ElvUI_EltreumUI.gradientmode.npcneutralB1
									return E.db.ElvUI_EltreumUI.gradientmode.npcneutralR1, E.db.ElvUI_EltreumUI.gradientmode.npcneutralG1, E.db.ElvUI_EltreumUI.gradientmode.npcneutralB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npcneutralR1, E.db.ElvUI_EltreumUI.gradientmode.npcneutralG1, E.db.ElvUI_EltreumUI.gradientmode.npcneutralB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							neutralnpc2 = {
								order = 105,
								type = 'color',
								name = L["Color 2"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npcneutralR2
									local dg = P.ElvUI_EltreumUI.gradientmode.npcneutralG2
									local db = P.ElvUI_EltreumUI.gradientmode.npcneutralB2
									return E.db.ElvUI_EltreumUI.gradientmode.npcneutralR2, E.db.ElvUI_EltreumUI.gradientmode.npcneutralG2, E.db.ElvUI_EltreumUI.gradientmode.npcneutralB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npcneutralR2, E.db.ElvUI_EltreumUI.gradientmode.npcneutralG2, E.db.ElvUI_EltreumUI.gradientmode.npcneutralB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header16 = {
								order = 105,
								type = "description",
								name = L["Unfriendly NPC"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							unfriendlynpc1 = {
								order = 106,
								type = 'color',
								name = L["Color 1"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npcunfriendlyR1
									local dg = P.ElvUI_EltreumUI.gradientmode.npcunfriendlyG1
									local db = P.ElvUI_EltreumUI.gradientmode.npcunfriendlyB1
									return E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyR1, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyG1, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyR1, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyG1, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							unfriendlynpc2 = {
								order = 107,
								type = 'color',
								name = L["Color 2"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npcunfriendlyR2
									local dg = P.ElvUI_EltreumUI.gradientmode.npcunfriendlyG2
									local db = P.ElvUI_EltreumUI.gradientmode.npcunfriendlyB2
									return E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyR2, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyG2, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyR2, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyG2, E.db.ElvUI_EltreumUI.gradientmode.npcunfriendlyB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header17 = {
								order = 108,
								type = "description",
								name = L["Hostile NPC"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							hostilenpc1 = {
								order = 109,
								type = 'color',
								name = L["Color 1"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npchostileR1
									local dg = P.ElvUI_EltreumUI.gradientmode.npchostileG1
									local db = P.ElvUI_EltreumUI.gradientmode.npchostileB1
									return E.db.ElvUI_EltreumUI.gradientmode.npchostileR1, E.db.ElvUI_EltreumUI.gradientmode.npchostileG1, E.db.ElvUI_EltreumUI.gradientmode.npchostileB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npchostileR1, E.db.ElvUI_EltreumUI.gradientmode.npchostileG1, E.db.ElvUI_EltreumUI.gradientmode.npchostileB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							hostilenpc2 = {
								order = 110,
								type = 'color',
								name = L["Color 2"],
								desc = L["NPCs use Target Castbar colors not NPC colors for their castbars"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.npchostileR2
									local dg = P.ElvUI_EltreumUI.gradientmode.npchostileG2
									local db = P.ElvUI_EltreumUI.gradientmode.npchostileB2
									return E.db.ElvUI_EltreumUI.gradientmode.npchostileR2, E.db.ElvUI_EltreumUI.gradientmode.npchostileG2, E.db.ElvUI_EltreumUI.gradientmode.npchostileB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.npchostileR2, E.db.ElvUI_EltreumUI.gradientmode.npchostileG2, E.db.ElvUI_EltreumUI.gradientmode.npchostileB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							header17tapped = {
								order = 111,
								type = "description",
								name = L["Tapped NPC"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							tappednpc1 = {
								order = 112,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.tappedR1
									local dg = P.ElvUI_EltreumUI.gradientmode.tappedG1
									local db = P.ElvUI_EltreumUI.gradientmode.tappedB1
									return E.db.ElvUI_EltreumUI.gradientmode.tappedR1, E.db.ElvUI_EltreumUI.gradientmode.tappedG1, E.db.ElvUI_EltreumUI.gradientmode.tappedB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.tappedR1, E.db.ElvUI_EltreumUI.gradientmode.tappedG1, E.db.ElvUI_EltreumUI.gradientmode.tappedB1 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},
							tappednpc2 = {
								order = 113,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.tappedR2
									local dg = P.ElvUI_EltreumUI.gradientmode.tappedG2
									local db = P.ElvUI_EltreumUI.gradientmode.tappedB2
									return E.db.ElvUI_EltreumUI.gradientmode.tappedR2, E.db.ElvUI_EltreumUI.gradientmode.tappedG2, E.db.ElvUI_EltreumUI.gradientmode.tappedB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.tappedR2, E.db.ElvUI_EltreumUI.gradientmode.tappedG2, E.db.ElvUI_EltreumUI.gradientmode.tappedB2 = r, g, b
									ElvUI_EltreumUI:GradientColorTableUpdate()
								end,
							},

						},
					},
					unitframe = {
						order = 1,
						type = 'group',
						name = L["Unitframe Colors"],
						args = {
							headercastbar = {
								order = 4,
								type = "description",
								name = L["Player Castbar"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientcast1 = {
								order = 5,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar or not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbar end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.playercastbarR1
									local dg = P.ElvUI_EltreumUI.gradientmode.playercastbarG1
									local db = P.ElvUI_EltreumUI.gradientmode.playercastbarB1
									return E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1 = r, g, b
								end,
							},
							gradientcast2 = {
								order = 6,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar or not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbar end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.playercastbarR2
									local dg = P.ElvUI_EltreumUI.gradientmode.playercastbarG2
									local db = P.ElvUI_EltreumUI.gradientmode.playercastbarB2
									return E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2 = r, g, b
								end,
							},
							checkelvuiclasscolorcastbar = {
								order = 7,
								type = 'toggle',
								name = L["Class Colors"],
								desc = L["Use Class Colors instead of Custom Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbar end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar = value end,
							},
							headercastbarcantinterruptplayer = {
								order = 7,
								type = "description",
								name = L["Player Castbar (Non Interruptible)"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientcast1cantinterruptplayer = {
								order = 8,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarnoninterruptible end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptible
									local dg = P.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptible
									local db = P.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptible
									return E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptiblecustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptiblecustom = r, g, b
								end,
							},
							gradientcast2cantinterruptplayer = {
								order = 9,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarnoninterruptible end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptible
									local dg = P.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptible
									local db = P.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptible
									return E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptiblecustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptiblecustom = r, g, b
								end,
							},
							headercastbarinterruptedplayer = {
								order = 10,
								type = "description",
								name = L["Player Castbar (Interrupted)"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientcast1interruptedplayer = {
								order = 11,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarinterrupted end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.playercastbarR1interrupted
									local dg = P.ElvUI_EltreumUI.gradientmode.playercastbarG1interrupted
									local db = P.ElvUI_EltreumUI.gradientmode.playercastbarB1interrupted
									return E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1interruptedcustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1interruptedcustom = r, g, b
								end,
							},
							gradientcast2interruptedplayer = {
								order = 12,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarinterrupted end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.playercastbarR2interrupted
									local dg = P.ElvUI_EltreumUI.gradientmode.playercastbarG2interrupted
									local db = P.ElvUI_EltreumUI.gradientmode.playercastbarB2interrupted
									return E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2interruptedcustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2interruptedcustom = r, g, b
								end,
							},
							headercastbartarget = {
								order = 13,
								type = "description",
								name = L["Target Castbar"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientcast1target = {
								order = 14,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbar end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.targetcastbarR1
									local dg = P.ElvUI_EltreumUI.gradientmode.targetcastbarG1
									local db = P.ElvUI_EltreumUI.gradientmode.targetcastbarB1
									return E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom = r, g, b
								end,
							},
							gradientcast2target = {
								order = 15,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbar end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.targetcastbarR2
									local dg = P.ElvUI_EltreumUI.gradientmode.targetcastbarG2
									local db = P.ElvUI_EltreumUI.gradientmode.targetcastbarB2
									return E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom = r, g, b
								end,
							},
							checkelvuiclasscolorcastbartarget = {
								order = 16,
								type = 'toggle',
								name = L["Class Colors"],
								desc = L["Use Class Colors instead of Custom Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbar end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar = value end,
							},
							headercastbarnoninterruptibletargetcustom = {
								order = 16,
								type = "description",
								name = L["Target Castbar (Non Interruptible)"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientcast1noninterruptibletargetcustom = {
								order = 17,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarnoninterruptible end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptible
									local dg = P.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptible
									local db = P.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptible
									return E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptiblecustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptiblecustom = r, g, b
								end,
							},
							gradientcast2noninterruptibletargetcustom = {
								order = 18,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarnoninterruptible end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptible
									local dg = P.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptible
									local db = P.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptible
									return E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptiblecustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptiblecustom = r, g, b
								end,
							},
							headercastbarinterruptedtarget = {
								order = 19,
								type = "description",
								name = L["Target Castbar (Interrupted)"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientcast1interruptedtarget = {
								order = 20,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarinterrupted end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.targetcastbarR1interrupted
									local dg = P.ElvUI_EltreumUI.gradientmode.targetcastbarG1interrupted
									local db = P.ElvUI_EltreumUI.gradientmode.targetcastbarB1interrupted
									return E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1interruptedcustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1interruptedcustom = r, g, b
								end,
							},
							gradientcast2interruptedtarget = {
								order = 21,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.gradientmode.customcolor or not E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarinterrupted end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.targetcastbarR2interrupted
									local dg = P.ElvUI_EltreumUI.gradientmode.targetcastbarG2interrupted
									local db = P.ElvUI_EltreumUI.gradientmode.targetcastbarB2interrupted
									return E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2interruptedcustom, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2interruptedcustom = r, g, b
								end,
							},
						},
					},
					nameplate = {
						order = 1,
						type = 'group',
						name = E.NewSign..L["Nameplate Colors"],
						args = {
							headergoodthreat = {
								order = 10,
								type = "description",
								name = L["Good Threat"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							goodthreat1 = {
								order = 11,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.goodthreatR1
									local dg = P.ElvUI_EltreumUI.gradientmode.goodthreatG1
									local db = P.ElvUI_EltreumUI.gradientmode.goodthreatB1
									return E.db.ElvUI_EltreumUI.gradientmode.goodthreatR1, E.db.ElvUI_EltreumUI.gradientmode.goodthreatG1, E.db.ElvUI_EltreumUI.gradientmode.goodthreatB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.goodthreatR1, E.db.ElvUI_EltreumUI.gradientmode.goodthreatG1, E.db.ElvUI_EltreumUI.gradientmode.goodthreatB1 = r, g, b
								end,
							},
							goodthreat2 = {
								order = 12,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.goodthreatR2
									local dg = P.ElvUI_EltreumUI.gradientmode.goodthreatG2
									local db = P.ElvUI_EltreumUI.gradientmode.goodthreatB2
									return E.db.ElvUI_EltreumUI.gradientmode.goodthreatR2, E.db.ElvUI_EltreumUI.gradientmode.goodthreatG2, E.db.ElvUI_EltreumUI.gradientmode.goodthreatB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.goodthreatR2, E.db.ElvUI_EltreumUI.gradientmode.goodthreatG2, E.db.ElvUI_EltreumUI.gradientmode.goodthreatB2 = r, g, b
								end,
							},
							headerbadthreat = {
								order = 13,
								type = "description",
								name = L["Bad Threat"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							badthreat1 = {
								order = 14,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.badthreatR1
									local dg = P.ElvUI_EltreumUI.gradientmode.badthreatG1
									local db = P.ElvUI_EltreumUI.gradientmode.badthreatB1
									return E.db.ElvUI_EltreumUI.gradientmode.badthreatR1, E.db.ElvUI_EltreumUI.gradientmode.badthreatG1, E.db.ElvUI_EltreumUI.gradientmode.badthreatB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.badthreatR1, E.db.ElvUI_EltreumUI.gradientmode.badthreatG1, E.db.ElvUI_EltreumUI.gradientmode.badthreatB1 = r, g, b
								end,
							},
							badthreat2 = {
								order = 15,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.badthreatR2
									local dg = P.ElvUI_EltreumUI.gradientmode.badthreatG2
									local db = P.ElvUI_EltreumUI.gradientmode.badthreatB2
									return E.db.ElvUI_EltreumUI.gradientmode.badthreatR2, E.db.ElvUI_EltreumUI.gradientmode.badthreatG2, E.db.ElvUI_EltreumUI.gradientmode.badthreatB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.badthreatR2, E.db.ElvUI_EltreumUI.gradientmode.badthreatG2, E.db.ElvUI_EltreumUI.gradientmode.badthreatB2 = r, g, b
								end,
							},
							headergoodthreattransition = {
								order = 16,
								type = "description",
								name = L["Good Threat Transition"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							goodthreattransition1 = {
								order = 17,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionR1
									local dg = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionG1
									local db = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionB1
									return E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionR1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionG1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionR1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionG1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionB1 = r, g, b
								end,
							},
							goodthreattransition2 = {
								order = 18,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionR2
									local dg = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionG2
									local db = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionB2
									return E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionR2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionG2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionR2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionG2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionB2 = r, g, b
								end,
							},
							headerbadthreattransition = {
								order = 19,
								type = "description",
								name = L["Bad Threat Transition"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							badthreattransition1 = {
								order = 20,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.badthreattransitionR1
									local dg = P.ElvUI_EltreumUI.gradientmode.badthreattransitionG1
									local db = P.ElvUI_EltreumUI.gradientmode.badthreattransitionB1
									return E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionR1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionG1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionR1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionG1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionB1 = r, g, b
								end,
							},
							badthreattransition2 = {
								order = 21,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.badthreattransitionR2
									local dg = P.ElvUI_EltreumUI.gradientmode.badthreattransitionG2
									local db = P.ElvUI_EltreumUI.gradientmode.badthreattransitionB2
									return E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionR2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionG2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionR2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionG2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionB2 = r, g, b
								end,
							},
							headerofftank = {
								order = 22,
								type = "description",
								name = L["Off Tank"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							offtank1 = {
								order = 23,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.offtankR1
									local dg = P.ElvUI_EltreumUI.gradientmode.offtankG1
									local db = P.ElvUI_EltreumUI.gradientmode.offtankB1
									return E.db.ElvUI_EltreumUI.gradientmode.offtankR1, E.db.ElvUI_EltreumUI.gradientmode.offtankG1, E.db.ElvUI_EltreumUI.gradientmode.offtankB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.offtankR1, E.db.ElvUI_EltreumUI.gradientmode.offtankG1, E.db.ElvUI_EltreumUI.gradientmode.offtankB1 = r, g, b
								end,
							},
							offtank2 = {
								order = 24,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.offtankR2
									local dg = P.ElvUI_EltreumUI.gradientmode.offtankG2
									local db = P.ElvUI_EltreumUI.gradientmode.offtankB2
									return E.db.ElvUI_EltreumUI.gradientmode.offtankR2, E.db.ElvUI_EltreumUI.gradientmode.offtankG2, E.db.ElvUI_EltreumUI.gradientmode.offtankB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.offtankR2, E.db.ElvUI_EltreumUI.gradientmode.offtankG2, E.db.ElvUI_EltreumUI.gradientmode.offtankB2 = r, g, b
								end,
							},
							headerbadthreattransitionofftank = {
								order = 25,
								type = "description",
								name = L["Off Tank Bad Threat Transition"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							badthreattransition1offtank = {
								order = 26,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankR1
									local dg = P.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankG1
									local db = P.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankB1
									return E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankR1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankG1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankR1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankG1, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankB1 = r, g, b
								end,
							},
							badthreattransition2offtank = {
								order = 27,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankR2
									local dg = P.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankG2
									local db = P.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankB2
									return E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankR2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankG2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankR2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankG2, E.db.ElvUI_EltreumUI.gradientmode.badthreattransitionofftankB2 = r, g, b
								end,
							},
							headergoodthreattransitionofftank = {
								order = 28,
								type = "description",
								name = L["Offtank Good Threat Transition"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							goodthreattransition1offtank = {
								order = 29,
								type = 'color',
								name = L["Color 1"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankR1
									local dg = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankG1
									local db = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankB1
									return E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankR1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankG1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankB1, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankR1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankG1, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankB1 = r, g, b
								end,
							},
							goodthreattransition2offtank = {
								order = 30,
								type = 'color',
								name = L["Color 2"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable or not E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								get = function()
									local dr = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankR2
									local dg = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankG2
									local db = P.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankB2
									return E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankR2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankG2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankB2, 1, dr, dg, db, 1
								end,
								set = function(_, r, g, b, a)
									E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankR2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankG2, E.db.ElvUI_EltreumUI.gradientmode.goodthreattransitionofftankB2 = r, g, b
								end,
							},
						},
					},
				},
			},
			loottext = {
				type = 'group',
				name = L["Loot"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\loot',
				order = 85,
				args = {
					header1 = {
						order = 1,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					lootsetting = {
						order = 2,
						type = 'group',
						inline = true,
						name = L["Show a floating loot text"],
						args = {
							desc = {
								type = 'toggle',
								name = L["Enable"],
								desc = L["Toggle On and Off"],
								order = 1,
								get = function() return E.db.ElvUI_EltreumUI.loottext.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.loottext.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							addagaphere = {
								order = 2,
								type = "description",
								name = "",
							},
							addanothergapforfun = {
								order = 2,
								type = "description",
								name = "",
							},
							suboptions = {
								order = 2,
								type = 'group',
								name = L["Choose which types of text:"],
									args = {
										yetanothergap = {
										order = 2,
										type = "description",
										name = "",
										},
										honor = {
											type = 'toggle',
											name = HONOR,
											order = 5,
											disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
											get = function() return E.db.ElvUI_EltreumUI.loottext.honor end,
											set = function(_, value) E.db.ElvUI_EltreumUI.loottext.honor = value end,
										},
										currency = {
											type = 'toggle',
											name = CURRENCY,
											order = 5,
											disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
											get = function() return E.db.ElvUI_EltreumUI.loottext.currency end,
											set = function(_, value) E.db.ElvUI_EltreumUI.loottext.currency = value end,
										},
										pet = {
											type = 'toggle',
											name = L["Pets"],
											order = 5,
											disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
											get = function() return E.db.ElvUI_EltreumUI.loottext.pet end,
											set = function(_, value) E.db.ElvUI_EltreumUI.loottext.pet = value end,
										},
									}
							},
							header1 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							lootscale = {
								type = 'range',
								name = L["Change the scale of LootText"],
								desc = L["Set the size of LootText"],
								order = 4,
								min = .1,
								max = 1.5,
								step = .05,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
								get = function() return E.db.ElvUI_EltreumUI.loottext.scale end,
								set = function(_, value) E.db.ElvUI_EltreumUI.loottext.scale = value end,
							},
							addgaptobenice = {
								order = 5,
								type = "description",
								name = "",
							},
							lootscalereset = {
								type = 'execute',
								name = L["Reset Scale"],
								desc = L["Return LootText to its default scale"],
								order = 9,
								disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
								func = function() E.db.ElvUI_EltreumUI.loottext.scale = 0.65 end,
							},
							header2 = {
								order = 10,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							lootstrata = {
								type = 'select',
								name = L["Change the strata of the Loot Text"],
								desc = L["Set the level that LootText will be drawn to this"],
								order = 11,
								values = {
									["BACKGROUND"] = L["Background"],
									["LOW"] = L["Low"],
									["MEDIUM"] = L["Medium"],
									["HIGH"] = L["High"],
									["DIALOG"] = L["Dialog"],
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
								get = function() return E.db.ElvUI_EltreumUI.loottext.strata end,
								set = function(_, value) E.db.ElvUI_EltreumUI.loottext.strata = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header99 = {
								order = 12,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							lootscalex = {
								type = 'range',
								name = L["Change the Horizontal Position of LootText (Default = 0)"],
								desc = L["Set X offset"],
								order = 13,
								min = -1000,
								max = 1000,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
								get = function() return E.db.ElvUI_EltreumUI.loottext.xOffset end,
								set = function(_, value) E.db.ElvUI_EltreumUI.loottext.xOffset = value end,
								--confirm = true,
							},
							lootscaley = {
								type = 'range',
								name = L["Change the Vertical Position of LootText (Default = 200)"],
								desc = L["Set Y offset"],
								order = 14,
								min = -1000,
								max = 1000,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.loottext.enable end,
								get = function() return E.db.ElvUI_EltreumUI.loottext.yOffset end,
								set = function(_, value) E.db.ElvUI_EltreumUI.loottext.yOffset = value end,
								--confirm = true,
							},
							header98 = {
								order = 15,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							customfontlootgap = {
								type = 'description',
								name = '',
								width = 'full',
								order = 16,
							},
							customfontlootdesc = {
								type = 'description',
								name = L["Change the font of LootText to be that the ElvUI Default Font found in General"],
								width = 'full',
								order = 17,
							},
							customfontloot = {
								type = 'toggle',
								name = L["Use ElvUI General Font"],
								desc = L["Change the font of LootText"],
								order = 18,
								get = function() return E.db.ElvUI_EltreumUI.loottext.fontsetting end,
								set = function(_, value) E.db.ElvUI_EltreumUI.loottext.fontsetting = value E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					header13 = {
						order = 38,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					fastlootenable = {
						order = 39,
						name = L["Enable Fast Loot"],
						type = "toggle",
						desc = L["Decrease the time it takes for auto loot to work, works with TSM"],
						width = 'full',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.fastlootfilter or E.db.ElvUI_EltreumUI.otherstuff.lootwishlistfilter end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.fastloot end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.fastloot = value SetCVar('autoLootDefault', 1) E:StaticPopup_Show('CONFIG_RL') end,
					},
					fastlootenablefilter = {
						order = 40,
						name = L["Enable Fast Loot with Loot Quality Filter"],
						type = "toggle",
						desc = L["Enable filtering item quality, items can still be looted by holding Shift or the mod key setup in Interface"],
						width = 'full',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.fastloot or E.db.ElvUI_EltreumUI.otherstuff.lootwishlistfilter end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.fastlootfilter end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.fastlootfilter = value SetCVar('autoLootDefault', 0) E:StaticPopup_Show('CONFIG_RL') end,
					},
					lootwishlistfilter = {
						order = 41,
						name = L["Enable Fast Loot with Wishlist Filter"],
						type = "toggle",
						desc = L["Items not on the wishlist will not be looted, items can still be looted by holding Shift or the mod key setup in Interface"],
						width = 'full',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.fastloot or E.db.ElvUI_EltreumUI.otherstuff.fastlootfilter or #E.private.ElvUI_EltreumUI.wishlistID == 0 end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.lootwishlistfilter end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.lootwishlistfilter = value SetCVar('autoLootDefault', 0) E:StaticPopup_Show('CONFIG_RL') end,
					},
					lootwishlistwarning = {
						order = 42,
						name = L["Enable Wishlist Loot Warning"],
						type = "toggle",
						desc = L["Show a toast if an item in the wishlist is looted"],
						width = 'full',
						disabled = function() return #E.private.ElvUI_EltreumUI.wishlistID == 0 end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.lootwishlistwarning end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.lootwishlistwarning = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					lootautoclose = {
						order = 43,
						name = L["Enable Automatically Closing Loot Window"],
						type = "toggle",
						desc = L["Loot Window will automatically close when using filters and the item desired is not found"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.lootautoclose end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.lootautoclose = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					lootscreenshot = {
						order = 43,
						name = L["Enable Screenshotting if an item from the wishlist is looted"],
						type = "toggle",
						desc = L["Automatically screenshot when you loot an item from the wishlist"],
						width = 'full',
						disabled = function() return #E.private.ElvUI_EltreumUI.wishlistID == 0 end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.lootwishlistscreenshot end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.lootwishlistscreenshot = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					fastlootenablefilterquality = {
						order = 43,
						type = 'select',
						name = L["Minimum Loot Quality Filter"],
						desc = L["Only items of this quality or better will be looted when using Fast Loot Filter"],
						values = {
							["0"] = L["Poor"],
							["1"] = L["Common"],
							["2"] = L["Uncommon"],
							["3"] = L["Rare"],
							["4"] = L["Epic"],
						},
						style = 'radio',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.fastloot or not E.db.ElvUI_EltreumUI.otherstuff.fastlootfilter or E.db.ElvUI_EltreumUI.otherstuff.lootwishlistfilter end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.fastlootquality end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.fastlootquality = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					lootwishlist = {
						order = 44,
						type = 'input',
						name = L["Item Wishlist (type the Item ID)"],
						desc = L["Items in your wishlist will display a warning when looted"],
						width = 'double',
						get = function() return E.private.ElvUI_EltreumUI.wishlistID end,
						validate = function(_, value)
							E.PopupDialogs["ELTRUISMINVALID"] = {
								text = L["Invalid Item, you need to add an itemID which can be found in the tooltip or in Wowhead"],
								button1 = OKAY,
								timeout = 0,
								whileDead = 1,
								hideOnEscape = true,
							}
							if tonumber(value) ~= nil then
								value = tonumber(value)
								local item = Item:CreateFromItemID(value)
								if item == nil then
									return E:StaticPopup_Show('ELTRUISMINVALID') and false
								elseif item:IsItemEmpty() then
									return E:StaticPopup_Show('ELTRUISMINVALID') and false
								else
									return true
								end
							else
								return E:StaticPopup_Show('ELTRUISMINVALID') and false
							end
						end,
						set = function(_, value)
							value = tonumber(value)
							local item = Item:CreateFromItemID(value)
							if not item:IsItemEmpty() then
								item:ContinueOnItemLoad(function()
									local itemName = item:GetItemName()
									local itemID = tonumber(value)
									tinsert(E.private.ElvUI_EltreumUI.wishlistName, itemName)
									tinsert(E.private.ElvUI_EltreumUI.wishlistID, itemID)
								end)
							end
						end,
					},
					lootwishlistremove = {
						order = 45,
						type = 'select',
						width = "double",
						name = L["Remove item from Wishlist"],
						desc = L["Remove"],
						values = E.private.ElvUI_EltreumUI.wishlistName,
						get = function() return E.private.ElvUI_EltreumUI.wishlistName end,
						set = function(_,value)
							local item = tonumber(value)
							tremove(E.private.ElvUI_EltreumUI.wishlistID, item)
							tremove(E.private.ElvUI_EltreumUI.wishlistName, item)
						 end,
					},
				},
			},
			maps = {
				type = 'group',
				name = L["Maps"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\map',
				order = 85,
				args = {
					header1 = {
						order = 1,
						type = "description",
						name = "",
						width = 'full',
						hidden = function() if E.Retail then return false else return true end end,
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					waypointetasetting = {
						order = 2,
						type = 'group',
						inline = true,
						hidden = function() if E.Retail then return false else return true end end,
						name = L["Add a time to arrive below the waypoint"],
						args = {
							explainer = {
								order = 1,
								type = "description",
								name = L["The time will be calculated based on player speed and distance"],
							},
							explainer2 = {
								order = 2,
								type = "description",
								name = L["If the player is not moving then *** will show up since time cannot be calculated"],
							},
							explainer3 = {
								order = 3,
								type = "description",
								name = L["If you move away from the waypoint the time will just increase"],
							},
							explainer4 = {
								order = 4,
								type = "description",
								name = '',
							},
							enable = {
								order = 5,
								type = 'toggle',
								name = L["Enable ETA"],
								desc = L["Add an ETA to waypoints"],
								get = function() return E.db.ElvUI_EltreumUI.waypointetasetting.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.waypointetasetting.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enableautopin = {
								order = 7,
								type = 'toggle',
								name = L["Enable Autopin"],
								desc = L["Automatically pin the Waypoint"],
								get = function() return E.db.ElvUI_EltreumUI.waypointetasetting.autopin end,
								set = function(_, value) E.db.ElvUI_EltreumUI.waypointetasetting.autopin = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enablelimit = {
								order = 9,
								type = 'toggle',
								name = E.NewSign..L["Limit Max Distance"],
								hidden = function() if E.Retail then return false else return true end end,
								get = function() return E.db.ElvUI_EltreumUI.waypointetasetting.limitmaxdistance or not E.db.ElvUI_EltreumUI.waypointetasetting.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.waypointetasetting.limitmaxdistance = value end,
							},
							etacolor = {
								order = 10,
								type = 'color',
								name = E.NewSign..L["Text Color"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.waypointetasetting.enable end,
								get = function() return E.db.ElvUI_EltreumUI.waypointetasetting.textcolorR, E.db.ElvUI_EltreumUI.waypointetasetting.textcolorG, E.db.ElvUI_EltreumUI.waypointetasetting.textcolorB, 1, P.ElvUI_EltreumUI.waypointetasetting.textcolorR, P.ElvUI_EltreumUI.waypointetasetting.textcolorG, P.ElvUI_EltreumUI.waypointetasetting.textcolorB, 1 end,
								set = function(_, r, g, b, a) E.db.ElvUI_EltreumUI.waypointetasetting.textcolorR, E.db.ElvUI_EltreumUI.waypointetasetting.textcolorG, E.db.ElvUI_EltreumUI.waypointetasetting.textcolorB = r, g, b E:StaticPopup_Show('CONFIG_RL') end,
							},
							enablelimitd = {
								type = 'range',
								name = E.NewSign..L["Max Distance"],
								order = 11,
								min = 200,
								max = 10000,
								step = 10,
								width = "full",
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.waypointetasetting.limitmaxdistance or not E.db.ElvUI_EltreumUI.waypointetasetting.enable end,
								get = function() return E.db.ElvUI_EltreumUI.waypointetasetting.distance end,
								set = function(_, value) E.db.ElvUI_EltreumUI.waypointetasetting.distance = value end,
							},
						},
					},
					header2 = {
						order = 3,
						type = "description",
						name = "",
						width = 'full',
						hidden = function() if E.Retail then return false else return true end end,
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					waytext = {
						order = 4,
						type = 'group',
						inline = true,
						hidden = function() if E.Retail then return false else return true end end,
						name = L["Enable the /way and /waypoint commands"],
						args = {
							explainer = {
								order = 1,
								type = "description",
								name = L["You can type /way or /waypoint"],
							},
							explainer2 = {
								order = 2,
								type = "description",
								name = L["Use formats such as:"],
							},
							explainer3 = {
								order = 3,
								type = "description",
								name = L["XX YY, XX.XX YY.YY, XX,XX YY,YY and XXX YYY"],
							},
							explainer4 = {
								order = 4,
								type = "description",
								name = L["Other Formats can end up causing errors"],
							},
							enable = {
								order = 5,
								type = 'toggle',
								name = L["Enable"],
								desc = L["Enable the /way and /waypoint commands"],
								get = function() return E.db.ElvUI_EltreumUI.waytext.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.waytext.enable = value end,
							},
						},
					},
					header3 = {
						order = 5,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					mapcombathide = {
						order = 6,
						type = 'group',
						inline = true,
						name = L["Minimap"],
						args = {
							explainer4 = {
								order = 4,
								type = "description",
								name = L["Hide Minimap while in Combat"],
							},
							enable = {
								order = 5,
								type = 'toggle',
								name = L["Enable"],
								desc = L["Automatically hide the Minimap in combat"],
								get = function() return E.db.ElvUI_EltreumUI.otherstuff.mapcombathide end,
								set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.mapcombathide = value E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
				},
			},
			media = {
				type = 'group',
				name = L["Media"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\media',
				childGroups = "tab",
				order = 85,
				args = {
					general = {
						type = 'group',
						name = L["Setup Media"],
						order = 1,
						args = {
							header7 = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							private = {
								order = 2,
								type = 'execute',
								name = L["Reset all Media"],
								desc = L["Reset Fonts, Textures, Skins to Eltreum UI defaults."],
								width = 'full',
								func = function() ElvUI_EltreumUI:SetupPrivate() E:StaggeredUpdateAll(nil, true) E:StaticPopup_Show('CONFIG_RL') end,
								confirm = true,
							},
							header1 = {
								order = 3,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							fontdescription= {
								order = 3,
								type = "description",
								name = L["Set the fonts used in Eltruism. Kimberley is the default font"],
							},
							kimberley = {
								order = 4,
								type = 'execute',
								name = 'Kimberley',
								desc = L["This will set all ElvUI fonts as Kimberley"],
								func = function() ElvUI_EltreumUI:SetupFontsKimberley() E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
							exo2 = {
								order = 5,
								type = 'execute',
								name = 'Exo2',
								desc = L["This will set all ElvUI fonts as Exo2"],
								func = function() ElvUI_EltreumUI:SetupFontsExo2() E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
							addagaphereforfonts = {
								order = 6,
								type = "description",
								name = "",
								--width = "full",
							},
							gotham = {
								order = 7,
								type = 'execute',
								name = 'Gotham',
								desc = L["This will set all ElvUI fonts as Gotham"],
								func = function() ElvUI_EltreumUI:SetupFontsGotham() E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
							roboto = {
								order = 7,
								type = 'execute',
								name = 'Roboto',
								desc = L["This will set all ElvUI fonts as Roboto"],
								func = function() ElvUI_EltreumUI:SetupFontsRoboto() E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
							sharedmediafont = {
								 order = 8,
								 type = 'select',
								 width = "double",
								 dialogControl = 'LSM30_Font',
								 name = L["Or choose a custom font"],
								 desc = L["Choose a different font from the preselected ones"],
								 values = AceGUIWidgetLSMlists.font,
								 get = function()
									return E.db.ElvUI_EltreumUI.fonts.playerfont
								 end,
								 set = function(self,fontvalue)
									E.db.ElvUI_EltreumUI.fonts.playerfont = fontvalue
									ElvUI_EltreumUI:SetupCustomFont(fontvalue)
								 end,
							},
							addagaphereforoutlines = {
								order = 9,
								type = "description",
								name = "",
							},
							addagaphereagain = {
								order = 9,
								type = "description",
								name = "",
							},
							header3 = {
								order = 10,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							fontoutline = {
								order = 11,
								type = "description",
								name = L["Set the Font Outlines everywhere. Use Default to return to Eltruism default settings"],
								width = "full",
							},
							default = {
								order = 12,
								type = 'execute',
								name = L["Defaults"],
								desc = L["This will set fonts to Eltruism defaults, recommended for 4K"],
								func = function() ElvUI_EltreumUI:SetupFontsOutlineDefault() E:StaggeredUpdateAll(nil, true) E:StaticPopup_Show('CONFIG_RL') end,
								confirm = true,
							},
							none = {
								order = 12,
								type = 'execute',
								name = L["None"],
								desc = L["This will set fonts to no outline"],
								func = function() ElvUI_EltreumUI:SetupFontsOutlineNone() E:StaggeredUpdateAll(nil, true) E:StaticPopup_Show('CONFIG_RL') end,
								confirm = true,
							},
							outlinegap = {
								order = 13,
								type = "description",
								name = "",
							},
							outline = {
								order = 13,
								type = 'execute',
								name = L["Outline"],
								desc = L["This will set fonts to use outline, recommended for 1440p and 1080p"],
								func = function() ElvUI_EltreumUI:SetupFontsOutlineOutline() E:StaggeredUpdateAll(nil, true) E:StaticPopup_Show('CONFIG_RL') end,
								confirm = true,
							},
							thick = {
								order = 13,
								type = 'execute',
								name = L["Thick Outline"],
								desc = L["This will set fonts to use thick outline"],
								func = function() ElvUI_EltreumUI:SetupFontsOutlineThick() E:StaggeredUpdateAll(nil, true) E:StaticPopup_Show('CONFIG_RL') end,
								confirm = true,
							},
							header448 = {
								order = 94,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							bgmode = {
								order = 95,
								type = "description",
								name = L["Change the ElvUI background"],
								width = "full",
							},
							grey = {
								order = 96,
								type = 'execute',
								name = L["Grey Background"],
								desc = L["This will set the background to be a grey color"],
								func = function() ElvUI_EltreumUI:GreyBg() E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
							black = {
								order = 97,
								type = 'execute',
								name = L["Black Background"],
								desc = L["This will set the background to be a black color"],
								func = function() ElvUI_EltreumUI:BlackBg() E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
							header5 = {
								order = 124,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							dynamicdatatext12123 = {
								order = 125,
								type = "description",
								hidden = function() if E.Retail then return true else return false end end,
								name = L["Dynamic Datatext that changes according to class to show Ammo or Soul Shards when playing Hunter, Warrior, Rogue or Warlock"],
								width = "full",
							},
							dynamicenable = {
								order = 126,
								type = 'toggle',
								name = L["Enable"],
								desc = L["Enable the Dynamic Datatext"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.dynamicdatatext.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.dynamicdatatext.enable = value end,
							},
						},
					},
				},
			},
			misc = {
				type = 'group',
				name = L["Misc"],
				--childGroups = "tab",
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\misc',
				order = 85,
				args = {
					header0 = {
						order = 1,
						type = "description",
						name = L["Show Eltruism Game Menu Button"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					gamemenu = {
						type = 'toggle',
						name = L["Enable"],
						order = 2,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.gamemenu end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.gamemenu = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header1 = {
						order = 3,
						type = "description",
						name = L["Show Buffs in Arena and hide them outside (will overwrite Eltruism default settings)"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					arenabuffs = {
						type = 'toggle',
						name = L["Enable"],
						order = 4,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.arenabuffs end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.arenabuffs = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header2 = {
						order = 5,
						type = "description",
						hidden = function() if E.Classic then return true else return false end end,
						name = function()
							if E.Retail then
								return L["Hide Arena Frames in Arena due to Gladius/GladiusEX or another addon"]
							else
								return L["Hide Arena Frames in Arena due to Gladius/Gladdy or another addon"]
							end
						end,
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					arenaUF = {
						type = 'toggle',
						name = L["Enable"],
						hidden = function() if E.Classic then return true else return false end end,
						order = 6,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.arenaunitframes end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.arenaunitframes = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header3 = {
						order = 7,
						type = "description",
						name = L["Hide Raid Unitframes in battlegrounds due to addons like Battleground Enemies"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					bgUF = {
						type = 'toggle',
						name = L["Enable"],
						order = 8,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.bgunitframes end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.bgunitframes = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header4 = {
						order = 9,
						type = "description",
						name = "",
						width = 'full',
						hidden = function() if E.Retail then return false else return true end end,
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					rogueorderhallautoopen = {
						order = 10,
						type = "description",
						hidden = function() if E.Retail then return false else return true end end,
						name = L["Auto open the Rogue Order Hall, to avoid opening hold CTRL or SHIFT or ALT while talking to the NPC"],
						width = "full",
					},
					rogueenable = {
						order = 11,
						type = 'toggle',
						name = L["Enable"],
						desc = L["Enable the Rogue Order Hall Auto Open"],
						hidden = function() if E.Retail then return false else return true end end,
						get = function() return E.db.ElvUI_EltreumUI.questsettings.rogueopen end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.rogueopen = value end,
					},
					header5 = {
						order = 12,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					xpdatabar = {
						order = 13,
						type = "toggle",
						name = L["Dynamically toggle the mouseover of the Experience Bar"],
						desc = L["Shows XP bar when below max level, makes it mouseover when max level"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.dynamicxpbar end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.dynamicxpbar = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header6 = {
						order = 26,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					combatextindicator = {
						order = 27,
						type = "toggle",
						name = L["Enable Entering/Leaving Combat Indicator Texts"],
						desc = L["Adds a +Combat and -Combat for when entering and leaving combat"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.loottext.combatindicator end,
						set = function(_, value) E.db.ElvUI_EltreumUI.loottext.combatindicator = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header7 = {
						order = 28,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					darksouls = {
						order = 29,
						type = "toggle",
						name = L["Enable a Dark Souls death animation"],
						desc = L["Plays an animation when you die"],
						width = 'full',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeathgta or E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustom end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeath end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.playerdeath = value end,
					},
					gta = {
						order = 29,
						type = "toggle",
						name = L["Enable a GTA death animation"],
						desc = L["Plays an animation when you die"],
						width = 'full',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeath or E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustom end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeathgta end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.playerdeathgta = value end,
					},
					customdeath = {
						order = 30,
						type = "toggle",
						name = L["Enable a Custom death animation"],
						desc = L["Plays an animation when you die"],
						width = 'full',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeathgta or E.db.ElvUI_EltreumUI.otherstuff.playerdeath end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustom end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustom = value end,
					},
					customdeathtext = {
						order = 31,
						type = 'input',
						name = L["Custom Death Text"],
						desc = L["The text displayed when you die using the custom text option"],
						--width = 'double',
						disabled = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeathgta or E.db.ElvUI_EltreumUI.otherstuff.playerdeath or (not E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustom) end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustomtext end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.playerdeathcustomtext = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					header8 = {
						order = 33,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					rollsound = {
						order = 34,
						type = "toggle",
						name = L["Add Sounds to /roll when someone gets a 1 or a 100"],
						desc = L["Plays a sound if someone rolls 1 or 100 out 100"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.chat.rollsound end,
						set = function(_, value) E.db.ElvUI_EltreumUI.chat.rollsound = value PlaySoundFile("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\sound\\WillSmith-Ahaha.ogg", "Master") E:StaticPopup_Show('CONFIG_RL') end,
					},
					header9 = {
						order = 35,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					worldtext = {
						order = 36,
						type = "description",
						name = L["Change the Scale of the World Text"],
						desc = L["Such as the floating XP, floating reputation changes and others"],
						width = 'full',
					},
					worldtextscale = {
						type = 'range',
						name = L["Select the size of the World Text"],
						order = 37,
						min = 0.2,
						max = 5,
						step = 0.1,
						width = "full",
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.worldtextscale end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.worldtextscale = value ElvUI_EltreumUI:WorldTextScale(value) end,
					},
					header10 = {
						order = 47,
						type = "description",
						name = "",
						width = 'full',
						hidden = function() if E.Retail then return false else return true end end,
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					hidetalkdesc = {
						order = 48,
						type = "description",
						name = L["Hide Talking Head"],
						hidden = function() if E.Retail then return false else return true end end,
						width = 'full',
					},
					hidetalkenable = {
						order = 49,
						name = L["Enable"],
						type = "toggle",
						hidden = function() if E.Retail then return false else return true end end,
						desc = L["Prevent Blizzard's Talking Head from appearing"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.hidetalkinghead end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.hidetalkinghead = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header11 = {
						order = 50,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					autossdesc = {
						order = 51,
						type = "description",
						name = L["Automatically take Screenshots"],
						width = 'full',
					},
					autossenable = {
						order = 52,
						name = L["Enable"],
						type = "toggle",
						desc = L["Automatically take Screenshots such as when leveling up"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.screenshot end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.screenshot = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header12 = {
						order = 53,
						type = "description",
						name = L["Stealth"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					stealthframeoptions = {
						order = 54,
						type = 'toggle',
						name = L["Add a vignette effect while in stealth"],
						width = 'full',
						desc = L["Turn the effect on"],
						get = function() return E.db.ElvUI_EltreumUI.stealthOptions.stealtheffect end,
						set = function(_, value) E.db.ElvUI_EltreumUI.stealthOptions.stealtheffect = value end,
					},
					header13 = {
						order = 55,
						type = "description",
						name = L["Item Deletion"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					autotypedelete = {
						order = 56,
						type = 'toggle',
						name = L["Automatically type DELETE on the popup"],
						width = 'full',
						desc = L["Will not delete the item, will simply type DELETE instead you needing to type it"],
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.delete end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.delete = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header14 = {
						order = 57,
						type = "description",
						name = L["Play a Sound when receiving mail"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					enablesoundmail = {
						type = 'toggle',
						name = L["Enable"],
						width = "full",
						order = 58,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.mailsoundenable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.mailsoundenable = value end,
					},
					sharedmediasoundmail = {
						order = 59,
						type = 'select',
						width = "double",
						dialogControl = 'LSM30_Sound',
						name = L["Select a Sound"],
						desc = L["Choose a Sound from SharedMedia files"],
						values = AceGUIWidgetLSMlists.sound,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.mailsound end,
						disabled = function() return not E.db.ElvUI_EltreumUI.otherstuff.mailsoundenable end,
						set = function(self,key) E.db.ElvUI_EltreumUI.otherstuff.mailsound = key E:StaticPopup_Show('CONFIG_RL') end,
					},
					header15 = {
						order = 94,
						type = "description",
						name = L["Blizzard Floating Combat Text"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					blizzcombatexttoggle = {
						order = 96,
						name = L["Disable Combat Text"],
						type = "toggle",
						desc = L["Enable or disable Blizzard's default Floating Combat Text"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.blizzcombattext end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.blizzcombattext = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					blizzcombatextmana = {
						order = 97,
						name = L["Enable Resource Gains"],
						type = "toggle",
						desc = L["Enable or disable Blizzard's default Floating Combat Text for Mana/Rage/Energy and other resouces"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.blizzcombatmana end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.blizzcombatmana = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header16 = {
						order = 98,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					apswap = {
						order = 99,
						type = 'execute',
						name = L["Swap Action Paging and visibility for Bar1 and Bar4"],
						--desc = "",
						width = 'full',
						confirm = true,
						func = function() ElvUI_EltreumUI:ActionPagingSwap() E:StaticPopup_Show('CONFIG_RL') end,
					},
				},
			},
			nameplates = {
				type = 'group',
				name = L["Nameplates"],
				order = 85,
				childGroups = "tab",
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\nameplate',
				args = {
					general = {
						order = 1,
						type = 'group',
						name = L["General"],
						args = {
							header = {
								order = 1,
								type = "description",
								name = L["Class Colored Nameplate Options"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classhover = {
								order = 2,
								type = 'toggle',
								name = L["Hover"],
								width = 'double',
								desc = L["Change the color of the hover to be class colored"],
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.ClassColorGlow end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.ClassColorGlow = value end,
							},
							classborder = {
								order = 3,
								type = 'toggle',
								name = L["Border"],
								width = 'double',
								desc = L["Change the color of the border glow to be class bordered in nameplates"],
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.ClassBorderNameplate end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.ClassBorderNameplate = value end,
							},
							classtexture = {
								order = 4,
								type = 'toggle',
								name = L["Player Class Texture"],
								width = 'double',
								desc = L["Change the texture of the nameplate to be a class gradient of the player's class"],
								disabled = function() return E.db.ElvUI_EltreumUI.nameplateOptions.targetclasstexture end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.nameplatetexture end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.nameplatetexture = value end,
							},
							targetclasstexture = {
								order = 4,
								type = 'toggle',
								name = L["Target Class Texture"],
								width = 'double',
								desc = L["Change the texture of the nameplate to be a class gradient of the target's class"],
								disabled = function() return E.db.ElvUI_EltreumUI.nameplateOptions.nameplatetexture end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.targetclasstexture end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.targetclasstexture = value end,
							},
							headernptextv = {
								order = 5,
								type = "description",
								name= L["Nameplate Texture Version"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							textureselect = {
								type = 'select',
								name= "",
								--desc = L["Choose the direction of the gradient"],
								order = 6,
								values = {
									["V1"] = L["Version 1"],
									["V2"] = L["Version 2"],
									["V3"] = L["Version 3"],
								},
								style = 'radio',
								disabled = function() return (not E.db.ElvUI_EltreumUI.nameplateOptions.nameplatetexture and not E.db.ElvUI_EltreumUI.nameplateOptions.targetclasstexture) end,
								get = function() return E.db.ElvUI_EltreumUI.nptextureversion end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nptextureversion = value end,
							},
							headernpheight = {
								order = 7,
								type = "description",
								name= L["Custom Health Height"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enableCustomHealthHeight = {
								order = 8,
								type = 'toggle',
								name = E.NewSign..L["Enable Custom Health Heights"],
								desc = L["Changes Nameplate Health Height depending on conditions"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.enableHealthHeight end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.enableHealthHeight = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enableCustomHealthHeightnocombat = {
								type = 'range',
								name = E.NewSign..L["Out of Combat/Not Targeted"],
								desc = L["Choose the Health Height for Nameplates not in combat or not targeted"],
								order = 9,
								min = 1,
								max = 40,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.enableHealthHeight end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.outofcombatHeight end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.outofcombatHeight = value end,
							},
							enableCustomHealthHeightincombat = {
								type = 'range',
								name = E.NewSign..L["In Combat/Targeted"],
								desc = L["Choose the Health Height for Nameplates that are in combat or targeted"],
								order = 9,
								min = 1,
								max = 40,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.enableHealthHeight end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.incombatHeight end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.incombatHeight = value end,
							},
							targetmodel = {
								order = 10,
								type = "description",
								name= L["Target Model"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enabletargetmodel = {
								order = 11,
								type = 'toggle',
								name = E.NewSign..L["Enable Target Model"],
								desc = L["Shows the target's model on the target nameplate"],
								width = 'double',
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel = value end,
							},
							enabletargetmodelpause = {
								order = 12,
								type = 'toggle',
								name = E.NewSign..L["Pause"],
								width = 'double',
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.paused end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.paused = value end,
							},
							enabletargetmodelCamDistance = {
								type = 'range',
								name = E.NewSign..L["Camera Distance Scale"],
								order = 13,
								min = 0.01,
								max = 7,
								step = 0.01,
								width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.CamDistanceScale end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.CamDistanceScale = value end,
							},
							enabletargetmodelViewTranslationx = {
								type = 'range',
								name = E.NewSign..L["X-Offset"],
								order = 14,
								min = -1,
								max = 1,
								step = 0.01,
								width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.ViewTranslationx end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.ViewTranslationx = value end,
							},
							enabletargetmodelViewTranslationy = {
								type = 'range',
								name = E.NewSign..L["Y-Offset"],
								order = 15,
								min = -1,
								max = 1,
								step = 0.01,
								width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.ViewTranslationy end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.ViewTranslationy = value end,
							},
							enabletargetmodelRotation = {
								type = 'range',
								name = E.NewSign..L["Model Rotation"],
								order = 16,
								min = 0,
								max = 360,
								step = 0.1,
								width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.Rotation end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.Rotation = value end,
							},
							enabletargetmodelalpha = {
								type = 'range',
								name = E.NewSign..L["Model Alpha"],
								order = 17,
								min = 0,
								max = 1,
								step = 0.1,
								width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.modelalpha end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.modelalpha = value end,
							},
							enabletargetmodelDesaturate = {
								type = 'range',
								name = E.NewSign..L["Desaturate"],
								order = 18,
								min = 0,
								max = 1,
								step = 0.1,
								width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.nameplateOptions.targetmodel end,
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.desaturation end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.desaturation = value end,
							},
							header2 = {
								order = 905,
								type = "description",
								name = L["Control how Nameplates behave"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							hidehealthinsideinstances = {
								order = 906,
								type = 'toggle',
								name = L["Show Friendly Nameplates but Hide Healthbar"],
								desc = L["Show Friendly Nameplates but Hide Healthbar"],
								width = 'full',
								disabled = function() return (E.db.ElvUI_EltreumUI.friendlynameplatetoggle.disablefriendly or E.db.ElvUI_EltreumUI.friendlynameplatetoggle.hidefriendly) end,
								get = function() return E.db.ElvUI_EltreumUI.friendlynameplatetoggle.friendlynames end,
								set = function(_, value) E.db.ElvUI_EltreumUI.friendlynameplatetoggle.friendlynames = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							nofriendlyinstances = {
								order = 907,
								type = 'toggle',
								name = L["Hide Friendly Nameplates inside Instances"],
								desc = L["Hide Friendly Nameplates inside Instances"],
								width = 'full',
								disabled = function() return (E.db.ElvUI_EltreumUI.friendlynameplatetoggle.friendlynames or E.db.ElvUI_EltreumUI.friendlynameplatetoggle.hidefriendly) end,
								get = function() return E.db.ElvUI_EltreumUI.friendlynameplatetoggle.disablefriendly end,
								set = function(_, value) E.db.ElvUI_EltreumUI.friendlynameplatetoggle.disablefriendly = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							dontshowfriendlyatall = {
								order = 908,
								type = 'toggle',
								name = L["Hide Friendly Nameplates everywhere"],
								desc = L["Hide Friendly Nameplates everywhere"],
								width = 'full',
								disabled = function() return (E.db.ElvUI_EltreumUI.friendlynameplatetoggle.friendlynames or E.db.ElvUI_EltreumUI.friendlynameplatetoggle.disablefriendly) end,
								get = function() return E.db.ElvUI_EltreumUI.friendlynameplatetoggle.hidefriendly end,
								set = function(_, value) E.db.ElvUI_EltreumUI.friendlynameplatetoggle.hidefriendly = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header33 = {
								order = 909,
								type = "description",
								name = L["Smart Classbar"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							classbarautohide = {
								order = 910,
								type = 'toggle',
								name = L["Enable Smart Classbar"],
								desc = L["Automatically hide the Classbar if the Target is Friendly, show if it is an enemy"],
								get = function() return E.db.ElvUI_EltreumUI.nameplateOptions.classbarautohide end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplateOptions.classbarautohide = value end,
							},
							header3 = {
								order = 911,
								type = "description",
								name = L["Wide nameplate debuffs and buffs"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							verywidenameplate = {
								order = 912,
								type = 'toggle',
								name = L["Make Buffs and Debuffs Wide on Nameplates"],
								desc = L["Toggle On and Off"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.widenameplate.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.widenameplate.enable = value end,
							},
							header4 = {
								order = 913,
								type = "description",
								name = L["Enemy Nameplate Level"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							dynamiclevel = {
								order = 914,
								type = 'toggle',
								name = L["Hide level on enemy nameplates when you are max level"],
								desc = L["Toggle On and Off"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.nameplatelevel.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.nameplatelevel.enable = value end,
							},
							header5 = {
								order = 915,
								type = "description",
								name = L["Automatically Hide NPC Names"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							hidenpcname = {
								order = 916,
								type = 'toggle',
								name = L["Hide NPC Names when they are too far away to have Nameplates"],
								desc = L["Toggle On and Off"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								get = function() return E.db.ElvUI_EltreumUI.cvars.autohidenpcname end,
								set = function(_, value) E.db.ElvUI_EltreumUI.cvars.autohidenpcname = value end,
							},
							headerrestore = {
								order = 917,
								type = "description",
								name = L["Restore Hidden Names"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							restorenames = {
								order = 918,
								type = 'execute',
								name = function()
									if E.Retail then
										return L["Restore Unit Names hidden by Hide NPC Names"]
									else
										return L["Restore Unit Names Hidden during install"]
									end
								end,
								width = 'full',
								desc = function()
									if E.Retail then
										return L["Use this button to restore names should you have disabled the Hide NPC Names option"]
									else
										return L["Use this button to restore names"]
									end
								end,
								func = function() ElvUI_EltreumUI:RestoreNameplateNames() end,
							},
						},
					},
					powerbar = {
						order = 2,
						type = 'group',
						name= L["Nameplate Power Bar"],
						args = {
							header5 = {
								order = 10,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							nameplatepower = {
								order = 11,
								type = 'group',
								inline = true,
								name = L["Nameplate Power Bar"],
								args = {
									enablepowerbar = {
										order = 1,
										type = 'toggle',
										name = L["Enable Nameplate Power Bar"],
										desc = L["Enable an extra Power Bar on Nameplates for missing powers"],
										width = 'full',
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.enable = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									enableadjust = {
										order = 2,
										type = 'toggle',
										name = L["Enable Auto-adjusting Buffs/Debuffs"],
										desc = L["Enable Auto-adjusting the position of Buffs/Debuffs"],
										width = 'full',
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.adjust end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.adjust = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									header998747 = {
										order = 3,
										type = "description",
										name = L["Nameplate Powerbar Position"],
										width = 'full',
										image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
									},
									enableautoadjust = {
										order = 91,
										type = 'toggle',
										name = L["Enable Auto-adjusting the Vertical Position of the Power Bar"],
										desc = L["Power Bar will move automatically based on class/spec/druid form"],
										width = 'full',
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.db.ElvUI_EltreumUI.nameplatepower.autoadjustposition end,
										set = function(_, value) E.db.ElvUI_EltreumUI.nameplatepower.autoadjustposition = value end,
									},
									powerbarYoffset = {
										type = 'range',
										name = L["Select the Y Offset for the Power Bar (Default 16)"],
										desc = L["Set Y Offset"],
										order = 92,
										min = -100,
										max = 100,
										step = 0.1,
										width = "full",
										disabled = function() return E.db.ElvUI_EltreumUI.nameplatepower.autoadjustposition end,
										get = function() return E.db.ElvUI_EltreumUI.nameplatepower.posy end,
										set = function(_, value) E.db.ElvUI_EltreumUI.nameplatepower.posy = value end,
									},
									header98879 = {
										order = 93,
										type = "description",
										name = L["Nameplate Powerbar Size"],
										width = 'full',
										image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
									},
									powerbarsizeX = {
										type = 'range',
										name = L["Select the Horizontal Size of the Power Bar (Default 132)"],
										desc = L["Set Horizontal Size"],
										order = 94,
										min = 10,
										max = 300,
										step = 0.1,
										width = "full",
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.db.ElvUI_EltreumUI.nameplatepower.sizex end,
										set = function(_, value) E.db.ElvUI_EltreumUI.nameplatepower.sizex = value end,
									},
									powerbarsizeY = {
										type = 'range',
										name = L["Select the Vertical Size of the Power Bar (Default 6)"],
										desc = L["Set Vertical Size"],
										order = 95,
										min = 2,
										max = 20,
										step = 0.1,
										width = "full",
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.db.ElvUI_EltreumUI.nameplatepower.sizey end,
										set = function(_, value) E.db.ElvUI_EltreumUI.nameplatepower.sizey = value end,
									},
									header998 = {
										order = 96,
										type = "description",
										name = L["Nameplate Powerbar appearance"],
										width = 'full',
										image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
									},
									nameplatepowerfont = {
										order = 97,
										type = 'select',
										-- width = "double",
										dialogControl = 'LSM30_Font',
										name = L["Font"],
										desc = L["Choose a font for the Nameplate Powerbar Text"],
										values = AceGUIWidgetLSMlists.font,
										get = function()
											return E.db.ElvUI_EltreumUI.nameplatepower.font
										end,
										set = function(self,fontvalue)
											E.db.ElvUI_EltreumUI.nameplatepower.font = fontvalue
										end,
									},
									nameplatepowerfontsize = {
										type = 'range',
										name = L["Font Size"],
										desc = L["Nameplate Powerbar Font Size"],
										order = 98,
										min = 8,
										max = 36,
										step = 1,
										--width = "double",
										get = function() return E.db.ElvUI_EltreumUI.nameplatepower.fontsize end,
										set = function(_, value) E.db.ElvUI_EltreumUI.nameplatepower.fontsize = tonumber(value) end,
									},
									sharedmediatexture = {
										order = 99,
										type = 'select',
										width = "double",
										dialogControl = 'LSM30_Statusbar',
										name = L["Choose the Power Bar Texture"],
										desc = L["Select a Texture"],
										values = AceGUIWidgetLSMlists.statusbar,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.db.ElvUI_EltreumUI.nameplatepower.texture end,
										set = function(self,key) E.db.ElvUI_EltreumUI.nameplatepower.texture = key end,
									},
									powerbarbackgroundcolor = {
										order = 100,
										type = 'color',
										name = L["Background Color"],
										hasAlpha = false,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function()
											local customcolorpowerbar = E.db.ElvUI_EltreumUI.nameplatepower
											local d = P.ElvUI_EltreumUI.nameplatepower
											return customcolorpowerbar.r, customcolorpowerbar.g, customcolorpowerbar.b, customcolorpowerbar.a, d.r, d.g, d.b, d.a
										end,
										set = function(_, r, g, b, a)
											local customcolorpowerbar = E.db.ElvUI_EltreumUI.nameplatepower
											customcolorpowerbar.r, customcolorpowerbar.g, customcolorpowerbar.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
										end,
									},
									header9987 = {
										order = 101,
										type = "description",
										name = "",
										width = 'full',
										image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
									},
									describethis = {
										order = 102,
										type = "description",
										name = L["Select the power types to be displayed:"],
									},
									addagapforspace8 = {
										order = 103,
										type = "description",
										name = "",
									},
									mana = {
										type = 'toggle',
										name = L["Mana"],
										order = 104,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.mana end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.mana = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									rage = {
										type = 'toggle',
										name = L["Rage"],
										order = 104,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.rage end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.rage = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									energy = {
										type = 'toggle',
										name = L["Energy"],
										order = 104,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.energy end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.energy = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									astral = {
										type = 'toggle',
										name = L["Astral power"],
										order = 104,
										hidden = function() if E.Retail then return false else return true end end,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.astral end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.astral = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									runic = {
										type = 'toggle',
										name = L["Runic power"],
										order = 104,
										hidden = function() if E.Retail or E.Wrath then return false else return true end end,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.runic end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.runic = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									insanity = {
										type = 'toggle',
										name = L["Insanity"],
										order = 104,
										hidden = function() if E.Retail then return false else return true end end,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.insanity end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.insanity = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									maelstrom = {
										type = 'toggle',
										name = L["Maelstrom"],
										order = 104,
										hidden = function() if E.Retail then return false else return true end end,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.maelstrom end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.maelstrom = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									fury = {
										type = 'toggle',
										name = L["Fury"],
										order = 104,
										hidden = function() if E.Retail then return false else return true end end,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.fury end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.fury = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
									focus = {
										type = 'toggle',
										name = L["Focus"],
										order = 104,
										hidden = function() if E.Retail then return false else return true end end,
										disabled = function() return not E.private.ElvUI_EltreumUI.nameplatepower.enable end,
										get = function() return E.private.ElvUI_EltreumUI.nameplatepower.focus end,
										set = function(_, value) E.private.ElvUI_EltreumUI.nameplatepower.focus = value E:StaticPopup_Show('PRIVATE_RL') end,
									},
								}
							},
						},
					},
					gradientnp = {
						order = 3,
						type = 'group',
						name = E.NewSign..L["Gradient"],
						args = {
							header = {
								order = 1,
								type = "description",
								name = L["Gradient Colors"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enablegradientnp = {
								order = 2,
								type = 'toggle',
								name = E.NewSign..L["Enable Gradient Nameplates"],
								desc = L["Enable Gradient colors for Nameplates. |cffFF0000WARING:|r This will overwrite some default ElvUI NP settings, if you dont want this, please disable this feature."],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.npenable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.npenable = value end,
							},
							enablecustomcolor = {
								order = 3,
								type = 'toggle',
								name = L["Custom Color"],
								desc = L["Enable Custom Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor = value ElvUI_EltreumUI:GradientColorTableUpdate() end,
							},
							enablecustomcolor = {
								order = 3,
								type = 'toggle',
								name = L["Custom Color"],
								desc = L["Enable Custom Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor = value ElvUI_EltreumUI:GradientColorTableUpdate() end,
							},
							opengradientcolors = {
								order = 4,
								type = 'execute',
								name = L["Colors"],
								width = 'full',
								desc = L["Customize Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable end,
								func = function() E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'ElvUI_EltreumUI', "gradient") end,
							},
							gradientorientation = {
								type = 'select',
								name = L["Gradient Orientation"],
								desc = L["Choose the direction of the gradient"],
								order = 10,
								values = {
									["HORIZONTAL"] = L["Horizontal"],
									["VERTICAL"] = L["Vertical"],
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.npenable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.nporientation end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.nporientation = value E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
				},
			},
			partyraidsettings = {
				type = 'group',
				name = L["Party/Raid"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\party',
				order = 85,
				args = {
					headergap1 = {
						order = 1,
						type = "description",
						name = L["Play a sound when someone dies in Party or Raid"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					enablesound = {
						type = 'toggle',
						name = L["Enable"],
						width = "full",
						order = 6,
						get = function() return E.db.ElvUI_EltreumUI.partyraiddeath.enable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.partyraiddeath.enable = value end,
					},
					disablebgs = {
						type = 'toggle',
						name = L["Disable in Battlegrounds/Arenas"],
						width = "full",
						order = 7,
						disabled = function() return not E.db.ElvUI_EltreumUI.partyraiddeath.enable end,
						get = function() return E.db.ElvUI_EltreumUI.partyraiddeath.bgdisable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.partyraiddeath.bgdisable = value end,
					},
					sharedmediasound = {
						order = 8,
						type = 'select',
						width = "double",
						dialogControl = 'LSM30_Sound',
						name = L["Select a Sound"],
						desc = L["Choose a Sound from SharedMedia files"],
						values = AceGUIWidgetLSMlists.sound,
						get = function() return E.db.ElvUI_EltreumUI.partyraiddeath.playerdeathsound end,
						disabled = function() return not E.db.ElvUI_EltreumUI.partyraiddeath.enable end,
						set = function(self,key) E.db.ElvUI_EltreumUI.partyraiddeath.playerdeathsound = key E:StaticPopup_Show('CONFIG_RL') end,
					},
					header52 = {
						order = 9,
						type = "description",
						name = "",
						width = 'full',
						hidden = function() if E.Retail then return false else return true end end,
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					bresenable = {
						order = 10,
						type = "toggle",
						name = L["Show a Battle Resurrection Count and Cooldown Frame"],
						desc = L["Enables a frame that shows a cooldown and count for battle ressurections while in an instance that has them"],
						width = 'full',
						hidden = function() if E.Retail then return false else return true end end,
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.bres end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.bres = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					layoutdescriptiongap2 = {
						order = 13,
						type = 'description',
						name = "",
						width = "full",
					},
					headergapisntances = {
						order = 13,
						type = "description",
						name = L["Instance Texts"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					instancetextenable = {
						type = 'toggle',
						name = L["Enable"],
						width = "full",
						order = 14,
						get = function() return E.db.ElvUI_EltreumUI.instances.enable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.enable = value end,
					},
					instancecolor = {
						order = 15,
						type = 'color',
						name = L["Instance Text Color"],
						hasAlpha = false,
						width = "full",
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.r, E.db.ElvUI_EltreumUI.instances.g, E.db.ElvUI_EltreumUI.instances.b, 1, P.ElvUI_EltreumUI.instances.r, P.ElvUI_EltreumUI.instances.g, P.ElvUI_EltreumUI.instances.b, 1 end,
						set = function(_, r, g, b, a) E.db.ElvUI_EltreumUI.instances.r, E.db.ElvUI_EltreumUI.instances.g, E.db.ElvUI_EltreumUI.instances.b = r, g, b end,
					},
					instancefontsize = {
						type = 'range',
						name = L["Font Size"],
						desc = L["Instance text Font Size"],
						order = 16,
						min = 4,
						max = 72,
						step = 1,
						width = "double",
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.fontsize end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.fontsize = tonumber(value) end,
					},
					headergapisntance2 = {
						order = 17,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					DungeonNormal = {
						order = 80,
						type = 'input',
						name = L["Dungeon"],
						desc = L["The text displayed when in a normal dungeon"],
						--width = 'double',
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.DungeonNormal end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.DungeonNormal = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					DungeonHeroic = {
						order = 80,
						type = 'input',
						name = L["Dungeon (Heroic)"],
						desc = L["The text displayed when in a heroic dungeon"],
						--width = 'double',
						hidden = function() if E.Classic then return true else return false end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.DungeonHeroic end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.DungeonHeroic = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					DungeonTimwalking = {
						order = 80,
						type = 'input',
						name = L["Dungeon (Timewalking)"],
						desc = L["The text displayed when in a timewalking dungeon"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.DungeonTimewalker end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.DungeonTimewalker = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					DungeonMzero = {
						order = 80,
						type = 'input',
						name = L["Dungeon (Mythic)"],
						desc = L["The text displayed when in a mythic dungeon"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.DungeonMythic end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.DungeonMythic = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					DungeonMplus = {
						order = 80,
						type = 'input',
						name = L["Dungeon (Mythic Plus)"],
						desc = L["The text displayed when in a mythic plus dungeon"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.DungeonMythicPlus end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.DungeonMythicPlus = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					Raid = {
						order = 80,
						type = 'input',
						name = L["Raid (Normal)"],
						desc = L["The text displayed when in a normal raid"],
						--width = 'double',
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.Raid end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.Raid = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					RaidHeroic = {
						order = 80,
						type = 'input',
						name = L["Raid (Heroic)"],
						desc = L["The text displayed when in a heroic raid"],
						--width = 'double',
						hidden = function() if E.Classic or E.TBC then return true else return false end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.RaidHeroic end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.RaidHeroic = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					RaidLFR = {
						order = 80,
						type = 'input',
						name = L["Raid (LFR)"],
						desc = L["The text displayed when in a lfr raid"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.RaidLFR end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.RaidLFR = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					RaidMythic = {
						order = 80,
						type = 'input',
						name = L["Raid (Mythic)"],
						desc = L["The text displayed when in a mythic raid"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.MythicRaid end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.MythicRaid = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					RaidTimewalking = {
						order = 80,
						type = 'input',
						name = L["Raid (Timewalking)"],
						desc = L["The text displayed when in a timewalking raid"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.RaidTimewalker end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.RaidTimewalker = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
					Guild = {
						order = 80,
						type = 'input',
						name = L["Guild"],
						desc = L["The text displayed when in a guild group"],
						--width = 'double',
						hidden = function() if E.Retail then return false else return true end end,
						disabled = function() return (not E.db.ElvUI_EltreumUI.instances.enable) end,
						get = function() return E.db.ElvUI_EltreumUI.instances.guild end,
						set = function(_, value) E.db.ElvUI_EltreumUI.instances.guild = tostring(value) E:StaticPopup_Show('PRIVATE_RL') end,
					},
				},
			},
			quests = {
				type = 'group',
				name = L["Quests"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\quest',
				order = 85,
				args = {
					headergaphere112 = {
						order = 1,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					autoaccept = {
						order = 2,
						type = 'toggle',
						name = L["Enable Automatically accepting/turning in Quests when not holding CTRL/SHIFT/ALT"],
						desc = L["You will automatically accept and turn in quests that do not require gold, are not weekly and are not daily"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.questsettings.autoaccept end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.autoaccept = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					autoacceptdailyweekly = {
						order = 3,
						type = 'toggle',
						name = L["Accept Daily and Weekly quests"],
						desc = L["You will also automatically accept Daily and Weekly Quests"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.questsettings.acceptdaily end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.acceptdaily = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					autoacceptinvert = {
						order = 3,
						type = 'toggle',
						name = L["Invert CTRL/SHIFT/ALT"],
						desc = L["You will only accept and turn in quests if you hold CTRL/SHIFT/ALT while talking to the NPC"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.questsettings.autoacceptinvert end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.autoacceptinvert = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					headergaphereitembar = {
						order = 4,
						type = "description",
						name = L["Quest Item Bar"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					questitembar = {
						order = 5,
						type = 'toggle',
						name = L["Enable Quest Item Bar"],
						desc = L["Add a Quest Item bar, keybind can be changed in Keybinds > ElvUI Eltruism"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.questsettings.questitems end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.questitems = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					questitembarab1 = {
						order = 6,
						type = 'toggle',
						name = L["Quest Item Bar follows visibility settings for ElvUI Action Bar 1"],
						desc = L["The Quest Item Bar will appear only when ElvUI Action Bar 1 appears, following its settings"],
						width = 'full',
						disabled = function() return (not E.db.ElvUI_EltreumUI.questsettings.questitems) or E.db.ElvUI_EltreumUI.questsettings.questitemsfade end,
						get = function() return E.db.ElvUI_EltreumUI.questsettings.questitemsbar1 end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.questitemsbar1 = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					questitembarmouseover = {
						order = 7,
						type = 'toggle',
						name = L["Quest Item Bar Button Mouse Over"],
						desc = L["Each Button in the Quest Item Bar will appear only if the cursor is over it"],
						width = 'full',
						disabled = function() return (not E.db.ElvUI_EltreumUI.questsettings.questitems) or E.db.ElvUI_EltreumUI.questsettings.questitemsbar1 end,
						get = function() return E.db.ElvUI_EltreumUI.questsettings.questitemsfade end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.questitemsfade = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					questitemsbarsize = {
						type = 'range',
						name = L["Quest Item Bar Button Size"],
						desc = L["Change the size of the button on the Quest Item Bar"],
						order = 8,
						min = 10,
						max = 100,
						step = 1,
						width = "double",
						disabled = function() return not E.db.ElvUI_EltreumUI.questsettings.questitems end,
						get = function() return E.db.ElvUI_EltreumUI.questsettings.questitemsize end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.questitemsize = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					headergaphere9487 = {
						order = 95,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					questsettings = {
						order = 96,
						type = 'toggle',
						name = L["Collapse Quests during Encounters/Boss Fights"],
						desc = L["Collapse Quests when the boss fight starts"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.questsettings.enable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.enable = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					headergaphere2 = {
						order = 97,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					questcombatsettings = {
						order = 98,
						type = 'toggle',
						name = L["Collapse Quests during any combat event"],
						desc = L["Collapse Quests when you enter combat"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.questsettings.combatenable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.combatenable = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					arenaquestsettings = {
						order = 99,
						type = 'toggle',
						width = 'full',
						name = L["Hide Quests during Battlegrounds and Arenas"],
						desc = L["Hide Quests during Battlegrounds and Arenas"],
						get = function() return E.db.ElvUI_EltreumUI.questsettings.arena end,
						set = function(_, value) E.db.ElvUI_EltreumUI.questsettings.arena = value E:StaticPopup_Show('CONFIG_RL') end,
					},
				},
			},
			skins = {
				order = 85,
				type = 'group',
				name = L["Skins"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\paint',
				childGroups = "tab",
				args = {
					general = {
						type = 'group',
						name = L["General"],
						order = 1,
						args = {
							header11 = {
								order = 1,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							zonetext = {
								order = 2,
								type = "description",
								name = L["Make more texts use ElvUI font settings"],
								width = 'full',
							},
							errorenable = {
								order = 3,
								name = L["Enable for Error Frame"],
								type = "toggle",
								desc = L["Enable for Error Frame"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.skins.zones end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.zones = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							errorsize = {
								type = 'range',
								name = L["Error Frame Font Size"],
								desc = L["Error Frame Font Size"],
								order = 4,
								min = 8,
								max = 36,
								step = 1,
								width = "double",
								get = function() return E.db.ElvUI_EltreumUI.blizzframes.errorframefontsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.blizzframes.errorframefontsize = tonumber(value) E:StaticPopup_Show('CONFIG_RL') end,
							},
							--[[bossenable = {
								order = 5,
								name = L["Enable for Boss Emote Frame"],
								type = "toggle",
								desc = L["Enable for Boss Emote Frame"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.blizzframes.raidbossframe end,
								set = function(_, value) E.db.ElvUI_EltreumUI.blizzframes.raidbossframe = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							bosssize = {
								type = 'range',
								name = L["Boss Emote Frame Font Size"],
								desc = L["Boss Emote Frame Font Size"],
								order = 6,
								min = 8,
								max = 36,
								step = 1,
								width = "double",
								get = function() return E.db.ElvUI_EltreumUI.blizzframes.raidbossframefontsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.blizzframes.raidbossframefontsize = tonumber(value) E:StaticPopup_Show('CONFIG_RL') end,
							},]]
							zoneenable = {
								order = 34,
								name = L["Enable for Zones, Mail and others"],
								type = "toggle",
								desc = L["Such as the Zones, Mail and others"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.skins.zones end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.zones = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							hideerrorframe = {
								order = 35,
								name = L["Hide Error Frame"],
								type = "toggle",
								desc = L["Hide Error Frame"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.blizzframes.hideerrorframe end,
								set = function(_, value) E.db.ElvUI_EltreumUI.blizzframes.hideerrorframe = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							questskins = {
								order = 36,
								type = "description",
								name = L["Skin Objective Frame"],
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = 'full',
							},
							showwowhead = {
								order = 37,
								name = L["Enable Wowhead Button on Quest Log"],
								type = "toggle",
								desc = L["Show a button for Wowhead quest links"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.skins.questswowhead end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.questswowhead = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							questenable = {
								order = 37,
								name = L["Enable Skin"],
								type = "toggle",
								desc = L["Skin the Objective/Quest Frame"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.skins.quests end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.quests = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							queststexture = {
								order = 38,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Choose the Progress Bar Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.quests end,
								get = function() return E.db.ElvUI_EltreumUI.skins.queststatusbartexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.skins.queststatusbartexture = key E:StaticPopup_Show('CONFIG_RL') end,
							},
							levelBosskins = {
								order = 48,
								type = "description",
								hidden = function() if E.Retail then return false else return true end end,
								name = L["Skin Level Up, Boss Loot and Instance Entrance frames to be class colored"],
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = "full",
							},
							skinenable = {
								order = 49,
								type = 'toggle',
								name = L["Enable"],
								hidden = function() if E.Retail then return false else return true end end,
								desc = L["Enable the Skins"],
								get = function() return E.db.ElvUI_EltreumUI.skins.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							expandedstable = {
								order = 50,
								type = "description",
								hidden = function() if E.Retail then return false else return true end end,
								name = L["Expand Hunter Stables to show all pets and improve search"],
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = "full",
							},
							stableenable = {
								order = 51,
								type = 'toggle',
								name = L["Enable"],
								hidden = function() if E.Retail then return false else return true end end,
								desc = L["Enable the Expanded Stable"],
								get = function() return E.db.ElvUI_EltreumUI.skins.expandedstable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandedstable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header79745 = {
								order = 52,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							raidbossemoteframe = {
								order = 53,
								type = "description",
								hidden = function() if E.Retail then return false else return true end end,
								name = L["Remove Blizzard's Boss Emote Frame"],
								width = "full",
							},
							removebossemote = {
								order = 54,
								type = 'toggle',
								name = L["Enable"],
								hidden = function() if E.Retail then return false else return true end end,
								desc = L["Enable removing the Alert Frame that can show up in the middle of the screen"],
								get = function() return E.db.ElvUI_EltreumUI.skins.bossemote end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.bossemote = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header8897 = {
								order = 55,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							widertransmog = {
								order = 56,
								type = "description",
								hidden = function() if E.Retail then return false else return true end end,
								name = L["Expand Transmog Window to better show your character"],
								width = "full",
							},
							widetransmogenable = {
								order = 57,
								type = 'toggle',
								name = L["Enable"],
								desc = L["Enable the Wider Transmog Window"],
								hidden = function() if E.Retail then return false else return true end end,
								get = function() return E.db.ElvUI_EltreumUI.skins.widertransmog end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.widertransmog = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							professionskins = {
								order = 46,
								type = "description",
								name = L["Skin Profession Frame"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
							},
							professionenable = {
								order = 47,
								name = L["Enable"],
								type = "toggle",
								desc = L["Skin the Profession/Tradeskill Frame"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.skins.professions end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.professions = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header64546 = {
								order = 48,
								type = "description",
								name = L["Add a Level Up toast"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							skinenable = {
								order = 49,
								type = 'toggle',
								name = L["Enable"],
								desc = L["Enable a toast showing up when you level up"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.skins.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							tbctalentinfo = {
								order = 50,
								type = "description",
								name = L["Expand the Talents to show the entire tree"],
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = "full",
							},
							tbctalents = {
								order = 51,
								type = 'toggle',
								name = L["Expanded Talents"],
								desc = L["Expand Talents to cover the full tree"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.tbctalents.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.tbctalents.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header8898 = {
								order = 58,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							gradientxp = {
								order = 59,
								type = "description",
								name = L["Add a gradient color to the Experience Bar"],
								width = "full",
							},
							gradientxpenable = {
								order = 60,
								type = 'toggle',
								name = L["Enable"],
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.gradientXP end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.gradientXP = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headerroleicon = {
								order = 61,
								type = "description",
								name = L["Replace role icons with Eltruism role icons"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							roleiconsenable = {
								order = 62,
								type = 'toggle',
								name = L["Enable"],
								get = function() return E.db.ElvUI_EltreumUI.otherstuff.eltruismroleicons end,
								set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.eltruismroleicons = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headerhidekeypressab = {
								order = 63,
								type = "description",
								name = E.NewSign..L["Hide Actionbar Button Press"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							hideABkeypress = {
								order = 64,
								type = 'toggle',
								name = L["Enable"],
								get = function() return E.db.ElvUI_EltreumUI.skins.hideABkeypress end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.hideABkeypress = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							otherskins = {
								order = 98,
								type = "description",
								name = L["Other Skins"],
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = "full",
							},
							meetinghorn = {
								order = 99,
								type = 'toggle',
								name = L["Skin MeetingHorn"],
								desc = L["Skin MeetingHorn"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.skins.meetinghorn end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.meetinghorn = value E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					character = {
						type = 'group',
						name = L["Character"],
						order = 2,
						args = {
							headersocket = {
								order = 1,
								type = "description",
								name = L["Sockets and Enchants"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							anchorgapheresocket = {
								order = 2,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
							},
							socketsonchar = {
								order = 3,
								type = 'toggle',
								name = L["Add Sockets and Enchants to the Character Panel"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								desc = L["Enable this option"],
								get = function() return E.db.ElvUI_EltreumUI.skins.sockets end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.sockets = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							socketsoninspect = {
								order = 4,
								type = 'toggle',
								name = L["Add Sockets and Enchants to the Inspect Frame"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								desc = L["Enable this option"],
								get = function() return E.db.ElvUI_EltreumUI.skins.socketsinspect end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.socketsinspect = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headerfirst = {
								order = 80,
								type = "description",
								name = L["Item Levels"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							anchorgaphere = {
								order = 81,
								type = "description",
								name = "",
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
							},
							skincharpanel = {
								order = 82,
								type = 'toggle',
								name = L["Add Item Levels to the Character Panel"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
								desc = L["Enable this option"],
								get = function() return E.db.ElvUI_EltreumUI.skins.ilvls end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.ilvls = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							inspectilvl = {
								order = 82,
								type = 'toggle',
								name = L["Add Item Levels to the Inspect Panel"],
								hidden = function() if E.Retail then return true else return false end end,
								width = 'full',
								desc = L["Enable this option"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.ilvls end,
								get = function() return E.db.ElvUI_EltreumUI.skins.ilvlsinspect end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.ilvlsinspect = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header831 = {
								order = 83,
								type = "description",
								hidden = function() if E.Retail then return true else return false end end,
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							ilvlanchor = {
								order = 84,
								type = 'select',
								name = L["Ilvl Anchor Point"],
								desc = L["Choose where the Ilvl will be attach to on the items"],
								hidden = function() if E.Retail then return true else return false end end,
								values = {
									["CENTER"] = "Center",
									["LEFT"] = 'Left',
									["RIGHT"] = 'Right',
									["TOP"] = 'Top',
									["TOPLEFT"] = 'Top Left',
									["TOPRIGHT"] = 'Top Right',
									["BOTTOM"] = 'Bottom',
									["BOTTOMLEFT"] = 'Bottom Left',
									["BOTTOMRIGHT"] = 'Bottom Right',
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.ilvls end,
								get = function() return E.db.ElvUI_EltreumUI.skins.ilvlanchor end,
								set = function(_,value) E.db.ElvUI_EltreumUI.skins.ilvlanchor = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header838 = {
								order = 85,
								type = "description",
								hidden = function() if E.Retail then return true else return false end end,
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							ilvlfontweight = {
								order = 86,
								type = 'select',
								name = L["Ilvl Font Outline"],
								desc = L["Choose the Ilvl font outline"],
								hidden = function() if E.Retail then return true else return false end end,
								values = {
									["OUTLINE"] = "Outline",
									["THICKOUTLINE"] = 'Thick Outline',
									["MONOCHROME"] = 'Monochrome',
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.ilvls end,
								get = function() return E.db.ElvUI_EltreumUI.skins.ilvlfontweight end,
								set = function(_,value) E.db.ElvUI_EltreumUI.skins.ilvlfontweight = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header840 = {
								order = 87,
								type = "description",
								hidden = function() if E.Retail then return true else return false end end,
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							ilvlfontsize = {
								type = 'range',
								name = L["Ilvl Font Size"],
								desc = L["Change the Ilvl font size"],
								hidden = function() if E.Retail then return true else return false end end,
								order = 88,
								min = 4,
								max = 72,
								step = 1,
								width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.ilvls end,
								get = function() return E.db.ElvUI_EltreumUI.skins.ilvlfontsize end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.ilvlfontsize = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header844 = {
								order = 89,
								type = "description",
								name = L["Character Panel"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							expandart = {
								order = 93,
								type = 'toggle',
								name = L["Expand Character Art"],
								width = 'full',
								desc = L["Enable this option"],
								hidden = function() if E.Retail then return false else return true end end,
								get = function() return E.db.ElvUI_EltreumUI.skins.expandarmorybg end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandarmorybg = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							expandamoryclassic = {
								order = 93,
								type = 'toggle',
								name = L["Expand Character Panel"],
								width = 'full',
								desc = L["Enable this option"],
								hidden = function() if E.Retail then return true else return false end end,
								get = function() return E.db.ElvUI_EltreumUI.skins.classicarmory end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.classicarmory = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							expandartcrest = {
								order = 94,
								type = 'toggle',
								name = L["Add Crest to Character Panel"],
								width = 'full',
								desc = L["Enable this option"],
								get = function() return E.db.ElvUI_EltreumUI.skins.expandarmorycrest end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandarmorycrest = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header834gap = {
								order = 95,
								type = "description",
								name = "",
								width = 'full',
							},
							characterpanelscale = {
								type = 'range',
								name = L["Character Panel Scale"],
								desc = L["Change the size of the Character Panel"],
								order = 96,
								min = 0.2,
								max = 2,
								step = 0.01,
								--width = "double",
								get = function() return E.db.ElvUI_EltreumUI.skins.characterpanelscale end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.characterpanelscale = value _G["CharacterFrame"]:SetScale(value) end,
							},
							header834gap2 = {
								order = 97,
								type = "description",
								name = "",
								width = 'full',
							},
							expandartalpha = {
								type = 'range',
								name = L["Art Alpha"],
								desc = L["Change the transparency of the Art"],
								order = 97,
								min = 0.01,
								max = 1,
								step = 0.01,
								--width = "double",
								disabled = function()
									if (E.Retail and not E.db.ElvUI_EltreumUI.skins.expandarmorybg) then
										return true
									elseif (not E.Retail and not E.db.ElvUI_EltreumUI.skins.classicarmory) then
										return true
									end
								end,
								get = function() return E.db.ElvUI_EltreumUI.skins.expandarmorybgalpha end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandarmorybgalpha = value _G["EltruismCharacterBG"]:SetAlpha(value) end,
							},
							armorybgtextureselect = {
								order = 98,
								type = 'select',
								name = L["Background Texture Type"],
								desc = L["Choose between a Class, Race or Custom Background"],
								--width = "double",
								values = {
									["CLASS"] = L["Class"],
									["RACE"] = L["Race"],
									["RAGNAROS"] = L["Ragnaros"],
									["SPACECLOUD"] = L["SpaceCloud"],
									["RAVNYR"] = L["Ravnyr"],
									["CUSTOM"] = L["Custom"],
								},
								sorting = {
									"CLASS",
									"RACE",
									"RAGNAROS",
									"SPACECLOUD",
									"RAVNYR",
									"CUSTOM"
					            },
								style = 'radio',
								disabled = function()
									if (E.Retail and not E.db.ElvUI_EltreumUI.skins.expandarmorybg) then
										return true
									elseif (not E.Retail and not E.db.ElvUI_EltreumUI.skins.classicarmory) then
										return true
									end
								end,
								get = function() return E.db.ElvUI_EltreumUI.skins.armorybgtype end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.armorybgtype = value ElvUI_EltreumUI:ExpandedCharacterStats() end,
							},
							bgcustomtexture = {
								order = 99,
								type = 'input',
								name = L["Name of file inside Interface\\Addons"],
								desc = L["Example: "].."mytexture.tga or mytexture or mytexture.jpg",
								width = 'double',
								disabled = function() return E.db.ElvUI_EltreumUI.skins.armorybgtype ~= "CUSTOM" end,
								get = function() return E.private.ElvUI_EltreumUI.skins.armorybgtexture end,
								set = function(_, value) E.private.ElvUI_EltreumUI.skins.armorybgtexture = value ElvUI_EltreumUI:ExpandedCharacterStats() end,
							},
							expandvignetteenable = {
								order = 100,
								type = 'toggle',
								name = L["Add a Vignette over the Character Art"],
								width = 'full',
								desc = L["Enable this option"],
								disabled = function()
									if (E.Retail and not E.db.ElvUI_EltreumUI.skins.expandarmorybg) then
										return true
									elseif (not E.Retail and not E.db.ElvUI_EltreumUI.skins.classicarmory) then
										return true
									end
								end,
								get = function() return E.db.ElvUI_EltreumUI.skins.armoryvignette end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.armoryvignette = value ElvUI_EltreumUI:ExpandedCharacterStats() end,
							},
							expandvignettealpha = {
								type = 'range',
								name = L["Vignette Alpha"],
								desc = L["Change the transparency of the Vignette"],
								order = 101,
								min = 0.01,
								max = 1,
								step = 0.01,
								--width = "double",
								disabled = function()
									if E.Retail and (not E.db.ElvUI_EltreumUI.skins.expandarmorybg or not E.db.ElvUI_EltreumUI.skins.armoryvignette) then
										return true
									elseif not E.Retail and (not E.db.ElvUI_EltreumUI.skins.classicarmory or not E.db.ElvUI_EltreumUI.skins.armoryvignette) then
										return true
									end
								end,
								get = function() return E.db.ElvUI_EltreumUI.skins.armoryvignettealpha end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.armoryvignettealpha = value _G["EltruismCharacterBGVignette"]:SetAlpha(value) end,
							},
							header843stats = {
								order = 102,
								type = "description",
								name = "",
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							autoarmorystats = {
								order = 103,
								type = 'toggle',
								name = L["Automatically swap the Character Stats to your main ones"],
								width = 'full',
								hidden = function() if E.Retail then return true else return false end end,
								desc = L["Enable this option"],
								get = function() return E.db.ElvUI_EltreumUI.skins.classicarmoryautostats end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.classicarmoryautostats = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headeritemq1823 = {
								order = 104,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							itemqualitycolors = {
								order = 105,
								type = 'toggle',
								name = L["Add Item Quality Texture"],
								width = 'full',
								desc = L["Enable this option"],
								disabled = function()
									if (E.Retail and not E.db.ElvUI_EltreumUI.skins.expandarmorybg) then
										return true
									elseif (not E.Retail and not E.db.ElvUI_EltreumUI.skins.classicarmory) then
										return true
									end
								end,
								get = function() return E.db.ElvUI_EltreumUI.skins.itemquality end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.itemquality = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headerstat5 = {
								order = 106,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							statcolors = {
								order = 107,
								type = 'toggle',
								name = L["Add Class Gradient Colors to Stats"],
								width = 'full',
								desc = L["Enable this option"],
								disabled = function()
									if (E.Retail and not E.db.ElvUI_EltreumUI.skins.expandarmorybg) then
										return true
									elseif (not E.Retail and not E.db.ElvUI_EltreumUI.skins.classicarmory) then
										return true
									end
								end,
								get = function() return E.db.ElvUI_EltreumUI.skins.statcolors end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.statcolors = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header85 = {
								order = 108,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							iconsoncharacter = {
								order = 109,
								type = 'toggle',
								name = L["Add Class Icons to Character Panel"],
								width = 'full',
								desc = L["Enable this option"],
								get = function() return E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							blizzicons = {
								order = 110,
								type = 'toggle',
								name = L["Use Blizzard Icons"],
								width = 'full',
								desc = L["Enable Blizzard Icons"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel or E.db.ElvUI_EltreumUI.skins.classiconsreleaf end,
								get = function() return E.db.ElvUI_EltreumUI.skins.classiconsblizz end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.classiconsblizz = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							releaficons= {
								order = 111,
								type = 'toggle',
								name = L["Use Blizzard Icons colored by Releaf"],
								width = 'full',
								desc = L["Enable Releaf Icons"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel or E.db.ElvUI_EltreumUI.skins.classiconsblizz end,
								get = function() return E.db.ElvUI_EltreumUI.skins.classiconsreleaf end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.classiconsreleaf = value E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
					shadows = {
						type = 'group',
						name = L["Shadows"],
						order = 2,
						args = {
							shadowsdesc = {
								order = 1,
								type = "description",
								name = L["Add Shadows to Frames"],
								desc = L["Add Shadows to some frames"],
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = 'full',
							},
							shadowsenable = {
								order = 2,
								name = L["Enable General Shadows"],
								type = "toggle",
								desc = L["Add Shadows to frames like Player, target, Chats and others"],
								width = 'full',
								get = function() return E.db.ElvUI_EltreumUI.skins.shadows end,
								set = function(_, value) E.db.ElvUI_EltreumUI.skins.shadows = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenableab = {
								order = 3,
								name = L["ActionBars"],
								type = "toggle",
								desc = L["Add Shadows to Actionbars"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.actionbars end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.actionbars = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenableraid = {
								order = 4,
								name = L["Raid"],
								type = "toggle",
								desc = L["Add Shadows to Raid Frames"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.raid end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.raid = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							header845 = {
								order = 98,
								type = "description",
								name = L["Other Shadows (can become CPU/Memory Intensive)"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							shadowsenablenp = {
								order = 99,
								name = L["Nameplate Health"],
								type = "toggle",
								desc = L["Add Shadows to Nameplate Healthbars"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.nameplates end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.nameplates = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenablenpauras = {
								order = 99,
								name = L["Nameplate Aura"],
								type = "toggle",
								desc = L["Add Shadows to Nameplate Auras"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.npauras end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.npauras = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenablenpportrait = {
								order = 99,
								name = L["Nameplate Portrait"],
								type = "toggle",
								desc = L["Add Shadows to Nameplate Portraits"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.npportrait end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.npportrait = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenablenppower = {
								order = 99,
								name = L["Nameplate Power"],
								type = "toggle",
								desc = L["Add Shadows to Nameplate Powers"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.nppower end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.nppower = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenablenpcastbar = {
								order = 99,
								name = L["Nameplate Castbar"],
								type = "toggle",
								desc = L["Add Shadows to Nameplate Castbars"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.npcastbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.npcastbar = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenableufaura = {
								order = 99,
								name = L["Unitframe Aura"],
								type = "toggle",
								desc = L["Add Shadows to Unitframe Auras"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.ufaura end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.ufaura = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							shadowsenableaura = {
								order = 99,
								name = L["Aura"],
								type = "toggle",
								desc = L["Add Aura Shadows (Aura list next to the minimap)"],
								disabled = function() return not E.db.ElvUI_EltreumUI.skins.shadows end,
								get = function() return E.db.ElvUI_EltreumUI.shadows.aura end,
								set = function(_, value) E.db.ElvUI_EltreumUI.shadows.aura = value E:StaticPopup_Show('CONFIG_RL') end,
							},
						},
					},
				},
			},
			unitframes = {
				type = 'group',
				name = L["Unitframes"],
				order = 85,
				childGroups = "tab",
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\unitframes',
				args = {
					general = {
						type = 'group',
						name = L["General"],
						order = 1,
						args = {
							enableUFmod = {
								order = 1,
								type = 'toggle',
								width = "full",
								name = L["Enable Unitframe Modifications"],
								desc = L["Enable changing textures and gradients for ElvUI unitframes"],
								get = function() return E.db.ElvUI_EltreumUI.UFmodifications end,
								set = function(_, value) E.db.ElvUI_EltreumUI.UFmodifications = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							uftypeselect = {
								type = "description",
								name = L["Choose between custom textures or gradient mode"],
								order = 2,
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							unitframesenable = {
								order = 3,
								name = L["Enable Custom Textures"],
								type = "toggle",
								desc = L["Requires Light Mode Enabled"],
								width = 'full',
								disabled = function() return E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.ufcustomtexture.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							enablegradient = {
								order = 3,
								type = 'toggle',
								name = L["Enable Gradient (Requires Dark or Light Modes)"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								disabled = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.enable or not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							darklightmode = {
								order = 96,
								type = "description",
								name = L["Change the look of frames to Dark or Light mode"],
								width = "full",
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							dark = {
								order = 97,
								type = 'toggle',
								name = L["Dark Mode"],
								width = 'full',
								desc = L["This will set colors to black with class colors when losing health"],
								disabled = function() return E.db.ElvUI_EltreumUI.lightmode or not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.darkmode end,
								set = function(_, value) E.db.ElvUI_EltreumUI.darkmode = value end,
							},
							light = {
								order = 97,
								type = 'toggle',
								name = L["Light Mode"],
								width = 'full',
								desc = L["This will set colors to class based with black backgrounds when losing health"],
								disabled = function() return E.db.ElvUI_EltreumUI.darkmode or not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.lightmode end,
								set = function(_, value) E.db.ElvUI_EltreumUI.lightmode = value end,
							},
							applymode = {
								order = 98,
								type = 'execute',
								name = L["Apply"],
								--width = 'full',
								desc = L["Apply the mode selected"],
								disabled = function() return (not E.db.ElvUI_EltreumUI.UFmodifications) or (not (E.db.ElvUI_EltreumUI.lightmode or E.db.ElvUI_EltreumUI.darkmode)) end,
								func = function()
									if E.db.ElvUI_EltreumUI.lightmode == true then
										ElvUI_EltreumUI:LightMode()
										E:StaggeredUpdateAll(nil, true)
									elseif E.db.ElvUI_EltreumUI.darkmode == true then
										ElvUI_EltreumUI:DarkMode()
										E:StaggeredUpdateAll(nil, true)
									end
								end,
								--confirm = true,
							},
							headeruftextv = {
								order = 99,
								type = "description",
								name= L["Light Mode Texture Version"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							textureselect = {
								type = 'select',
								name= "",
								--desc = L["Choose the direction of the gradient"],
								order = 100,
								values = {
									["V1"] = L["Version 1"],
									["V2"] = L["Version 2"],
									["V3"] = L["Version 3"],
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.uftextureversion end,
								set = function(_, value) E.db.ElvUI_EltreumUI.uftextureversion = value E:StaticPopup_Show('CONFIG_RL') end,
							},

							headerorientation = {
								order = 101,
								type = "description",
								name = E.NewSign..L["Unitframe Fill Orientation"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							setorientation = {
								type = 'select',
								name = "",
								order = 102,
								values = {
									["HORIZONTAL"] = L["Horizontal"],
									["VERTICAL"] = L["Vertical"],
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.UForientation end,
								set = function(_, value) E.db.ElvUI_EltreumUI.UForientation = value end,
							},
							headerufbackdrop = {
								order = 984,
								type = "description",
								name = L["Backdrops"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							backdrophide = {
								order = 985,
								type = 'toggle',
								width = "full",
								name = E.NewSign..L["Hide Backdrop"],
								desc = L["Sets the Backdrop as Transparent/Hidden"],
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.backdrophidden end,
								set = function(_, value) E.db.ElvUI_EltreumUI.ufcustomtexture.backdrophidden = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							ufbackdropTex = {
								order = 986,
								type = 'select',
								--width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Backdrop Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.backdroptexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.backdroptexture = key end,
							},
							ufbackdropTexalpha = {
								type = 'range',
								name = L["Backdrop Alpha"],
								desc = L["Change the transparency of the backdrop"],
								order = 987,
								min = 0,
								max = 1,
								step = 0.01,
								--width = "full",
								disabled = function() return not E.db.ElvUI_EltreumUI.UFmodifications end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.backdropalpha end,
								set = function(_, value) E.db.ElvUI_EltreumUI.ufcustomtexture.backdropalpha = value end,
							},
							darkpowerdesc = {
								order = 988,
								type = "description",
								name = L["Change the Class Power background"],
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = "full",
							},
							darkpowerenable = {
								order = 989,
								type = 'toggle',
								width = "full",
								name = L["Dark Power Background"],
								desc = L["Sets Class Power backgrounds to be black"],
								get = function() return E.db.ElvUI_EltreumUI.darkpowercolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.darkpowercolor = value end,
							},
							header8898 = {
								order = 990,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							castbarspark = {
								order = 991,
								type = "description",
								name = L["Customize the player castbar spark"],
								width = "full",
							},
							castbarsparkenable = {
								order = 992,
								type = 'toggle',
								name = L["Enable"],
								width = "full",
								desc = L["Customize Player CastBar Spark"],
								get = function() return E.db.ElvUI_EltreumUI.sparkcustomcolor.enable end,
								set = function(_, value) E.db.ElvUI_EltreumUI.sparkcustomcolor.enable = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							colorspark = {
								order = 993,
								type = 'color',
								name = L["Custom Color"],
								hasAlpha = false,
								disabled = function() return not E.db.ElvUI_EltreumUI.sparkcustomcolor.enable end,
								get = function()
									local glowcustomcolor = E.db.ElvUI_EltreumUI.sparkcustomcolor
									local d = P.ElvUI_EltreumUI.sparkcustomcolor
									return glowcustomcolor.r, glowcustomcolor.g, glowcustomcolor.b, glowcustomcolor.a, d.r, d.g, d.b, d.a
								end,
								set = function(_, r, g, b, a)
									local glowcustomcolor = E.db.ElvUI_EltreumUI.sparkcustomcolor
									glowcustomcolor.r, glowcustomcolor.g, glowcustomcolor.b = r, g, b E:StaticPopup_Show('CONFIG_RL')
								end,
							},
							sparktexture = {
								order = 993,
								type = 'select',
								--width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = E.NewSign..L["Spark Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.sparkcustomcolor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.sparkcustomcolor.texture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.sparkcustomcolor.texture = key end,
							},
							sparkwidth = {
								type = 'range',
								name = E.NewSign..L["Width"],
								desc = L["Set Width of the Spark (Default 3)"],
								order = 994,
								min = 1,
								max = 20,
								step = 1,
								--width = "double",
								disabled = function() return not E.db.ElvUI_EltreumUI.sparkcustomcolor.enable end,
								get = function() return E.db.ElvUI_EltreumUI.sparkcustomcolor.width end,
								set = function(_, value) E.db.ElvUI_EltreumUI.sparkcustomcolor.width = value E:StaticPopup_Show('CONFIG_RL') end,
							},
							headergaphere = {
								order = 995,
								type = "description",
								name = L["Alternative unitframe layouts"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							layoutdescriptiongap = {
								order = 996,
								type = 'description',
								name = "",
								width = "full",
							},
							layoutdescription = {
								order = 997,
								type = 'description',
								fontSize = 'medium',
								name = L["DPS/Tank layouts were created with pure dps classes in mind, if you play a class with more raid cooldowns like a Shaman, Druid or Paladin you might want to use the alternative layout in order to make it easier for you to use your cooldowns on the members of your group"],
							},
							alternativegroups = {
								order = 998,
								type = 'execute',
								name = L["Alternative Layout"],
								func = function() ElvUI_EltreumUI:AlternativeGroupsDPS() end,
							},
							originalgroups = {
								order = 999,
								type = 'execute',
								name = L["Original Layout"],
								func = function() ElvUI_EltreumUI:OriginalGroupsDPS() end,
							},
						},
					},
					textures = {
						type = 'group',
						name = L["Textures"],
						order = 2,
						disabled = function() return E.db.ElvUI_EltreumUI.gradientmode.enable or not E.db.ElvUI_EltreumUI.UFmodifications or not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
						args = {
							unitframesdesc = {
								order = 102,
								type = "description",
								name = L["Customize Unitframe textures"],
								desc = L["Choose custom textures for some unitframes"],
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
								width = 'full',
							},
							classdetect = {
								order = 103,
								name = L["Automatically Detect Classes for Player, Target, Target of Target and Focus"],
								type = "toggle",
								desc = L["Use the custom texture based on it's class instead of general texture for Player, Target, Target of Target and Focus"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.classdetect end,
								set = function(_, value) E.db.ElvUI_EltreumUI.ufcustomtexture.classdetect = value end,
							},
							playertexture = {
								order = 104,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Player Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.playertexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.playertexture = key ElvUI_EltreumUI:GradientCustomTexture() end,
							},
							castbartex = {
								order = 105,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Player Castbar Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.castbartexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.castbartexture = key end,
							},
							targettexture = {
								order = 106,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Target Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.targettexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.targettexture = key end,
							},
							targettargettexture = {
								order = 107,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Target of Target Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.targettargettexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.targettargettexture = key end,
							},
							targettargettargettexture = {
								order = 107,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Target of Target of Target Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.targettargettargettexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.targettargettargettexture = key end,
							},
							focustexture = {
								order = 108,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Focus Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								hidden = function() if E.Classic then return true else return false end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.focustexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.focustexture = key end,
							},
							headerclasses = {
								order = 109,
								type = "description",
								name = L["Class Textures"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							dktexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Death Knight"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								hidden = function() if E.Retail or E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.deathknighttexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.deathknighttexture = key end,
							},
							dhtexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Demon Hunter"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.demonhuntertexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.demonhuntertexture = key end,
							},
							druidtexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Druid"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.druidtexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.druidtexture = key end,
							},
							huntertexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Hunter"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.huntertexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.huntertexture = key end,
							},
							magetexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Mage"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.magetexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.magetexture = key end,
							},
							monktexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Monk"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.monktexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.monktexture = key end,
							},
							paladintexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Paladin"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.paladintexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.paladintexture = key end,
							},
							priesttexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Priest"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.priesttexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.priesttexture = key end,
							},
							roguetexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Rogue"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.roguetexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.roguetexture = key end,
							},
							shamantexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Shaman"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.shamantexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.shamantexture = key end,
							},
							warlocktexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Warlock"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.warlocktexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.warlocktexture = key end,
							},
							warriortexture = {
								order = 110,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Warrior"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.warriortexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.warriortexture = key end,
							},
							npcfriendlytexture = {
								order = 111,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Friendly NPC"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.npcfriendly end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.npcfriendly = key end,
							},
							npcneutraltexture = {
								order = 111,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Neutral NPC"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.npcneutral end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.npcneutral = key end,
							},
							npcunfriendlytexture = {
								order = 111,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Unfriendly NPC"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.npcunfriendly end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.npcunfriendly = key end,
							},
							npchostiletexture = {
								order = 111,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Hostile NPC"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.npchostile end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.npchostile = key end,
							},
							tappedtexture = {
								order = 111,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Tapped NPC"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.ufcustomtexture.enable end,
								get = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.tappedtexture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.ufcustomtexture.tappedtexture = key end,
							},
						},
					},
					gradient = {
						type = "group",
						name = L["Gradient"],
						order = 3,
						disabled = function() return E.db.ElvUI_EltreumUI.ufcustomtexture.enable or not E.db.ElvUI_EltreumUI.UFmodifications or not E.db.ElvUI_EltreumUI.gradientmode.enable end,
						args = {
							header1 = {
								order = 1,
								type = "description",
								name = L["Gradient Colors"],
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
							},
							enableplayer = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Player"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enableplayer end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enableplayer = value end,
							},
							enabletarget = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Target"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enabletarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enabletarget = value end,
							},
							enabletargettarget = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Target of Target"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enabletargettarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enabletargettarget = value end,
							},
							enabletargettargettarget = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Target of Target of Target"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enabletargettargettarget end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enabletargettargettarget = value end,
							},
							enablefocus = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Focus"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								hidden = function() if E.Retail or E.TBC or E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enablefocus end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enablefocus = value end,
							},
							enableboss = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Boss"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								hidden = function() if E.Retail then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enableboss end,
								set = function(_, value)
									E.db.ElvUI_EltreumUI.gradientmode.enableboss = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss1 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss2 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss3 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss4 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss5 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss6 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss7 = value
									E.db.ElvUI_EltreumUI.gradientmode.enableboss8 = value
								end,
							},
							enablearena = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Arena"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								hidden = function() if E.Retail or E.TBC or E.Wrath then return false else return true end end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enablearena end,
								set = function(_, value)
									E.db.ElvUI_EltreumUI.gradientmode.enablearena = value
									E.db.ElvUI_EltreumUI.gradientmode.enablearena1 = value
									E.db.ElvUI_EltreumUI.gradientmode.enablearena2 = value
									E.db.ElvUI_EltreumUI.gradientmode.enablearena3 = value
									E.db.ElvUI_EltreumUI.gradientmode.enablearena4 = value
									E.db.ElvUI_EltreumUI.gradientmode.enablearena5 = value
								end,
							},
							enablegroupunits = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Group Units"],
								desc = L["Enable Gradient colors for Health"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enablegroupunits end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enablegroupunits = value end,
							},
							enablecastbargradient = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Player Castbar"],
								desc = L["Enable Gradient colors for Player Castbar"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbar = value end,
							},
							enablecastbargradientnoninterruptplayer = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Player Castbar (Non Interruptible)"],
								desc = L["Enable Gradient colors for Player Castbar (Non Interruptible)"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarnoninterruptible end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarnoninterruptible = value end,
							},
							enablecastbargradientinterruptedplayer = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Player Castbar (Interrupted)"],
								desc = L["Enable Gradient colors for Player Castbar (Interrupted)"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarinterrupted end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarinterrupted = value end,
							},
							enabletargetcastbargradient = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Target Castbar"],
								desc = L["Enable Gradient colors for Target Castbar"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbar end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbar = value end,
							},
							enablecastbargradientnoninterrupttarget = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Target Castbar (Non Interruptible)"],
								desc = L["Enable Gradient colors for Target Castbar (Non Interruptible)"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarnoninterruptible end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarnoninterruptible = value end,
							},
							enablecastbargradientinterruptedtarget = {
								order = 2,
								type = 'toggle',
								name = L["Enable for Target Castbar (Interrupted)"],
								desc = L["Enable Gradient colors for Target Castbar (Interrupted)"],
								width = 'full',
								--disabled = function() return true end,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarinterrupted end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarinterrupted = value end,
							},
							enablecustomcolor = {
								order = 3,
								type = 'toggle',
								name = L["Custom Color"],
								desc = L["Enable Custom Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.customcolor end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.customcolor = value ElvUI_EltreumUI:GradientColorTableUpdate() end,
							},
							opengradientcolors = {
								order = 4,
								type = 'execute',
								name = L["Colors"],
								width = 'full',
								desc = L["Customize Colors"],
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								func = function() E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'ElvUI_EltreumUI', "gradient") end,
							},
							gradientorientation = {
								type = 'select',
								name = L["Gradient Orientation"],
								desc = L["Choose the direction of the gradient"],
								order = 5,
								values = {
									["HORIZONTAL"] = L["Horizontal"],
									["VERTICAL"] = L["Vertical"],
								},
								style = 'radio',
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.orientation end,
								set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.orientation = value end,
							},
							gradienttexture = {
								order = 6,
								type = 'select',
								width = "double",
								dialogControl = 'LSM30_Statusbar',
								name = L["Gradient Texture"],
								desc = L["Select a Texture"],
								values = AceGUIWidgetLSMlists.statusbar,
								disabled = function() return not E.db.ElvUI_EltreumUI.gradientmode.enable end,
								get = function() return E.db.ElvUI_EltreumUI.gradientmode.texture end,
								set = function(self,key) E.db.ElvUI_EltreumUI.gradientmode.texture = key ElvUI_EltreumUI:GradientCustomTexture() end,
							},

						}
					},
				},
			},
			weakauras = {
				type = 'group',
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\weakauras',
				name = L["WeakAuras"],
				order = 95,
				args = {
					header1 = {
						order = 1,
						type = 'header',
						name = 'WeakAuras',
					},
					explain1 = {
						order = 2,
						type = "description",
						name = L["You can set your Weakauras to anchor to custom locations making it easier to move them"],
					},
					explain2 = {
						order = 3,
						type = "description",
						name = L["In order to use this feature, simply go to your Weakaura, and go to its Group options, scroll down to Position Settings and set the Anchored To Select Frame, then type either |cff82B4ffEltruismWA|r or |cff82B4ffEltruismConsumablesWA|r to anchor the weakaura to the preset location"],
					},
					explain3 = {
						order = 4,
						type = "description",
						name = L["Setting "].."|cff82B4ffEltruismWA|r"..L[" or "].."|cff82B4ffEltruismConsumablesWA|r"..L[" as the anchor will move them to the locations, keep in mind you might need to change the X and Y offset of the weakaura to zero"],
					},
					explainer1 = {
						order = 5,
						type = "group",
						name = L["How to use the Anchors"],
						inline = true,
						args = {
							addaspaceher544e = {
								order = 86,
								type = "description",
								name = '',
							},
							explainer7 = {
								order = 87,
								type = "description",
								name = L["Open WeakAuras, go to your group Weakauras and in Group change Position Settings > Anchored To > Select Frame > EltruismWA or EltruismConsumablesWA"],
							},
							demopic = {
								order = 98,
								type = "description",
								name = "",
								width = 'full',
								image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\WADemo', 512, 1024 end,
							},
						},
					},
				},
			},
			discord = {
				type = 'group',
				name = 'Discord',
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\discord',
				order = 96,
				args = {
					logodiscord = {
						type = 'description',
						name = "",
						order = 1,
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\disc', 256, 128 end,
					},
					explainer8 = {
						order = 2,
						type = "description",
						name = L["Join the Discord if you have any questions or issues"],
					},
					addaspacehere4 = {
						order = 3,
						type = "description",
						name = L["Keep in mind the discord is in English"],
					},
					discordinvitelink = {
						order = 19,
						type = 'input',
						width = 'full',
						name = '',
						get = function() return 'https://discord.gg/rBXNxUY6pk' end,
					},
				},
			},
			credits = {
				type = 'group',
				name = L["Credits"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\credits',
				order = 97,
				args = {
					author = {
						order = 1,
						type = 'group',
						inline = true,
						name = L["Author"],
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = AUTHORS_STRING,
							},
						},
					},
					thankyou = {
						order = 2,
						type = 'group',
						inline = true,
						name = L["Credits and Thank yous"],
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = THANKYOU_STRING,
							},
						},
					},
					supporters = {
						order = 3,
						type = 'group',
						inline = true,
						name = "Supporters",
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = SUPPORTER_STRING,
							},
						},
					},
					translators = {
						order = 4,
						type = 'group',
						inline = true,
						name = "Translators",
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = TRANSLATORS_STRING,
							},
						},
					},
					licensewarning = {
						order = 99,
						type = 'group',
						inline = true,
						name = L["License"],
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = function()
									if E.Retail then
										return 'Cursor is a fork of CastCursor by michaelsp which licensed under GNU GPLv3\nCursor Cooldowns is a fork of CooldownToGo by mitchnull which is licensed under Public Domain\nExpand Hunter Stables is merged from Improved Stable Frame by Cybeloras which is licensed under GNU GPLv3\nIcons8 (www.icons8.com) for some of the icons. List in license.txt\nLootText is a fork of SLoTe from xavjer which is licensed under GNU GPLv3\nRogue Door Opener is a fork of Rogue Door Opener by Burzolog which licensed under GNU GPLv3\nLoot Icons are merged from Chat Loot Icons by Stanzilla which is licensed under Public Domain\nQuest Items is a merge of QBar by Aezay, which is licensed under GNU GPLv3'
									else
										return 'Cursor is a fork of CastCursor by michaelsp which licensed under GNU GPLv3\nCursor Cooldowns is a fork of CooldownToGo by mitchnull which is licensed under Public Domain\nIcons8 (www.icons8.com) for some of the icons. List in license.txt\nLootText is a fork of SLoTe from xavjer which is licensed under GNU GPLv3\nLoot Icons are merged from Chat Loot Icons by Stanzilla which is licensed under Public Domain\nThe Item Level shown on the Character Panel Skin uses code from Simple Item level by Kemayo, licensed under BSD\nQuest Items is a merge of QBar by Aezay, which is licensed under GNU GPLv3\nSockets and Enchants is a fork of Kibs Item Levels by Kibsgaard which is licensed under Public Domain'
									end
								end,
							},
						},
					},
				},
			},
			support = {
				type = 'group',
				name = L["Support"],
				icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\support',
				order = 98,
				args = {
					gitlink = {
						order = 1,
						type = 'input',
						width = 'full',
						name = L["Changelog"],
						get = function() return 'https://github.com/eltreum0/eltruism/blob/main/Changelog.md' end,
					},
					issues = {
						order = 2,
						type = 'input',
						width = 'full',
						name = L["Report issues and problems here:"],
						get = function() return 'https://github.com/eltreum0/eltruism/issues' end,
					},
					tukui = {
						order = 3,
						type = 'input',
						width = 'full',
						name = L["Addon on Tukui:"],
						get = function()
							if E.Retail then
								return 'https://www.tukui.org/addons.php?id=209'
							elseif E.Wrath then
								return 'https://www.tukui.org/addons.php?id=209'
							elseif E.TBC then
								return 'https://www.tukui.org/classic-tbc-addons.php?id=10'
							elseif E.Classic then
								return 'https://www.tukui.org/classic-addons.php?id=49'
							end
						end,
					},
					curse = {
						order = 4,
						type = 'input',
						width = 'full',
						name = L["Addon on CurseForge:"],
						get = function() return 'https://www.curseforge.com/wow/addons/elvui-eltruism' end,
					},
					wago = {
						order = 5,
						type = 'input',
						width = 'full',
						name = L["Addon on Wago:"],
						get = function() return 'https://addons.wago.io/addons/elvui-eltruism' end,
					},
				},
			},
		},
	}
	for _, func in pairs(ElvUI_EltreumUI.Config) do
		func()
	end
end

--in case i split options into modules
--[[
tinsert(ElvUI_EltreumUI.Config, function()
	E.Options.args.ElvUI_EltreumUI.args.NAMEOFOPTION = {
		type = 'group',
		name = "SOME NAME HERE",
		icon = 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Icons\\aurafilter',
		childGroups = "tab",
		order = 15,
		args = {
			someoption = {
			},
		},
	}
end)
]]
