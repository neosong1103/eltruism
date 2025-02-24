local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local classcolor = E:ClassColor(E.myclass, true)
local classtable = {
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

-- WarpDeplete profile setup
function ElvUI_EltreumUI:GetWarpDepleteProfile()
	if IsAddOnLoaded("WarpDeplete") then
		WarpDepleteDB["profileKeys"][E.mynameRealm] = E.mynameRealm
		WarpDepleteDB["global"]["mdtAlertShown"] = true
		WarpDepleteDB["profiles"][E.mynameRealm] = {
			["timerSuccessColor"] = "ff00ff24",
			["bar1TextureColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["forcesFont"] = E.db.general.font,
			["frameX"] = 0,
			["completedObjectivesColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["keyDetailsFontSize"] = 14,
			["timerFont"] = E.db.general.font,
			["bar3Font"] = E.db.general.font,
			["bar3TextureColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["objectivesFont"] = E.db.general.font,
			["keyDetailsFont"] = E.db.general.font,
			["keyFont"] = E.db.general.font,
			["prideGlowColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["deathsFont"] = E.db.general.font,
			["completedForcesColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["bar1Font"] = E.db.general.font,
			["bar2TextureColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["bar2Font"] = E.db.general.font,
			["frameY"] = -92.44456481933594,
			["forcesTextureColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["bar1Texture"] = classtable[E.myclass],
			["bar2Texture"] = classtable[E.myclass],
			["forcesOverlayTexture"] = "Eltreum-Blank",
			["bar3Texture"] = classtable[E.myclass],
			["forcesTexture"] = classtable[E.myclass],
			["timerRunningColor"] = tostring(E:RGBToHex(classcolor.r, classcolor.g, classcolor.b, "ff", "")),
			["forcesFontSize"] = 18,
			["forcesOverlayTextureColor"] = "ffffffff",
		}

		ElvUI_EltreumUI:Print(L["WarpDeplete profile has been set."])
	else
		ElvUI_EltreumUI:Print(L["WarpDeplete is not loaded"])
	end
end
