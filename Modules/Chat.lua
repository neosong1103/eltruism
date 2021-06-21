local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local UIFrameFadeOut = _G.UIFrameFadeOut
local UIFrameFadeIn = _G. UIFrameFadeIn
local C_Timer =_G.C_Timer
local InCombatLockdown = _G.InCombatLockdown

--chat fading/mouseover/combathide
function ElvUI_EltreumUI:DynamicChatFade(event)
	if E.db.ElvUI_EltreumUI.chat.enable then
		--register events left chat panel
		LeftChatPanel:RegisterEvent("PLAYER_REGEN_DISABLED")
		LeftChatPanel:RegisterEvent("PLAYER_REGEN_ENABLED")
		LeftChatPanel:RegisterEvent("CHAT_MSG_ACHIEVEMENT")
		LeftChatPanel:RegisterEvent("CHAT_MSG_ADDON")
		LeftChatPanel:RegisterEvent("CHAT_MSG_AFK")
		LeftChatPanel:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE")
		LeftChatPanel:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE")
		LeftChatPanel:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
		LeftChatPanel:RegisterEvent("CHAT_MSG_BN_WHISPER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_CHANNEL")
		LeftChatPanel:RegisterEvent("CHAT_MSG_EMOTE")
		LeftChatPanel:RegisterEvent("CHAT_MSG_GUILD")
		LeftChatPanel:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
		LeftChatPanel:RegisterEvent("CHAT_MSG_INSTANCE_CHAT")
		LeftChatPanel:RegisterEvent("CHAT_MSG_INSTANCE_CHAT_LEADER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_OFFICER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_PARTY")
		LeftChatPanel:RegisterEvent("CHAT_MSG_PARTY_LEADER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_RAID")
		LeftChatPanel:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
		LeftChatPanel:RegisterEvent("CHAT_MSG_RAID_BOSS_WHISPER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_RAID_LEADER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_RAID_WARNING")
		LeftChatPanel:RegisterEvent("CHAT_MSG_SAY")
		LeftChatPanel:RegisterEvent("CHAT_MSG_SKILL")
		LeftChatPanel:RegisterEvent("CHAT_MSG_SYSTEM")
		LeftChatPanel:RegisterEvent("CHAT_MSG_WHISPER")
		LeftChatPanel:RegisterEvent("CHAT_MSG_YELL")
		--register events right chat panel
		RightChatPanel:RegisterEvent("PLAYER_REGEN_DISABLED")
		RightChatPanel:RegisterEvent("PLAYER_REGEN_ENABLED")
		RightChatPanel:RegisterEvent("CHAT_MSG_ACHIEVEMENT")
		RightChatPanel:RegisterEvent("CHAT_MSG_ADDON")
		RightChatPanel:RegisterEvent("CHAT_MSG_AFK")
		RightChatPanel:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE")
		RightChatPanel:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE")
		RightChatPanel:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
		RightChatPanel:RegisterEvent("CHAT_MSG_BN_WHISPER")
		RightChatPanel:RegisterEvent("CHAT_MSG_CHANNEL")
		RightChatPanel:RegisterEvent("CHAT_MSG_EMOTE")
		RightChatPanel:RegisterEvent("CHAT_MSG_GUILD")
		RightChatPanel:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
		RightChatPanel:RegisterEvent("CHAT_MSG_INSTANCE_CHAT")
		RightChatPanel:RegisterEvent("CHAT_MSG_INSTANCE_CHAT_LEADER")
		RightChatPanel:RegisterEvent("CHAT_MSG_OFFICER")
		RightChatPanel:RegisterEvent("CHAT_MSG_PARTY")
		RightChatPanel:RegisterEvent("CHAT_MSG_PARTY_LEADER")
		RightChatPanel:RegisterEvent("CHAT_MSG_RAID")
		RightChatPanel:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
		RightChatPanel:RegisterEvent("CHAT_MSG_RAID_BOSS_WHISPER")
		RightChatPanel:RegisterEvent("CHAT_MSG_RAID_LEADER")
		RightChatPanel:RegisterEvent("CHAT_MSG_RAID_WARNING")
		RightChatPanel:RegisterEvent("CHAT_MSG_SAY")
		RightChatPanel:RegisterEvent("CHAT_MSG_SKILL")
		RightChatPanel:RegisterEvent("CHAT_MSG_SYSTEM")
		RightChatPanel:RegisterEvent("CHAT_MSG_WHISPER")
		RightChatPanel:RegisterEvent("CHAT_MSG_YELL")

		--timer things
		local hidetime = E.db.chat.inactivityTimer
		local timeractive
		function ElvUI_EltreumUI:TimerHide()
			if E.db.ElvUI_EltreumUI.chat.leftfader then
				UIFrameFadeOut(LeftChatPanel, 0.5, 1, 0)
			end
			if E.db.ElvUI_EltreumUI.chat.rightfader then
				UIFrameFadeOut(RightChatPanel, 0.5, 1, 0)
			end
		end

		--[[function ElvUI_EltreumUI:TimerHideInstantLeft()
			LeftChatPanel:Hide()
			LeftChatPanel.backdrop:Hide()
			--lchat:Hide()
			LeftChatDataPanel:Hide()
			LeftChatToggleButton:Hide()
		end

		function ElvUI_EltreumUI:TimerHideInstantRight()
			RightChatPanel:Hide()
			RightChatPanel.backdrop:Hide()
			rchat:Hide()
			--RightChatDataPanel:Hide()
			RightChatToggleButton:Hide()
		end
		]]--

		--Left Chat Panel
		if E.db.ElvUI_EltreumUI.chat.leftmouseover then
			LeftChatPanel:SetScript('OnEnter', function(self)
				if not InCombatLockdown() then
					UIFrameFadeIn(LeftChatPanel, 0.5, 0, 1)
					--LeftChatPanel.backdrop:Show()
					--LeftChatDataPanel:Show()
					--LeftChatToggleButton:Show()
				end
			end)
			LeftChatPanel:SetScript('OnLeave', function(self)
				--local function hideleft() self.ScheduleTimer("TimerHideInstantLeft", 0.5) end
				UIFrameFadeOut(LeftChatPanel, 0.5, 1, 0)
				--LeftChatPanel:Hide()
				--LeftChatPanel.backdrop:Hide()
				--LeftChatDataPanel:Hide()
				--LeftChatToggleButton:Hide()
			end)
		end
		if E.db.ElvUI_EltreumUI.chat.leftfader then
			LeftChatPanel:HookScript("OnEvent", function(__, event)
				if (event == 'PLAYER_REGEN_DISABLED') then
					if E.db.ElvUI_EltreumUI.chat.leftcombathide then
						UIFrameFadeOut(LeftChatPanel, 0.5, 1, 0)
					end
				elseif (event == 'PLAYER_REGEN_ENABLED') then
					if E.db.ElvUI_EltreumUI.chat.leftcombathide then
						UIFrameFadeIn(LeftChatPanel, 0.5, 0, 1)
					end
				else
					self:CancelTimer(timeractive)
					if not InCombatLockdown() then
						timeractive = self:ScheduleTimer("TimerHide", hidetime)
						LeftChatPanel:SetAlpha(1)
					end
				end
			end)
		end
		--Right Chat Panel
		if E.db.ElvUI_EltreumUI.chat.rightmouseover then
			RightChatPanel:SetScript('OnEnter', function(self)
				if not InCombatLockdown() then
					UIFrameFadeIn(RightChatPanel, 0.5, 0, 1)
				end
			end)
			RightChatPanel:SetScript('OnLeave', function(self)
				if not InCombatLockdown() then
					UIFrameFadeOut(RightChatPanel, 0.5, 1, 0)
				end
			end)
		end
		if E.db.ElvUI_EltreumUI.chat.rightfader then
			RightChatPanel:HookScript("OnEvent", function(__, event)
				if E.db.ElvUI_EltreumUI.chat.rightcombathide then
					if (event == 'PLAYER_REGEN_DISABLED') then
						UIFrameFadeOut(RightChatPanel, 0.5, 1, 0)
					elseif (event == 'PLAYER_REGEN_ENABLED') then
						UIFrameFadeIn(RightChatPanel, 0.5, 0, 1)
					end
				else
					if (event == 'PLAYER_REGEN_DISABLED') then
						RightChatPanel:SetAlpha(1)
					end
				end
				self:CancelTimer(timeractive)
				if not InCombatLockdown() then
					timeractive = self:ScheduleTimer("TimerHide", hidetime)
					RightChatPanel:SetAlpha(1)
				end
				if InCombatLockdown() then
					if not E.db.ElvUI_EltreumUI.chat.rightcombathide then
						self:CancelTimer(timeractive)
						RightChatPanel:SetAlpha(1)
					end
				end
			end)
		end
	end
end
