local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))

-- Floating Combat Text profile setup
function ElvUI_EltreumUI:GetFCTProfile()
	ElvFCT = {
		["nameplates"] = {
			["enable"] = true,
			["frames"] = {
				["Player"] = {
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetY"] = 20,
						["ScrollTime"] = 1,
					},
					["prefix"] = "",
					["mode"] = "LS",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["spellY"] = 20,
					["alternateIcon"] = true,
					["font"] = E.db.general.font,
					["numberStyle"] = "BLIZZARD",
					["critFontSize"] = 32,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
					["textShake"] = false,
					["enable"] = true,
				},
				["EnemyNPC"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["advanced"] = {
						["OffsetY"] = 100,
						["ScrollTime"] = 1,
					},
					["fontSize"] = 16,
					["isTarget"] = false,
					["cycleColors"] = false,
					["spellY"] = 100,
					["font"] = E.db.general.font,
					["numberStyle"] = "BLIZZARD",
					["showDots"] = true,
					["showHots"] = false,
					["critFontSize"] = 60,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["prefix"] = "",
					["critFont"] = E.db.general.font,
				},
				["FriendlyPlayer"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["advanced"] = {
						["OffsetY"] = 20,
						["ScrollTime"] = 1,
					},
					["fontSize"] = 16,
					["isTarget"] = false,
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["spellY"] = 20,
					["font"] = E.db.general.font,
					["numberStyle"] = "BLIZZARD",
					["critFontSize"] = 32,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["prefix"] = "",
					["critFont"] = E.db.general.font,
				},
				["EnemyPlayer"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["advanced"] = {
						["OffsetY"] = 100,
						["ScrollTime"] = 1,
					},
					["fontSize"] = 16,
					["isTarget"] = false,
					["cycleColors"] = false,
					["spellY"] = 100,
					["font"] = E.db.general.font,
					["numberStyle"] = "BLIZZARD",
					["showDots"] = true,
					["showHots"] = false,
					["critFontSize"] = 60,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["prefix"] = "",
					["critFont"] = E.db.general.font,
				},
				["FriendlyNPC"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["advanced"] = {
						["OffsetY"] = 20,
						["ScrollTime"] = 1,
					},
					["fontSize"] = 16,
					["isTarget"] = false,
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["spellY"] = 20,
					["font"] = E.db.general.font,
					["numberStyle"] = "BLIZZARD",
					["critFontSize"] = 32,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["prefix"] = "",
					["critFont"] = E.db.general.font,
				},
			},
		},
		["unitframes"] = {
			["enable"] = true,
			["frames"] = {
				["Tank"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Boss"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["spellY"] = 0,
					["font"] = E.db.general.font,
					["showHots"] = false,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Focus"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["spellY"] = 0,
					["font"] = E.db.general.font,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Target"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["showIcon"] = true,
					["fontSize"] = 16,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["spellY"] = 0,
					["showName"] = false,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["font"] = E.db.general.font,
					["critFont"] = E.db.general.font,
				},
				["FocusTarget"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["spellY"] = 0,
					["font"] = E.db.general.font,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["PetTarget"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["font"] = E.db.general.font,
					["showHots"] = false,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["TargetTargetTarget"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["font"] = E.db.general.font,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Pet"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Raid2"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Raid3"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Player"] = {
					["isPlayer"] = false,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["showIcon"] = true,
					["fontSize"] = 16,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["isPlayer"] = false,
					["spellY"] = 0,
					["showName"] = false,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["font"] = E.db.general.font,
					["critFont"] = E.db.general.font,
				},
				["Raid1"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Party"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["TargetTarget"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["font"] = E.db.general.font,
					["showDots"] = true,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Arena"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["font"] = E.db.general.font,
					["showDots"] = true,
					["showHots"] = false,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["Assist"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = true,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["showDots"] = false,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
				["RaidPet"] = {
					["isPlayer"] = true,
					["textShake"] = false,
					["enable"] = false,
					["isTarget"] = false,
					["fontSize"] = 16,
					["showIcon"] = true,
					["iconX"] = -5,
					["advanced"] = {
						["OffsetX"] = 0,
						["OffsetY"] = 0,
						["anim"] = "static",
					},
					["showDots"] = false,
					["prefix"] = "",
					["cycleColors"] = false,
					["showHots"] = true,
					["font"] = E.db.general.font,
					["showPet"] = false,
					["critFontSize"] = 24,
					["shakeDuration"] = 0.4,
					["followSize"] = true,
					["critFont"] = E.db.general.font,
				},
			},
		},
		["colors"] = {
			["Ranged"] = {
				["b"] = 0,
				["g"] = 1,
				["r"] = 1,
			},
			["Physical"] = {
				["b"] = 0,
				["g"] = 1,
				["r"] = 1,
			},
			[1] = {
				["r"] = 1,
				["g"] = 1,
				["b"]= 0,
			},
			[2] = {
				["b"] = 0.5019607843137255,
				["g"] = 0.9019607843137255,
				["r"] = 1,
			},
			[4] = {
				["b"] = 0,
				["g"] = 0.5019607843137255,
				["r"] = 1,
			},
			[8] = {
				["b"] = 0.3019607843137255,
				["g"] = 1,
				["r"] = 0.3019607843137255,
			},
			[16] = {
				["b"] = 1,
				["r"] = 0.5019607843137255,
				["g"] = 1,
			},
			[32] = {
				["b"] = 0.596078431372549,
				["g"] = 0.1725490196078431,
				["r"] = 0.4117647058823529,
			},
			["Prefix"] = {
				["b"] = 0,
				["g"] = 0,
				["r"] = 1,
			},
			[64] = {
				["b"] = 1,
				["g"] = 0.5019607843137255,
				["r"] = 1,
			},
		},
	}
end
