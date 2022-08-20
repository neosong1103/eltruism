local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))

--Based on ElvUI's and SLE's db convert
function ElvUI_EltreumUI:DatabaseConversions(forced)
	if E.private.ElvUI_EltreumUI.install_version ~= nil then
		E.PopupDialogs["ELTRUISMDBCONVERT"] = {
			text = L["Eltruism database was converted.\n|cff82B4ffThe Following profiles were updated:|r\n%s\n\n|cff82B4ffPrivate settings were updated for the following private profiles:|r\n%s\n\n|cff82B4ffIf you have any issues please report in Discord or open a ticket.|r\n|cffff0000A Reload is necessary to save this conversion and fix variables|r"],
			OnAccept = ReloadUI,
			button1 = ACCEPT,
			timeout = 0,
			whileDead = 1,
			hideOnEscape = false,
		}

		if E.private.ElvUI_EltreumUI.install_version < "3.2.0" or forced then

			--Profile options conversion
			local ProfileNames = "NONE"
			local CharacterNames = "NONE"
			for profile, data in pairs(ElvDB.profiles) do
				local profileChanged = false
				if data then
					if data.ElvUI_EltreumUI then

						if data.ElvUI_EltreumUI.instances then
							E:CopyTable(E.db.ElvUI_EltreumUI.skins.instances, data.ElvUI_EltreumUI.instances)
							data.ElvUI_EltreumUI.instances = nil
						end

						if data.ElvUI_EltreumUI.shadows then
							local temp = E.db.ElvUI_EltreumUI.skins.shadows
							E.db.ElvUI_EltreumUI.skins.shadows = {}
							E:CopyTable(E.db.ElvUI_EltreumUI.skins.shadows, data.ElvUI_EltreumUI.shadows)
							E.db.ElvUI_EltreumUI.skins.shadows.enable =  temp
							data.ElvUI_EltreumUI.shadows = nil
						end
						if data.ElvUI_EltreumUI.blizzframes then
							E:CopyTable(E.db.ElvUI_EltreumUI.skins.blizzframes, data.ElvUI_EltreumUI.blizzframes)
							data.ElvUI_EltreumUI.blizzframes = nil
						end
						if data.ElvUI_EltreumUI.cursor then
							E:CopyTable(E.db.ElvUI_EltreumUI.cursors.cursor, data.ElvUI_EltreumUI.cursor)
							data.ElvUI_EltreumUI.cursor = nil
						end
						if data.ElvUI_EltreumUI.cursorcast then
							E:CopyTable(E.db.ElvUI_EltreumUI.cursors.cursorcast, data.ElvUI_EltreumUI.cursorcast)
							data.ElvUI_EltreumUI.cursorcast = nil
						end
						if data.ElvUI_EltreumUI.cursorgcd then
							E:CopyTable(E.db.ElvUI_EltreumUI.cursors.cursorgcd, data.ElvUI_EltreumUI.cursorgcd)
							data.ElvUI_EltreumUI.cursorgcd = nil
						end
						if data.ElvUI_EltreumUI.cursorcursor then
							E:CopyTable(E.db.ElvUI_EltreumUI.cursors.cursorcursor, data.ElvUI_EltreumUI.cursorcursor)
							data.ElvUI_EltreumUI.cursorcursor = nil
						end
						if data.ElvUI_EltreumUI.nameplateOptions then
							E:CopyTable(E.db.ElvUI_EltreumUI.nameplates.nameplateOptions, data.ElvUI_EltreumUI.nameplateOptions)
							data.ElvUI_EltreumUI.nameplateOptions = nil
						end
						if data.ElvUI_EltreumUI.nameplatelevel then
							E:CopyTable(E.db.ElvUI_EltreumUI.nameplates.nameplatelevel, data.ElvUI_EltreumUI.nameplatelevel)
							data.ElvUI_EltreumUI.nameplatelevel = nil
						end
						if data.ElvUI_EltreumUI.nptextureversion then
							E:CopyTable(E.db.ElvUI_EltreumUI.nameplates.nptextureversion, data.ElvUI_EltreumUI.nptextureversion)
							data.ElvUI_EltreumUI.nptextureversion = nil
						end
						if data.ElvUI_EltreumUI.nameplatepower then
							E:CopyTable(E.db.ElvUI_EltreumUI.nameplates.nameplatepower, data.ElvUI_EltreumUI.nameplatepower)
							data.ElvUI_EltreumUI.nameplatepower = nil
						end
						if data.ElvUI_EltreumUI.friendlynameplatetoggle then
							E:CopyTable(E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle, data.ElvUI_EltreumUI.friendlynameplatetoggle)
							data.ElvUI_EltreumUI.friendlynameplatetoggle = nil
						end
						if data.ElvUI_EltreumUI.widenameplate then
							E:CopyTable(E.db.ElvUI_EltreumUI.nameplates.widenameplate, data.ElvUI_EltreumUI.widenameplate)
							data.ElvUI_EltreumUI.widenameplate = nil
						end
						if data.ElvUI_EltreumUI.glowcustomcolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowcustomcolor, data.ElvUI_EltreumUI.glowcustomcolor)
							data.ElvUI_EltreumUI.glowcustomcolor = nil
						end
						if data.ElvUI_EltreumUI.tbctalents then
							if data.ElvUI_EltreumUI.tbctalents.enable then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.tbctalents, data.ElvUI_EltreumUI.tbctalents.enable)
								data.ElvUI_EltreumUI.tbctalents = nil
							end
						end
						if data.ElvUI_EltreumUI.stealthOptions then
							if data.ElvUI_EltreumUI.stealthOptions.stealtheffect then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.stealtheffect, data.ElvUI_EltreumUI.stealthOptions.stealtheffect)
								data.ElvUI_EltreumUI.stealthOptions = nil
							end
						end
						if data.ElvUI_EltreumUI.glowcustomcolorpet then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowcustomcolorpet, data.ElvUI_EltreumUI.glowcustomcolorpet)
							data.ElvUI_EltreumUI.glowcustomcolorpet = nil
						end
						if data.ElvUI_EltreumUI.glowcustomcolornp then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowcustomcolornp, data.ElvUI_EltreumUI.glowcustomcolornp)
							data.ElvUI_EltreumUI.glowcustomcolornp = nil
						end
						if data.ElvUI_EltreumUI.glowtotem1customcolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowtotem1customcolor, data.ElvUI_EltreumUI.glowtotem1customcolor)
							data.ElvUI_EltreumUI.glowtotem1customcolor = nil
						end
						if data.ElvUI_EltreumUI.glowtotem2customcolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowtotem2customcolor, data.ElvUI_EltreumUI.glowtotem2customcolor)
							data.ElvUI_EltreumUI.glowtotem2customcolor = nil
						end
						if data.ElvUI_EltreumUI.glowtotem3customcolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowtotem3customcolor, data.ElvUI_EltreumUI.glowtotem3customcolor)
							data.ElvUI_EltreumUI.glowtotem3customcolor = nil
						end
						if data.ElvUI_EltreumUI.glowtotem4customcolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.glow.glowtotem4customcolor, data.ElvUI_EltreumUI.glowtotem4customcolor)
							data.ElvUI_EltreumUI.glowtotem4customcolor = nil
						end
						if data.ElvUI_EltreumUI.waypointetasetting then
							E:CopyTable(E.db.ElvUI_EltreumUI.waypoints.waypointetasetting, data.ElvUI_EltreumUI.waypointetasetting)
							data.ElvUI_EltreumUI.waypointetasetting = nil
						end
						if data.ElvUI_EltreumUI.waytext then
							E:CopyTable(E.db.ElvUI_EltreumUI.waypoints.waytext, data.ElvUI_EltreumUI.waytext)
							data.ElvUI_EltreumUI.waytext = nil
						end
						if data.ElvUI_EltreumUI.dynamicdatatext then
							E:CopyTable(E.db.ElvUI_EltreumUI.otherstuff.dynamicdatatext, data.ElvUI_EltreumUI.dynamicdatatext)
							data.ElvUI_EltreumUI.dynamicdatatext = nil
						end
						if data.ElvUI_EltreumUI.partyraiddeath then
							E:CopyTable(E.db.ElvUI_EltreumUI.otherstuff.partyraiddeath, data.ElvUI_EltreumUI.partyraiddeath)
							data.ElvUI_EltreumUI.partyraiddeath = nil
						end
						if data.ElvUI_EltreumUI.afkmusic then
							E:CopyTable(E.db.ElvUI_EltreumUI.otherstuff.afkmusic, data.ElvUI_EltreumUI.afkmusic)
							data.ElvUI_EltreumUI.afkmusic = nil
						end
						if data.ElvUI_EltreumUI.fonts then
							E:CopyTable(E.db.ElvUI_EltreumUI.otherstuff.fonts, data.ElvUI_EltreumUI.fonts)
							data.ElvUI_EltreumUI.fonts = nil
						end
						if data.ElvUI_EltreumUI.loottext then
							E:CopyTable(E.db.ElvUI_EltreumUI.loot.loottext, data.ElvUI_EltreumUI.loottext)
							data.ElvUI_EltreumUI.loottext = nil
						end
						if data.ElvUI_EltreumUI.otherstuff then
							if data.ElvUI_EltreumUI.otherstuff.playerdeathcustomtext then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.playerdeathcustomtext, data.ElvUI_EltreumUI.otherstuff.playerdeathcustomtext)
								data.ElvUI_EltreumUI.otherstuff.playerdeathcustomtext = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.playerdeath then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.playerdeath, data.ElvUI_EltreumUI.otherstuff.playerdeath)
								data.ElvUI_EltreumUI.otherstuff.playerdeath = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.playerdeathgta then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.playerdeathgta, data.ElvUI_EltreumUI.otherstuff.playerdeathgta)
								data.ElvUI_EltreumUI.otherstuff.playerdeathgta = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.playerdeathcustom then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.playerdeathcustom, data.ElvUI_EltreumUI.otherstuff.playerdeathcustom)
								data.ElvUI_EltreumUI.otherstuff.playerdeathcustom = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.hidetalkinghead then
								E:CopyTable(E.db.ElvUI_EltreumUI.skins.hidetalkinghead, data.ElvUI_EltreumUI.otherstuff.hidetalkinghead)
								data.ElvUI_EltreumUI.otherstuff.hidetalkinghead = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.fastloot then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.fastloot, data.ElvUI_EltreumUI.otherstuff.fastloot)
								data.ElvUI_EltreumUI.otherstuff.fastloot = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.fastlootfilter then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.fastlootfilter, data.ElvUI_EltreumUI.otherstuff.fastlootfilter)
								data.ElvUI_EltreumUI.otherstuff.fastlootfilter = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.fastlootquality then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.fastlootquality, data.ElvUI_EltreumUI.otherstuff.fastlootquality)
								data.ElvUI_EltreumUI.otherstuff.fastlootquality = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.lootwishlistwarning then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.lootwishlistwarning, data.ElvUI_EltreumUI.otherstuff.lootwishlistwarning)
								data.ElvUI_EltreumUI.otherstuff.lootwishlistwarning = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.lootwishlistfilter then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.lootwishlistfilter, data.ElvUI_EltreumUI.otherstuff.lootwishlistfilter)
								data.ElvUI_EltreumUI.otherstuff.lootwishlistfilter = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.lootwishlistscreenshot then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.lootwishlistscreenshot, data.ElvUI_EltreumUI.otherstuff.lootwishlistscreenshot)
								data.ElvUI_EltreumUI.otherstuff.lootwishlistscreenshot = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.lootwishlistsoundenable then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.lootwishlistsoundenable, data.ElvUI_EltreumUI.otherstuff.lootwishlistsoundenable)
								data.ElvUI_EltreumUI.otherstuff.lootwishlistsoundenable = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.lootautoclose then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.lootautoclose, data.ElvUI_EltreumUI.otherstuff.lootautoclose)
								data.ElvUI_EltreumUI.otherstuff.lootautoclose = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.lootwishlistsound then
								E:CopyTable(E.db.ElvUI_EltreumUI.loot.lootwishlistsound, data.ElvUI_EltreumUI.otherstuff.lootwishlistsound)
								data.ElvUI_EltreumUI.otherstuff.lootwishlistsound = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.arenabuffs then
								E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.arenabuffs, data.ElvUI_EltreumUI.otherstuff.arenabuffs)
								data.ElvUI_EltreumUI.otherstuff.arenabuffs = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.bgunitframes then
								E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.bgunitframes, data.ElvUI_EltreumUI.otherstuff.bgunitframes)
								data.ElvUI_EltreumUI.otherstuff.bgunitframes = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.arenaunitframes then
								E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.arenaunitframes, data.ElvUI_EltreumUI.otherstuff.arenaunitframes)
								data.ElvUI_EltreumUI.otherstuff.arenaunitframes = nil
							end
							if data.ElvUI_EltreumUI.otherstuff.portraitfix then
								E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.portraitfix, data.ElvUI_EltreumUI.otherstuff.portraitfix)
								data.ElvUI_EltreumUI.otherstuff.portraitfix = nil
							end
						end
						if data.ElvUI_EltreumUI.UFmodifications then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.UFmodifications, data.ElvUI_EltreumUI.UFmodifications)
							data.ElvUI_EltreumUI.UFmodifications = nil
						end
						if data.ElvUI_EltreumUI.UForientation then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.UForientation, data.ElvUI_EltreumUI.UForientation)
							data.ElvUI_EltreumUI.UForientation = nil
						end
						if data.ElvUI_EltreumUI.uftextureversion then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.uftextureversion, data.ElvUI_EltreumUI.uftextureversion)
							data.ElvUI_EltreumUI.uftextureversion = nil
						end
						--dark mode/light mode is special
						if data.ElvUI_EltreumUI.darkmode and data.ElvUI_EltreumUI.lightmode then
							data.ElvUI_EltreumUI.lightmode = false
							E.db.ElvUI_EltreumUI.unitframes.lightmode = false
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.lightmode, data.ElvUI_EltreumUI.lightmode)
							data.ElvUI_EltreumUI.darkmode = true
							E.db.ElvUI_EltreumUI.unitframes.darkmode = true
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.darkmode, data.ElvUI_EltreumUI.darkmode)
						elseif data.ElvUI_EltreumUI.lightmode and not data.ElvUI_EltreumUI.darkmode then
							data.ElvUI_EltreumUI.lightmode = true
							E.db.ElvUI_EltreumUI.unitframes.lightmode = true
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.lightmode, data.ElvUI_EltreumUI.lightmode)
							data.ElvUI_EltreumUI.darkmode = false
							E.db.ElvUI_EltreumUI.unitframes.darkmode = false
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.darkmode, data.ElvUI_EltreumUI.darkmode)
						elseif data.ElvUI_EltreumUI.darkmode and not data.ElvUI_EltreumUI.lightmode then
							data.ElvUI_EltreumUI.lightmode = false
							E.db.ElvUI_EltreumUI.unitframes.lightmode = false
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.lightmode, data.ElvUI_EltreumUI.lightmode)
							data.ElvUI_EltreumUI.darkmode = true
							E.db.ElvUI_EltreumUI.unitframes.darkmode = true
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.darkmode, data.ElvUI_EltreumUI.darkmode)
						end

						if data.ElvUI_EltreumUI.darkpowercolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.darkpowercolor, data.ElvUI_EltreumUI.darkpowercolor)
							data.ElvUI_EltreumUI.darkpowercolor = nil
						end
						if data.ElvUI_EltreumUI.greybackground then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.greybackground, data.ElvUI_EltreumUI.greybackground)
							data.ElvUI_EltreumUI.greybackground = nil
						end
						if data.ElvUI_EltreumUI.gradientmode then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.gradientmode, data.ElvUI_EltreumUI.gradientmode)
							data.ElvUI_EltreumUI.gradientmode = nil
						end
						if data.ElvUI_EltreumUI.ufcustomtexture then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.ufcustomtexture, data.ElvUI_EltreumUI.ufcustomtexture)
							data.ElvUI_EltreumUI.ufcustomtexture = nil
						end
						if data.ElvUI_EltreumUI.sparkcustomcolor then
							E:CopyTable(E.db.ElvUI_EltreumUI.unitframes.sparkcustomcolor, data.ElvUI_EltreumUI.sparkcustomcolor)
							data.ElvUI_EltreumUI.sparkcustomcolor = nil
						end

						profileChanged = true
					end
					if profileChanged then
						if ProfileNames == "NONE" then
							ProfileNames = profile
						else
							ProfileNames = ProfileNames..', '..profile
						end
					end
				end
			end
			E:StaggeredUpdateAll(nil, true)
			E:StaticPopup_Show('ELTRUISMDBCONVERT', ProfileNames, CharacterNames)
			E.private.ElvUI_EltreumUI.install_version = ElvUI_EltreumUI.Version
		end
	end
end
