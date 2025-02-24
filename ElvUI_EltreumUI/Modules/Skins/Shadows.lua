local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local NP = E:GetModule('NamePlates')
local UF = E:GetModule('UnitFrames')
local A = E:GetModule('Auras')
local pairs = _G.pairs
local CreateFrame = _G.CreateFrame
local IsAddOnLoaded = _G.IsAddOnLoaded
local hooksecurefunc = _G.hooksecurefunc
local EnhancedShadows = nil
if IsAddOnLoaded("ProjectAzilroka") then
	EnhancedShadows = _G.ProjectAzilroka:GetModule('EnhancedShadows')
end

--Frame Shadows, turns out ElvUI includes the function
function ElvUI_EltreumUI:Shadows()
	if E.db.ElvUI_EltreumUI.skins.shadow.enable then
		------------------------------------------------------------------------------------------------------blizzard frames
		local EltruismBlizzShadows = CreateFrame("Frame")
		EltruismBlizzShadows:RegisterEvent("ADDON_LOADED")
		EltruismBlizzShadows:SetScript("OnEvent", function(_, _, arg)
			if (arg == "Blizzard_MacroUI") then
				_G.MacroFrame:HookScript("OnShow", function()
					if E.Retail or E.Wrath or E.TBC then
						if not _G.MacroFrame.shadow then
							_G.MacroFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.MacroFrame.shadow) end
						end
					elseif E.Classic then
						if _G.MacroFrame and _G.MacroFrame.backdrop and not _G.MacroFrame.backdrop.shadow then
							_G.MacroFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.MacroFrame.backdrop.shadow) end
						end
					end
				end)
			end
			if (arg == "Blizzard_DeathRecap") then
				_G.DeathRecapFrame:HookScript("OnShow", function()
					if not _G.DeathRecapFrame.shadow then
						_G.DeathRecapFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.DeathRecapFrame.shadow) end
					end
				end)
			end
			if (arg == "Blizzard_FlightMap") then
				_G.FlightMapFrame:HookScript("OnShow", function()
					if not _G.FlightMapFrame.shadow then
						_G.FlightMapFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.FlightMapFrame.shadow) end
					end
				end)
			end
			if (arg == "Blizzard_GuildBankUI") then
				_G.GuildBankFrame:HookScript("OnShow", function()
					if E.Retail then
						if not _G.GuildBankFrame.shadow then
							_G.GuildBankFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.GuildBankFrame.shadow) end
						end
					else
						if not _G.GuildBankFrame.backdrop.shadow then
							_G.GuildBankFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.GuildBankFrame.backdrop.shadow) end
						end
					end
				end)
			end
			if (arg == "Blizzard_TrainerUI") then
				_G.ClassTrainerFrame:HookScript("OnShow", function()
					if E.Retail then
						if not _G.ClassTrainerFrame.shadow then
							_G.ClassTrainerFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.ClassTrainerFrame.shadow) end
						end
					else
						if not _G.ClassTrainerFrame.backdrop.shadow then
							_G.ClassTrainerFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.ClassTrainerFrame.backdrop.shadow) end
						end
					end
				end)
			end
			if (arg == "Blizzard_ItemSocketingUI") then
				_G.ItemSocketingFrame:HookScript("OnShow", function()
					if not _G.ItemSocketingFrame.shadow then
						_G.ItemSocketingFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.ItemSocketingFrame.shadow) end
					end
				end)
			end
			if (arg == "Blizzard_TradeSkillUI") then
				_G.TradeSkillFrame:HookScript("OnShow", function()
					if E.Retail then
						if not _G.TradeSkillFrame.shadow then
							_G.TradeSkillFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.TradeSkillFrame.shadow) end
						end
					else
						if not _G.TradeSkillFrame.backdrop.shadow then
							_G.TradeSkillFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.TradeSkillFrame.backdrop.shadow) end
						end
					end
				end)
			end
			if (arg == "Blizzard_BindingUI") then
				_G.KeyBindingFrame:HookScript("OnShow", function()
					if not _G.KeyBindingFrame.shadow then
						_G.KeyBindingFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.KeyBindingFrame.shadow) end
					end
				end)
			end
			if (arg == "Blizzard_InspectUI") then
				_G.InspectFrame:HookScript("OnShow", function()
					if E.Retail then
						if _G.InspectFrame and not _G.InspectFrame.shadow then
							_G.InspectFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.InspectFrame.shadow) end
						end
					else
						if _G.InspectFrame and _G.InspectFrame.backdrop and not _G.InspectFrame.backdrop.shadow then
							_G.InspectFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.InspectFrame.backdrop.shadow) end
						end
						if _G.InspectFrameTab1 and _G.InspectFrameTab1.backdrop and not _G.InspectFrameTab1.backdrop.shadow then
							_G.InspectFrameTab1.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.InspectFrameTab1.backdrop.shadow) end
						end
						if _G.InspectFrameTab2 and _G.InspectFrameTab2.backdrop and not _G.InspectFrameTab2.backdrop.shadow then
							_G.InspectFrameTab2.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.InspectFrameTab2.backdrop.shadow) end
						end
						if _G.InspectFrameTab3 and _G.InspectFrameTab3.backdrop and not _G.InspectFrameTab3.backdrop.shadow then
							_G.InspectFrameTab3.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.InspectFrameTab3.backdrop.shadow) end
						end
					end
				end)
			end
			if E.Retail then
				if (arg == "Blizzard_AuctionHouseUI") then
					_G.AuctionHouseFrame:HookScript("OnShow", function()
						if _G.AuctionHouseFrame and not _G.AuctionHouseFrame.shadow then
							_G.AuctionHouseFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.AuctionHouseFrame.shadow) end
						end
					end)
				end
			elseif E.Wrath or E.TBC or E.Classic then
				if (arg == "Blizzard_AuctionUI") then
					_G.AuctionFrame:HookScript("OnShow", function()
						if _G.AuctionFrame and _G.AuctionFrame.backdrop and not _G.AuctionFrame.backdrop.shadow then
							_G.AuctionFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.AuctionFrame.backdrop.shadow) end
						end
					end)
				end
			end
		end)

		local blizzardframes = {
			_G.GameMenuFrame,
			_G.DropDownList1,
			_G.DropDownList2,
			_G.ReadyCheckFrame,
			_G.StackSplitFrame,
			_G.ChatConfigFrame,
			_G.ShoppingTooltip1,
			_G.ShoppingTooltip2,
			_G.VideoOptionsFrame,
			_G.InterfaceOptionsFrame,
			_G.StaticPopup1, --seems like blizzard
			_G.StaticPopup2, --seems like blizzard
			_G.StaticPopup3, --seems like blizzard
			_G.StaticPopup4, --seems like blizzard
			_G.StaticPopup5, --seems like blizzard
			_G.CharacterFrameTab1.backdrop,
			_G.CharacterFrameTab2.backdrop,
			_G.CharacterFrameTab3.backdrop,
			_G.FriendsFrameTab1.backdrop,
			_G.FriendsFrameTab2.backdrop,
			_G.FriendsFrameTab3.backdrop,
			_G.FriendsFrameTab4.backdrop,
			_G.SpellBookFrameTabButton1.backdrop,
			_G.SpellBookFrameTabButton2.backdrop,
			_G.ItemTextFrame.backdrop,
			_G.GossipFrame.backdrop,
			_G.BNToastFrame,
			_G.TimeAlertFrame,
			_G.ReportFrame,
			_G.SpellBookSkillLineTab1,
			_G.SpellBookSkillLineTab2,
			_G.SpellBookSkillLineTab3,
			_G.SpellBookSkillLineTab4,
			_G.SpellBookSkillLineTab5,
			_G.CliqueSpellTab,
			_G.EltruismClickCastingToggle,
			_G.TradeFrame,
			_G.AddonList,
			_G.BlackMarketFrame,
			_G.ChromieTimeFrame,
			_G.VoidStorageFrame,
			_G.BonusRollFrame,
			_G.ItemRefTooltip,
			--_G.ImmersionFrame.TalkBox,
		}
		for _, frame in pairs(blizzardframes) do
			if frame and not frame.shadow then
				frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
			end
		end

		--[[if _G.ImmersionFrame.TalkBox.shadow then --works but no guarantee they'll be using the layout/size/addonskins skin
			_G.ImmersionFrame.TalkBox.shadow:ClearAllPoints()
			_G.ImmersionFrame.TalkBox.shadow:SetPoint("TOPRIGHT", _G.ImmersionFrame.TalkBox, "TOPRIGHT", -5,-5)
			_G.ImmersionFrame.TalkBox.shadow:SetPoint("BOTTOMLEFT", _G.ImmersionFrame.TalkBox, "BOTTOMLEFT",5,5)
		end]]

		hooksecurefunc(_G.AlertFrame, "AddAlertFrame", function(_,frame)
			if frame and frame.backdrop and not frame.backdrop.shadow then
				frame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.backdrop.shadow) end
			end
		end)

		--mirror timer shadow
		for i = 1, _G.MIRRORTIMER_NUMTIMERS do
			local statusBar = _G['MirrorTimer'..i..'StatusBar']
			if statusBar then
				if not statusBar.shadow then
					statusBar:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(statusBar.shadow) end
				end
			end
		end

		if E.private["general"]["minimap"]["enable"] and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.minimapborder) then
			local MinimapShadow = CreateFrame("Frame", "EltruismMiniMapShadowFrame")
			local Minimapsizex, Minimapsizey = _G["Minimap"]:GetSize()
			MinimapShadow:SetSize(Minimapsizex, Minimapsizey)
			MinimapShadow:SetParent(_G["Minimap"])
			if not (self.minimapIsSkinned) then
				MinimapShadow:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				MinimapShadow:SetPoint("TOPRIGHT", _G["Minimap"] ,"TOPRIGHT", 0, 0)
				MinimapShadow:SetPoint("BOTTOMLEFT", _G["MinimapPanel"] ,"BOTTOMLEFT", 0, 0)
				if E.db.datatexts.panels.MinimapPanel.backdrop == false or E.db.datatexts.panels.MinimapPanel.enable == false then
					MinimapShadow:SetPoint("BOTTOMLEFT", _G["Minimap"] ,"BOTTOMLEFT", 0, 0)
				end
				if IsAddOnLoaded("ElvUI_SLE") and E.private["sle"]["minimap"]["rectangle"] == true then --Shadow and Light Rectangle Minimap
					if E.db.datatexts.panels.MinimapPanel.backdrop == true and E.db.datatexts.panels.MinimapPanel.enable == true then
						MinimapShadow:SetPoint("TOPRIGHT", _G["Minimap"].backdrop ,"TOPRIGHT", 0, 0)
						MinimapShadow:SetPoint("BOTTOMLEFT", _G["MinimapPanel"] ,"BOTTOMLEFT", 0, 0)
					elseif E.db.datatexts.panels.MinimapPanel.backdrop == false or E.db.datatexts.panels.MinimapPanel.enable == false then
						MinimapShadow:SetPoint("TOPRIGHT", _G["Minimap"].backdrop ,"TOPRIGHT", 0, 0)
						MinimapShadow:SetPoint("BOTTOMLEFT", _G["Minimap"].backdrop ,"BOTTOMLEFT", 0, 0)
					end
				elseif IsAddOnLoaded("ElvUI_WindTools") and E.db["WT"]["maps"]["rectangleMinimap"]["enable"] == true then --Windtools rectangle minimap
					MinimapShadow:SetAllPoints(_G["Minimap"].backdrop)
					if E.db.datatexts.panels.MinimapPanel.backdrop == true and E.db.datatexts.panels.MinimapPanel.enable == true then
						if _G["MinimapPanel"] and not _G["MinimapPanel"].shadow then
							_G["MinimapPanel"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["MinimapPanel"].shadow) end
						end
					end
				end
				MinimapShadow:Show()
				if EnhancedShadows then EnhancedShadows:RegisterShadow(MinimapShadow.shadow) end
				self.minimapIsSkinned = true
			end
		end

		if _G.GameTooltip and not _G.GameTooltip.shadow then
			if E.private.tooltip.enable then
				_G.GameTooltip:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.GameTooltip.shadow) end
			end
		end

		--finally fix gametooltip shadow
		if _G.GameTooltipStatusBar and E.private.tooltip.enable then
			_G.GameTooltipStatusBar:HookScript("OnShow", function()
				if _G.GameTooltip.shadow then
					if E.db.tooltip.healthBar.statusPosition == "TOP" then
						_G.GameTooltip.shadow:ClearAllPoints()
						_G.GameTooltip.shadow:SetPoint("BOTTOMLEFT", _G.GameTooltip,"BOTTOMLEFT", -3, -3)
						_G.GameTooltip.shadow:SetPoint("BOTTOMRIGHT", _G.GameTooltip,"BOTTOMRIGHT", 3, -3)
						_G.GameTooltip.shadow:SetPoint("TOPLEFT", _G.GameTooltip,"TOPLEFT", -3, E.db.tooltip.healthBar.height+3)
						_G.GameTooltip.shadow:SetPoint("TOPRIGHT", _G.GameTooltip,"TOPRIGHT", 3, E.db.tooltip.healthBar.height+3)
					elseif E.db.tooltip.healthBar.statusPosition == "BOTTOM" then
						_G.GameTooltip.shadow:ClearAllPoints()
						_G.GameTooltip.shadow:SetPoint("BOTTOMLEFT", _G.GameTooltip,"BOTTOMLEFT", -3, -(E.db.tooltip.healthBar.height+3))
						_G.GameTooltip.shadow:SetPoint("BOTTOMRIGHT", _G.GameTooltip,"BOTTOMRIGHT", 3, -(E.db.tooltip.healthBar.height+3))
						_G.GameTooltip.shadow:SetPoint("TOPLEFT", _G.GameTooltip,"TOPLEFT", -3, 3)
						_G.GameTooltip.shadow:SetPoint("TOPRIGHT", _G.GameTooltip,"TOPRIGHT", 3, 3)
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.GameTooltip.shadow) end
				end
			end)
			_G.GameTooltipStatusBar:HookScript("OnHide", function()
				if _G.GameTooltip.shadow then
					_G.GameTooltip.shadow:ClearAllPoints()
					_G.GameTooltip.shadow:SetPoint("BOTTOMLEFT", _G.GameTooltip,"BOTTOMLEFT", -3, -3)
					_G.GameTooltip.shadow:SetPoint("BOTTOMRIGHT", _G.GameTooltip,"BOTTOMRIGHT", 3, -3)
					_G.GameTooltip.shadow:SetPoint("TOPLEFT", _G.GameTooltip,"TOPLEFT", -3, 3)
					_G.GameTooltip.shadow:SetPoint("TOPRIGHT", _G.GameTooltip,"TOPRIGHT", 3, 3)
				end
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.GameTooltip.shadow) end
			end)
		end

		--blizzard stuff that loads addon later
		local EltruismBlizzShadowsRetail = CreateFrame("Frame")
		EltruismBlizzShadowsRetail:RegisterEvent("ADDON_LOADED")
		EltruismBlizzShadowsRetail:SetScript("OnEvent", function(_, _, arg)
			if E.private.skins.blizzard.enable then
				if E.Retail then
					if (arg == "Blizzard_TalentUI") then
						_G.PlayerTalentFrame:HookScript("OnShow", function()
							if not _G.PlayerTalentFrame.shadow then
								_G.PlayerTalentFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrame.shadow) end
							end
						end)
						_G.PlayerTalentFrameTab1:HookScript("OnShow", function()
							if _G.PlayerTalentFrameTab1 and _G.PlayerTalentFrameTab1.backdrop and not _G.PlayerTalentFrameTab1.backdrop.shadow then
								_G.PlayerTalentFrameTab1.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrameTab1.backdrop.shadow) end
							end
						end)
						_G.PlayerTalentFrameTab2:HookScript("OnShow", function()
							if _G.PlayerTalentFrameTab2 and _G.PlayerTalentFrameTab2.backdrop and not _G.PlayerTalentFrameTab2.backdrop.shadow then
								_G.PlayerTalentFrameTab2.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrameTab2.backdrop.shadow) end
							end
						end)
					end
				elseif not E.Retail then
					if (arg == "Blizzard_TalentUI") then
						_G.PlayerTalentFrame:HookScript("OnShow", function()
							if _G.PlayerTalentFrame and _G.PlayerTalentFrame.backdrop and not _G.PlayerTalentFrame.backdrop.shadow then
								_G.PlayerTalentFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrame.backdrop.shadow) end
							end
							if _G.PlayerTalentFrameTab1 and _G.PlayerTalentFrameTab1.backdrop and not _G.PlayerTalentFrameTab1.backdrop.shadow then
								_G.PlayerTalentFrameTab1.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrameTab1.backdrop.shadow) end
							end
							if _G.PlayerTalentFrameTab2 and _G.PlayerTalentFrameTab2.backdrop and not _G.PlayerTalentFrameTab2.backdrop.shadow then
								_G.PlayerTalentFrameTab2.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrameTab2.backdrop.shadow) end
							end
							if _G.PlayerTalentFrameTab3 and _G.PlayerTalentFrameTab3.backdrop and not _G.PlayerTalentFrameTab3.backdrop.shadow then
								_G.PlayerTalentFrameTab3.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrameTab3.backdrop.shadow) end
							end
							if _G.PlayerTalentFrameTab4 and _G.PlayerTalentFrameTab4.backdrop and not _G.PlayerTalentFrameTab4.backdrop.shadow then
								_G.PlayerTalentFrameTab4.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerTalentFrameTab4.backdrop.shadow) end
							end
							if _G.PlayerSpecTab1 and not _G.PlayerSpecTab1.shadow then
								_G.PlayerSpecTab1:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerSpecTab1.shadow) end
							end
							if _G.PlayerSpecTab2 and not _G.PlayerSpecTab2.shadow then
								_G.PlayerSpecTab2:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PlayerSpecTab2.shadow) end
							end
						end)
					end
				end
				if (arg == "Blizzard_Calendar") then
					_G.CalendarFrame:HookScript("OnShow", function()
						if not _G.CalendarFrame.shadow then
							_G.CalendarFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CalendarFrame.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_Communities") then
					_G.CommunitiesFrame:HookScript("OnShow", function()
						if not _G.CommunitiesFrame.shadow then
							_G.CommunitiesFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CommunitiesFrame.shadow) end
						end
						if _G.CommunitiesFrameTab1 and _G.CommunitiesFrameTab1.backdrop and not _G.CommunitiesFrameTab1.backdrop.shadow then
							_G.CommunitiesFrameTab1.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CommunitiesFrameTab1.backdrop.shadow) end
						end
						if _G.CommunitiesFrameTab2 and _G.CommunitiesFrameTab2.backdrop and not _G.CommunitiesFrameTab2.backdrop.shadow then
							_G.CommunitiesFrameTab2.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CommunitiesFrameTab2.backdrop.shadow) end
						end
						if _G.CommunitiesFrameTab3 and _G.CommunitiesFrameTab3.backdrop and not _G.CommunitiesFrameTab3.backdrop.shadow then
							_G.CommunitiesFrameTab3.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CommunitiesFrameTab3.backdrop.shadow) end
						end
						if _G.CommunitiesFrameTab4 and _G.CommunitiesFrameTab4.backdrop and not _G.CommunitiesFrameTab4.backdrop.shadow then
							_G.CommunitiesFrameTab4.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CommunitiesFrameTab4.backdrop.shadow) end
						end
						if _G.CommunitiesFrameTab5 and _G.CommunitiesFrameTab5.backdrop and not _G.CommunitiesFrameTab5.backdrop.shadow then
							_G.CommunitiesFrameTab5.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CommunitiesFrameTab5.backdrop.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_AchievementUI") then
					_G.AchievementFrame:HookScript("OnShow", function()
						if _G.AchievementFrame and _G.AchievementFrame.backdrop and not _G.AchievementFrame.backdrop.shadow then
							_G.AchievementFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.AchievementFrame.backdrop.shadow) end
						end
					end)
					_G.AchievementFrameTab1:HookScript("OnShow", function()
						if _G.AchievementFrameTab1 and _G.AchievementFrameTab1.backdrop and not _G.AchievementFrameTab1.backdrop.shadow then
							_G.AchievementFrameTab1.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.AchievementFrameTab1.backdrop.shadow) end
						end
					end)
					_G.AchievementFrameTab2:HookScript("OnShow", function()
						if _G.AchievementFrameTab2 and _G.AchievementFrameTab2.backdrop and not _G.AchievementFrameTab2.backdrop.shadow then
							_G.AchievementFrameTab2.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.AchievementFrameTab2.backdrop.shadow) end
						end
					end)
					if E.Retail then
						_G.AchievementFrameTab3:HookScript("OnShow", function()
							if _G.AchievementFrameTab3 and _G.AchievementFrameTab3.backdrop and not _G.AchievementFrameTab3.backdrop.shadow then
								_G.AchievementFrameTab3.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.AchievementFrameTab3.backdrop.shadow) end
							end
						end)
					end
				end
				if (arg == "Blizzard_GarrisonUI") then
					_G.GarrisonLandingPage:HookScript("OnShow", function()
						if not _G.GarrisonLandingPage.shadow then
							_G.GarrisonLandingPage:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.GarrisonLandingPage.shadow) end
						end
					end)
					_G.CovenantMissionFrame:HookScript("OnShow", function()
						if not _G.CovenantMissionFrame.shadow then
							_G.CovenantMissionFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CovenantMissionFrame.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_CovenantSanctum") then
					_G.CovenantSanctumFrame:HookScript("OnShow", function()
						if not _G.CovenantSanctumFrame.shadow then
							_G.CovenantSanctumFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CovenantSanctumFrame.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_Soulbinds") then
					_G.SoulbindViewer:HookScript("OnShow", function()
						if not _G.SoulbindViewer.shadow then
							_G.SoulbindViewer:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.SoulbindViewer.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_Collections") then
					_G.CollectionsJournal:HookScript("OnShow", function()
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournal.shadow) end
						end
					end)
					_G.CollectionsJournalTab1:HookScript("OnShow", function()
						if _G.CollectionsJournalTab1 and _G.CollectionsJournalTab1.backdrop and not _G.CollectionsJournalTab1.backdrop.shadow then
							_G.CollectionsJournalTab1.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournalTab1.backdrop.shadow) end
						end
					end)
					_G.CollectionsJournalTab2:HookScript("OnShow", function()
						if _G.CollectionsJournalTab2 and _G.CollectionsJournalTab2.backdrop and not _G.CollectionsJournalTab2.backdrop.shadow then
							_G.CollectionsJournalTab2.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournalTab2.backdrop.shadow) end
						end
					end)
					_G.CollectionsJournalTab3:HookScript("OnShow", function()
						if _G.CollectionsJournalTab3 and _G.CollectionsJournalTab3.backdrop and not _G.CollectionsJournalTab3.backdrop.shadow then
							_G.CollectionsJournalTab3.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournalTab3.backdrop.shadow) end
						end
					end)
					_G.CollectionsJournalTab4:HookScript("OnShow", function()
						if _G.CollectionsJournalTab4 and _G.CollectionsJournalTab4.backdrop and not _G.CollectionsJournalTab4.backdrop.shadow then
							_G.CollectionsJournalTab4.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournalTab4.backdrop.shadow) end
						end
					end)
					_G.CollectionsJournalTab5:HookScript("OnShow", function()
						if _G.CollectionsJournalTab5 and _G.CollectionsJournalTab5.backdrop and not _G.CollectionsJournalTab5.backdrop.shadow then
							_G.CollectionsJournalTab5.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournalTab5.backdrop.shadow) end
						end
					end)
					_G.ToyBox:HookScript("OnShow", function()
						if not _G.ToyBox.shadow then
							_G.ToyBox:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.ToyBox.shadow) end
						end
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournal.shadow) end
						end
					end)
					_G.HeirloomsJournal:HookScript("OnShow", function()
						if not _G.HeirloomsJournal.shadow then
							_G.HeirloomsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.HeirloomsJournal.shadow) end
						end
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournal.shadow) end
						end
					end)
					_G.PetJournal:HookScript("OnShow", function()
						if not _G.PetJournal.shadow then
							_G.PetJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PetJournal.shadow) end
						end
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournal.shadow) end
						end
					end)
					--[[_G.WardrobeCollectionFrame:HookScript("OnShow", function()
						if not _G.WardrobeCollectionFrame.shadow then
							_G.WardrobeCollectionFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.WardrobeCollectionFrame.shadow) end
						end
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournal.shadow) end
						end
					end)]]
					_G.WardrobeFrame:HookScript("OnShow", function()
						if not _G.WardrobeFrame.shadow then
							_G.WardrobeFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.WardrobeFrame.shadow) end
						end
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						end
					end)
					_G.MountJournal:HookScript("OnShow", function()
						if not _G.CollectionsJournal.shadow then
							_G.CollectionsJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.CollectionsJournal.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_PVPUI") then
					_G.PVPUIFrame:HookScript("OnShow", function()
						if not _G.PVPUIFrame.shadow then
							_G.PVPUIFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PVPUIFrame.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_VoidStorageUI") then
					_G.VoidStorageFrame:HookScript("OnShow", function()
						if not _G.VoidStorageFrame.shadow then
							_G.VoidStorageFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.VoidStorageFrame.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_ChallengesUI") then
					_G.PVEFrame:HookScript("OnShow", function()
						if not _G.PVEFrame.shadow then
							_G.PVEFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.PVEFrame.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_EncounterJournal") then
					_G.EncounterJournal:HookScript("OnShow", function()
						if not _G.EncounterJournal.shadow then
							_G.EncounterJournal:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.EncounterJournal.shadow) end
						end
					end)
				end
				if (arg == "Blizzard_WeeklyRewards") then
					_G.WeeklyRewardsFrame:HookScript("OnShow", function()
						if not _G.WeeklyRewardsFrame.shadow then
							_G.WeeklyRewardsFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.WeeklyRewardsFrame.shadow) end
						end
					end)
				end
			end
		end)

		------------------------------------------------------------------------------------------------------version specific
		if E.Retail then
			if IsAddOnLoaded("Rarity") then
				local rarityalreadyloads = {
					_G.CollectionsJournalTab1.backdrop,
					_G.CollectionsJournalTab2.backdrop,
					_G.CollectionsJournalTab3.backdrop,
					_G.CollectionsJournalTab4.backdrop,
					_G.CollectionsJournalTab5.backdrop,
				}
				for _, frame in pairs(rarityalreadyloads) do
					if frame and not frame.shadow then
						frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
					end
				end
			end

			--retail frames
			local retailframes = {
				_G.QueueStatusFrame,
				--_G.SplashFrame,
				_G.LFDRoleCheckPopup,
				_G.LFDReadyCheckPopup,
				_G.LFGListApplicationDialog,
				_G.LFGDungeonReadyDialog,
				_G.LFGDungeonReadyPopup,
				_G.LFGListInviteDialog,
				_G.PaperDollFrame,
				_G.GroupFinderFrame,
				_G.ZoneAbilityFrame,
				_G.ReputationFrame,
				_G.TokenFrame,
				_G.SpellBookFrame,
				_G.FriendsFrame,
				_G.MerchantFrame,
				_G.MailFrame,
				_G.HelpFrame.backdrop,
				_G.WorldMapFrame.backdrop,
				_G.WardrobeFrame, --weird
				_G.PVEFrame,
				_G.PVEFrameTab1.backdrop,
				_G.PVEFrameTab2.backdrop,
				_G.PVEFrameTab3.backdrop,
				_G.CollectionsJournal,
				_G.DressUpFrame,
				_G.DressUpFrame.OutfitDetailsPanel,
				_G.WeeklyRewardsFrame,
				_G.CovenantPreviewFrame,
				_G.PetStableFrame,
				_G.TaxiFrame,
				_G.TabardFrame,
				--_G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.backdrop,
			}
			for _, frame in pairs(retailframes) do
				if frame and not frame.shadow then
					frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
				end
			end

			--main minimize button easier here
			if _G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton and not _G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.shadow then
				_G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:CreateShadow()
				_G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.shadow:ClearAllPoints()
				_G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.shadow:SetPoint("TOPLEFT", _G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.tex, "TOPLEFT", -1,1)
				_G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.shadow:SetPoint("BOTTOMRIGHT", _G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.tex, "BOTTOMRIGHT", 1,-1)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.shadow) end
			end

			if E.private.actionbar.enable and E.db.ElvUI_EltreumUI.skins.shadow.actionbars then
				if not _G.BossButton.shadow then
					_G.BossButton:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.BossButton.shadow) end
				end
			end
		elseif E.Wrath or E.TBC or E.Classic then

			--classic only elvui
			local ClassicElvUIFrames = {
			_G["ElvUF_PartyGroup1UnitButton1Pet"],
			_G["ElvUF_PartyGroup1UnitButton2Pet"],
			_G["ElvUF_PartyGroup1UnitButton3Pet"],
			_G["ElvUF_PartyGroup1UnitButton4Pet"],
			_G["ElvUF_PartyGroup1UnitButton5Pet"],
			}
			for _, frame in pairs(ClassicElvUIFrames) do
				if frame and not frame.shadow then
					frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
				end
			end

			--totems
			local ElvUITotemFrames = {
			_G["ElvUF_PlayerTotem1"],
			_G["ElvUF_PlayerTotem2"],
			_G["ElvUF_PlayerTotem3"],
			_G["ElvUF_PlayerTotem4"],
			}
			for _, frame in pairs(ElvUITotemFrames) do
				if frame and frame.backdrop and not frame.backdrop.shadow then
					frame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
				end
			end

			--raid pet
			for k = 1, 42 do
				local petunits = {_G["ElvUF_RaidpetGroup1UnitButton"..k]}
				for _, button in pairs(petunits) do
					if not button.shadow then
						button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
					end
				end
			end

			--tbc/classic frames
			local classicframes = {
				_G.HelpFrame,
				_G.QuestLogFrame.backdrop,
				_G.CharacterFrame.backdrop,
				_G.SpellBookFrame.backdrop,
				_G.FriendsFrame.backdrop,
				_G.MailFrame.backdrop,
				_G.MerchantFrame.backdrop,
				_G.WorldMapFrame,
				_G.CharacterFrameTab4.backdrop, --only in classic though
				_G.CharacterFrameTab5.backdrop, --only in classic though
				_G.FriendsFrameTab5.backdrop, --only in classic though
				_G.PetStableFrame.backdrop,
				_G.TaxiFrame.backdrop,
				_G.TabardFrame.backdrop,
			}
			for _, frame in pairs(classicframes) do
				if frame and not frame.shadow then
					frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
				end
			end
			--wrath/tbc only frames
			if E.Wrath or E.TBC then
				local tbcframes = {
				_G.LFGParentFrame.backdrop,
				_G.LFGParentFrameTab1.backdrop,
				_G.LFGParentFrameTab2.backdrop,
				_G.QuestLogDetailFrame.backdrop,
				}
				for _, frame in pairs(tbcframes) do
					if frame and not frame.shadow then
						frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
					end
				end
			end

			--wrath only frames
			if E.Wrath and E.db.ElvUI_EltreumUI.skins.shadow.actionbars then
				if _G.LFGListingFrame.backdrop and not _G.LFGListingFrame.backdrop.shadow then
					_G.LFGListingFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.LFGListingFrame.backdrop.shadow) end
				end
				if _G.LFGBrowseFrame.backdrop and not _G.LFGBrowseFrame.backdrop.shadow then
					_G.LFGBrowseFrame.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.LFGBrowseFrame.backdrop.shadow) end
				end

				--Shaman Totem things
				if E.myclass == "SHAMAN" and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.totembar) and E.db.actionbar.totemBar.enable then
					local totemframes = {
						_G.MultiCastSummonSpellButton,
						_G.MultiCastRecallSpellButton,
						_G.MultiCastActionButton1,
						_G.MultiCastActionButton2,
						_G.MultiCastActionButton3,
						_G.MultiCastActionButton4,
						_G.MultiCastFlyoutFrameCloseButton.backdrop,
						_G.MultiCastFlyoutFrameOpenButton.backdrop,
					}
					for _, frame in pairs(totemframes) do
						if frame and not frame.shadow then
							frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
						end
					end

					hooksecurefunc("MultiCastFlyoutFrame_ToggleFlyout", function()
						local Flyframes = {
							_G.MultiCastFlyoutButton1,
							_G.MultiCastFlyoutButton2,
							_G.MultiCastFlyoutButton3,
							_G.MultiCastFlyoutButton4,
							_G.MultiCastFlyoutButton5,
							_G.MultiCastFlyoutButton6,
							_G.MultiCastFlyoutButton7,
						}
						for _, frame in pairs(Flyframes) do
							if frame and not frame.shadow then
								frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
								if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
							end
						end
					end)
				end
			end
		end
		------------------------------------------------------------------------------------------------------elvui frames
		local GeneralElvUIFrames = {
			_G["ElvLootFrame"],
			_G["ElvUI_ReputationBar"],
			_G["ElvUI_ExperienceBar"],
			_G["ElvUI_ThreatBar"],
			_G["ElvUIStatusReport"],
			_G["ElvUIStatusPlugins"],
			_G["ElvUIVendorGraysFrame"],
		}
		for _, frame in pairs(GeneralElvUIFrames) do
			if frame and not frame.shadow then
				frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
			end
		end

		--datatexts
		local DT = E:GetModule('DataTexts')
		if DT.tooltip then
			if not DT.tooltip.shadow then
				DT.tooltip:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(DT.tooltip.shadow) end
			end
		end

		--class totems
		for i = 1, MAX_TOTEMS do
			local classtotem = _G['ElvUI_TotemTrackerTotem'..i]
			if classtotem and not classtotem.shadow then
				classtotem:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(classtotem.shadow) end
			end
		end

		--action bars
		if E.private.actionbar.enable and not IsAddOnLoaded("ElvUI_ActionBarMasks") and E.db.ElvUI_EltreumUI.skins.shadow.actionbars then
			--elvui action bars
			for i = 1, 10 do
				for k = 1, 12 do
					local slots = {_G["ElvUI_Bar"..i..'Button'..k]}
					for _, button in pairs(slots) do
						if not button.shadow and not (E.db.ElvUI_EltreumUI.borders.borders and E.db["ElvUI_EltreumUI"]["borders"]["bar"..i.."borders"]) then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
						end
					end
				end
			end

			--pet bars
			for i = 1, 12 do
				local button = _G["PetActionButton"..i]
				if not button then
					break
				else
					if not button.shadow and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.petactionborders) then
						button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
					end
				end
			end
			if _G["ElvUI_BarPet"].backdrop and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.petactionborders) then
				if not _G["ElvUI_BarPet"].backdrop.shadow then
					_G["ElvUI_BarPet"].backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUI_BarPet"].backdrop.shadow) end
				end
			end

			--stances
			if not _G["EltruismStanceBorder1"] and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.stanceborders) then
				for i = 1, 12 do
					local button = _G["ElvUI_StanceBarButton"..i]
					if not button then
						break
					else
						if not button.shadow then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
						end
					end
				end
			end

		end

		--microbar shadow
		if E.db.actionbar.microbar.enabled == true then
			if E.db.actionbar.microbar.backdrop == true then
				if _G.ElvUI_MicroBar and _G.ElvUI_MicroBar.backdrop and not _G.ElvUI_MicroBar.backdrop.shadow then
					_G.ElvUI_MicroBar.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.ElvUI_MicroBar.backdrop.shadow) end
				end
			else
				local microbar = {
					_G["CharacterMicroButton"],
					_G["SpellbookMicroButton"],
					_G["TalentMicroButton"],
					_G["QuestLogMicroButton"],
					_G["SocialsMicroButton"],
					_G["MainMenuMicroButton"],
					_G["HelpMicroButton"],
					_G["LFGMicroButton"],
					_G["WorldMapMicroButton"],
					_G["AchievementMicroButton"],
					_G["GuildMicroButton"],
					_G["LFDMicroButton"],
					_G["EJMicroButton"],
					_G["CollectionsMicroButton"],
					_G["StoreMicroButton"],
				}
				for _, frame in pairs(microbar) do
					if frame and not frame.shadow then
						frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
					end
				end
			end
		end

		--unitframes
		if E.private.unitframe.enable then
			if E.Retail or E.Wrath or E.TBC then
				if not _G["ElvUF_Focus_HealthBar"].shadow and not (E.db.ElvUI_EltreumUI.borders.focusborder and E.db.ElvUI_EltreumUI.borders.borders)then
					_G["ElvUF_Focus_HealthBar"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Focus_HealthBar"].shadow) end
				end
				if not _G["ElvUF_Focus_PowerBar"].shadow and not (E.db.ElvUI_EltreumUI.borders.focusborder and E.db.ElvUI_EltreumUI.borders.borders)then
					_G["ElvUF_Focus_PowerBar"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Focus_PowerBar"].shadow) end
				end
				if not _G["ElvUF_FocusTarget_HealthBar"].shadow then
					_G["ElvUF_FocusTarget_HealthBar"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_FocusTarget_HealthBar"].shadow) end
				end
				if not _G["ElvUF_FocusTarget_PowerBar"].shadow then
					_G["ElvUF_FocusTarget_PowerBar"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_FocusTarget_PowerBar"].shadow) end
				end
				if E.db.ElvUI_EltreumUI.unitframes.infopanelontop then
					if E.db["unitframe"]["units"]["focus"]["infoPanel"]["enable"] then
						if _G["ElvUF_Focus_HealthBar"].shadow then
							_G["ElvUF_Focus_HealthBar"].shadow:Hide()
						end
						if _G["ElvUF_Focus_PowerBar"].shadow then
							_G["ElvUF_Focus_PowerBar"].shadow:Hide()
						end
						if not _G["ElvUF_Focus"].shadow then
							_G["ElvUF_Focus"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Focus"].shadow) end
						end
						if _G["ElvUF_Focus"].shadow then
							_G["ElvUF_Focus"].shadow:ClearAllPoints()
							_G["ElvUF_Focus"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Focus_HealthBar"],"BOTTOMLEFT", -3, -3)
							_G["ElvUF_Focus"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Focus_HealthBar"],"BOTTOMRIGHT", 3, -3)
							_G["ElvUF_Focus"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Focus_InfoPanel"],"TOPLEFT", -3, 3)
							_G["ElvUF_Focus"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Focus_InfoPanel"],"TOPRIGHT", 3, 3)
							if E.db["unitframe"]["units"]["focus"]["power"]["enable"] then
								if E.db["unitframe"]["units"]["focus"]["power"]["width"] == "inset" then
									_G["ElvUF_Focus"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Focus_HealthBar"] ,"BOTTOMLEFT", -3, -3)
									_G["ElvUF_Focus"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Focus_HealthBar"] ,"BOTTOMRIGHT", 3, -3)
								else
									_G["ElvUF_Focus"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Focus_PowerBar"] ,"BOTTOMLEFT", -3, -3)
									_G["ElvUF_Focus"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Focus_PowerBar"] ,"BOTTOMRIGHT", 3, -3)
								end
							end
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Focus"].shadow) end
						end
					end
					if E.db["unitframe"]["units"]["focustarget"]["infoPanel"]["enable"] then
						if _G["ElvUF_FocusTarget_HealthBar"].shadow then
							_G["ElvUF_FocusTarget_HealthBar"].shadow:Hide()
						end
						if _G["ElvUF_FocusTarget_PowerBar"].shadow then
							_G["ElvUF_FocusTarget_PowerBar"].shadow:Hide()
						end
						if not _G["ElvUF_FocusTarget"].shadow then
							_G["ElvUF_FocusTarget"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_FocusTarget"].shadow) end
						end
						if _G["ElvUF_FocusTarget"].shadow then
							_G["ElvUF_FocusTarget"].shadow:ClearAllPoints()
							_G["ElvUF_FocusTarget"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_FocusTarget"],"BOTTOMLEFT", -3, -3)
							_G["ElvUF_FocusTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_FocusTarget"],"BOTTOMRIGHT", 3, -3)
							_G["ElvUF_FocusTarget"].shadow:SetPoint("TOPLEFT", _G["ElvUF_FocusTarget_InfoPanel"],"TOPLEFT", -3, 3)
							_G["ElvUF_FocusTarget"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_FocusTarget_InfoPanel"],"TOPRIGHT", 3, 3)
							if E.db["unitframe"]["units"]["focustarget"]["power"]["width"] == "inset" then
								_G["ElvUF_FocusTarget"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_FocusTarget_HealthBar"] ,"BOTTOMLEFT", -3, -3)
								_G["ElvUF_FocusTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_FocusTarget_HealthBar"] ,"BOTTOMRIGHT", 3, -3)
							else
								_G["ElvUF_FocusTarget"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_FocusTarget_PowerBar"] ,"BOTTOMLEFT", -3, -3)
								_G["ElvUF_FocusTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_FocusTarget_PowerBar"] ,"BOTTOMRIGHT", 3, -3)
							end
							if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_FocusTarget"].shadow) end
						end
					end
				end
			end

			local elvuiframes = {
				_G["ElvUF_TargetTarget_HealthBar"],
				_G["ElvUF_TargetTarget_PowerBar"],
				_G["ElvUF_TargetTargetTarget_HealthBar"],
				_G["ElvUF_TargetTargetTarget_PowerBar"],
				_G["ElvUF_Target_HealthBar"],
				_G["ElvUF_Target_PowerBar"],
				_G["ElvUF_Pet_HealthBar"],
				_G["ElvUF_Player_HealthBar"],
				_G["ElvUF_Player_PowerBar"],
				_G["ElvUF_Player_Stagger"],
				_G["ElvUF_Arena1"],
				_G["ElvUF_Arena2"],
				_G["ElvUF_Arena3"],
				_G["ElvUF_Arena4"],
				_G["ElvUF_Arena5"],
				_G["ElvUF_Player_CastBar"],
				_G["ElvUF_Target_CastBar"],
			}
			for _, frame in pairs(elvuiframes) do
				if frame then
					if not frame.shadow then
						if not E.db.ElvUI_EltreumUI.borders.borders then
							frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
						end
					elseif frame.shadow then
						if E.db.ElvUI_EltreumUI.borders.borders then
							frame.shadow:Hide()
						else
							frame.shadow:Show()
						end
					end
				end
			end

			if E.db["unitframe"]["units"]["player"]["portrait"]["enable"] == true and E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] == false then
				if _G["ElvUF_Player"] and not _G["ElvUF_Player"].shadow then
					if not (E.db.ElvUI_EltreumUI.borders.playerborder and E.db.ElvUI_EltreumUI.borders.borders) then
						_G["ElvUF_Player"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						_G["ElvUF_Player"].shadow:ClearAllPoints()
						_G["ElvUF_Player"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Player"] ,"TOPRIGHT", 3, 3)
						_G["ElvUF_Player"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Player"] ,"BOTTOMLEFT", -3, -3)
						if _G["ElvUF_Player_HealthBar"].shadow then
							_G["ElvUF_Player_HealthBar"].shadow:Hide()
						end
						if _G["ElvUF_Player_PowerBar"].shadow then
							_G["ElvUF_Player_PowerBar"].shadow:Hide()
						end
						if E.Retail then
							if _G["ElvUF_Player_Stagger"] and _G["ElvUF_Player_Stagger"].shadow then
								_G["ElvUF_Player_Stagger"].shadow:Hide()
							end
						end
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player"].shadow) end
					end
				end
				--[[if _G["ElvUF_Player"].Portrait.backdrop and not _G["ElvUF_Player"].Portrait.backdrop.shadow then
					if (not E.db.ElvUI_EltreumUI.borders.playerborder) then
						_G["ElvUF_Player"].Portrait.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					end
				end]]
			end

			if E.db["unitframe"]["units"]["target"]["portrait"]["enable"] == true and E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] == false then
				if _G["ElvUF_Target"] and not _G["ElvUF_Target"].shadow then
					if not (E.db.ElvUI_EltreumUI.borders.targetcastborder and E.db.ElvUI_EltreumUI.borders.borders) then
						_G["ElvUF_Target"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						_G["ElvUF_Target"].shadow:ClearAllPoints()
						_G["ElvUF_Target"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Target"] ,"TOPRIGHT", 3, 3)
						_G["ElvUF_Target"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Target"] ,"BOTTOMLEFT", -3, -3)
						if _G["ElvUF_Target_HealthBar"].shadow then
							_G["ElvUF_Target_HealthBar"].shadow:Hide()
						end
						if _G["ElvUF_Target_PowerBar"].shadow then
							_G["ElvUF_Target_PowerBar"].shadow:Hide()
						end
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Target"].shadow) end
					end
				end
				--[[if _G["ElvUF_Target"].Portrait.backdrop and not _G["ElvUF_Target"].Portrait.backdrop.shadow then
					if (not E.db.ElvUI_EltreumUI.borders.targetborder) then
						_G["ElvUF_Target"].Portrait.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					end
				end]]
			end

			--player castbar
			if E.db.unitframe.units.player.castbar.overlayOnFrame == "None" and not (E.db.ElvUI_EltreumUI.borders.playercastborder and E.db.ElvUI_EltreumUI.borders.borders) and E.db.unitframe.units.player.castbar.icon then
				if _G["ElvUF_Player_CastBar"].shadow then
					_G["ElvUF_Player_CastBar"].shadow:ClearAllPoints()
					if not E.db.unitframe.units.player.castbar.iconAttached then
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("TOPLEFT",_G["ElvUF_Player_CastBar"].Icon.bg, "TOPLEFT",-3,3)
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("BOTTOMLEFT",_G["ElvUF_Player_CastBar"].Icon.bg, "BOTTOMLEFT",-3,-3)
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("TOPRIGHT",_G["ElvUF_Player_CastBar"].backdrop, "TOPRIGHT",3,-3)
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("BOTTOMRIGHT",_G["ElvUF_Player_CastBar"].backdrop, "BOTTOMRIGHT",3,-3)
					elseif E.db.unitframe.units.player.castbar.iconAttached then
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("TOPLEFT",_G["ElvUF_Player_CastBar"].Icon, "TOPLEFT",-3,3)
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("BOTTOMLEFT",_G["ElvUF_Player_CastBar"].Icon, "BOTTOMLEFT",-3,-3)
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("TOPRIGHT",_G["ElvUF_Player_CastBar"].backdrop, "TOPRIGHT",3,-3)
						_G["ElvUF_Player_CastBar"].shadow:SetPoint("BOTTOMRIGHT",_G["ElvUF_Player_CastBar"].backdrop, "BOTTOMRIGHT",3,-3)
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player_CastBar"].shadow) end
				end
			end

			--target castbar
			if E.db.unitframe.units.target.castbar.overlayOnFrame == "None" and not (E.db.ElvUI_EltreumUI.borders.targetcastborder and E.db.ElvUI_EltreumUI.borders.borders) and E.db.unitframe.units.target.castbar.icon then
				if _G["ElvUF_Target_CastBar"].shadow then
					_G["ElvUF_Target_CastBar"].shadow:ClearAllPoints()
					if not E.db.unitframe.units.target.castbar.iconAttached then
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("TOPLEFT",_G["ElvUF_Target_CastBar"].Icon.bg, "TOPLEFT",-3,3)
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("BOTTOMLEFT",_G["ElvUF_Target_CastBar"].Icon.bg, "BOTTOMLEFT",-3,-3)
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("TOPRIGHT",_G["ElvUF_Target_CastBar"].backdrop, "TOPRIGHT",3,-3)
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("BOTTOMRIGHT",_G["ElvUF_Target_CastBar"].backdrop, "BOTTOMRIGHT",3,-3)
					elseif E.db.unitframe.units.target.castbar.iconAttached then
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("TOPLEFT",_G["ElvUF_Target_CastBar"].Icon, "TOPLEFT",-3,3)
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("BOTTOMLEFT",_G["ElvUF_Target_CastBar"].Icon, "BOTTOMLEFT",-3,-3)
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("TOPRIGHT",_G["ElvUF_Target_CastBar"].backdrop, "TOPRIGHT",3,-3)
						_G["ElvUF_Target_CastBar"].shadow:SetPoint("BOTTOMRIGHT",_G["ElvUF_Target_CastBar"].backdrop, "BOTTOMRIGHT",3,-3)
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Target_CastBar"].shadow) end
				end
			end

			--party
			for i = 1, 5 do
				local partymembers = {_G["ElvUF_PartyGroup1UnitButton"..i]}
				for _, frame in pairs(partymembers) do
					if not frame.shadow then
						if not (E.db.ElvUI_EltreumUI.borders.partyborders and E.db.ElvUI_EltreumUI.borders.borders) then
							frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if E.db["unitframe"]["units"]["party"]["power"]["enable"] and E.db["unitframe"]["units"]["party"]["power"]["width"] == "spaced" then
								frame.shadow:ClearAllPoints()
								frame.shadow:SetPoint("BOTTOMLEFT", frame.Health,"BOTTOMLEFT", -3, -3)
								frame.shadow:SetPoint("BOTTOMRIGHT", frame.Health,"BOTTOMRIGHT", 3, -3)
								frame.shadow:SetPoint("TOPLEFT", frame.Health,"TOPLEFT", -3, 3)
								frame.shadow:SetPoint("TOPRIGHT", frame.Health,"TOPRIGHT", 3, 3)
								if not frame.Power.shadow then
									frame.Power:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
									if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.Power.shadow) end
								end
							end
							if E.db.ElvUI_EltreumUI.unitframes.infopanelontop and E.db.ElvUI_EltreumUI.unitframes.infopanelontopallframes then
								frame.shadow:ClearAllPoints()
								frame.shadow:SetPoint("BOTTOMLEFT", frame.Power,"BOTTOMLEFT", -3, -3)
								frame.shadow:SetPoint("BOTTOMRIGHT", frame.Power,"BOTTOMRIGHT", 3, -3)
								frame.shadow:SetPoint("TOPLEFT", frame.InfoPanel,"TOPLEFT", -3, 3)
								frame.shadow:SetPoint("TOPRIGHT", frame.InfoPanel,"TOPRIGHT", 3, 3)
								if E.db["unitframe"]["units"]["party"]["power"]["enable"] and E.db["unitframe"]["units"]["party"]["power"]["width"] == "spaced" then
									frame.shadow:ClearAllPoints()
									frame.shadow:SetPoint("BOTTOMLEFT", frame.Health,"BOTTOMLEFT", -3, -3)
									frame.shadow:SetPoint("BOTTOMRIGHT", frame.Health,"BOTTOMRIGHT", 3, -3)
									frame.shadow:SetPoint("TOPLEFT", frame.InfoPanel,"TOPLEFT", -3, 3)
									frame.shadow:SetPoint("TOPRIGHT", frame.InfoPanel,"TOPRIGHT", 3, 3)
								end
							end
							if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
						end
					end
				end
			end

			--boss
			for i = 1, 8 do
				local bossmembers = {_G["ElvUF_Boss"..i]}
				for _, frame in pairs(bossmembers) do
					if not frame.shadow then
						if not (E.db.ElvUI_EltreumUI.borders.bossborder and E.db.ElvUI_EltreumUI.borders.borders) then
							frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if E.db.ElvUI_EltreumUI.unitframes.infopanelontop and E.db.ElvUI_EltreumUI.unitframes.infopanelontopallframes then
								frame.shadow:ClearAllPoints()
								frame.shadow:SetPoint("BOTTOMLEFT", frame.Power,"BOTTOMLEFT", -3, -3)
								frame.shadow:SetPoint("BOTTOMRIGHT", frame.Power,"BOTTOMRIGHT", 3, -3)
								frame.shadow:SetPoint("TOPLEFT", frame.InfoPanel,"TOPLEFT", -3, 3)
								frame.shadow:SetPoint("TOPRIGHT", frame.InfoPanel,"TOPRIGHT", 3, 3)
							end
							if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
						end
					end
					--[[for _, button in pairs(bossmembers) do
						if not button.shadow then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						end
					end]]
				end
			end

			--tanks
			for i = 1, 8 do
				local tankmembers = {_G["ElvUF_TankUnitButton"..i]}
				for _, frame in pairs(tankmembers) do
					if not frame.shadow then
						frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if E.db.ElvUI_EltreumUI.unitframes.infopanelontop and E.db.ElvUI_EltreumUI.unitframes.infopanelontopallframes then
							frame.shadow:ClearAllPoints()
							frame.shadow:SetPoint("BOTTOMLEFT", frame.Power,"BOTTOMLEFT", -3, -3)
							frame.shadow:SetPoint("BOTTOMRIGHT", frame.Power,"BOTTOMRIGHT", 3, -3)
							frame.shadow:SetPoint("TOPLEFT", frame.InfoPanel,"TOPLEFT", -3, 3)
							frame.shadow:SetPoint("TOPRIGHT", frame.InfoPanel,"TOPRIGHT", 3, 3)
						end
						if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
					end
					--[[for _, button in pairs(tankmembers) do
						if not button.shadow then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						end
					end]]
				end
			end

			--assists
			for i = 1, 8 do
				local assistmembers = {_G["ElvUF_AssistUnitButton"..i]}
				for _, frame in pairs(assistmembers) do
					if not frame.shadow then
						frame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if E.db.ElvUI_EltreumUI.unitframes.infopanelontop and E.db.ElvUI_EltreumUI.unitframes.infopanelontopallframes then
							frame.shadow:ClearAllPoints()
							frame.shadow:SetPoint("BOTTOMLEFT", frame.Power,"BOTTOMLEFT", -3, -3)
							frame.shadow:SetPoint("BOTTOMRIGHT", frame.Power,"BOTTOMRIGHT", 3, -3)
							frame.shadow:SetPoint("TOPLEFT", frame.InfoPanel,"TOPLEFT", -3, 3)
							frame.shadow:SetPoint("TOPRIGHT", frame.InfoPanel,"TOPRIGHT", 3, 3)
						end
						if EnhancedShadows then EnhancedShadows:RegisterShadow(frame.shadow) end
					end
					--[[for _, button in pairs(assistmembers) do
						if not button.shadow then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						end
					end]]
				end
			end

			--runes
			if E.myclass == 'DEATHKNIGHT' then
				for i = 1, 6 do
					if not _G["ElvUF_PlayerRuneButton"..i] then
						break
					end
					local button = _G["ElvUF_PlayerRuneButton"..i] --.backdrop
					if not button then
						break
					else
						if not button.shadow and (E.db["unitframe"]["units"]["player"]["classbar"]["fill"] == "spaced" or E.db["unitframe"]["units"]["player"]["classbar"]["detachFromFrame"] == true) then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
						end
					end
				end
			end

			--AdditionalPowerBar
			if E.myclass == 'DRUID' or E.myclass == 'SHAMAN' or E.myclass == 'PRIEST' then
				local additionalpowerbar = _G["ElvUF_Player_AdditionalPowerBar"]
				if additionalpowerbar ~= nil then
					if not _G["ElvUF_Player_AdditionalPowerBar"].shadow then
						_G["ElvUF_Player_AdditionalPowerBar"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
						if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player_AdditionalPowerBar"].shadow) end
					end
				end
			end

			--classpower
			if not (E.myclass == 'DEATHKNIGHT') then
				for i = 1, 10 do
					if not _G["ElvUF_PlayerClassIconButton"..i] then
						break
					end
					local button = _G["ElvUF_PlayerClassIconButton"..i].backdrop
					if not button then
						break
					else
						if not button.shadow then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
						end
					end
				end
			end
		end

		--handle non spaced power and classpower
		if E.db["unitframe"]["units"]["target"]["power"]["width"] ~= "spaced" and E.db["unitframe"]["units"]["target"]["power"]["detachFromFrame"] == false then
			if _G["ElvUF_Target_PowerBar"] and _G["ElvUF_Target_PowerBar"].shadow then
				_G["ElvUF_Target_PowerBar"].shadow:Hide()
			end
			if _G["ElvUF_Target_HealthBar"] and _G["ElvUF_Target_HealthBar"].shadow then
				_G["ElvUF_Target_HealthBar"].shadow:Hide()
			end
			if _G["ElvUF_Target"] and not _G["ElvUF_Target"].shadow then
				_G["ElvUF_Target"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Target"].shadow) end
			end
			if E.db["unitframe"]["units"]["target"]["power"]["width"] == "inset" then
				if _G["ElvUF_Target"] and _G["ElvUF_Target"].shadow then
					_G["ElvUF_Target"].shadow:ClearAllPoints()
					_G["ElvUF_Target"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Target"], "TOPLEFT",-3,3)
					_G["ElvUF_Target"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Target"], "BOTTOMRIGHT",3,-3)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Target"].shadow) end
				end
			else
				if _G["ElvUF_Target"] and _G["ElvUF_Target"].shadow then
					_G["ElvUF_Target"].shadow:ClearAllPoints()
					_G["ElvUF_Target"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Target_HealthBar"], "TOPLEFT",-3,3)
					_G["ElvUF_Target"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Target_PowerBar"], "BOTTOMRIGHT",3,-3)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Target"].shadow) end
				end
			end
		end
		if E.db["unitframe"]["units"]["targettarget"]["power"]["width"] ~= "spaced" and E.db["unitframe"]["units"]["targettarget"]["power"]["detachFromFrame"] == false then
			if _G["ElvUF_TargetTarget_PowerBar"] and _G["ElvUF_TargetTarget_PowerBar"].shadow then
				_G["ElvUF_TargetTarget_PowerBar"].shadow:Hide()
			end
			if _G["ElvUF_TargetTarget_HealthBar"] and _G["ElvUF_TargetTarget_HealthBar"].shadow then
				_G["ElvUF_TargetTarget_HealthBar"].shadow:Hide()
			end
			if _G["ElvUF_TargetTarget"] and not _G["ElvUF_TargetTarget"].shadow then
				_G["ElvUF_TargetTarget"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_TargetTarget"].shadow) end
			end
			if E.db["unitframe"]["units"]["targettarget"]["power"]["width"] == "inset" then
				if _G["ElvUF_TargetTarget"] and _G["ElvUF_TargetTarget"].shadow then
					_G["ElvUF_TargetTarget"].shadow:ClearAllPoints()
					_G["ElvUF_TargetTarget"].shadow:SetPoint("TOPLEFT", _G["ElvUF_TargetTarget"], "TOPLEFT",-3,3)
					_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_TargetTarget"], "BOTTOMRIGHT",3,-3)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_TargetTarget"].shadow) end
				end
			else
				if _G["ElvUF_TargetTarget"] and _G["ElvUF_TargetTarget"].shadow then
					_G["ElvUF_TargetTarget"].shadow:ClearAllPoints()
					_G["ElvUF_TargetTarget"].shadow:SetPoint("TOPLEFT", _G["ElvUF_TargetTarget_HealthBar"], "TOPLEFT",-3,3)
					_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_TargetTarget_PowerBar"], "BOTTOMRIGHT",3,-3)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_TargetTarget"].shadow) end
				end
			end
		end
		if E.db["unitframe"]["units"]["player"]["power"]["width"] ~= "spaced" and E.db["unitframe"]["units"]["player"]["power"]["detachFromFrame"] == false then

			if _G["ElvUF_Player_PowerBar"] and _G["ElvUF_Player_PowerBar"].shadow then
				_G["ElvUF_Player_PowerBar"].shadow:Hide()
			end
			if _G["ElvUF_Player_HealthBar"] and _G["ElvUF_Player_HealthBar"].shadow then
				_G["ElvUF_Player_HealthBar"].shadow:Hide()
			end
			if _G["ElvUF_Player"] and not _G["ElvUF_Player"].shadow then
				_G["ElvUF_Player"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player"].shadow) end
			end
			if E.db["unitframe"]["units"]["player"]["power"]["width"] == "inset" then
				if _G["ElvUF_Player"] and _G["ElvUF_Player"].shadow then
					_G["ElvUF_Player"].shadow:ClearAllPoints()
					_G["ElvUF_Player"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Player"], "TOPLEFT",-3,3)
					_G["ElvUF_Player"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Player"], "BOTTOMRIGHT",3,-3)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player"].shadow) end
				end
			else
				if _G["ElvUF_Player"] and _G["ElvUF_Player"].shadow then
					_G["ElvUF_Player"].shadow:ClearAllPoints()
					_G["ElvUF_Player"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Player_HealthBar"], "TOPLEFT",-3,3)
					_G["ElvUF_Player"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Player_PowerBar"], "BOTTOMRIGHT",3,-3)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player"].shadow) end
				end
			end
		end
		if E.db["unitframe"]["units"]["player"]["classbar"]["fill"] ~= "spaced" and not E.db["unitframe"]["units"]["player"]["classbar"]["detachFromFrame"] == true then
			if _G["ElvUF_Player_Stagger"] and _G["ElvUF_Player_Stagger"].shadow then
				_G["ElvUF_Player_Stagger"].shadow:Hide()
			end
			if _G["ElvUF_Player_AdditionalPowerBar"] and _G["ElvUF_Player_AdditionalPowerBar"].shadow then
				_G["ElvUF_Player_AdditionalPowerBar"].shadow:Hide()
			end
		end

		--bags
		if E.private.bags.enable then
			if not _G.ElvUI_ContainerFrame.shadow then
				_G["ElvUI_ContainerFrame"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUI_ContainerFrame"].shadow) end
			end
			if not _G.ElvUI_BankContainerFrame.shadow then
				_G["ElvUI_BankContainerFrame"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUI_BankContainerFrame"].shadow) end
			end
		end

		--elvui popup
		for i = 1, 5 do
			local ElvUI_StaticPopups = {_G["ElvUI_StaticPopup"..i]}
			for _, button in pairs(ElvUI_StaticPopups) do
				if not button.shadow then
					button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
				end
			end
		end

		--chat
		if not (E.db.ElvUI_EltreumUI.borders.chatborder and E.db.ElvUI_EltreumUI.borders.borders) then
			local RightChatShadow = CreateFrame("Frame", "EltruismRightChatShadowFrame")
			local rightsizex, rightsizey = _G["RightChatMover"]:GetSize()
			RightChatShadow:SetSize(rightsizex, rightsizey)
			RightChatShadow:SetParent(_G["RightChatPanel"].backdrop)
			local LeftChatShadow = CreateFrame("Frame", "EltruismLeftChatShadowFrame")
			local leftsizex, leftsizey = _G["LeftChatMover"]:GetSize()
			LeftChatShadow:SetSize(leftsizex, leftsizey)
			LeftChatShadow:SetParent(_G["LeftChatPanel"].backdrop)

			if E.db["datatexts"]["panels"]["EltruismDataText"] and E.db["datatexts"]["panels"]["EltruismDataText"]["enable"] then
				if _G["RightChatPanel"] and _G["RightChatPanel"].backdrop and not _G["RightChatPanel"].backdrop.shadow then
					_G["RightChatPanel"].backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(RightChatShadow.shadow) end
				end
				if _G["LeftChatPanel"] and _G["LeftChatPanel"].backdrop and not _G["LeftChatPanel"].backdrop.shadow then
					_G["LeftChatPanel"].backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					if EnhancedShadows then EnhancedShadows:RegisterShadow(LeftChatShadow.shadow) end
				end
			else
				if not (self.RightChatIsSkinned) then
					RightChatShadow.shadow = RightChatShadow:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					RightChatShadow:SetPoint("TOPRIGHT", _G["RightChatPanel"] ,"TOPRIGHT", 0, 0)
					if E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] then
						RightChatShadow:SetPoint("BOTTOMLEFT", _G["RightChatDataPanel"] ,"BOTTOMLEFT", 0, 0)
					else
						RightChatShadow:SetPoint("BOTTOMLEFT", _G["RightChatPanel"] ,"BOTTOMLEFT", 0, 0)
					end
					RightChatShadow:Show()
					if EnhancedShadows then EnhancedShadows:RegisterShadow(RightChatShadow.shadow) end
					self.RightChatIsSkinned = true
				end
				if not (self.LeftChatIsSkinned) then
					LeftChatShadow.shadow = LeftChatShadow:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
					LeftChatShadow:SetPoint("TOPLEFT", _G["LeftChatPanel"] ,"TOPLEFT", 0, 0)
					if E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] then
						LeftChatShadow:SetPoint("BOTTOMRIGHT", _G["LeftChatDataPanel"] ,"BOTTOMRIGHT", 0, 0)
					else
						LeftChatShadow:SetPoint("BOTTOMRIGHT", _G["LeftChatPanel"] ,"BOTTOMRIGHT", 0, 0)
					end
					LeftChatShadow:Show()
					if EnhancedShadows then EnhancedShadows:RegisterShadow(LeftChatShadow.shadow) end
					self.LeftChatIsSkinned = true
				end
			end
			if E.db["chat"]["panelBackdrop"] == "LEFT" then
				RightChatShadow:Hide()
			elseif E.db["chat"]["panelBackdrop"] == "RIGHT" then
				LeftChatShadow:Hide()
			elseif E.db["chat"]["panelBackdrop"] == "HIDEBOTH" then
				LeftChatShadow:Hide()
				RightChatShadow:Hide()
			end
		end

		--info panel on top
		if E.db.ElvUI_EltreumUI.unitframes.infopanelontop then
			if E.db["unitframe"]["units"]["player"]["infoPanel"]["enable"] then
				if not _G["ElvUF_Player"].shadow then
					_G["ElvUF_Player"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				end
				if _G["ElvUF_Player"].shadow then
					_G["ElvUF_Player"].shadow:Show()
					_G["ElvUF_Player"].shadow:ClearAllPoints()
					_G["ElvUF_Player"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Player_HealthBar"],"BOTTOMLEFT", -3, -3)
					_G["ElvUF_Player"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Player_HealthBar"] ,"BOTTOMRIGHT", 3, -3)
					_G["ElvUF_Player"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Player_InfoPanel"],"TOPLEFT", -3, 3)
					_G["ElvUF_Player"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Player_InfoPanel"],"TOPRIGHT", 3, 3)
					local benikdettached = false
					if IsAddOnLoaded("ElvUI_BenikUI") then
						benikdettached = E.db.benikui.unitframes.player.detachPortrait
					end
					if E.db["unitframe"]["units"]["player"]["portrait"]["enable"] and E.db["unitframe"]["units"]["player"]["portrait"]["style"] ~= "3D" and not benikdettached then
						_G["ElvUF_Player"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Player"].Portrait,"BOTTOMLEFT", -3, -3)
						_G["ElvUF_Player"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Player"].Portrait,"TOPLEFT", -3, 3)
					end
					if E.db["unitframe"]["units"]["player"]["power"]["enable"] then
						if E.db["unitframe"]["units"]["player"]["power"]["width"] == "fill" then
							_G["ElvUF_Player"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Player_PowerBar"],"BOTTOMLEFT", -3, -3)
							_G["ElvUF_Player"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Player_PowerBar"] ,"BOTTOMRIGHT", 3, -3)
						end
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Player"].shadow) end
				end
			end
			if E.db["unitframe"]["units"]["target"]["infoPanel"]["enable"] then
				if not _G["ElvUF_Target"].shadow then
					_G["ElvUF_Target"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				end
				if _G["ElvUF_Target"].shadow then
					_G["ElvUF_Target"].shadow:ClearAllPoints()
					_G["ElvUF_Target"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Target_HealthBar"],"BOTTOMLEFT", -3, -3)
					_G["ElvUF_Target"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Target_HealthBar"],"BOTTOMRIGHT", 3, -3)
					_G["ElvUF_Target"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Target_InfoPanel"],"TOPLEFT", -3, 3)
					_G["ElvUF_Target"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Target_InfoPanel"],"TOPRIGHT", 3, 3)
					local benikdettachedtarget = false
					if IsAddOnLoaded("ElvUI_BenikUI") then
						benikdettachedtarget = E.db.benikui.unitframes.target.detachPortrait
					end
					if E.db["unitframe"]["units"]["target"]["portrait"]["enable"] and E.db["unitframe"]["units"]["target"]["portrait"]["style"] ~= "3D" and not benikdettachedtarget then
						_G["ElvUF_Target"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Target"].Portrait,"BOTTOMRIGHT", 3, -3)
						_G["ElvUF_Target"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Target"].Portrait,"TOPRIGHT", 3, 3)
					end
					if E.db["unitframe"]["units"]["target"]["power"]["enable"] then
						if E.db["unitframe"]["units"]["target"]["power"]["width"] == "fill" then
							_G["ElvUF_Target"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Target_PowerBar"],"BOTTOMRIGHT", 3, -3)
							_G["ElvUF_Target"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Target_PowerBar"],"BOTTOMLEFT", -3, -3)
						end
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Target"].shadow) end
				end
			end

			if E.db["unitframe"]["units"]["targettarget"]["infoPanel"]["enable"] then
				if _G["ElvUF_TargetTarget"].shadow then
					_G["ElvUF_TargetTarget"].shadow:ClearAllPoints()
					_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_TargetTarget_HealthBar"],"BOTTOMLEFT", -3, -3)
					_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_TargetTarget_HealthBar"],"BOTTOMRIGHT", 3, -3)
					_G["ElvUF_TargetTarget"].shadow:SetPoint("TOPLEFT", _G["ElvUF_TargetTarget_InfoPanel"],"TOPLEFT", -3, 3)
					_G["ElvUF_TargetTarget"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_TargetTarget_InfoPanel"],"TOPRIGHT", 3, 3)
					if E.db["unitframe"]["units"]["targettarget"]["power"]["enable"] then
						if E.db["unitframe"]["units"]["targettarget"]["power"]["width"] == "inset" then
							_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_TargetTarget_HealthBar"] ,"BOTTOMLEFT", -3, -3)
							_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_TargetTarget_HealthBar"] ,"BOTTOMRIGHT", 3, -3)
						else
							_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_TargetTarget_PowerBar"] ,"BOTTOMLEFT", -3, -3)
							_G["ElvUF_TargetTarget"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_TargetTarget_PowerBar"] ,"BOTTOMRIGHT", 3, -3)
						end
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_TargetTarget"].shadow) end
				end
			end

			if E.db["unitframe"]["units"]["pet"]["infoPanel"]["enable"] then
				if _G["ElvUF_Pet_HealthBar"].shadow then
					_G["ElvUF_Pet_HealthBar"].shadow:Hide()
				end
				if not _G["ElvUF_Pet"].shadow then
					_G["ElvUF_Pet"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				end
				if _G["ElvUF_Pet"].shadow then
					_G["ElvUF_Pet"].shadow:Show()
					_G["ElvUF_Pet"].shadow:ClearAllPoints()
					_G["ElvUF_Pet"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Pet_HealthBar"],"BOTTOMLEFT", -3, -3)
					_G["ElvUF_Pet"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Pet_HealthBar"] ,"BOTTOMRIGHT", 3, -3)
					_G["ElvUF_Pet"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Pet_InfoPanel"],"TOPLEFT", -3, 3)
					_G["ElvUF_Pet"].shadow:SetPoint("TOPRIGHT", _G["ElvUF_Pet_InfoPanel"],"TOPRIGHT", 3, 3)
					if E.db["unitframe"]["units"]["pet"]["portrait"]["enable"] then
						_G["ElvUF_Pet"].shadow:SetPoint("BOTTOMLEFT", _G["ElvUF_Pet"].Portrait,"BOTTOMLEFT", -3, -3)
						_G["ElvUF_Pet"].shadow:SetPoint("TOPLEFT", _G["ElvUF_Pet"].Portrait,"TOPLEFT", -3, 3)
					end
					if E.db["unitframe"]["units"]["pet"]["power"]["enable"] then
						if E.db["unitframe"]["units"]["pet"]["power"]["width"] == "inset" then
							_G["ElvUF_Pet"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Pet_HealthBar"],"BOTTOMRIGHT", 3, -3)
						else
							_G["ElvUF_Pet"].shadow:SetPoint("BOTTOMRIGHT", _G["ElvUF_Pet_PowerBar"] ,"BOTTOMRIGHT", 3, -3)
						end
					end
					if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvUF_Pet"].shadow) end
				end
			end
		end

		------------------------------------------------------------------------------------------------------end of elvui frames
		if IsAddOnLoaded('ProjectAzilroka') then
			if _G.stAMFrame and not _G.stAMFrame.shadow then
				_G.stAMFrame:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.stAMFrame.shadow) end
			end

			if _G.stAMProfileMenu and not _G.stAMProfileMenu.shadow then
				_G.stAMProfileMenu:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.stAMProfileMenu.shadow) end
			end

			if _G.SquareMinimapButtonBar and not _G.SquareMinimapButtonBar.shadow then
				_G.SquareMinimapButtonBar:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G.SquareMinimapButtonBar.shadow) end
			end
		end
	end
end

function ElvUI_EltreumUI:RaidShadows()
	if E.private.unitframe.enable and E.db.ElvUI_EltreumUI.skins.shadow.enable and E.db.ElvUI_EltreumUI.skins.shadow.raid and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.raidborders) then
		--raid
		for i = 1, 3 do
			for k = 1, 8 do
				for l = 1, 5 do
					local slots = {_G["ElvUF_Raid"..i..'Group'..k..'UnitButton'..l]}
					for _, button in pairs(slots) do
						if button and not button.shadow then
							button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
							if E.db.ElvUI_EltreumUI.unitframes.infopanelontop and E.db.ElvUI_EltreumUI.unitframes.infopanelontopallframes then
								button.shadow:ClearAllPoints()
								--[[if button.Power then
									button.shadow:SetPoint("BOTTOMLEFT", button.Power,"BOTTOMLEFT", -3, -3)
									button.shadow:SetPoint("BOTTOMRIGHT", button.Power,"BOTTOMRIGHT", 3, -3)
								else
									button.shadow:SetPoint("BOTTOMLEFT", button.Health,"BOTTOMLEFT", -3, -3)
									button.shadow:SetPoint("BOTTOMRIGHT", button.Health,"BOTTOMRIGHT", 3, -3)
								end]]
								button.shadow:SetPoint("BOTTOMLEFT", button.Health,"BOTTOMLEFT", -3, -3)
								button.shadow:SetPoint("BOTTOMRIGHT", button.Health,"BOTTOMRIGHT", 3, -3)
								button.shadow:SetPoint("TOPLEFT", button.InfoPanel,"TOPLEFT", -3, 3)
								button.shadow:SetPoint("TOPRIGHT", button.InfoPanel,"TOPRIGHT", 3, 3)
							end
							button.shadow:SetParent(button)
							if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
						end
					end
				end
			end
		end
	end
end

--benik's version
function ElvUI_EltreumUI:NameplateShadows(nameplate)
	if E.private.nameplates.enable and E.db.ElvUI_EltreumUI.skins.shadow.enable then
		if E.db.ElvUI_EltreumUI.skins.shadow.nameplates then
			if nameplate.Health.backdrop and not nameplate.Health.backdrop.shadow then
				nameplate.Health.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(nameplate.Health.backdrop.shadow) end
			end
		end

		if E.db.ElvUI_EltreumUI.skins.shadow.nppower then
			if nameplate.Power.backdrop and not nameplate.Power.backdrop.shadow then
				nameplate.Power.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(nameplate.Power.backdrop.shadow) end
			end
			if _G["ElvNP_TargetClassPowerClassPower"] and not _G["ElvNP_TargetClassPowerClassPower"].shadow then
				_G["ElvNP_TargetClassPowerClassPower"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["ElvNP_TargetClassPowerClassPower"].shadow) end
			end
			if _G["EltruismPowerBar"] and not _G["EltruismPowerBar"].shadow then
				_G["EltruismPowerBar"]:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(_G["EltruismPowerBar"].shadow) end
			end
		end

		if E.db.ElvUI_EltreumUI.skins.shadow.npcastbar then
			if nameplate.Castbar.backdrop and not nameplate.Castbar.backdrop.shadow then
				nameplate.Castbar.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(nameplate.Castbar.backdrop.shadow) end
			end

			if nameplate.Castbar.Button and not nameplate.Castbar.Button.shadow then
				nameplate.Castbar.Button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(nameplate.Castbar.Button.shadow) end
			end
		end

		if E.db.ElvUI_EltreumUI.skins.shadow.npportraits then
			if nameplate.Portrait.backdrop and not nameplate.Portrait.backdrop.shadow then
				nameplate.Portrait.backdrop:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
				if EnhancedShadows then EnhancedShadows:RegisterShadow(nameplate.Portrait.backdrop.shadow) end
			end
		end
	end
end
hooksecurefunc(NP, 'StylePlate', ElvUI_EltreumUI.NameplateShadows) --nameplate shadows

function ElvUI_EltreumUI:Construct_AuraIcon(button)
	if E.db.ElvUI_EltreumUI.skins.shadow.enable and E.db.ElvUI_EltreumUI.skins.shadow.npauras then
		if button and not button.shadow then
			button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
			if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
		end
	end
end
hooksecurefunc(NP, 'Construct_AuraIcon', ElvUI_EltreumUI.Construct_AuraIcon) --nameplate buffs/debuffs shadows

function ElvUI_EltreumUI:AuraShadows(button)
	if E.db.ElvUI_EltreumUI.skins.shadow.enable and E.db.ElvUI_EltreumUI.skins.shadow.aura and not (E.db.ElvUI_EltreumUI.borders.borders and E.db.ElvUI_EltreumUI.borders.auraborder) then
		if button and not button.shadow then
			button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
			if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
		end
	end
end
hooksecurefunc(A, 'CreateIcon', ElvUI_EltreumUI.AuraShadows) --aura (minimap) shadows

function ElvUI_EltreumUI:UFAuraShadows(button)
	if E.db.ElvUI_EltreumUI.skins.shadow.enable and E.db.ElvUI_EltreumUI.skins.shadow.ufaura then
		if button and not button.shadow then
			button:CreateShadow(E.db.ElvUI_EltreumUI.skins.shadow.length)
			if EnhancedShadows then EnhancedShadows:RegisterShadow(button.shadow) end
		end
	end
end
hooksecurefunc(UF, 'Construct_AuraIcon', ElvUI_EltreumUI.UFAuraShadows) --uf aura shadows

