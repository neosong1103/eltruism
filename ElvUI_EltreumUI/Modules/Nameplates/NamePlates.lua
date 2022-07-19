local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local NP = E:GetModule('NamePlates')
local UF = E:GetModule('UnitFrames')
local LCG = E.Libs.CustomGlow
local classcolor = E:ClassColor(E.myclass, true)
local glowcolor

-- Different Debuffs/Buffs on nameplates
local ONUPDATE_INTERVAL = 0.1
function ElvUI_EltreumUI:PostUpdateIconDebuff(unit, button)
	if E.db.ElvUI_EltreumUI.glow.colorclass then
		glowcolor = {classcolor.r, classcolor.g, classcolor.b, 1}
	else
		glowcolor = {E.db.ElvUI_EltreumUI.glowcustomcolornp.r, E.db.ElvUI_EltreumUI.glowcustomcolornp.g, E.db.ElvUI_EltreumUI.glowcustomcolornp.b, 1}
	end
	if button and button.spellID then
		if not string.find(unit, "nameplate") then
			return
		else
			if E.db.ElvUI_EltreumUI.widenameplate.enable then
				button.icon:SetTexCoord(0.07, 0.93, 0.21, 0.79)
			end
			button.cd:SetFrameStrata('DIALOG')
			local TimeSinceLastUpdate = 0
			if not button.cd then
				LCG.PixelGlow_Stop(button)
			else
				button.cd:SetScript('OnUpdate', function(self, elapsed)
					TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
					if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
						TimeSinceLastUpdate = 0
						--print("np button spam "..math.random(1,99))
						if button.cd.timer then
							if E.db.ElvUI_EltreumUI.widenameplate.enable then
								button.cd.timer.text:ClearAllPoints()
								button.cd.timer.text:Point("TOP", button.icon, "TOP", 0, 5)
							end
							local _, g, b, a = button.cd.timer.text:GetTextColor()
							if E.db.ElvUI_EltreumUI.widenameplate.npglow then
								if ((g < 0.2 and g > 0.19) or (b < 0.2 and b > 0.19)) and a > 0.5 and button.cd.timer.text then
									--0.1999995559454 0.1999995559454
									LCG.PixelGlow_Start(button, glowcolor, 6, 0.8, 4, 2, 1, 1, false, nil)
								else
									LCG.PixelGlow_Stop(button)
								end
							end
						else
							if E.db.ElvUI_EltreumUI.widenameplate.npglow and (button.cd == nil or button.cd.timer == nil)then
								LCG.PixelGlow_Stop(button)
							end
						end
					end
				end)
			end
			button.count:SetParent(button.cd)
			if E.TBC or E.Classic then
				if E.db.ElvUI_EltreumUI.widenameplate.enable then
					button.count:Point('BOTTOMRIGHT', 2, -3) --elvui added a setting for it but its missing some things
				end
			end
		end
	end
	if UnitExists(unit) then
		UF.PostUpdateAura(self, unit, button) --error? TexCoord out of range (mostly in vehicles)
	end
end

function ElvUI_EltreumUI:PostUpdateIconBuff(unit, button)
	if button and button.spellID then
		if not string.find(unit, "nameplate") then
			return
		else
			button.icon:SetTexCoord(0.07, 0.93, 0.21, 0.79)
			local TimeSinceLastUpdate = 0
			button.cd:SetScript('OnUpdate', function(self, elapsed)
			TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
				if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
					TimeSinceLastUpdate = 0
					if button.cd.timer then
						button.cd.timer.text:ClearAllPoints()
						button.cd.timer.text:SetDrawLayer('OVERLAY',1)
						button.cd.timer.text:Point("TOP", button.icon, "TOP", 0, 5)
					end
				end
			end)
			button.count:SetParent(button.cd)
			button.count:Point('BOTTOMRIGHT', 2, -3)
		end
	end
	if UnitExists(unit) then
		UF.PostUpdateAura(self, unit, button) --error? TexCoord out of range (mostly in vehicles)
	end
end

function ElvUI_EltreumUI:Construct_Auras(nameplate)
	if E.private.nameplates.enable == true and (E.db.ElvUI_EltreumUI.widenameplate.enable or E.db.ElvUI_EltreumUI.widenameplate.npglow) then
		nameplate.Buffs.PostUpdateIcon = ElvUI_EltreumUI.PostUpdateIconBuff
		nameplate.Debuffs.PostUpdateIcon = ElvUI_EltreumUI.PostUpdateIconDebuff
	end
end
hooksecurefunc(NP, "Construct_Auras", ElvUI_EltreumUI.Construct_Auras)

--for general nameplates
local playerclassv1 = {
	["WARRIOR"] = "Eltreum-Class-Warrior",
	["PALADIN"] = "Eltreum-Class-Paladin",
	["HUNTER"] = "Eltreum-Class-Hunter",
	["ROGUE"] = "Eltreum-Class-Rogue",
	["PRIEST"] = "Eltreum-Class-Priest",
	["DEATHKNIGHT"] = "Eltreum-Class-DeathKnight",
	["SHAMAN"] = "Eltreum-Class-Paladin", -- issues becoming green due to color mixing so color changed to paladin from "Eltreum-Class-Shaman"
	["MAGE"] = "Eltreum-Class-Paladin", -- issues becoming green due to color mixing so color changed to paladin from "Eltreum-Class-Mage"
	["WARLOCK"] = "Eltreum-Class-Warlock",
	["MONK"] = "Eltreum-Class-Monk",
	["DRUID"] = "Eltreum-Class-Druid",
	["DEMONHUNTER"] = "Eltreum-Class-DemonHunter",
}

local playerclassv2 = {
	["WARRIOR"] = "Eltreum-Class-WarriorV2",
	["PALADIN"] = "Eltreum-Class-PaladinV2",
	["HUNTER"] = "Eltreum-Class-HunterV2",
	["ROGUE"] = "Eltreum-Class-RogueV2",
	["PRIEST"] = "Eltreum-Class-PriestV2",
	["DEATHKNIGHT"] = "Eltreum-Class-DeathKnightV2",
	["SHAMAN"] = "Eltreum-Class-ShamanV2",
	["MAGE"] = "Eltreum-Class-MageV2",
	["WARLOCK"] = "Eltreum-Class-WarlockV2",
	["MONK"] = "Eltreum-Class-MonkV2",
	["DRUID"] = "Eltreum-Class-DruidV2",
	["DEMONHUNTER"] = "Eltreum-Class-DemonHunterV2",
}

-- for rare nameplates
local rareclass = {
	["WARRIOR"] = "Eltreum-Class-Warrior",
	["PALADIN"] = "Eltreum-Class-Paladin",
	["HUNTER"] = "Eltreum-Class-Hunter",
	["ROGUE"] = "Eltreum-Class-Rogue",
	["PRIEST"] = "Eltreum-Class-Priest",
	["DEATHKNIGHT"] = "Eltreum-Class-DeathKnight",
	["SHAMAN"] = "Eltreum-Class-Shaman",
	["MAGE"] = "Eltreum-Class-Mage",
	["WARLOCK"] = "Eltreum-Class-Warlock",
	["MONK"] = "Eltreum-Class-Monk",
	["DRUID"] = "Eltreum-Class-Druid",
	["DEMONHUNTER"] = "Eltreum-Class-DemonHunter",
}

local nameplateclasscolors

-- Nameplate options for Border and Glow and Texture
function ElvUI_EltreumUI:NamePlateOptions()
	nameplateclasscolors = E:ClassColor(E.myclass, true)
	if E.private.nameplates.enable then
		if E.db.ElvUI_EltreumUI.nameplateOptions.ClassColorGlow then
			E.db["nameplates"]["colors"]["glowColor"]["b"] = nameplateclasscolors.b
			E.db["nameplates"]["colors"]["glowColor"]["r"] = nameplateclasscolors.r
			E.db["nameplates"]["colors"]["glowColor"]["g"] = nameplateclasscolors.g
		end
		if E.db.ElvUI_EltreumUI.nameplateOptions.ClassBorderNameplate then
			E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["border"] = true
			E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["b"] = nameplateclasscolors.b
			E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["g"] = nameplateclasscolors.g
			E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["r"] = nameplateclasscolors.r
			if E.global.nameplates.filters.EltreumRare then
				if E.db["nameplates"]["filters"]["EltreumRare"]["triggers"]["enable"] == true then
					E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["border"] = true
					E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["borderColor"]["b"] = nameplateclasscolors.b
					E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["borderColor"]["g"] = nameplateclasscolors.g
					E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["borderColor"]["r"] = nameplateclasscolors.r
				end
			end
		else
			E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["border"] = false
		end
		if E.db.ElvUI_EltreumUI.nameplateOptions.nameplatetexture then
			if E.db.ElvUI_EltreumUI.nptextureversion == "V1" then
				E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = (playerclassv1[E.myclass])
			elseif E.db.ElvUI_EltreumUI.nptextureversion == "V2" then
				E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = (playerclassv2[E.myclass])
			end
			if E.global.nameplates.filters.EltreumRare then
				E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["texture"]["texture"] = (rareclass[E.myclass])
			end
		end
		if E.db.ElvUI_EltreumUI.nameplateOptions.targetclasstexture then
			local _, targetclass = UnitClass("target")
			local reactiontarget = UnitReaction("player", "target")
			if UnitExists("target") then
				if targetclass and UnitIsPlayer("target") then
					if E.db.ElvUI_EltreumUI.nptextureversion == "V1" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = (playerclassv1[E.myclass])
					elseif E.db.ElvUI_EltreumUI.nptextureversion == "V2" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = (playerclassv2[E.myclass])
					end
				elseif ( UnitIsPlayer("target") == false and ( reactiontarget >= 5) ) then
					if E.db.ElvUI_EltreumUI.nptextureversion == "V1" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-Hunter"
					elseif E.db.ElvUI_EltreumUI.nptextureversion == "V2" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-HunterV2"
					end
				elseif reactiontarget == 4 then
					if E.db.ElvUI_EltreumUI.nptextureversion == "V1" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-Rogue"
					elseif E.db.ElvUI_EltreumUI.nptextureversion == "V2" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-RogueV2"
					end
				elseif reactiontarget == 3 then
					if E.db.ElvUI_EltreumUI.nptextureversion == "V1" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-Druid"
					elseif E.db.ElvUI_EltreumUI.nptextureversion == "V2" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-DruidV2"
					end
				elseif reactiontarget == 2 or reactiontarget == 1 then
					if E.db.ElvUI_EltreumUI.nptextureversion == "V1" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-DeathKnight"
					elseif E.db.ElvUI_EltreumUI.nptextureversion == "V2" then
						E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "Eltreum-Class-DeathKnightV2"
					end
				end
			end
		end

		--general disable/enable
		if (not E.db.ElvUI_EltreumUI.nameplateOptions.targetclasstexture and not E.db.ElvUI_EltreumUI.nameplateOptions.nameplatetexture and not E.db.ElvUI_EltreumUI.nameplateOptions.ClassBorderNameplate and not E.db.ElvUI_EltreumUI.nameplateOptions.ClassColorGlow) then
			if E.global.nameplates.filters.EltreumRare then
				E.db["nameplates"]["filters"]["EltreumRare"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumSpellsteal then
				E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumLevel then
				E.db["nameplates"]["filters"]["EltreumLevel"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumHideNP then
				E.db["nameplates"]["filters"]["EltreumHideNP"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumInterrupt then
				E.db["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumExecute then
				E.db["nameplates"]["filters"]["EltreumExecute"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumRestedNP then
				E.db["nameplates"]["filters"]["EltreumRestedNP"]["triggers"]["enable"] = false
			end
			if E.global.nameplates.filters.EltreumTotems then
				E.db["nameplates"]["filters"]["EltreumTotems"]["triggers"]["enable"] = false
			end
		else
			if E.global.nameplates.filters.EltreumRare then
				E.db["nameplates"]["filters"]["EltreumRare"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumSpellsteal then
				E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumLevel then
				E.db["nameplates"]["filters"]["EltreumLevel"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumHideNP then
				E.db["nameplates"]["filters"]["EltreumHideNP"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumInterrupt then
				E.db["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumExecute then
				E.db["nameplates"]["filters"]["EltreumExecute"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumRestedNP then
				E.db["nameplates"]["filters"]["EltreumRestedNP"]["triggers"]["enable"] = true
			end
			if E.global.nameplates.filters.EltreumTotems then
				E.db["nameplates"]["filters"]["EltreumTotems"]["triggers"]["enable"] = true
			end
		end

		--automatically hide classbar when targeting friendly targets
		if E.db.ElvUI_EltreumUI.nameplateOptions.classbarautohide then
			--add spec info for retail
			local id, _
			if E.Retail then
				local currentSpec = GetSpecialization()
				if currentSpec then
					id, _ = GetSpecializationInfo(currentSpec)
				end
			end
			if UnitExists("target") and UnitCanAttack("player", "target") then
				if E.Retail then
					--print(id)
					if E.myclass == 'DEATHKNIGHT' then
						_G["ElvNP_TargetClassPowerRunes"]:Show()
					elseif E.myclass == 'PALADIN ' or E.myclass == 'ROGUE' or E.myclass == 'WARLOCK' then
						_G["ElvNP_TargetClassPowerClassPower"]:Show()
					elseif E.myclass == 'DRUID' then
						local stance = GetShapeshiftForm()
						if stance == 2 then --its a cat
							_G["ElvNP_TargetClassPowerClassPower"]:Show()
						else
							_G["ElvNP_TargetClassPowerClassPower"]:Hide()
						end
					elseif E.myclass == 'MONK' then
						if id == 269 then
							_G["ElvNP_TargetClassPowerClassPower"]:Show()
						elseif id == 268 then
							_G["ElvNP_TargetClassPowerStagger"]:Show()
						end
					elseif E.myclass == 'MAGE' then
						if id == 62 then
							_G["ElvNP_TargetClassPowerClassPower"]:Show()
						end
					end
				elseif E.TBC or E.Classic then
					if E.myclass == 'ROGUE' then
						_G["ElvNP_TargetClassPowerClassPower"]:Show()
					elseif E.myclass == 'DRUID' then
						local stance = GetShapeshiftForm()
						if stance == 2 then --its a cat
							_G["ElvNP_TargetClassPowerClassPower"]:Show()
						else
							_G["ElvNP_TargetClassPowerClassPower"]:Hide()
						end
					end
				end
			elseif UnitExists("target") and (not UnitCanAttack("player", "target")) then
				if E.Retail then
					if E.myclass == 'DEATHKNIGHT' then
						_G["ElvNP_TargetClassPowerRunes"]:Hide()
					elseif E.myclass == 'PALADIN ' or E.myclass == 'ROGUE' or E.myclass == 'WARLOCK' then
						_G["ElvNP_TargetClassPowerClassPower"]:Hide()
					elseif E.myclass == 'DRUID' then
							_G["ElvNP_TargetClassPowerClassPower"]:Hide()
					elseif E.myclass == 'MONK' then
						if id == 269 then
							_G["ElvNP_TargetClassPowerClassPower"]:Hide()
						elseif id == 268 then
							_G["ElvNP_TargetClassPowerStagger"]:Hide()
						end
					elseif E.myclass == 'MAGE' then
						if id == 62 then
							_G["ElvNP_TargetClassPowerClassPower"]:Hide()
						end
					end
				elseif E.TBC or E.Classic then
					if E.myclass == 'ROGUE' then
						_G["ElvNP_TargetClassPowerClassPower"]:Hide()
					elseif E.myclass == 'DRUID' then
						_G["ElvNP_TargetClassPowerClassPower"]:Hide()
					end
				end
			end
		end
	end
end

local EltruismNamePlateOptionsFrame = CreateFrame("FRAME")
EltruismNamePlateOptionsFrame:RegisterUnitEvent("UNIT_MODEL_CHANGED", "player")
EltruismNamePlateOptionsFrame:SetScript("OnEvent", ElvUI_EltreumUI.NamePlateOptions)

--add threat to nameplate by putting threat into title and moving title to the healthbar
function ElvUI_EltreumUI:ClassicThreatNP()
	if E.private.nameplates.enable == true then
		if E.Classic or E.TBC then
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["font"] = "Kimberley"
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["fontOutline"] = E.db.general.fontStyle
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["enable"] = true
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["parent"] = "Health"
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["fontSize"] = 10
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["format"] = "[threat:percent]"
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["position"] = "CENTER"
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["yOffset"] = 0
			E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["xOffset"] = -55
		end
	end
end

--- Friendly Nameplate Control
function ElvUI_EltreumUI:FriendlyNameplates()
	local _, instanceType = IsInInstance()
	local mapID = WorldMapFrame:GetMapID()
	local nameplateShowOnlyNames = tostring(C_CVar.GetCVar('nameplateShowOnlyNames'))
	local nameplateShowFriends = tostring(C_CVar.GetCVar('nameplateShowFriends'))
	--print(mapID, instanceType)
	if not InCombatLockdown() then
		if E.Retail then
			local UnitNameHostleNPC = C_CVar.GetCVar('UnitNameHostleNPC')
			local UnitNameInteractiveNPC =C_CVar.GetCVar('UnitNameInteractiveNPC')
			local UnitNameNPC = C_CVar.GetCVar('UnitNameNPC')
			if E.db.ElvUI_EltreumUI.cvars.autohidenpcname then
				if instanceType == "none" then
					if UnitNameHostleNPC == "1" then
						SetCVar('UnitNameHostleNPC', 0)
					end
					if UnitNameInteractiveNPC == "1" then
						SetCVar('UnitNameInteractiveNPC', 0)
					end
					if UnitNameNPC == "1" then
						SetCVar('UnitNameNPC', 0)
					end
				elseif instanceType == "party" or instanceType == "raid" or instanceType == "pvp" or instanceType == "arena" or instanceType == "scenario" or mapID == 1662 or mapID == 582 or mapID == 590 then
					if UnitNameHostleNPC == "0" then
						SetCVar('UnitNameHostleNPC', 1)
					end
					if UnitNameInteractiveNPC == "0" then
						SetCVar('UnitNameInteractiveNPC', 1)
					end
					if UnitNameNPC == "0" then
						SetCVar('UnitNameNPC', 1)
					end
				end
			end
		end
		if E.db.ElvUI_EltreumUI.friendlynameplatetoggle.friendlynames then
			if instanceType == "party" or instanceType == "raid" or instanceType == "pvp" or instanceType == "arena" or instanceType == "scenario" or instanceType == "none" or mapID == 1662 or mapID == 582 or mapID == 590 then
				if nameplateShowOnlyNames == "0" then
					SetCVar("nameplateShowOnlyNames", 1)
				end
			end
		end
		if E.db.ElvUI_EltreumUI.friendlynameplatetoggle.disablefriendly then
			if instanceType == "party" or instanceType == "raid" or instanceType == "pvp" or instanceType == "arena" or instanceType == "scenario" then
				if nameplateShowFriends == "1" then
					SetCVar("nameplateShowFriends", 0)
				end
			end
			if instanceType == "none" or mapID == 1662 or mapID == 582 or mapID == 590 then
				if nameplateShowFriends == "0" then
					SetCVar("nameplateShowFriends", 1)
				end
			end
		end
		if E.db.ElvUI_EltreumUI.friendlynameplatetoggle.hidefriendly then
			if nameplateShowFriends == "1" then
				SetCVar("nameplateShowFriends", 0)
			end
		end
	end
end
