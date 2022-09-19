local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))

-- DBM profile setup
function ElvUI_EltreumUI:GetDBMProfile()
	DBM:CreateProfile("Eltreum")
	DBM_AllSavedOptions = {
		["Eltreum"] = {
			["DontShowFarWarnings"] = true,
			["FilterInterrupt2"] = "TandFandAllCooldown",
			["DontShowNameplateLines"] = false,
			["InfoFrameX"] = -419.1039428710938,
			["DontShowNameplateIcons"] = false,
			["SpecialWarningFlash5"] = true,
			["FilterInterruptNoteName"] = false,
			["EnableModels"] = true,
			["ArrowPoint"] = "TOP",
			["SWarnNameInNote"] = true,
			["SpecialWarningSound2"] = 15391,
			["InfoFramePoint"] = "BOTTOMRIGHT",
			["EventSoundMusicCombined"] = true,
			["DontShowReminders"] = false,
			["WorldBossAlert"] = false,
			["DontSendBossWhispers"] = false,
			["ShowMinimapButton"] = false,
			["ShowGuildMessages"] = true,
			["ShowAllVersions"] = true,
			["SpecialWarningSound3"] = "Interface\\AddOns\\DBM-Core\\sounds\\AirHorn.ogg",
			["DontShowTargetAnnouncements"] = false,
			["ShowWarningsInChat"] = false,
			["ShowCombatLogMessage"] = true,
			["InfoFrameFontStyle"] = "OUTLINE",
			["WarningFontStyle"] = "OUTLINE",
			["ChatFrame"] = "DEFAULT_CHAT_FRAME",
			["FilterTrashWarnings"] = false,
			["RangeFrameRadarX"] = 267.6197814941406,
			["InfoFrameCols"] = -0,
			["ShowFakedRaidWarnings"] = false,
			["LatencyThreshold"] = 165.8546447753906,
			["DontShowHealthFrame"] = false,
			["LFDEnhance"] = true,
			["RLReadyCheckSound"] = true,
			["WOTLKTWMessageShown"] = false,
			["HideObjectivesFrame"] = false,
			["SpecialWarningShortText"] = true,
			["DontShowPTText"] = false,
			["SpecialWarningFontSize2"] = 40,
			["SpecialWarningFlashCol5"] = {
				0.2, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["SpecialWarningFlashCount2"] = 1,
			["HUDSizeOverride"] = false,
			["AutoAcceptGuildInvite"] = false,
			["SpecialWarningFlashDura3"] = 1,
			["MovieFilter"] = "Never",
			["EventSoundVictory"] = "Interface\\AddOns\\DBM-Core\\sounds\\Victory\\SmoothMcGroove_Fanfare.ogg",
			["DisableSFX"] = false,
			["SpecialWarningFlashDura4"] = 0.7,
			["SpecialWarningFlashCol3"] = {
				1, -- [1]
				-0, -- [2]
				-0, -- [3]
			},
			["ModelSoundValue"] = "Short",
			["HUDColor3"] = {
				1, -- [1]
				0.5, -- [2]
				-0, -- [3]
			},
			["HUDTexture2"] = "highlight",
			["SpecialWarningY"] = -152.1428680419922,
			["RangeFrameUpdates"] = "Average",
			["AutoCorrectTimer"] = false,
			["RaidWarningSound"] = 11742,
			["CustomSounds"] = 2,
			["ShowTranscriptorMessage"] = true,
			["RoleSpecAlert"] = false,
			["MISTSTWMessageShown"] = false,
			["ShowKillMessage"] = true,
			["WarningIconLeft"] = true,
			["RangeFrameLocked"] = false,
			["SpecialWarningFlashDura2"] = 0.4,
			["PGMessageShown"] = false,
			["SpecialWarningFlashRepeat4"] = false,
			["BonusFilter"] = "Never",
			["DontShowUserTimers"] = false,
			["SpecialWarningFlashRepeat5"] = true,
			["HideBossEmoteFrame"] = true,
			["DontPlayCountdowns"] = false,
			["SpecialWarningFlashAlph1"] = 0.3,
			["ShowDefeatMessage"] = true,
			["WarningDuration2"] = 1.5,
			["InfoFrameShowSelf"] = true,
			["WarningFontShadow"] = true,
			["DontShowBossTimers"] = false,
			["HelpMessageShown3"] = false,
			["TalkingHeadFilter"] = "Never",
			["DontShowBossAnnounces"] = false,
			["BadIDAlert"] = false,
			["SpecialWarningFlashRepeatAmount"] = 2,
			["WarningIconChat"] = true,
			["HideGuildChallengeUpdates"] = true,
			["DontShowCTCount"] = false,
			["ShowPizzaMessage"] = false,
			["RangeFrameSound2"] = "none",
			["HideTooltips"] = false,
			["BCTWMessageShown"] = false,
			["FilterVoidFormSay"] = true,
			["BugMessageShown"] = 2,
			["EventSoundMusic"] = "None",
			["SpamBlockBossWhispers"] = true,
			["CATATWMessageShown"] = false,
			["ShowFlashFrame"] = true,
			["SpecialWarningFontSize"] = 50,
			["HUDTextureOverride"] = false,
			["SpecialWarningFlashAlph2"] = 0.3,
			["EventRandomVictory"] = false,
			["DontShowHudMap2"] = false,
			["SpecialWarningFlashCount4"] = 2,
			["ShowSWarningsInChat"] = false,
			["HideApplicantAlerts"] = -0,
			["HUDAlpha2"] = 0.5,
			["StatusEnabled"] = true,
			["CoreSavedRevision"] = 20210714171927,
			["RangeFrameX"] = -423.904052734375,
			["AlwaysShowSpeedKillTimer"] = true,
			["HUDColor2"] = {
				1, -- [1]
				-0, -- [2]
				-0, -- [3]
			},
			["SpecialWarningFlashAlph3"] = 0.4,
			["ShowRecoveryMessage"] = true,
			["FakeBWVersion"] = false,
			["CRT_Enabled"] = false,
			["SpecialWarningFlashCol2"] = {
				1, -- [1]
				0.5, -- [2]
				-0, -- [3]
			},
			["HUDColorOverride"] = false,
			["SpecialWarningPoint"] = "TOP",
			["CheckGear"] = true,
			["HUDColor4"] = {
				-0, -- [1]
				1, -- [2]
				-0, -- [3]
			},
			["HUDSize3"] = 5,
			["DontShowPT2"] = false,
			["MCMessageShown"] = false,
			["DontShowSpecialWarnings"] = false,
			["EventSoundTurle"] = "Interface\\AddOns\\DBM-SoundEventsPack\\Music\\atmittw.mp3",
			["ShowQueuePop"] = true,
			["SpecialWarningFlashCol4"] = {
				1, -- [1]
				-0, -- [2]
				1, -- [3]
			},
			["DebugMode"] = false,
			["SpecialWarningFlashDura5"] = 1,
			["ShowReminders"] = true,
			["SpecialWarningFontCol"] = {
				1, -- [1]
				0.7, -- [2]
				-0, -- [3]
			},
			["EventSoundEngage2"] = "None",
			["InfoFrameY"] = 103.3210754394531,
			["SpecialWarningSound"] = 37666,
			["HealthFrameLocked"] = false,
			["UseSoundChannel"] = "Dialog",
			["ShowCountdownText"] = false,
			["ShowRespawn"] = true,
			["HideQuestTooltips"] = true,
			["HUDSize2"] = 5,
			["AlwaysShowSpeedKillTimer2"] = true,
			["FilterDispel"] = true,
			["ShowLoadMessage"] = true,
			["DebugLevel"] = 1,
			["SpecialWarningFlashDura1"] = 0.4,
			["DontShowPTNoID"] = false,
			["HideGarrisonToasts"] = true,
			["RangeFramePoint"] = "BOTTOMRIGHT",
			["PGMessageShown2"] = false,
			["SpecialWarningFontShadow"] = false,
			["EventMusicMythicFilter"] = false,
			["SpecialWarningFlashCol1"] = {
				1, -- [1]
				1, -- [2]
				-0, -- [3]
			},
			["SWarnClassColor"] = true,
			["UseNameplateHandoff"] = true,
			["WarningX"] = -0.5238134264945984,
			["HPFrameMaxEntries"] = 5,
			["InfoFrameLocked"] = false,
			["HideBossEmoteFrame2"] = false,
			["RecordOnlyBosses"] = false,
			["SpecialWarningFlashAlph4"] = 0.4,
			["BadTimerAlert"] = false,
			["ChallengeBest"] = "Realm",
			["PTCountThreshold2"] = 5,
			["GUIWidth"] = 894.983642578125,
			["SpecialWarningFontStyle"] = "OUTLINE",
			["LogOnlyRaidBosses"] = false,
			["oRA3AnnounceConsumables"] = false,
			["DontPlayPTCountdown"] = false,
			["EnableWBSharing"] = true,
			["ArrowPosX"] = -0,
			["SpecialWarningFlash4"] = true,
			["AITimer"] = true,
			["HelpMessageVersion"] = 1,
			["SpecialWarningFlashCount5"] = 3,
			["HPFramePoint"] = "LEFT",
			["FilterInterrupt"] = true,
			["SpecialWarningSound4"] = 9278,
			["FilterSelfHud"] = true,
			["RangeFrameRadarY"] = -19.74611282348633,
			["GUIX"] = -0,
			["AutologBosses"] = false,
			["DontShowRespawn"] = false,
			["EventRandomDefeat"] = true,
			["WarningColors"] = {
				{
					["b"] = 0.9411764705882353,
					["g"] = 0.8,
					["r"] = 0.4117647058823529,
				}, -- [1]
				{
					["b"] = -0,
					["g"] = 0.9490196078431372,
					["r"] = 0.9490196078431372,
				}, -- [2]
				{
					["b"] = -0,
					["g"] = 0.5019607843137255,
					["r"] = 1,
				}, -- [3]
				{
					["b"] = 0.1019607843137255,
					["g"] = 0.1019607843137255,
					["r"] = 1,
				}, -- [4]
			},
			["AdvancedAutologBosses"] = false,
			["InfoFrameFontSize"] = 16.0731201171875,
			["RangeFrameY"] = 149.3018798828125,
			["SWarningAlphabetical"] = true,
			["HUDAlpha1"] = 0.5,
			["BlockNoteShare"] = false,
			["EventRandomMusic"] = false,
			["DontRestoreIcons"] = false,
			["DontPlaySpecialWarningSound"] = false,
			["ShortTimerText"] = true,
			["HUDColor1"] = {
				1, -- [1]
				1, -- [2]
				-0, -- [3]
			},
			["AlwaysShowHealthFrame"] = false,
			["DontShowSpecialWarningText"] = false,
			["RangeFrameRadarPoint"] = "TOP",
			["DontShowInfoFrame"] = true,
			["SpecialWarningFont"] = "Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Fonts\\Kimberley.ttf",
			["DontShowRangeFrame"] = false,
			["MovieFilter2"] = "OnlyFight",
			["HUDTexture1"] = "highlight",
			["RaidWarningPosition"] = {
				["Y"] = -185,
				["X"] = -0,
				["Point"] = "TOP",
			},
			["DontRestoreRange"] = false,
			["SpecialWarningFlashRepeat3"] = true,
			["SpecialWarningFlashCount3"] = 3,
			["VoiceOverSpecW2"] = "All",
			["WhisperStats"] = false,
			["SilentMode"] = false,
			["LogOnlyNonTrivial"] = false,
			["HUDAlpha3"] = 0.5,
			["SpecialWarningFlashAlph5"] = 0.5,
			["SpecialWarningDuration2"] = 1.5,
			["HealthFrameWidth"] = 200,
			["ArrowPosY"] = -150,
			["ShowEngageMessage"] = true,
			["RangeFrameSound1"] = "none",
			["HPFrameY"] = -145,
			["WarningFontSize"] = 20.580696105957,
			["EventSoundVictory2"] = "Interface\\AddOns\\DBM-SoundEventsPack\\Victory\\Victory_FinalFantasyClassic.ogg",
			["EventSoundDungeonBGM"] = "None",
			["LastRevision"] = -0,
			["GUIPoint"] = "LEFT",
			["SettingsMessageShown"] = true,
			["FilterTrashWarnings2"] = false,
			["WarningPoint"] = "TOP",
			["DontShowFlexMessage"] = false,
			["ShowGuildMessagesPlus"] = false,
			["DontSetIcons"] = false,
			["BigBrotherAnnounceToRaid"] = false,
			["PTCountThreshold"] = 5,
			["HUDAlphaOverride"] = false,
			["WarningIconRight"] = true,
			["AutoRespond"] = true,
			["EventDungMusicMythicFilter"] = false,
			["DisableStatusWhisper"] = false,
			["HealthFrameGrowUp"] = false,
			["GUIY"] = 59.42858505249023,
			["RangeFrameFrames"] = "radar",
			["DisableGuildStatus"] = false,
			["ShowBigBrotherOnCombatStart"] = false,
			["SpecialWarningIcon"] = true,
			["InfoFrameFont"] = "Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Fonts\\Kimberley.ttf",
			["SpecialWarningFlashRepeat2"] = false,
			["HUDSize1"] = 5,
			["FilterTankSpec"] = true,
			["InfoFrameLines"] = -0,
			["EventSoundWipe"] = 109069,
			["WarningDuration"] = 4,
			["ShowSpecialWarnings"] = true,
			["EnablePatchRestrictions"] = false,
			["EventSoundEngage"] = "Sound\\Creature\\MuradinBronzebeard\\IC_Muradin_Saurfang02.ogg",
			["HUDTexture4"] = "highlight",
			["DontShowSpecialWarningFlash"] = false,
			["SpecialWarningX"] = -1.53969407081604,
			["HUDTexture3"] = "highlight",
			["WorldBossNearAlert"] = true,
			["WarningFont"] = "Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Fonts\\Kimberley.ttf",
			["WarningAlphabetical"] = true,
			["DontShowPTCountdownText"] = false,
			["AutoAcceptFriendInvite"] = false,
			["FilterSayAndYell"] = false,
			["SpecialWarningFlashCount1"] = 1,
			["AlwaysPlayVoice"] = false,
			["SpecialWarningSound5"] = 11052,
			["DontSendYells"] = false,
			["HUDAlpha4"] = 0.5,
			["SpecialWarningFlash2"] = true,
			["SpecialWarningFlashRepeat1"] = false,
			["SpecialWarningFlash3"] = true,
			["HUDSize4"] = 5,
			["Enabled"] = false,

			--with the dbm update this seems to be the way to go around using voice packs
			--["ChosenVoicePack"] = "VEM", --dbm VEM
			--["ChosenVoicePack2"] = "VEM", --dbm VEM
			["ChosenVoicePack2"] = "None",
			["CountdownVoice"] = "Corsica",
			["CountdownVoice2"] = "Corsica",
			["CountdownVoice3"] = "Corsica",
			["VPReplacesAnnounce"] = true,
			["VPReplacesSA1"] = true,
			["VPReplacesSA2"] = true,
			["VPReplacesSA3"] = true,
			["VPReplacesSA4"] = true,
			--["ChosenVoicePack2"] = "English female", --calanon's voice
			--["CountdownVoice"] = "VP:English female",
			--["CountdownVoice2"] = "VP:English female",
			--["CountdownVoice3"] = "VP:English female",

			["WarningShortText"] = true,
			["SpecialWarningFlash1"] = true,
			["WarningY"] = -118.3650970458984,
			["GUIHeight"] = 798.4761352539062,
			["ShowWipeMessage"] = true,
			["NewsMessageShown"] = 12,
			["StripServerName"] = true,
			["AutoReplySound"] = true,
			["ForumsMessageShown"] = 13634,
			["HPFrameX"] = 341.999877929688,
			["NPAuraSize"] = 40,
			["AFKHealthWarning"] = true,
			["SpecialWarningDuration"] = 4,
			["DontPlayTrivialSpecialWarningSound"] = false,
		},
	}
	DBM_MinimapIcon = {
		["hide"] = true,
	}
	DBT_AllPersistentOptions = {
		["Eltreum"] = {
			["DBM"] = {
				["StartColorPR"] = 1,
				["HugeBarsEnabled"] = true,
				["EnlargeBarsPercent"] = 0.125,
				["StartColorR"] = 1,
				["EndColorPR"] = 0.501960784313726,
				["Sort"] = "Sort",
				["ExpandUpwardsLarge"] = true,
				["ExpandUpwards"] = true,
				["TimerPoint"] = "BOTTOMRIGHT",
				["EndColorDG"] = 0,
				["Alpha"] = 0.8,
				["HugeTimerPoint"] = "CENTER",
				["EndColorUIG"] = 0.92156862745098,
				["StartColorUIR"] = 1,
				["StartColorAG"] = 0.545098039215686,
				["EndColorDR"] = 1,
				["StartColorRR"] = 0.501960784313726,
				["StartColorUIG"] = 1,
				["FillUpLargeBars"] = false,
				["StartColorDG"] = 0.301960784313726,
				["StartColorAR"] = 0.376470588235294,
				["TextColorR"] = 1,
				["EndColorAER"] = 1,
				["StartColorIB"] = 1,
				["ClickThrough"] = true,
				["Font"] = "Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Fonts\\Kimberley.ttf",
				["TDecimal"] = 10,
				["EndColorAEB"] = 0.247058823529412,
				["HugeSort"] = "Sort",
				["NoBarFade"] = false,
				["EndColorAR"] = 0.149019607843137,
				["EndColorG"] = 0,
				["StartColorDB"] = 1,
				["Decimal"] = 60,
				["IconRight"] = false,
				["FadeBars"] = true,
				["TextColorB"] = 1,
				["EndColorIB"] = 1,
				["EndColorRR"] = 0.109803921568627,
				["StartColorAER"] = 1,
				["EndColorRB"] = 0.301960784313726,
				["EndColorIR"] = 0.0470588235294118,
				["DynamicColor"] = true,
				["HugeAlpha"] = 1,
				["Bar7ForceLarge"] = false,
				["BarStyle"] = "DBM",
				["EnlargeBarTime"] = 11,
				["Spark"] = true,
				["StartColorPG"] = 0.776470588235294,
				["StartColorRG"] = 1,
				["FontFlag"] = "OUTLINE",
				["EndColorAB"] = 1,
				["IconLocked"] = true,
				["EndColorPG"] = 0.411764705882353,
				["Bar7CustomInline"] = true,
				["EndColorIG"] = 0.87843137254902,
				["EndColorAEG"] = 0.0431372549019608,
				["StartColorAEG"] = 0.466666666666667,
				["StartColorAEB"] = 0.458823529411765,
				["StartColorIR"] = 0.470588235294118,
				["KeepBars"] = true,
				["Skin"] = "AddOnSkins Half-Bar",

				--"huge" bars, the small bars near the top right center
				["HugeScale"] = 1, --bar scale
				["HugeWidth"] = 170, --bar width
				["HugeHeight"] = 10, --bar height
				["HugeBarXOffset"] = 0, --offset for bars near top right center
				["HugeBarYOffset"] = 18, --offset for bars near top right center
				["HugeTimerX"] = 400, --actual small bar position X
				["HugeTimerY"] = 280, --actual small bar position Y

				--"small bars" the ones above right chat
				["BarXOffset"] = 0, --offset between bars above right chat
				["BarYOffset"] = 18, --offset between bars above right chat
				["Scale"] = 1, --bar scale
				["TimerX"] = -195, --actual position X
				["TimerY"] = 215, -- actual positon Y
				["Height"] = 11, --bar height
				["FontSize"] = 11, --bar font size
				["Width"] = 390, --bar width

				["ColorByType"] = true,
				["IconLeft"] = true,
				["Texture"] = "Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\NormTex3",
				["EndColorUIB"] = 0.0117647058823529,
				["StartColorDR"] = 0.901960784313726,
				["StartColorAB"] = 1,
				["StartColorRB"] = 0.501960784313726,
				["EndColorPB"] = 0.286274509803922,
				["FlashBar"] = true,
				["EndColorUIR"] = 1,
				["EndColorRG"] = 1,
				["StartColorUIB"] = 0.0627450980392157,
				["StartColorG"] = 0.701960784313726,
				["StripCDText"] = true,
				["FillUpBars"] = false,
				["EndColorR"] = 1,
				["StartColorPB"] = 0.419607843137255,
				["InlineIcons"] = true,
				["EndColorAG"] = 0.384313725490196,
				["EndColorDB"] = 1,
				["StartColorB"] = 0,
				["EndColorB"] = 0,
				["TextColorG"] = 1,
				["StartColorIG"] = 0.968627450980392,
			},
			["AddOnSkins Half-Bar"] = {
				["StartColorPR"] = 1,
				["HugeBarsEnabled"] = true,
				["EnlargeBarsPercent"] = 0.125,
				["StartColorR"] = 1,
				["EndColorPR"] = 0.501960784313726,
				["Sort"] = "Sort",
				["ExpandUpwardsLarge"] = true,
				["ExpandUpwards"] = true,
				["TimerPoint"] = "BOTTOMRIGHT",
				["EndColorDG"] = 0,
				["Alpha"] = 0.8,
				["HugeTimerPoint"] = "CENTER",
				["EndColorUIG"] = 0.92156862745098,
				["StartColorUIR"] = 1,
				["StartColorAG"] = 0.545098039215686,
				["EndColorDR"] = 1,
				["StartColorRR"] = 0.501960784313726,
				["StartColorUIG"] = 1,
				["FillUpLargeBars"] = false,
				["StartColorDG"] = 0.301960784313726,
				["StartColorAR"] = 0.376470588235294,
				["TextColorR"] = 1,
				["EndColorAER"] = 1,
				["StartColorIB"] = 1,
				["ClickThrough"] = true,
				["Font"] = "Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Fonts\\Kimberley.ttf",
				["TDecimal"] = 10,
				["EndColorAEB"] = 0.247058823529412,
				["HugeSort"] = "Sort",
				["NoBarFade"] = false,
				["EndColorAR"] = 0.149019607843137,
				["EndColorG"] = 0,
				["StartColorDB"] = 1,
				["Decimal"] = 60,
				["IconRight"] = false,
				["FadeBars"] = true,
				["TextColorB"] = 1,
				["EndColorIB"] = 1,
				["EndColorRR"] = 0.109803921568627,
				["StartColorAER"] = 1,
				["EndColorRB"] = 0.301960784313726,
				["EndColorIR"] = 0.0470588235294118,
				["DynamicColor"] = true,
				["HugeAlpha"] = 1,
				["Bar7ForceLarge"] = false,
				["BarStyle"] = "DBM",
				["EnlargeBarTime"] = 11,
				["Spark"] = true,
				["StartColorPG"] = 0.776470588235294,
				["StartColorRG"] = 1,
				["FontFlag"] = "OUTLINE",
				["EndColorAB"] = 1,
				["IconLocked"] = true,
				["EndColorPG"] = 0.411764705882353,
				["Bar7CustomInline"] = true,
				["EndColorIG"] = 0.87843137254902,
				["EndColorAEG"] = 0.0431372549019608,
				["StartColorAEG"] = 0.466666666666667,
				["StartColorAEB"] = 0.458823529411765,
				["StartColorIR"] = 0.470588235294118,
				["KeepBars"] = true,
				["Skin"] = "AddOnSkins Half-Bar",
				["ColorByType"] = true,
				["IconLeft"] = true,
				["Texture"] = "Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\NormTex3",
				["EndColorUIB"] = 0.0117647058823529,
				["StartColorDR"] = 0.901960784313726,
				["StartColorAB"] = 1,

				--"huge" bars, the small bars near the top right center
				["HugeScale"] = 1, --bar scale
				["HugeWidth"] = 170, --bar width
				["HugeHeight"] = 10, --bar height
				["HugeBarXOffset"] = 0, --offset for bars near top right center
				["HugeBarYOffset"] = 18, --offset for bars near top right center
				["HugeTimerX"] = 400, --actual small bar position X
				["HugeTimerY"] = 280, --actual small bar position Y

				--"small bars" the ones above right chat
				["BarXOffset"] = 0, --offset between bars above right chat
				["BarYOffset"] = 18, --offset between bars above right chat
				["Scale"] = 1, --bar scale
				["TimerX"] = -195, --actual position X
				["TimerY"] = 215, -- actual positon Y
				["Height"] = 11, --bar height
				["FontSize"] = 11, --bar font size
				["Width"] = 390, --bar width


				["StartColorRB"] = 0.501960784313726,
				["EndColorPB"] = 0.286274509803922,
				["FlashBar"] = true,
				["EndColorUIR"] = 1,
				["EndColorRG"] = 1,
				["StartColorUIB"] = 0.0627450980392157,
				["StartColorG"] = 0.701960784313726,
				["StripCDText"] = true,
				["FillUpBars"] = false,
				["EndColorR"] = 1,
				["StartColorPB"] = 0.419607843137255,
				["InlineIcons"] = true,
				["EndColorAG"] = 0.384313725490196,
				["EndColorDB"] = 1,
				["StartColorB"] = 0,
				["EndColorB"] = 0,
				["TextColorG"] = 1,
				["StartColorIG"] = 0.968627450980392,
			},
		},
	}
	DBM:ApplyProfile("Eltreum")
end
