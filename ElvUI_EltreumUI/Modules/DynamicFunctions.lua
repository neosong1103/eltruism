local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G

function ElvUI_EltreumUI:BattlegroundGroupUnitframes()
	if E.db.ElvUI_EltreumUI.otherstuff.bgunitframes and E.private.unitframe.enable then
		local _, instanceType = IsInInstance()
		if instanceType == "pvp" then
			E.db["unitframe"]["units"]["raid"]["visibility"] = "hide"
			E.db["unitframe"]["units"]["raid40"]["visibility"] = "hide"
		else
			E.db["unitframe"]["units"]["raid"]["visibility"] = "[@raid6,noexists][@raid21,exists] hide;show"
			E.db["unitframe"]["units"]["raid40"]["visibility"] = "[@raid21,noexists] hide;show"
		end
		E:StaggeredUpdateAll(nil, true)
	end
end

function ElvUI_EltreumUI:ArenaUnitframes()
	if E.db.ElvUI_EltreumUI.otherstuff.arenaunitframes and E.private.unitframe.enable then
		local _, instanceType = IsInInstance()
		if instanceType == "arena" then
			ElvUF_Arena1:Hide()
			ElvUF_Arena2:Hide()
			ElvUF_Arena3:Hide()
			ElvUF_Arena4:Hide()
			--ConsoleExec("ElvUF_Arena4:Hide()")
			ElvUF_Arena5:Hide()
		end
	end
end

function ElvUI_EltreumUI:DynamicBuffs()
	if E.db.ElvUI_EltreumUI.otherstuff.arenabuffs and E.private.unitframe.enable then
		local _, instanceType = IsInInstance()
		if instanceType == "arena" or instanceType == "pvp" then
			E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["enable"] = true
			E.db["unitframe"]["units"]["target"]["buffs"]["enable"] = true
			ElvUI_EltreumUI:Print(L["Buffs have been updated for Arenas"])
		elseif instanceType == "none" then
			E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["enable"] = false
			E.db["unitframe"]["units"]["target"]["buffs"]["enable"] = false
			ElvUI_EltreumUI:Print(L["Buffs have been updated for Open World"])
		end
	end
end

--Dynamically datatext swap based on player class
function ElvUI_EltreumUI:DynamicClassicDatatext()
	if E.db.ElvUI_EltreumUI.dynamicdatatext.enable then
		if not E.db.movers then E.db.movers = {} end
		if E.myclass == 'HUNTER' or E.myclass == 'WARLOCK' or E.myclass == 'WARRIOR' or E.myclass == 'ROGUE' then
			E.db["datatexts"]["panels"]["LeftChatDataPanel"][3] = "Eltruism Ammo"
		elseif E.myclass == 'PALADIN' or E.myclass == 'MAGE' or E.myclass == 'PRIEST' or E.myclass == 'DRUID' or E.myclass == 'SHAMAN' then
			E.db["datatexts"]["panels"]["LeftChatDataPanel"][3] = "Friends"
		end
	end
end

--Dynamic Level Nameplate Style Filter
function ElvUI_EltreumUI:DynamicLevelStyleFilter()
	if E.db.ElvUI_EltreumUI.nameplatelevel.enable and E.db.nameplates.filters.EltreumLevel then
		if not E.private.ElvUI_EltreumUI.install_version then
			return
		else
			local level = UnitLevel("player")
			if E.Classic or E.Retail then
				if level == 60 then
					if E.private.ElvUI_EltreumUI.install_version >= "2.2.5" then
						E.db["nameplates"]["filters"]["EltreumLevel"]["triggers"]["enable"] = false
					end
				elseif level < 60 then
					if E.private.ElvUI_EltreumUI.install_version >= "2.2.5" then
						E.db["nameplates"]["filters"]["EltreumLevel"]["triggers"]["enable"] = true
					end
				end
			elseif E.TBC then
				if level == 70 then
					if E.private.ElvUI_EltreumUI.install_version >= "2.2.5" then
						E.db["nameplates"]["filters"]["EltreumLevel"]["triggers"]["enable"] = false
					end
				elseif level < 70 then
					if E.private.ElvUI_EltreumUI.install_version >= "2.2.5" then
						E.db["nameplates"]["filters"]["EltreumLevel"]["triggers"]["enable"] = true
					end
				end
			end
		end
	end
end

--Dynamic Spellsteal Nameplate Style Filter
function ElvUI_EltreumUI:DynamicSpellStealStyleFilter()
	if not E.private.ElvUI_EltreumUI.install_version then
		return
	else
		if E.private.ElvUI_EltreumUI.install_version >= "2.2.5" and E.db.nameplates.filters.EltreumSpellsteal then
			if E.TBC or E.Retail then
				if E.myclass == 'MAGE' then
					local level = UnitLevel("player")
					if E.Retail then
						if level >= 39 then
							E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = true
						elseif level < 39 then
							E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = false
						end
					elseif E.TBC then
						if level == 70 then
							E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = true
						elseif level < 70 then
							E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = false
						end
					end
				else
					E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = false
				end
			elseif E.Classic then
				if E.private.ElvUI_EltreumUI.install_version >= "2.2.5" then
					E.db["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["enable"] = false
				end
			end
		end
	end
end

--swap bar1 and bar4 action paging / visibility
function ElvUI_EltreumUI:ActionPagingSwap()
	if E.private.actionbar.enable then
		if E.db.actionbar.bar1.visibility == "[vehicleui] hide; [overridebar] hide; [possessbar] hide; [petbattle] hide; show" then
			E.db["actionbar"]["bar1"]["visibility"] = "[vehicleui] show; [overridebar] show; [possessbar] show; show;"
			E.db["actionbar"]["bar4"]["visibility"] = "[vehicleui] hide; [overridebar] hide; [possessbar] hide; [petbattle] hide; show"
			E.db["actionbar"]["bar1"]["paging"]["DEATHKNIGHT"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["DEMONHUNTER"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10; [vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["HUNTER"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["MAGE"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["MONK"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["PALADIN"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["PRIEST"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["ROGUE"] = "[bonusbar:1,nostealth] 4; [bonusbar:1,stealth] 7; [vehicleui] 12; [overridebar] 14; [possessbar] 12; [bonusbar:1] 7;"
			E.db["actionbar"]["bar1"]["paging"]["SHAMAN"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["WARLOCK"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["WARRIOR"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["DEATHKNIGHT"] = ""
			E.db["actionbar"]["bar4"]["paging"]["DEMONHUNTER"] = ""
			E.db["actionbar"]["bar4"]["paging"]["DRUID"] = ""
			E.db["actionbar"]["bar4"]["paging"]["HUNTER"] = ""
			E.db["actionbar"]["bar4"]["paging"]["MAGE"] = ""
			E.db["actionbar"]["bar4"]["paging"]["MONK"] = ""
			E.db["actionbar"]["bar4"]["paging"]["PALADIN"] = ""
			E.db["actionbar"]["bar4"]["paging"]["PRIEST"] = ""
			E.db["actionbar"]["bar4"]["paging"]["ROGUE"] = ""
			E.db["actionbar"]["bar4"]["paging"]["SHAMAN"] = ""
			E.db["actionbar"]["bar4"]["paging"]["WARLOCK"] = ""
			E.db["actionbar"]["bar4"]["paging"]["WARRIOR"] = ""
		elseif E.db.actionbar.bar4.visibility == "[vehicleui] hide; [overridebar] hide; [possessbar] hide; [petbattle] hide; show" then
			E.db["actionbar"]["bar1"]["visibility"] = "[vehicleui] hide; [overridebar] hide; [possessbar] hide; [petbattle] hide; show"
			E.db["actionbar"]["bar4"]["visibility"] = "[vehicleui] show; [overridebar] show; [possessbar] show; show;"
			E.db["actionbar"]["bar4"]["paging"]["DEATHKNIGHT"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["DEMONHUNTER"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10; [vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["HUNTER"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["MAGE"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["MONK"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["PALADIN"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["PRIEST"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["ROGUE"] = "[bonusbar:1,nostealth] 4; [bonusbar:1,stealth] 7; [vehicleui] 12; [overridebar] 14; [possessbar] 12; [bonusbar:1] 7;"
			E.db["actionbar"]["bar4"]["paging"]["SHAMAN"] = "[vehicleui] 12; [overridebar] 14; [possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["WARLOCK"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar4"]["paging"]["WARRIOR"] = "[vehicleui] 12; [overridebar] 14;[possessbar] 12;"
			E.db["actionbar"]["bar1"]["paging"]["DEATHKNIGHT"] = ""
			E.db["actionbar"]["bar1"]["paging"]["DEMONHUNTER"] = ""
			E.db["actionbar"]["bar1"]["paging"]["DRUID"] = ""
			E.db["actionbar"]["bar1"]["paging"]["HUNTER"] = ""
			E.db["actionbar"]["bar1"]["paging"]["MAGE"] = ""
			E.db["actionbar"]["bar1"]["paging"]["MONK"] = ""
			E.db["actionbar"]["bar1"]["paging"]["PALADIN"] = ""
			E.db["actionbar"]["bar1"]["paging"]["PRIEST"] = ""
			E.db["actionbar"]["bar1"]["paging"]["ROGUE"] = ""
			E.db["actionbar"]["bar1"]["paging"]["SHAMAN"] = ""
			E.db["actionbar"]["bar1"]["paging"]["WARLOCK"] = ""
			E.db["actionbar"]["bar1"]["paging"]["WARRIOR"] = ""
		end
	end
end

--fix master loot?
if E.TBC then
	hooksecurefunc(_G.MasterLooterFrame, 'Hide', function(self)
		self:ClearAllPoints()
	end)
end

-- Inspired by Luckyone's performance option. Thanks Luckyone!
function ElvUI_EltreumUI:EmptyDetailsTable()
	_detalhes.encounter_spell_pool = {}
	_detalhes.npcid_pool = {}
	_detalhes.spell_pool = {}
	_detalhes.spell_school_cache = {}
end

--Dynamic Experience Bar Mouseover
function ElvUI_EltreumUI:DynamicExperienceDatabar()
	if not E.private.ElvUI_EltreumUI.install_version then
		return
	else
		local level = UnitLevel("player")
		if E.db.ElvUI_EltreumUI.otherstuff.dynamicxpbar then
			if E.Retail or E.Classic  then
				if level < 60 then
					E.db.databars.experience.mouseover = false
					E.db.databars.experience.enable = true
				elseif level == 60 then
					E.db.databars.experience.mouseover = true
					E.db.databars.experience.enable = false
				end
			elseif E.TBC then
				if level < 70 then
					E.db.databars.experience.mouseover = false
					E.db.databars.experience.enable = true
				elseif level == 70 then
					E.db.databars.experience.mouseover = true
					E.db.databars.experience.enable = false
				end
			end
			E:UpdateDataBars()
		end
	end
end

function ElvUI_EltreumUI:TransparentChat()
	E.db["chat"]["fadeUndockedTabs"] = true
	E.db["chat"]["panelBackdrop"] = "HIDEBOTH"
	E.db["chat"]["panelTabTransparency"] = true
	E.db["chat"]["fadeTabsNoBackdrop"] = true
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["backdrop"] = false
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["backdrop"] = false
	E:UpdateChat()
	E:UpdateLayout()
	E:UpdateDataBars()
	E:UpdateDataTexts()
	--E:StaggeredUpdateAll()
	if _G["EltruismRightChatShadowFrame"] then
		_G["EltruismRightChatShadowFrame"]:Hide()
	end
	if _G["EltruismLeftChatShadowFrame"] then
		_G["EltruismLeftChatShadowFrame"]:Hide()
	end
	ElvUI_EltreumUI:Print("Chat set to Transparent mode")
end

function ElvUI_EltreumUI:DarkChat()
	E.db["chat"]["fadeUndockedTabs"] = false
	E.db["chat"]["panelBackdrop"] = "SHOWBOTH"
	E.db["chat"]["panelTabTransparency"] = false
	E.db["chat"]["fadeTabsNoBackdrop"] = false
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["backdrop"] = true
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["backdrop"] = true
	E:UpdateChat()
	E:UpdateLayout()
	E:UpdateDataBars()
	E:UpdateDataTexts()
	--E:StaggeredUpdateAll()
	if _G["EltruismRightChatShadowFrame"] then
		_G["EltruismRightChatShadowFrame"]:Show()
	end
	if _G["EltruismLeftChatShadowFrame"] then
		_G["EltruismLeftChatShadowFrame"]:Show()
	end
	ElvUI_EltreumUI:Print("Chat set to Dark mode")
end

--[[
--move mouseoverauras to top of tooltip
if IsAddOnLoaded('ProjectAzilroka') and not ProjectAzilrokaDB.profiles.Default.MouseoverAuras.Enable then  --because enable only shows up if its NOT enabled
	hooksecurefunc(_G.MouseoverAuras, "Update", function()
		if (not UnitExists('mouseover')) or GetMouseFocus() and (GetMouseFocus():IsForbidden()) then
			_G.MouseoverAuras.Holder:Hide()
			return
		end
		_G.MouseoverAuras.Holder:ClearAllPoints()
		_G.MouseoverAuras.Holder:SetPoint("TOPLEFT", _G.GameTooltip, "TOPLEFT", 0, 60)
	end)
end
]]
