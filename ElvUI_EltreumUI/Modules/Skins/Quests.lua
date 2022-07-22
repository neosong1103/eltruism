local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local S = E:GetModule('Skins')
local _G = _G
local classcolor = E:ClassColor(E.myclass, true)
local ObjectiveTrackerBlocksFrame, ScenarioObjectiveBlockBackground, ScenarioObjectiveBlockBackgroundTexture

if E.Retail then
	ScenarioObjectiveBlockBackground = CreateFrame("Frame", "EltruismScenarioBlockBg")
	ScenarioObjectiveBlockBackgroundTexture = ScenarioObjectiveBlockBackground:CreateTexture()
	ObjectiveTrackerBlocksFrame = _G.ObjectiveTrackerBlocksFrame
	ObjectiveTrackerBlocksFrame.ScenarioHeader.StatusLine = CreateFrame("StatusBar", "EltruismScenarioLine", ObjectiveTrackerBlocksFrame.ScenarioHeader)
	ObjectiveTrackerBlocksFrame.CampaignQuestHeader.StatusLine = CreateFrame("StatusBar", "EltruismCampaignLine", ObjectiveTrackerBlocksFrame.CampaignQuestHeader)
	ObjectiveTrackerBlocksFrame.QuestHeader.StatusLine = CreateFrame("StatusBar", "EltruismQuestLine", ObjectiveTrackerBlocksFrame.QuestHeader)
	ObjectiveTrackerBlocksFrame.AchievementHeader.StatusLine = CreateFrame("StatusBar", "EltruismAchievementLine", ObjectiveTrackerBlocksFrame.AchievementHeader)
end

local dontexpandanymorequests = 0
function ElvUI_EltreumUI:SkinQuests()
	local fontsize = E.db.general.fontSize
	if E.db.ElvUI_EltreumUI.skins.quests and E.private.skins.blizzard.objectiveTracker and not E.private.skins.blizzard.enable == false then

		--create the button for wowhead
		local wowheadbutton = CreateFrame("Button", nil)
		if E.Retail then
			wowheadbutton:SetWidth(80)
			wowheadbutton:SetHeight(20)
			wowheadbutton:SetParent(_G.WorldMapFrame)
			wowheadbutton:SetPoint("TOPRIGHT", _G.WorldMapFrame, "TOPRIGHT", -80, 0)
		elseif E.Wrath or E.TBC or E.Classic then
			local x, y = _G.QuestFramePushQuestButton:GetSize()
			wowheadbutton:SetWidth(x)
			wowheadbutton:SetHeight(y)
			wowheadbutton:SetParent(_G.QuestLogFrame)
			wowheadbutton:SetPoint("LEFT", _G.QuestFramePushQuestButton, "LEFT", -x-2, 0)
		end
		wowheadbutton:SetText("Wowhead")
		wowheadbutton:SetNormalFontObject("GameFontNormal")
		--let elvui handle the button skin
		S:HandleButton(wowheadbutton)
		--get the wowhead region based on game language region
		local wowheadregion
		if E.locale == "deDE" then
			wowheadregion = "de.wowhead.com"
		elseif E.locale == "enUS" or E.locale == "enCN" or E.locale == "enGB" or E.locale == "enTW" then
			wowheadregion = "wowhead.com"
		elseif E.locale == "esMX" or E.locale == "esES" then
			wowheadregion = "es.wowhead.com"
		elseif E.locale == "frFR" then
			wowheadregion = "fr.wowhead.com"
		elseif E.locale == "itIT" then
			wowheadregion = "it.wowhead.com"
		elseif E.locale == "koKR" then
			wowheadregion = "ko.wowhead.com"
		elseif E.locale == "ptBR" or E.locale == "ptPT" then
			wowheadregion = "pt.wowhead.com"
		elseif E.locale == "ruRU" then
			wowheadregion = "ru.wowhead.com"
		elseif E.locale == "zhCN" or E.locale == "zhTW" then
			wowheadregion = "cn.wowhead.com"
		end
		--register the button for clicks
		wowheadbutton:RegisterForClicks("AnyUp")
		if not E.db.ElvUI_EltreumUI.skins.questswowhead then
			wowheadbutton:Hide()
		end

		if E.Retail then
			--get questid
			local questID
			local getquestid = CreateFrame("FRAME")
			getquestid:RegisterEvent("QUEST_DATA_LOAD_RESULT")
			getquestid:SetScript("OnEvent", function()
				questID = QuestMapFrame_GetDetailQuestID()
				if questID ~= nil then
					questID = questID
				elseif questID == nil then
					questID = _G.C_SuperTrack.GetSuperTrackedQuestID()
				end
			end)
			--set the link to show when the button is clicked
			wowheadbutton:SetScript('OnClick', function()
				if questID ~= 0 then
					E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, "https://"..wowheadregion.."/quest="..questID)
				else
					E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, L["No quest selected"])
				end
			end)

			-- and (not IsAddOnLoaded("ElvUI_WindTools"))
			if (not IsAddOnLoaded('!KalielsTracker')) and (not IsAddOnLoaded('SorhaQuestLog')) and (not IsAddOnLoaded('ClassicQuestLog')) and (not IsAddOnLoaded('Who Framed Watcher Wabbit?')) then
				--WQs banner
				if _G.ObjectiveTrackerBonusBannerFrame then
					--textcoords from https://www.townlong-yak.com/framexml/39229/Helix/AtlasInfo.lua
					_G.ObjectiveTrackerBonusBannerFrame.Title:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
					_G.ObjectiveTrackerBonusBannerFrame.Title:SetText("") --so that the text doesn't show up when it shouldnt
					_G.ObjectiveTrackerBonusBannerFrame.Icon:SetTexture("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\bonusobjectives")
					_G.ObjectiveTrackerBonusBannerFrame.Icon:SetTexCoord(0.482422, 0.785156, 0.00195312, 0.294922)
					_G.ObjectiveTrackerBonusBannerFrame.Icon2:SetTexture("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\bonusobjectives")
					_G.ObjectiveTrackerBonusBannerFrame.Icon2:SetTexCoord(0.482422, 0.785156, 0.00195312, 0.294922)
					_G.ObjectiveTrackerBonusBannerFrame.Icon3:SetTexture("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\bonusobjectives")
					_G.ObjectiveTrackerBonusBannerFrame.Icon3:SetTexCoord(0.482422, 0.785156, 0.00195312, 0.294922)
					_G.ObjectiveTrackerBonusBannerFrame.BG1:SetTexture("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\bonusobjectives")
					_G.ObjectiveTrackerBonusBannerFrame.BG1:SetTexCoord(0.00195312, 0.818359, 0.359375, 0.507812)
					_G.ObjectiveTrackerBonusBannerFrame.BG2:SetTexture("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\bonusobjectives")
					_G.ObjectiveTrackerBonusBannerFrame.BG2:SetTexCoord(0.00195312, 0.818359, 0.359375, 0.507812)
					_G.ObjectiveTrackerBonusBannerFrame.BG1:SetVertexColor(classcolor.r, classcolor.g, classcolor.b) --bonusobjectives-title-bg
					_G.ObjectiveTrackerBonusBannerFrame.BG2:SetVertexColor(classcolor.r, classcolor.g, classcolor.b) --bonusobjectives-title-bg
					_G.ObjectiveTrackerBonusBannerFrame.Icon:SetVertexColor(classcolor.r, classcolor.g, classcolor.b) --bonusobjectives-title-icon
					_G.ObjectiveTrackerBonusBannerFrame.Icon2:SetVertexColor(classcolor.r, classcolor.g, classcolor.b) --bonusobjectives-title-icon
					_G.ObjectiveTrackerBonusBannerFrame.Icon3:SetVertexColor(classcolor.r, classcolor.g, classcolor.b) --bonusobjectives-title-icon
				end

				--create the lines
				if ObjectiveTrackerBlocksFrame and (not IsAddOnLoaded("ElvUI_SLE")) then

					ObjectiveTrackerBlocksFrame.ScenarioHeader.StatusLine:SetSize(250, 2)
					ObjectiveTrackerBlocksFrame.ScenarioHeader.StatusLine:SetPoint("BOTTOM", ObjectiveTrackerBlocksFrame.ScenarioHeader, 0, -1)
					ObjectiveTrackerBlocksFrame.ScenarioHeader.StatusLine:SetStatusBarTexture(E.Media.Textures.Highlight)
					ObjectiveTrackerBlocksFrame.ScenarioHeader.StatusLine:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)

					ObjectiveTrackerBlocksFrame.CampaignQuestHeader.StatusLine:SetSize(250, 2)
					ObjectiveTrackerBlocksFrame.CampaignQuestHeader.StatusLine:SetPoint("BOTTOM", ObjectiveTrackerBlocksFrame.CampaignQuestHeader, 0, -1)
					ObjectiveTrackerBlocksFrame.CampaignQuestHeader.StatusLine:SetStatusBarTexture(E.Media.Textures.Highlight)
					ObjectiveTrackerBlocksFrame.CampaignQuestHeader.StatusLine:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)

					ObjectiveTrackerBlocksFrame.QuestHeader.StatusLine:SetSize(250, 2)
					ObjectiveTrackerBlocksFrame.QuestHeader.StatusLine:SetPoint("BOTTOM", ObjectiveTrackerBlocksFrame.QuestHeader, 0, -1)
					ObjectiveTrackerBlocksFrame.QuestHeader.StatusLine:SetStatusBarTexture(E.Media.Textures.Highlight)
					ObjectiveTrackerBlocksFrame.QuestHeader.StatusLine:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)

					ObjectiveTrackerBlocksFrame.AchievementHeader.StatusLine:SetSize(250, 2)
					ObjectiveTrackerBlocksFrame.AchievementHeader.StatusLine:SetPoint("BOTTOM", ObjectiveTrackerBlocksFrame.AchievementHeader, 0, -1)
					ObjectiveTrackerBlocksFrame.AchievementHeader.StatusLine:SetStatusBarTexture(E.Media.Textures.Highlight)
					ObjectiveTrackerBlocksFrame.AchievementHeader.StatusLine:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)
				end

				--Interface/AddOns/Blizzard_ObjectiveTracker/Blizzard_ObjectiveTracker.lua
				local questmodules = {
					_G.QUEST_TRACKER_MODULE,
					_G.ACHIEVEMENT_TRACKER_MODULE,
					_G.BONUS_OBJECTIVE_TRACKER_MODULE,
					_G.WORLD_QUEST_TRACKER_MODULE,
					_G.UI_WIDGET_TRACKER_MODULE,
					_G.CAMPAIGN_QUEST_TRACKER_MODULE,
				}
				local mult = 0.85
				for _, k in pairs(questmodules) do
					hooksecurefunc(k, "AddObjective", function(_, block)
						if not block then
							return
						end
						if block.HeaderText then --quest title
							if not IsAddOnLoaded("ElvUI_SLE") then
								block.HeaderText:SetFont(E.LSM:Fetch('font', E.db.general.font), 13, E.db.general.fontStyle)
							end
							block.HeaderText:SetTextColor(mult * classcolor.r, mult * classcolor.g, mult * classcolor.b)
							block.HeaderText:SetWordWrap(true)
						end
						if block.currentLine then --quest text
							if block.currentLine.objectiveKey == 0 then --also quest title
								if not IsAddOnLoaded("ElvUI_SLE") then
									block.currentLine.Text:SetFont(E.LSM:Fetch('font', E.db.general.font), 12, E.db.general.fontStyle)
								end
								block.currentLine.Text:SetTextColor(mult * classcolor.r, mult * classcolor.g, mult * classcolor.b)
								block.currentLine.Text:SetWordWrap(true)
							else --step/description of the quest
								if not IsAddOnLoaded("ElvUI_SLE") then
									block.currentLine.Text:SetFont(E.LSM:Fetch('font', E.db.general.font), 12, E.db.general.fontStyle)
								end
								block.currentLine.Text:SetTextColor(mult, mult, mult)
								block.currentLine.Text:SetWordWrap(true)
							end
						end
					end)
				end

				hooksecurefunc('ObjectiveTracker_Update', function ()
					local modules = _G.ObjectiveTrackerFrame.MODULES
					if not modules then
						return
					end
					for i = 1, #modules do
						local module = modules[i]
						if module and module.Header and module.Header.Text then --the big type of quest
							if not IsAddOnLoaded("ElvUI_SLE") then
								module.Header.Text:SetFont(E.LSM:Fetch('font', E.db.general.font), fontsize*1.5, E.db.general.fontStyle)
							end
							module.Header.Text:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
							module.Header.Text:SetShadowColor(0, 0, 0, 0.8)
							module.Header.Text:SetShadowOffset(2, -1)
						end
					end
				end)

				--skin the progress bars
				local function EltreumSkinProgressBars(_, _, line)
					local progressBar = line and line.ProgressBar
					local bar = progressBar and progressBar.Bar
					if not bar or progressBar.EltruismSkin then
						return
					else
						bar:CreateShadow()
						progressBar.Bar.backdrop:SetAlpha(0.7)
						--progressBar:SetBackdropColor(0, 0, 0, 1)
						--progressBar.Bar.backdrop:SetBackdropBorderColor(0, 0, 0, 1)
						progressBar.Bar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.skins.queststatusbartexture))
						progressBar.EltruismSkin = true
					end
				end
				hooksecurefunc(_G.QUEST_TRACKER_MODULE, "AddProgressBar", EltreumSkinProgressBars)
				hooksecurefunc(_G.BONUS_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", EltreumSkinProgressBars)
				hooksecurefunc(_G.WORLD_QUEST_TRACKER_MODULE, "AddProgressBar", EltreumSkinProgressBars)
				hooksecurefunc(_G.CAMPAIGN_QUEST_TRACKER_MODULE, "AddProgressBar", EltreumSkinProgressBars)
				hooksecurefunc(_G.SCENARIO_TRACKER_MODULE, "AddProgressBar", EltreumSkinProgressBars)
				hooksecurefunc(_G.DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", EltreumSkinProgressBars)

				hooksecurefunc(_G.SCENARIO_CONTENT_TRACKER_MODULE, 'UpdateCriteria', function ()
					if _G.ScenarioObjectiveBlock then
						local frames = {_G.ScenarioObjectiveBlock:GetChildren()}
						for _, frame in pairs(frames) do
							if frame.Text then
								if not IsAddOnLoaded("ElvUI_SLE") then
									frame.Text:SetFont(E.LSM:Fetch('font', E.db.general.font), 12, E.db.general.fontStyle) --this is the objective like boss 1/1
								end
								frame.Text:SetTextColor(1, 1, 1) --dungeon obj text
								frame.Text:SetWordWrap(true)
							end
						end
					end
				end)

				if _G.ScenarioObjectiveBlock then
					local frames = {_G.ScenarioObjectiveBlock:GetChildren()}
					for _, frame in pairs(frames) do
						if frame.Text then
							if not IsAddOnLoaded("ElvUI_SLE") then
								frame.Text:SetFont(E.LSM:Fetch('font', E.db.general.font), 14, E.db.general.fontStyle)
							end
							frame.Text:SetTextColor(mult * classcolor.r, mult * classcolor.g, mult * classcolor.b)
							frame.Text:SetWordWrap(true)
						end
					end
				end

				--skin the dungeon/raid/scenario bg
				hooksecurefunc(_G["SCENARIO_CONTENT_TRACKER_MODULE"], "Update", function ()
					ScenarioObjectiveBlockBackground:SetParent(_G.ScenarioStageBlock)
					ScenarioObjectiveBlockBackground:ClearAllPoints()
					ScenarioObjectiveBlockBackground:SetAllPoints(_G.ScenarioStageBlock.NormalBG)
					ScenarioObjectiveBlockBackground:CreateBackdrop('Transparent')
					ScenarioObjectiveBlockBackgroundTexture:SetTexture("Interface\\Addons\\ElvUI\\Code\\Media\\Textures\\White8x8.tga")
					ScenarioObjectiveBlockBackgroundTexture:SetColorTexture(0, 0, 0, 0.01)
					ScenarioObjectiveBlockBackgroundTexture:SetAlpha(0.01)
					ScenarioObjectiveBlockBackgroundTexture:SetAllPoints(_G.ScenarioStageBlock.NormalBG)
					ScenarioObjectiveBlockBackground:Show()
					ScenarioObjectiveBlockBackgroundTexture:Show()
					if not ScenarioObjectiveBlockBackground.shadow then
						ScenarioObjectiveBlockBackground:CreateShadow()
					end
					_G.ScenarioStageBlock.NormalBG:Hide()
					_G.ScenarioStageBlock.FinalBG:Hide()
					--dungeon/raid/scenario name text
					if _G.ScenarioStageBlock.Stage then
						_G.ScenarioStageBlock.Stage:SetTextColor(mult * classcolor.r, mult * classcolor.g, mult * classcolor.b)
						if not IsAddOnLoaded("ElvUI_SLE") then
							_G.ScenarioStageBlock.Stage:SetFont(E.LSM:Fetch('font', E.db.general.font), 18, E.db.general.fontStyle)
						end
						_G.ScenarioStageBlock.Stage:SetShadowColor(0, 0, 0, 0.8)
						_G.ScenarioStageBlock.Stage:SetShadowOffset(2, -1)
					end
				end)

				--on mouse enter and leave
				hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "OnBlockHeaderEnter", function(_, block)
					if ( block.HeaderText ) then
						block.HeaderText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
						block.HeaderText.colorStyle = {r = classcolor.r, g = classcolor.g, b = classcolor.b}
					end
					if block.currentLine then --this is the text
						for _, line in pairs(block.lines) do
							line.Text:SetTextColor(1, 1, 1)
							line.Text.colorStyle = {r = mult * 1, g = mult * 1, b = mult * 1}
							if ( line.Dash ) then
								line.Dash:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
							end
						end
					end
				end)

				hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "OnBlockHeaderLeave", function(_, block)
					if ( block.HeaderText ) then
						block.HeaderText:SetTextColor(mult * classcolor.r, mult * classcolor.g, mult * classcolor.b)
						block.HeaderText.colorStyle = { r = mult * classcolor.r, g = mult * classcolor.g, b = mult * classcolor.b }
					end
					if block.currentLine then
						for _, line in pairs(block.lines) do
							line.Text:SetTextColor(mult, mult, mult)
							line.Text.colorStyle = {r = mult, g = mult, b = mult}
							if ( line.Dash ) then
								line.Dash:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
							end
						end
					end
				end)
			end
		end
		if E.Classic or E.Wrath or E.TBC then
			local questID
			--hook the function that sets the quest detail to get the questID from the quest title
			hooksecurefunc("QuestLog_SetSelection", function(questTitle) --questlogframe.lua 311
				questID = select(8, GetQuestLogTitle(questTitle))
			end)
			--set the link to show when the button is clicked
			wowheadbutton:SetScript('OnClick', function()
				E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, "https://"..wowheadregion.."/quest="..questID)
			end)

			--move the text for no quests
			QuestLogNoQuestsText:ClearAllPoints()
			QuestLogNoQuestsText:SetPoint("CENTER", QuestLogFrame, 0, 0)
			--make the whole thing bigger almost like retail
			QuestLogFrame:SetWidth(765)
			QuestLogFrame:SetHeight(550)
			--move the frame title
			QuestLogTitleText:ClearAllPoints()
			QuestLogTitleText:SetPoint("TOP", QuestLogFrame, "TOP", 0, -20)
			--increase the size of the quest title frame
			QuestLogListScrollFrame:SetHeight(390)
			QuestLogListScrollFrame:SetWidth(350)
			--increase the size of the quest description frame and move it
			QuestLogDetailScrollFrame:ClearAllPoints()
			QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "TOPRIGHT", 35, 0)
			QuestLogDetailScrollFrame:SetHeight(390)

			-- Create the additional rows
			--local numQuests = QUESTS_DISPLAYED
			local numQuests = 6
			--QUESTS_DISPLAYED = QUESTS_DISPLAYED + 18
			QUESTS_DISPLAYED = 24
			if dontexpandanymorequests == 0 then
				for i = numQuests + 1, 24 do
					local questTitlebutton = CreateFrame("Button", "QuestLogTitle" .. i, QuestLogFrame, "QuestLogTitleButtonTemplate")
					questTitlebutton:SetID(i)
					questTitlebutton:Hide()
					questTitlebutton:ClearAllPoints()
					questTitlebutton:SetPoint("TOPLEFT", _G["QuestLogTitle" .. (i - 1)], "BOTTOMLEFT", 0, 1)
				end
				--increase the width of the rows so the title fits
				for i = 1, 24 do
					local questTitle = _G["QuestLogTitle"..i]
					questTitle:Width(335)
				end
				dontexpandanymorequests = 1
			end

			if not IsAddOnLoaded('Questie') then
				--from blizzard's FrameXML/QuestLogFrame.lua

				--skin the classic objective frame
				hooksecurefunc("QuestWatch_Update",function()
					local numObjectives
					local questWatchMaxWidth = 0
					local tempWidth
					local watchText
					--local text, type, finished --type is unused
					local text, _, finished
					--local questTitle --unused
					local watchTextIndex = 1
					local questIndex
					local objectivesCompleted

					for i=1, GetNumQuestWatches() do
						questIndex = GetQuestIndexForWatch(i)
						if ( questIndex ) then
							numObjectives = GetNumQuestLeaderBoards(questIndex)

							--If there are objectives set the title
							if ( numObjectives > 0 ) then
								-- Set title
								watchText = _G["QuestWatchLine"..watchTextIndex]
								watchText:SetText(GetQuestLogTitle(questIndex))
								if not IsAddOnLoaded("ElvUI_SLE") then
									watchText:SetFont(E.LSM:Fetch('font', E.db.general.font), fontsize, E.db.general.fontStyle)
								end
								--watchText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

								tempWidth = watchText:GetWidth()
								-- Set the anchor of the title line a little lower
								if ( watchTextIndex > 1 ) then
									--watchText:SetPoint("TOPLEFT", "QuestWatchLine"..(watchTextIndex - 1), "BOTTOMLEFT", 0, -4)
									watchText:SetPoint("TOPLEFT", "QuestWatchLine"..(watchTextIndex - 1), "BOTTOMLEFT", 0, -10)
									--watchText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
								end
								watchText:Show()
								if ( tempWidth > questWatchMaxWidth ) then
									questWatchMaxWidth = tempWidth
								end
								watchTextIndex = watchTextIndex + 1
								objectivesCompleted = 0
								for j=1, numObjectives do
									text, _, finished = GetQuestLogLeaderBoard(j, questIndex)
									if ( text == nil ) then
										text = ""
									end
									if ( finished == nil ) then
										finished = true
									end
									watchText = _G["QuestWatchLine"..watchTextIndex]
									-- Set Objective text
									watchText:SetText(" - "..text)
									if not IsAddOnLoaded("ElvUI_SLE") then
										watchText:SetFont(E.LSM:Fetch('font', E.db.general.font), fontsize, E.db.general.fontStyle)
									end
									--watchText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
									-- Color the objectives
									if ( finished ) then
										watchText:SetTextColor(0, 1, 0)
										--watchText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
										objectivesCompleted = objectivesCompleted + 1
									else
										watchText:SetTextColor(0.8, 0.8, 0.8)
									end
									tempWidth = watchText:GetWidth()
									if ( tempWidth > questWatchMaxWidth ) then
										questWatchMaxWidth = tempWidth
									end
									--watchText:SetPoint("TOPLEFT", "QuestWatchLine"..(watchTextIndex - 1), "BOTTOMLEFT", 0, 0)
									watchText:SetPoint("TOPLEFT", "QuestWatchLine"..(watchTextIndex - 1), "BOTTOMLEFT", 0, -5)
									--watchText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
									watchText:Show()
									watchTextIndex = watchTextIndex + 1
								end
								-- Brighten the quest title if all the quest objectives were met
								watchText = _G["QuestWatchLine"..watchTextIndex-numObjectives-1]
								if ( objectivesCompleted == numObjectives ) then
									--watchText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
									watchText:SetTextColor(0, 1, 0)
								else
									watchText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
								end
							end
						end
					end

					-- Set tracking indicator
					if ( GetNumQuestWatches() > 0 ) then
						QuestLogTrackTracking:SetVertexColor(0, 1.0, 0)
					else
						QuestLogTrackTracking:SetVertexColor(1.0, 0, 0)
					end

					-- If no watch lines used then hide the frame and return
					if ( watchTextIndex == 1 ) then
						QuestWatchFrame:Hide()
						return
					else
						QuestWatchFrame:Show()
						QuestWatchFrame:SetHeight(watchTextIndex * 13)
						QuestWatchFrame:SetWidth(questWatchMaxWidth + 10)
					end

					-- Hide unused watch lines
					for i=watchTextIndex, MAX_QUESTWATCH_LINES do
						_G["QuestWatchLine"..i]:Hide()
					end

					UIParent_ManageFramePositions()
				end)
			end
		end
	end
end

local dontexpandanymoreEnchant = 0
local dontexpandanymore = 0
function ElvUI_EltreumUI:SkinProfessions()
	if E.db.ElvUI_EltreumUI.skins.professions and not E.private.skins.blizzard.enable == false then
		--skin and expand the tradeskills
		local WideTradeSkill = CreateFrame("Frame")

		WideTradeSkill:RegisterEvent("ADDON_LOADED")
		WideTradeSkill:SetScript("OnEvent", function(_, _, arg)
			if (arg == "Blizzard_TradeSkillUI") then
				WideTradeSkill:UnregisterAllEvents()
				TradeSkillFrame:HookScript("OnShow", function()
					if not TradeSkillFrame.backdrop.shadow then
						TradeSkillFrame.backdrop:CreateShadow()
					end
					TradeSkillFrame:SetWidth(765)
					TradeSkillFrame:SetHeight(550)

					TradeSkillDetailScrollFrame:SetHeight(390)
					TradeSkillDetailScrollFrame:SetWidth(350)

					TradeSkillDetailScrollFrame:ClearAllPoints()
					TradeSkillDetailScrollFrame:SetPoint("RIGHT", TradeSkillFrame, 0, -35)
					TradeSkillDetailScrollFrame:SetHeight(390)

					TradeSkillListScrollFrameScrollBar:ClearAllPoints()
					TradeSkillListScrollFrameScrollBar:SetPoint("LEFT", TradeSkillDetailScrollChildFrame, -30, -70)
					TradeSkillListScrollFrameScrollBar:SetHeight(320)

					TradeSkillCreateAllButton:ClearAllPoints()
					TradeSkillCreateAllButton:SetPoint("LEFT", TradeSkillFrame, "BOTTOMLEFT", 15, 95)

					TradeSkillCreateButton:ClearAllPoints()
					TradeSkillCreateButton:SetPoint("LEFT", TradeSkillFrame, "BOTTOMLEFT", 180, 95)

					TradeSkillCancelButton:ClearAllPoints()
					TradeSkillCancelButton:SetPoint("RIGHT", TradeSkillFrame, "BOTTOMRIGHT", -50, 95)

					if dontexpandanymore == 0 then
						-- Create the additional rows
						--local numSkills = TRADE_SKILLS_DISPLAYED
						local numSkills = 8
						--TRADE_SKILLS_DISPLAYED = TRADE_SKILLS_DISPLAYED + 14
						TRADE_SKILLS_DISPLAYED = 22
						for i = numSkills + 1, 22 do
							local skillbutton = CreateFrame("Button", "TradeSkillSkill" .. i, TradeSkillFrame, "TradeSkillSkillButtonTemplate")
							skillbutton:SetID(i)
							skillbutton:Hide()
							skillbutton:ClearAllPoints()
							skillbutton:SetPoint("TOPLEFT", _G["TradeSkillSkill" .. (i - 1)], "BOTTOMLEFT", 0, 1)
						end
						--increase the width of the rows so the title fits
						for i = 1, 8 do
							local skillTitle = _G["TradeSkillSkill"..i]
							skillTitle:Width(335)
						end
						dontexpandanymore = 1
					end
				end)
			end
		end)

		--and enchanting which uses a different system apparently
		--if (GetAddOnEnableState(GetUnitName("player"), "TradeSkillMaster")) > 0 then
		if IsAddOnLoaded("TradeSkillMaster") then
			local WideTradeSkillEnchant = CreateFrame("Frame")
			WideTradeSkillEnchant:RegisterEvent("CRAFT_SHOW")
			WideTradeSkillEnchant:SetScript("OnEvent", function()
				if not CraftFrame.backdrop.shadow then
					CraftFrame.backdrop:CreateShadow()
				end
				CraftFrame:SetWidth(765)
				CraftFrame:SetHeight(550)

				--S:HandleButton(CraftCreateButton)
				CraftCreateButton:ClearAllPoints()
				CraftCreateButton:SetPoint("LEFT", CraftFrame, "BOTTOMLEFT", 15, 95)

				CraftCancelButton:ClearAllPoints()
				CraftCancelButton:SetParent(CraftFrame)
				CraftCancelButton:SetPoint("RIGHT", CraftFrame, "BOTTOMRIGHT", -50, 95)

				CraftListScrollFrameScrollChildFrame:SetHeight(390)
				CraftListScrollFrameScrollChildFrame:SetWidth(350)

				CraftListScrollFrameScrollBar:ClearAllPoints()
				CraftListScrollFrameScrollBar:SetPoint("CENTER", CraftFrame, "CENTER", 10, 12)
				CraftListScrollFrameScrollBar:SetHeight(320)

				CraftDetailScrollChildFrame:SetParent(CraftFrame)
				CraftDetailScrollChildFrame:ClearAllPoints()
				CraftDetailScrollChildFrame:SetPoint("LEFT", CraftListScrollFrameScrollBar, 30, -46)
				CraftDetailScrollChildFrame:SetHeight(390)

				CraftDetailScrollFrame:Hide()
				CraftDetailScrollFrameScrollBar:Hide()

				if E.Wrath or E.TBC then
					CraftFrameFilterDropDown:ClearAllPoints()
					CraftFrameFilterDropDown:SetPoint("TOPRIGHT", CraftDetailScrollChildFrame, 0, 50)
					CraftFrameAvailableFilterCheckButton:ClearAllPoints()
					CraftFrameAvailableFilterCheckButton:SetPoint("TOPLEFT", CraftFrame, 64,-48)
				end

				if dontexpandanymoreEnchant == 0 then
					-- Create the additional rows
					--local numCrafts = CRAFTS_DISPLAYED
					local numCrafts = 8
					--CRAFTS_DISPLAYED = CRAFTS_DISPLAYED + 14
					CRAFTS_DISPLAYED = 22
					for i = numCrafts + 1, 22 do
						local craftbutton = CreateFrame("Button", "Craft" .. i, CraftFrame, "CraftButtonTemplate")
						craftbutton:SetID(i)
						craftbutton:Hide()
						craftbutton:ClearAllPoints()
						craftbutton:SetPoint("TOPLEFT", _G["Craft" .. (i - 1)], "BOTTOMLEFT", 0, 1)
					end
					--increase the width of the rows so the title fits
					for i = 1, 22 do
						local craftTitle = _G["Craft"..i]
						craftTitle:Width(335)
					end
					dontexpandanymoreEnchant = 1
				end
			end)
		else
			local WideTradeSkillEnchant = CreateFrame("Frame")
			WideTradeSkillEnchant:RegisterEvent("ADDON_LOADED")
			WideTradeSkillEnchant:SetScript("OnEvent", function(_, _, arg)
				if (arg == "Blizzard_CraftUI") then
					WideTradeSkillEnchant:UnregisterAllEvents()
					CraftFrame:HookScript("OnShow", function()
						if not CraftFrame.backdrop.shadow then
							CraftFrame.backdrop:CreateShadow()
						end
						CraftFrame:SetWidth(765)
						CraftFrame:SetHeight(550)

						CraftListScrollFrameScrollChildFrame:SetHeight(390)
						CraftListScrollFrameScrollChildFrame:SetWidth(350)

						CraftListScrollFrameScrollBar:ClearAllPoints()
						CraftListScrollFrameScrollBar:SetPoint("CENTER", CraftFrame, "CENTER", 10, 12)
						CraftListScrollFrameScrollBar:SetHeight(320)

						CraftDetailScrollChildFrame:SetParent(CraftFrame)
						CraftDetailScrollChildFrame:ClearAllPoints()
						CraftDetailScrollChildFrame:SetPoint("LEFT", CraftListScrollFrameScrollBar, 30, -46)
						CraftDetailScrollChildFrame:SetHeight(390)

						CraftDetailScrollFrame:Hide()
						CraftDetailScrollFrameScrollBar:Hide()
						if E.Wrath or E.TBC then
							CraftFrameFilterDropDown:ClearAllPoints()
							CraftFrameFilterDropDown:SetPoint("TOPRIGHT", CraftDetailScrollChildFrame, 0, 50)
							CraftFrameAvailableFilterCheckButton:ClearAllPoints()
							CraftFrameAvailableFilterCheckButton:SetPoint("TOPLEFT", CraftFrame, 64,-48)
						end

						CraftCreateButton:ClearAllPoints()
						CraftCreateButton:SetPoint("LEFT", CraftFrame, "BOTTOMLEFT", 15, 95)

						CraftCancelButton:ClearAllPoints()
						CraftCancelButton:SetPoint("RIGHT", CraftFrame, "BOTTOMRIGHT", -50, 95)

						if dontexpandanymoreEnchant == 0 then
							-- Create the additional rows
							--local numCrafts = CRAFTS_DISPLAYED
							local numCrafts = 8
							--CRAFTS_DISPLAYED = CRAFTS_DISPLAYED + 14
							CRAFTS_DISPLAYED = 22
							for i = numCrafts + 1, 22 do
								local craftbutton = CreateFrame("Button", "Craft" .. i, CraftFrame, "CraftButtonTemplate")
								craftbutton:SetID(i)
								craftbutton:Hide()
								craftbutton:ClearAllPoints()
								craftbutton:SetPoint("TOPLEFT", _G["Craft" .. (i - 1)], "BOTTOMLEFT", 0, 1)
							end
							--increase the width of the rows so the title fits
							for i = 1, 8 do
								local craftTitle = _G["Craft"..i]
								craftTitle:Width(335)
							end
							dontexpandanymoreEnchant = 1
						end
					end)
				end
			end)
		end
	end
end

function ElvUI_EltreumUI:SkinMailZone()
	local fontsize = E.db.general.fontSize
	if E.db.ElvUI_EltreumUI.skins.zones then
		if not IsAddOnLoaded("ElvUI_SLE") then
			--[[hooksecurefunc("SetZoneText", function()
				_G.ZoneTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 42, E.db.general.fontStyle)
				_G.SubZoneTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 28, E.db.general.fontStyle)
				_G.PVPInfoTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 20, E.db.general.fontStyle)
				_G.PVPArenaTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 20, E.db.general.fontStyle)
			end)]]
			_G.ZoneTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 42, E.db.general.fontStyle)
			_G.SubZoneTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 28, E.db.general.fontStyle)
			_G.PVPInfoTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 20, E.db.general.fontStyle)
			_G.PVPArenaTextString:SetFont(E.LSM:Fetch('font', E.db.general.font), 20, E.db.general.fontStyle)
			_G.OpenMailBodyText:SetFont(E.LSM:Fetch('font', E.db.general.font), fontsize, E.db.general.fontStyle)
			if E.Retail then
				_G.SendMailBodyEditBox:SetFont(E.LSM:Fetch('font', E.db.general.font), fontsize, E.db.general.fontStyle)
			--elseif E.TBC or E.Classic then
				--_G.MailEditBox:SetFont(E.LSM:Fetch('font', E.db.general.font), fontsize, E.db.general.fontStyle)
			end
		end
	end
end
