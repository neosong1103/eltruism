local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local pacheck = GetAddOnMetadata('ProjectAzilroka', 'Version')

-- ProjectAzilroka profile setup
function ElvUI_EltreumUI:GetPAProfile()
	local PA = _G.ProjectAzilroka
	PA.data:SetProfile("Default")

	-- Module toggles
	PA.db["AuraReminder"] = {}
	PA.db["AuraReminder"]["Enable"] = false
	PA.db["QuestSounds"]["Enable"] = false
	PA.db["FasterLoot"]["Enable"] = false
	if E.Retail then
		if pacheck >= '1.77' then
			PA.db["SunsongRanchFarmer"]["Enable"] = false
		elseif pacheck < '1.77' then
			PA.db["BigButtons"]["Enable"] = false
		end
		PA.db["QuestSounds"]["Enable"] = true
		PA.db["QuestSounds"]["ObjectiveCompleteID"] = "None"
		PA.db["QuestSounds"]["ObjectiveProgressID"] = "None"
		PA.db["QuestSounds"]["ObjectiveComplete"] = "None"
		PA.db["QuestSounds"]["QuestCompleteID"] = "None"
		PA.db["QuestSounds"]["ObjectiveProgress"] = "None"
		PA.db["ReputationReward"]["Enable"] = true
		PA.db["TorghastBuffs"]["horizontalSpacing"] = 1
		PA.db["TorghastBuffs"]["verticalSpacing"] = 1
		PA.db["TorghastBuffs"]["size"] = 26
		PA.db["EnhancedFriendsList"] = false
		PA.db["TorghastBuffs"]["Enable"] = false
	end
	PA.db["Cooldown"]["Enable"] = false
	PA.db["DragonOverlay"]["Enable"] = false
	PA.db["EnhancedShadows"]["Enable"] = false
	PA.db["EnhancedShadows"]["ColorByClass"] = true  --lol it was false while enable was true causing the purple color
	PA.db["EnhancedShadows"]["Size"] = 1
	PA.db["MasterExperience"]["Enable"] = false
	PA.db["MouseoverAuras"]["Enable"] = false
	PA.db["MovableFrames"]["Enable"] = false
	PA.db["OzCooldowns"]["Enable"] = false
	if E.Classic or E.TBC then
		PA.db["MovableFrames"]["Enable"] = true
		--[[
		PA.db["MovableFrames"]["GhostFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["WorldStateScoreFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GameMenuFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ItemTextFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CovenantSanctumFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["VoidStorageFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GuildInviteFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["StaticPopup3"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonBuildingFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonLandingPage"]["Permanent"] = false
		PA.db["MovableFrames"]["PetitionFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["StaticPopup1"]["Permanent"] = false
		PA.db["MovableFrames"]["ItemSocketingFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["QuestFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TradeFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CalendarFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["InterfaceOptionsFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["AuctionFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GuildRegistrarFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["SplashFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TaxiFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GossipFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonRecruiterFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["DressUpFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["WorldMapFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["LFGDungeonReadyDialog"]["Permanent"] = false
		PA.db["MovableFrames"]["PVEFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["QuestLogFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TradeSkillFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["RaidParentFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ClassTrainerFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["VideoOptionsFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CovenantPreviewFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["MailFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ScrollOfResurrectionSelectionFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["MacroFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["BarberShopFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CollectionsJournal"]["Permanent"] = false
		PA.db["MovableFrames"]["AuctionHouseFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["StaticPopup4"]["Permanent"] = false
		PA.db["MovableFrames"]["ChannelFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonCapacitiveDisplayFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TabardFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["BlackMarketFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonRecruitSelectFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["PlayerTalentFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GuildBankFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["SpellBookFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonShipyardFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["AchievementFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["StaticPopup2"]["Permanent"] = false
		PA.db["MovableFrames"]["FriendsFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TimeManagerFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ReadyCheckFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ItemUpgradeFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["LookingForGuildFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CalendarCreateEventFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["WeeklyRewardsFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["InspectFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CraftFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CommunitiesFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["BankFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["RaidBrowserFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CharacterFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["QuestChoiceFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TalentFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ScrappingMachineFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["ArchaeologyFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["AnimaDiversionFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CalendarViewEventFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["LossOfControlFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GarrisonMissionFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["MerchantFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["AddonList"]["Permanent"] = false
		PA.db["MovableFrames"]["ChallengesKeystoneFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["FriendsFriendsFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["OrderHallTalentFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["PetStableFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["QuestLogPopupDetailFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["GuildControlUI"]["Permanent"] = false
		PA.db["MovableFrames"]["LootFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["CalendarViewHolidayFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["TalkingHeadFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["SoulbindViewer"]["Permanent"] = false
		PA.db["MovableFrames"]["EncounterJournal"]["Permanent"] = false
		PA.db["MovableFrames"]["KeyBindingFrame"]["Permanent"] = false
		PA.db["MovableFrames"]["HelpFrame"]["Permanent"] = false
		]]
		--PA.db["EnhancedFriendsList"] = {}
		--PA.db["EnhancedFriendsList"] = true
		--PA.db["EnhancedFriendsList"]["StatusIconPack"] = "Square"
	end
	PA.db["TargetSounds"]["Enable"] = true
	PA.db["stAddonManager"]["Enable"] = true
	PA.db["stAddonManager"]["FontSize"] = 15
	PA.db["stAddonManager"]["NumAddOns"] = 20
	PA.db["stAddonManager"]["ButtonHeight"] = 20
	PA.db["stAddonManager"]["FontFlag"] = "THICKOUTLINE"
	PA.db["stAddonManager"]["ButtonWidth"] = 20
	PA.db["stAddonManager"]["ClassColor"] = true
	PA.db["stAddonManager"]["Font"] = "Kimberley"
	PA.db["stAddonManager"]["FrameWidth"] = 470
	PA.db["stAddonManager"]["CheckTexture"] = "Eltreum-Elvui-Norm"
	PA.db["SquareMinimapButtons"]["Enable"] = true
	PA.db["SquareMinimapButtons"]["Shadows"] = false
	PA.db["SquareMinimapButtons"]["MoveQueue"] = false
	PA.db["SquareMinimapButtons"]["ButtonSpacing"] = 1
	PA.db["SquareMinimapButtons"]["ReverseDirection"] = true
	PA.db["SquareMinimapButtons"]["IconSize"] = 24
	PA.db["SquareMinimapButtons"]["MoveMail"] = false
	PA.db["SquareMinimapButtons"]["ButtonsPerRow"] = 8
	PA.db["SquareMinimapButtons"]["Visibility"] = "show" --"[petbattle][combat]hide; show"
	PA.db["SquareMinimapButtons"]["MoveTracker"] = false
	PA.db["SquareMinimapButtons"]["BarMouseOver"] = true


	E.private.ElvUI_EltreumUI.isInstalled.projectazilroka = true
end
