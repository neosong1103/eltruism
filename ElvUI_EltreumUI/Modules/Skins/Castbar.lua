local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local UF = E:GetModule('UnitFrames')
local _G = _G
local hooksecurefunc = _G.hooksecurefunc
local UnitExists = _G.UnitExists
local UnitClass = _G.UnitClass
local UnitReaction = _G.UnitReaction
local UnitIsPlayer = _G.UnitIsPlayer

--Databar gradient
function ElvUI_EltreumUI:GradientDatabar()
	local databarXP = _G["ElvUI_ExperienceBar"]
	if databarXP and E.db.ElvUI_EltreumUI.gradientmode.gradientXP then
		databarXP:GetStatusBarTexture():SetGradientAlpha("HORIZONTAL", E.db.databars.colors.experience.r, E.db.databars.colors.experience.g, E.db.databars.colors.experience.b, E.db.databars.colors.experience.a, 0.8, 0.4, 1, E.db.databars.colors.experience.a)
	end
end
local DB = E:GetModule('DataBars')
hooksecurefunc(DB, 'ExperienceBar_Update', ElvUI_EltreumUI.GradientDatabar)

--elvui castbar texture/gradient
function ElvUI_EltreumUI:CastBarTextureGradient()
	local castbar = _G["ElvUF_Player_CastBar"]
	local targetcastbar = _G["ElvUF_Target_CastBar"]

	--spark
	if E.db.ElvUI_EltreumUI.sparkcustomcolor.enable and E.private.unitframe.enable then
		--castbar.Spark_ = castbar:CreateTexture(nil, 'OVERLAY')
		castbar.Spark_:SetTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.sparkcustomcolor.texture))
		if E.db.ElvUI_EltreumUI.sparkcustomcolor.texture == 'Eltreum-Fade' then --flip otherwise it will look wrong
			castbar.Spark_:SetTexCoord(1, 0, 0, 1)
		end
		castbar.Spark_:SetVertexColor(E.db.ElvUI_EltreumUI.sparkcustomcolor.r, E.db.ElvUI_EltreumUI.sparkcustomcolor.g, E.db.ElvUI_EltreumUI.sparkcustomcolor.b, 1)
		castbar.Spark_:SetWidth(E.db.ElvUI_EltreumUI.sparkcustomcolor.width)
		--castbar.Spark_:SetAlpha(0.8) dunno since it can look bad with color mixing, infact textures themselves can look bad

		if UnitExists("target") then
			targetcastbar.Spark_:SetTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.sparkcustomcolor.texture))
			targetcastbar.Spark_:SetVertexColor(E.db.ElvUI_EltreumUI.sparkcustomcolor.r, E.db.ElvUI_EltreumUI.sparkcustomcolor.g, E.db.ElvUI_EltreumUI.sparkcustomcolor.b, 1)
			targetcastbar.Spark_:SetWidth(E.db.ElvUI_EltreumUI.sparkcustomcolor.width)
		end
	end

	--gradient/texture
	if E.db.ElvUI_EltreumUI.UFmodifications then
		if E.db.ElvUI_EltreumUI.ufcustomtexture.enable and (not E.db.ElvUI_EltreumUI.gradientmode.enable) then
			castbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.ufcustomtexture.castbartexture))
			if UnitExists("target") then
				targetcastbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.ufcustomtexture.castbartexture))
			end
		end

		--player
		if UnitExists("player") then
			local _, playerclass = UnitClass("player")
			if E.db.ElvUI_EltreumUI.ufcustomtexture.enable and (not E.db.ElvUI_EltreumUI.gradientmode.enable) then
				castbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.ufcustomtexture.castbartexture))
			end
			if E.db.ElvUI_EltreumUI.gradientmode.enable and (not E.db.ElvUI_EltreumUI.ufcustomtexture.enable) then
				if castbar.notInterruptible then --cant interrupt
					if E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarnoninterruptible then
						castbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
						if E.db.unitframe.units.player.castbar.reverse == true then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptiblecustom)
							else
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptible)
							end
						elseif E.db.unitframe.units.player.castbar.reverse == false then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptiblecustom)
							else
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1noninterruptible)
							end
						end
					end
				elseif (not castbar.notInterruptible) then --can interrupt
					if E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbar then
						castbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
						if E.db.unitframe.units.player.castbar.reverse == true then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar then
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1)
							elseif E.db.ElvUI_EltreumUI.gradientmode.customcolor and E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar then
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(E.myclass, true))--unitcustomgradients[E.myclass]["r2"], unitcustomgradients[E.myclass]["g2"], unitcustomgradients[E.myclass]["b2"], unitcustomgradients[E.myclass]["r1"], unitcustomgradients[E.myclass]["g1"], unitcustomgradients[E.myclass]["b1"])
							else
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(E.myclass, true))--unitgradients[E.myclass]["r2"], unitgradients[E.myclass]["g2"], unitgradients[E.myclass]["b2"], unitgradients[E.myclass]["r1"], unitgradients[E.myclass]["g1"], unitgradients[E.myclass]["b1"])
							end
						elseif E.db.unitframe.units.player.castbar.reverse == false then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar then
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2)
							elseif E.db.ElvUI_EltreumUI.gradientmode.customcolor and E.db.ElvUI_EltreumUI.gradientmode.classcolorplayercastbar then
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(E.myclass))--unitcustomgradients[E.myclass]["r1"], unitcustomgradients[E.myclass]["g1"], unitcustomgradients[E.myclass]["b1"], unitcustomgradients[E.myclass]["r2"], unitcustomgradients[E.myclass]["g2"], unitcustomgradients[E.myclass]["b2"])
							else
								castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(E.myclass))--unitgradients[E.myclass]["r1"], unitgradients[E.myclass]["g1"], unitgradients[E.myclass]["b1"], unitgradients[E.myclass]["r2"], unitgradients[E.myclass]["g2"], unitgradients[E.myclass]["b2"])
							end
						end
					end
				end
			end
		end

		--target
		if UnitExists("target") then
			local _, targetclass = UnitClass("target")
			local reactiontarget = UnitReaction("player", "target")
			if E.db.ElvUI_EltreumUI.ufcustomtexture.enable and (not E.db.ElvUI_EltreumUI.gradientmode.enable) then
				targetcastbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.ufcustomtexture.castbartexture))
			end
			if E.db.ElvUI_EltreumUI.gradientmode.enable and (not E.db.ElvUI_EltreumUI.ufcustomtexture.enable) then
				if (targetcastbar.notInterruptible) then --cant interrupt
					if E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarnoninterruptible then
						targetcastbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
						if E.db.unitframe.units.target.castbar.reverse == true then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptiblecustom)
							else
								targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptible)
							end
						elseif E.db.unitframe.units.target.castbar.reverse == false then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptiblecustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptiblecustom)
							else
								targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1noninterruptible, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1noninterruptible)
							end
						end
					end
				elseif (not targetcastbar.notInterruptible) then --can interrupt
					if E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbar then
						targetcastbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
						if E.db.unitframe.units.target.castbar.reverse == true then
							if UnitIsPlayer("target") then
								if E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom)
								elseif E.db.ElvUI_EltreumUI.gradientmode.customcolor and E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(targetclass, true))--unitcustomgradients[targetclass]["r2"], unitcustomgradients[targetclass]["g2"], unitcustomgradients[targetclass]["b2"], unitcustomgradients[targetclass]["r1"], unitcustomgradients[targetclass]["g1"], unitcustomgradients[targetclass]["b1"])
								else
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(targetclass, true))--unitgradients[targetclass]["r2"], unitgradients[targetclass]["g2"], unitgradients[targetclass]["b2"], unitgradients[targetclass]["r1"], unitgradients[targetclass]["g1"], unitgradients[targetclass]["b1"])
								end
							else
								if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom)
								end
							end
						elseif E.db.unitframe.units.target.castbar.reverse == false then
							if UnitIsPlayer("target") then
								if E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom)
								elseif E.db.ElvUI_EltreumUI.gradientmode.customcolor and E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(targetclass))--unitcustomgradients[targetclass]["r1"], unitcustomgradients[targetclass]["g1"], unitcustomgradients[targetclass]["b1"], unitcustomgradients[targetclass]["r2"], unitcustomgradients[targetclass]["g2"], unitcustomgradients[targetclass]["b2"])
								else
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(targetclass))--unitgradients[targetclass]["r1"], unitgradients[targetclass]["g1"], unitgradients[targetclass]["b1"], unitgradients[targetclass]["r2"], unitgradients[targetclass]["g2"], unitgradients[targetclass]["b2"])
								end
							else
								if E.db.ElvUI_EltreumUI.gradientmode.customcolor and not E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom)
								elseif E.db.ElvUI_EltreumUI.gradientmode.customcolor and E.db.ElvUI_EltreumUI.gradientmode.classcolortargetcastbar then
									targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2custom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2custom)
								else
									if reactiontarget >= 5 then
										targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY"))--unitgradients["NPCFRIENDLY"]["r1"], unitgradients["NPCFRIENDLY"]["g1"], unitgradients["NPCFRIENDLY"]["b1"], unitgradients["NPCFRIENDLY"]["r2"], unitgradients["NPCFRIENDLY"]["g2"], unitgradients["NPCFRIENDLY"]["b2"])
									elseif reactiontarget == 4 then
										targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAl"))--unitgradients["NPCNEUTRAL"]["r1"], unitgradients["NPCNEUTRAL"]["g1"], unitgradients["NPCNEUTRAL"]["b1"], unitgradients["NPCNEUTRAL"]["r2"], unitgradients["NPCNEUTRAL"]["g2"], unitgradients["NPCNEUTRAL"]["b2"])
									elseif reactiontarget == 3 then
										targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY"))--unitgradients["NPCUNFRIENDLY"]["r1"], unitgradients["NPCUNFRIENDLY"]["g1"], unitgradients["NPCUNFRIENDLY"]["b1"], unitgradients["NPCUNFRIENDLY"]["r2"], unitgradients["NPCUNFRIENDLY"]["g2"], unitgradients["NPCUNFRIENDLY"]["b2"])
									elseif reactiontarget == 2 or reactiontarget == 1 then
										targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE"))--unitgradients["NPCHOSTILE"]["r1"], unitgradients["NPCHOSTILE"]["g1"], unitgradients["NPCHOSTILE"]["b1"], unitgradients["NPCHOSTILE"]["r2"], unitgradients["NPCHOSTILE"]["g2"], unitgradients["NPCHOSTILE"]["b2"])
									end
								end
							end
						end
					end
				end
			end
		end

	end
end
hooksecurefunc(UF, 'Construct_Castbar', ElvUI_EltreumUI.CastBarTextureGradient)
hooksecurefunc(UF, 'PostCastStart', ElvUI_EltreumUI.CastBarTextureGradient)

--color when interrupted
function ElvUI_EltreumUI:CastBarTextureGradientFail(unit)
	if not unit then return end

	local castbar = _G["ElvUF_Player_CastBar"]
	local targetcastbar = _G["ElvUF_Target_CastBar"]

	if E.db.ElvUI_EltreumUI.UFmodifications then
		if E.db.ElvUI_EltreumUI.gradientmode.enable and (not E.db.ElvUI_EltreumUI.ufcustomtexture.enable) then
			--player
			if E.db.ElvUI_EltreumUI.gradientmode.enableplayercastbarinterrupted and (unit == "player") then
				castbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
				if E.db.unitframe.units.player.castbar.reverse == true then
					if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
						castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1interrupted)
					else
						castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1interrupted)
					end
				else
					if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
						castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2interrupted)
					else
						castbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR1interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG1interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB1interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarR2interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarG2interrupted, E.db.ElvUI_EltreumUI.gradientmode.playercastbarB2interrupted)
					end
				end
			end
			--target
			if UnitExists("target") and E.db.ElvUI_EltreumUI.gradientmode.enabletargetcastbarinterrupted and targetcastbar ~= nil and (unit == "target") then
				targetcastbar:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
				if E.db.unitframe.units.target.castbar.reverse == true then
					if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
						targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1interrupted)
					else
						targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1interrupted)
					end
				else
					if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
						targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2interruptedcustom, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2interrupted)
					else
						targetcastbar:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.orientation, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR1interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG1interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB1interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarR2interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarG2interrupted, E.db.ElvUI_EltreumUI.gradientmode.targetcastbarB2interrupted)
					end
				end
			end
		end
	end
end
hooksecurefunc(UF, 'PostCastFail', ElvUI_EltreumUI.CastBarTextureGradientFail)