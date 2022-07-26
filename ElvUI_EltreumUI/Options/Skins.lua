local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))

function ElvUI_EltreumUI:SkinsOptions()
	local skins = {
		order = 85,
		type = 'group',
		name = "Skins",
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
						desc = L["Only loads when Questie is not enabled"],
						width = 'full',
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
					showwowhead = {
						order = 37,
						name = L["Enable Wowhead Button"],
						type = "toggle",
						desc = L["Show a button for Wowhead quest links"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.skins.questswowhead end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.questswowhead = value E:StaticPopup_Show('CONFIG_RL') end,
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
					professionskins = {
						order = 46,
						type = "description",
						name = L["Skin Profession Frame"],
						width = 'full',
					},
					professionenable = {
						order = 47,
						name = L["Enable"],
						type = "toggle",
						desc = L["Skin the Profession/Tradeskill Frame"],
						width = 'full',
						get = function() return E.db.ElvUI_EltreumUI.skins.professions end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.professions = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header64546 = {
						order = 48,
						type = "description",
						name = L["Add a Level Up toast"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					skinenable = {
						order = 49,
						type = 'toggle',
						name = L["Enable"],
						desc = L["Enable a toast showing up when you level up"],
						get = function() return E.db.ElvUI_EltreumUI.skins.enable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.enable = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					tbctalentinfo = {
						order = 50,
						type = "description",
						name = L["Expand the Talents to show the entire tree"],
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
						width = "full",
					},
					tbctalents = {
						order = 51,
						type = 'toggle',
						name = L["Expanded Talents"],
						desc = L["Expand Talents to cover the full tree"],
						get = function() return E.db.ElvUI_EltreumUI.tbctalents.enable end,
						set = function(_, value) E.db.ElvUI_EltreumUI.tbctalents.enable = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header8898 = {
						order = 52,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					gradientxp = {
						order = 53,
						type = "description",
						name = L["Add a gradient color to the Experience Bar"],
						width = "full",
					},
					gradientxpenable = {
						order = 54,
						type = 'toggle',
						name = L["Enable"],
						get = function() return E.db.ElvUI_EltreumUI.gradientmode.gradientXP end,
						set = function(_, value) E.db.ElvUI_EltreumUI.gradientmode.gradientXP = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					headerroleicon = {
						order = 55,
						type = "description",
						name = L["Replace role icons with Eltruism role icons"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					roleiconsenable = {
						order = 56,
						type = 'toggle',
						name = L["Enable"],
						get = function() return E.db.ElvUI_EltreumUI.otherstuff.eltruismroleicons end,
						set = function(_, value) E.db.ElvUI_EltreumUI.otherstuff.eltruismroleicons = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					otherskins = {
						order = 98,
						type = "description",
						name = L["Other Skins"],
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
						width = "full",
					},
					meetinghorn = {
						order = 99,
						type = 'toggle',
						name = L["Skin MeetingHorn"],
						desc = L["Skin MeetingHorn"],
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
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					anchorgapheresocket = {
						order = 2,
						type = "description",
						name = "",
						width = 'full',
					},
					socketsonchar = {
						order = 3,
						type = 'toggle',
						name = L["Add Sockets and Enchants to the Character Panel"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.sockets end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.sockets = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					socketsoninspect = {
						order = 4,
						type = 'toggle',
						name = L["Add Sockets and Enchants to the Inspect Frame"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.socketsinspect end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.socketsinspect = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					headerfirst = {
						order = 80,
						type = "description",
						name = L["Item Levels"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					anchorgaphere = {
						order = 81,
						type = "description",
						name = "",
						width = 'full',
					},
					skincharpanel = {
						order = 82,
						type = 'toggle',
						name = L["Add Item Levels to the Character Panel"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.ilvls end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.ilvls = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					inspectilvl = {
						order = 82,
						type = 'toggle',
						name = L["Add Item Levels to the Inspect Panel"],
						width = 'full',
						desc = L["Enable this option"],
						disabled = function() return not E.db.ElvUI_EltreumUI.skins.ilvls end,
						get = function() return E.db.ElvUI_EltreumUI.skins.ilvlsinspect end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.ilvlsinspect = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header831 = {
						order = 83,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					ilvlanchor = {
						order = 84,
						type = 'select',
						name = L["Ilvl Anchor Point"],
						desc = L["Choose where the Ilvl will be attach to on the items"],
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
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					ilvlfontweight = {
						order = 86,
						type = 'select',
						name = L["Ilvl Font Outline"],
						desc = L["Choose the Ilvl font outline"],
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
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					ilvlfontsize = {
						type = 'range',
						name = L["Ilvl Font Size"],
						desc = L["Change the Ilvl font size"],
						order = 88,
						min = 4,
						max = 72,
						step = 1,
						width = "full",
						disabled = function() return not E.db.ElvUI_EltreumUI.skins.ilvls end,
						get = function() return E.db.ElvUI_EltreumUI.skins.ilvlfontsize end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.ilvlfontsize = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					headergapart = {
						order = 89,
						type = "description",
						name = L["Character Panel"],
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					expandamory = {
						order = 90,
						type = 'toggle',
						name = L["Expand Character Panel"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.classicarmory end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.classicarmory = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header843 = {
						order = 91,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					autoarmorystats = {
						order = 92,
						type = 'toggle',
						name = L["Automatically swap the Character Stats to your main ones"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.classicarmoryautostats end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.classicarmoryautostats = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header844 = {
						order = 93,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					statcolors = {
						order = 96,
						type = 'toggle',
						name = L["Add Class Gradient Colors to Stats"],
						width = 'full',
						desc = L["Enable this option"],
						disabled = function() return not E.db.ElvUI_EltreumUI.skins.classicarmory end,
						get = function() return E.db.ElvUI_EltreumUI.skins.statcolors end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.statcolors = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					expandart = {
						order = 97,
						type = 'toggle',
						name = L["Expand Character Art"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.expandarmorybg end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandarmorybg = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					expandartcrest = {
						order = 98,
						type = 'toggle',
						name = L["Add Crest to Character Panel"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.expandarmorycrest end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandarmorycrest = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					expandartalpha = {
						type = 'range',
						name = L["Art Alpha"],
						desc = L["Change the transparency of the Art"],
						order = 99,
						min = 0.01,
						max = 1,
						step = 0.01,
						width = "full",
						disabled = function() return not E.db.ElvUI_EltreumUI.skins.expandarmorybg end,
						get = function() return E.db.ElvUI_EltreumUI.skins.expandarmorybgalpha end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.expandarmorybgalpha = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					header845 = {
						order = 196,
						type = "description",
						name = "",
						width = 'full',
						image = function() return 'Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\EltreumHeader', 3240, 1 end,
					},
					iconsoncharacter = {
						order = 197,
						type = 'toggle',
						name = L["Add Class Icons to Character Panel"],
						width = 'full',
						desc = L["Enable this option"],
						get = function() return E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					blizzicons = {
						order = 198,
						type = 'toggle',
						name = L["Use Blizzard Icons"],
						width = 'full',
						desc = L["Enable Blizzard Icons"],
						disabled = function() return not E.db.ElvUI_EltreumUI.skins.classiconsoncharacterpanel or E.db.ElvUI_EltreumUI.skins.classiconsreleaf end,
						get = function() return E.db.ElvUI_EltreumUI.skins.classiconsblizz end,
						set = function(_, value) E.db.ElvUI_EltreumUI.skins.classiconsblizz = value E:StaticPopup_Show('CONFIG_RL') end,
					},
					releaficons= {
						order = 199,
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
	}
	return skins
end
