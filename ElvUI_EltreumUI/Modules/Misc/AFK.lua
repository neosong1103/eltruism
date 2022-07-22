local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G

-- general alliance walk (legion) maybe human music idk
--/script PlaySoundFile(1417250, "Dialog", true)

-- AFK music (modified with the help of Repooc!)
local racialMusic = {
	["Human"] = 53210,
	["Gnome"] = 369055,
	["NightElf"] = 441709,
	["KulTiran"] = 1781897,
	["Dwarf"] = 298910,
	["Draenei"] = 53284,
	["Worgen"] = 441525,
	["VoidElf"] = 1864282,
	["LightforgedDraenei"] = 1864285,
	["DarkIronDwarf"] = 441566,
	["Mechagnome"] = 3028751,
	["Orc"] = 441713,
	["Scourge"] = 53217,
	["Tauren"] = 441788,
	["Troll"] = 371378,
	["Goblin"] = 441627,
	["BloodElf"] = 53473,
	["Pandaren"] = 642246,
	["Nightborne"] = 1477339,
	["HighmountainTauren"] = 1417319,
	["ZandalariTroll"] = 2844635,
	["Vulpera"] = 3260632,
	["MagharOrc"] = 2146630,
}
local classMusic = {
	["WARRIOR"] = 1417334,
	["PALADIN"] = 1417342, --443289
	["HUNTER"] = 1417326,
	["ROGUE"] = 1417273,
	["PRIEST"] = 1417367,
	["DEATHKNIGHT"] = 229831,
	["SHAMAN"] = 528163,
	["MAGE"] = 1417264,
	["WARLOCK"] = 1417356,
	["MONK"] = 642138,
	["DRUID"] = 1417312,
	["DEMONHUNTER"] = 1417290,
}

local tbcMusic = {
	["Human"] = 53202,
	["Gnome"] = 53190,
	["NightElf"] = 53187,
	["Dwarf"] = 53193,
	["Orc"] = 53201,
	["Scourge"] = 53217,
	["Tauren"] = 53215,
	["Troll"] = 53825,
	["Draenei"] = 53284,
	["BloodElf"] = 53473,
}

local classicMusic = {
	["Human"] = 6794,
	["Gnome"] = 7341,
	["NightElf"] = 3920,
	["Dwarf"] = 7319,
	["Orc"] = 2902,
	["Scourge"] = 5074,
	["Tauren"] = 7077,
	["Troll"] = 8452,
}

-- with the help of Repooc, Simpy, Nihilistzsche and Acidweb (not in order :D)
local musicSetting = C_CVar.GetCVar('Sound_EnableMusic')
local classicmusicstopper = nil
local willplay = nil
function ElvUI_EltreumUI:AFKmusic()
	if E.db.ElvUI_EltreumUI.afkmusic.enable then
		if UnitIsAFK("player") then
			musicSetting = C_CVar.GetCVar('Sound_EnableMusic')
			SetCVar("Sound_EnableMusic", 1)
			if E.Retail then
				if E.db.ElvUI_EltreumUI.afkmusic.racial then
					PlayMusic(racialMusic[E.myrace])
				elseif E.db.ElvUI_EltreumUI.afkmusic.playerclass then
					PlayMusic(classMusic[E.myclass])
				end
			elseif E.Wrath or E.TBC then
				PlayMusic(tbcMusic[E.myrace])
			elseif E.Classic then
				willplay, classicmusicstopper = PlaySound(classicMusic[E.myrace])
			end
		else
			if E.Retail or E.Wrath or E.TBC then
				StopMusic()
				SetCVar("Sound_EnableMusic", musicSetting)
			elseif E.Classic then
				if willplay then
					StopSound(classicmusicstopper,3000)
				end
				SetCVar("Sound_EnableMusic", musicSetting)
			end
		end
	end
end

--add Eltruism logo to elvui afk screen
local EltruismAFKLogo
if E.db.general.afk then
	EltruismAFKLogo = CreateFrame("Frame", "EltruismAFKLogo", UIParent)
	local EltruismAFKLogoTexture = EltruismAFKLogo:CreateTexture()
	EltruismAFKLogoTexture:SetTexture("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\Textures\\logohq")
	EltruismAFKLogo:SetSize(320, 80)
	EltruismAFKLogo:ClearAllPoints()
	EltruismAFKLogo:SetPoint("TOP", UIParent, "TOP", 0, -10)
	EltruismAFKLogoTexture:SetAllPoints(EltruismAFKLogo)
	EltruismAFKLogo:SetFrameStrata("DIALOG")
	EltruismAFKLogo:Hide()

	local EltruismAFKTop = CreateFrame('Frame', nil, EltruismAFKLogo)
	EltruismAFKTop:SetFrameLevel(0)
	EltruismAFKTop:SetTemplate('Transparent')
	EltruismAFKTop:SetPoint('TOP', UIParent, 'TOP', 0, 0)
	--EltruismAFKTop:SetWidth(E.screenWidth + (E.Border*2))
	EltruismAFKTop:SetWidth(E.screenWidth*2)
	EltruismAFKTop:SetHeight(E.screenHeight * (1 / 10))
end

function ElvUI_EltreumUI:AFKLogo()
	if E.db.general.afk then
		EltruismAFKLogo:SetParent(_G.ElvUIAFKFrame.bottom)
	end
	if UnitIsAFK("player") then
		EltruismAFKLogo:Show()
	else
		EltruismAFKLogo:Hide()
	end
end
