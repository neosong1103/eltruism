local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local UF = E:GetModule('UnitFrames')
local _G = _G
local hooksecurefunc = _G.hooksecurefunc
local UnitExists = _G.UnitExists
local UnitClass = _G.UnitClass
local UnitReaction = _G.UnitReaction
local UnitIsPlayer = _G.UnitIsPlayer
local tostring = _G.tostring
local select = _G.select
local UnitIsTapDenied = _G.UnitIsTapDenied
local UnitPlayerControlled = _G.UnitPlayerControlled

--set the textures or gradients
local truer = 0
local trueg = 0
local trueb = 0
local trueclass
local _, unit1class
local r,g,b

function ElvUI_EltreumUI:ApplyUnitGradientTexture(unit,name,uf)
	local _, classunit = UnitClass(unit)
	local namebar = E.LSM:Fetch("statusbar", "Eltreum-Blank")
	local reaction = UnitReaction(unit, "player")
	if UnitExists(unit) then
		if UnitIsPlayer(unit) then
			if classunit then
				namebar = ElvUI_EltreumUI:UnitframeClassTexture(classunit)
			end
		elseif not UnitIsPlayer(unit) then
			if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
				namebar = ElvUI_EltreumUI:UnitframeClassTexture("TAPPED")
			else
				if reaction and reaction >= 5 then
					namebar = ElvUI_EltreumUI:UnitframeClassTexture("NPCFRIENDLY")
				elseif reaction and reaction == 4 then
					namebar = ElvUI_EltreumUI:UnitframeClassTexture("NPCNEUTRAL")
				elseif reaction and reaction == 3 then
					namebar = ElvUI_EltreumUI:UnitframeClassTexture("NPCUNFRIENDLY")
				elseif reaction and reaction <= 2 then
					namebar = ElvUI_EltreumUI:UnitframeClassTexture("NPCHOSTILE")
				end
			end
		end
	end
	--if UF["units"][uf] and UnitExists(unit) then
	if E.db["unitframe"]["units"][uf] and UnitExists(unit) then
		local unitframe = _G["ElvUF_"..name]
		if unitframe and unitframe.Health then
			unitframe.Health:SetOrientation(E.db.ElvUI_EltreumUI.UForientation)
			if E.db.ElvUI_EltreumUI.ufcustomtexture.enable then
				if UnitIsPlayer(unit) then
					if E.db.ElvUI_EltreumUI.ufcustomtexture.classdetect then
						unitframe.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom(classunit))
					else
						unitframe.Health:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db["ElvUI_EltreumUI"]["ufcustomtexture"][unit.."texture"]))
					end
				elseif not UnitIsPlayer(unit) then
					if E.db.ElvUI_EltreumUI.ufcustomtexture.classdetect then
						if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
							unitframe.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom("TAPPED"))
						else
							if reaction and reaction >= 5 then
								unitframe.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom("NPCFRIENDLY"))
							elseif reaction and reaction == 4 then
								unitframe.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom("NPCNEUTRAL"))
							elseif reaction and reaction == 3 then
								unitframe.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom("NPCUNFRIENDLY"))
							elseif reaction and reaction <= 2 then
								unitframe.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom("NPCHOSTILE"))
							end
						end
					else
						unitframe.Health:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db["ElvUI_EltreumUI"]["ufcustomtexture"][unit.."texture"]))
					end
				end
			end
			if E.db.ElvUI_EltreumUI.gradientmode.enable and UnitIsPlayer(unit) and E.db["ElvUI_EltreumUI"]["gradientmode"]["enable"..unit] then
				if E.db.ElvUI_EltreumUI.lightmode then
					unitframe.Health:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
					if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
						if E.db.ElvUI_EltreumUI.gradientmode.orientation == "HORIZONTAL" then
							if unit == "target" then
								unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(classunit, true, true))
							else
								unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(classunit, false, true))
							end
						else
							unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, false, true))
						end
					else
						if E.db.ElvUI_EltreumUI.gradientmode.orientation == "HORIZONTAL" then
							if unit == "target" then
								unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, true, true))
							else
								unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, false, true))
							end
						else
							unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, false, true))
						end
					end
				elseif E.db.ElvUI_EltreumUI.darkmode then
					unitframe.Health.backdropTex:SetTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
					if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
						if E.db.ElvUI_EltreumUI.gradientmode.orientation == "HORIZONTAL" then
							if unit == "target" then
								unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(classunit, true, true))
							else
								unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(classunit, false, true))
							end
						else
							unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(classunit, false, true))
						end
					else
						if E.db.ElvUI_EltreumUI.gradientmode.orientation == "HORIZONTAL" then
							if unit == "target" then
								unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, true, true))
							else
								unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, false, true))
							end
						else
							unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(classunit, false, true))
						end
					end
				end
			elseif E.db.ElvUI_EltreumUI.gradientmode.enable and (not UnitIsPlayer(unit)) and E.db["ElvUI_EltreumUI"]["gradientmode"]["enable"..unit] then
				if E.db.ElvUI_EltreumUI.lightmode then
					unitframe.Health:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
					if E.db.ElvUI_EltreumUI.gradientmode.orientation == "HORIZONTAL" then
						if unit == "target" then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("TAPPED", true, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY", true, true))
									elseif reaction and reaction == 4 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAL", true, true))
									elseif reaction and reaction == 3 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY", true, true))
									elseif reaction and reaction <= 2 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE", true, true))
									end
								end
							else
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("TAPPED", true, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCFRIENDLY", true, true))
									elseif reaction and reaction == 4 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCNEUTRAL", true, true))
									elseif reaction and reaction == 3 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCUNFRIENDLY", true, true))
									elseif reaction and reaction <= 2 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCHOSTILE", true, true))
									end
								end
							end
						else
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("TAPPED", false, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY", false, true))
									elseif reaction and reaction == 4 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAL", false, true))
									elseif reaction and reaction == 3 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY", false, true))
									elseif reaction and reaction <= 2 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE", false, true))
									end
								end
							else
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("TAPPED", false, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCFRIENDLY", false, true))
									elseif reaction and reaction == 4 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCNEUTRAL", false, true))
									elseif reaction and reaction == 3 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCUNFRIENDLY", false, true))
									elseif reaction and reaction <= 2 then
										unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCHOSTILE", false, true))
									end
								end
							end
						end
					else
						if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
							if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
								unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("TAPPED", false, true))
							else
								if reaction and reaction >= 5 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY", false, true))
								elseif reaction and reaction == 4 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAL", false, true))
								elseif reaction and reaction == 3 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY", false, true))
								elseif reaction and reaction <= 2 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE", false, true))
								end
							end
						else
							if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
								unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("TAPPED", false, true))
							else
								if reaction and reaction >= 5 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCFRIENDLY", false, true))
								elseif reaction and reaction == 4 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCNEUTRAL", false, true))
								elseif reaction and reaction == 3 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCUNFRIENDLY", false, true))
								elseif reaction and reaction <= 2 then
									unitframe.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCHOSTILE", false, true))
								end
							end
						end
					end
				elseif E.db.ElvUI_EltreumUI.darkmode then
					unitframe.Health.backdropTex:SetTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
					if E.db.ElvUI_EltreumUI.gradientmode.orientation == "HORIZONTAL" then
						if unit == "target" then
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("TAPPED", true, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY", true, true))
									elseif reaction and reaction == 4 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAL", true, true))
									elseif reaction and reaction == 3 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY", true, true))
									elseif reaction and reaction == 2 or reaction == 1 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE", true, true))
									end
								end
							else
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("TAPPED", true, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCFRIENDLY", true, true))
									elseif reaction and reaction == 4 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCNEUTRAL", true, true))
									elseif reaction and reaction == 3 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCUNFRIENDLY", true, true))
									elseif reaction and reaction == 2 or reaction == 1 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation,ElvUI_EltreumUI:GradientColors("NPCHOSTILE", true, true))
									end
								end
							end
						else
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("TAPPED", false, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY", false, true))
									elseif reaction and reaction == 4 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAL", false, true))
									elseif reaction and reaction == 3 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY", false, true))
									elseif reaction and reaction == 2 or reaction == 1 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE", false, true))
									end
								end
							else
								if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("TAPPED", false, true))
								else
									if reaction and reaction >= 5 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCFRIENDLY", false, true))
									elseif reaction and reaction == 4 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCNEUTRAL", false, true))
									elseif reaction and reaction == 3 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCUNFRIENDLY", false, true))
									elseif reaction and reaction == 2 or reaction == 1 then
										unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation,ElvUI_EltreumUI:GradientColors("NPCHOSTILE", false, true))
									end
								end
							end
						end
					else
						if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
							if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
								unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("TAPPED", false, true))
							else
								if reaction and reaction >= 5 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCFRIENDLY", false, true))
								elseif reaction and reaction == 4 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCNEUTRAL", false, true))
								elseif reaction and reaction == 3 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCUNFRIENDLY", false, true))
								elseif reaction and reaction == 2 or reaction == 1 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom("NPCHOSTILE", false, true))
								end
							end
						else
							if UnitIsTapDenied(unit) and not UnitPlayerControlled(unit) then
								unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("TAPPED", false, true))
							else
								if reaction and reaction >= 5 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCFRIENDLY", false, true))
								elseif reaction and reaction == 4 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCNEUTRAL", false, true))
								elseif reaction and reaction == 3 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCUNFRIENDLY", false, true))
								elseif reaction and reaction == 2 or reaction == 1 then
									unitframe.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors("NPCHOSTILE", false, true))
								end
							end
						end
					end
				end
			else
				if E.db.ElvUI_EltreumUI.lightmode and not E.db.ElvUI_EltreumUI.ufcustomtexture.enable and not E.db.ElvUI_EltreumUI.gradientmode.enable and not E.db.ElvUI_EltreumUI.ufcustomtexture.classdetect then
					unitframe.Health:SetStatusBarTexture(namebar)
				end
			end
		end
	end
end

function ElvUI_EltreumUI:GradientCustomTexture(unit)
	if E.private.unitframe.enable and E.db.ElvUI_EltreumUI.UFmodifications then

		--main issue = the toggle for some units like boss and arena wont work bc it checks for boss1,boss2... instead of just boss
		ElvUI_EltreumUI:ApplyUnitGradientTexture("player", "Player","player")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("target", "Target","target")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("targettarget", "TargetTarget","targettarget")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("targettargettarget", "TargetTargetTarget","targetargettarget")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("focus", "Focus","focus")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("pet", "Pet","pet")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("arena1", "Arena1","arena")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("arena2", "Arena2","arena")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("arena3", "Arena3","arena")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("arena4", "Arena4","arena")
		ElvUI_EltreumUI:ApplyUnitGradientTexture("arena5", "Arena5","arena")
		if E.Retail then
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss1", "Boss1","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss2", "Boss2","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss3", "Boss3","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss4", "Boss4","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss5", "Boss5","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss6", "Boss6","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss7", "Boss7","boss")
			ElvUI_EltreumUI:ApplyUnitGradientTexture("boss8", "Boss8","boss")
		end

		--group/raid unitframes
		if UnitExists(unit) and (E.db.ElvUI_EltreumUI.lightmode or E.db.ElvUI_EltreumUI.darkmode) then

			local headergroup = nil
			if _G["ElvUF_Raid"] and _G["ElvUF_Raid"]:IsShown() then
				headergroup = _G["ElvUF_Raid"]
			elseif _G["ElvUF_Raid40"] and _G["ElvUF_Raid40"]:IsShown() then
				headergroup = _G["ElvUF_Raid40"]
			elseif _G["ElvUF_Party"] and _G["ElvUF_Party"]:IsShown() then
				headergroup = _G["ElvUF_Party"]
			end

			local headertank = nil
			if _G["ElvUF_Tank"] and _G["ElvUF_Tank"]:IsShown() then
				headertank = _G["ElvUF_Tank"]
			end

			local headerassist = nil
			if _G["ElvUF_Assist"] and _G["ElvUF_Assist"]:IsShown() then
				headerassist = _G["ElvUF_Assist"]
			end

			_, unit1class = UnitClass(unit)
			if not unit1class then
				return
			end

			if E.db.ElvUI_EltreumUI.lightmode then
				if E. Retail then
					if unit1class == 'WARRIOR' then
						truer = 0.77646887302399
						trueg = 0.60784178972244
						trueb = 0.4274500310421
						trueclass = "WARRIOR"
					elseif unit1class == 'PALADIN' then
						truer = 0.95686066150665
						trueg = 0.54901838302612
						trueb = 0.72941017150879
						trueclass = "PALADIN"
					elseif unit1class == 'HUNTER' then
						truer = 0.66666519641876
						trueg = 0.82744914293289
						trueb = 0.44705784320831
						trueclass = "HUNTER"
					elseif unit1class == 'ROGUE' then
						truer = 0.99999779462814
						trueg = 0.95686066150665
						trueb = 0.40784224867821
						trueclass = "ROGUE"
					elseif unit1class == 'PRIEST' and E.db.ElvUI_EltreumUI.gradientmode.enable then --priest ruins everything gradient
						trueclass = "PRIEST"
						return
					elseif unit1class == 'PRIEST' and not E.db.ElvUI_EltreumUI.gradientmode.enable then
						truer = 0.99999779462814
						trueg = 0.99999779462814
						trueb = 0.99999779462814
						trueclass = "PRIEST"
					elseif unit1class == 'DEATHKNIGHT' then
						truer = 0.76862573623657
						trueg = 0.11764679849148
						trueb = 0.2274504750967
						trueclass = "DEATHKNIGHT"
					elseif unit1class == 'SHAMAN' then
						truer = 0
						trueg = 0.4392147064209
						trueb = 0.86666476726532
						trueclass = "SHAMAN"
					elseif unit1class == 'MAGE' then
						truer = 0.24705828726292
						trueg = 0.78039044141769
						trueb = 0.92156660556793
						trueclass = "MAGE"
					elseif unit1class == 'WARLOCK' then
						truer = 0.52941060066223
						trueg = 0.53333216905594
						trueb = 0.93333131074905
						trueclass = "WARLOCK"
					elseif unit1class == 'MONK' then
						truer = 0
						trueg = 0.99999779462814
						trueb = 0.59607714414597
						trueclass = "MONK"
					elseif unit1class == 'DRUID' then
						truer = 0.99999779462814
						trueg = 0.48627343773842
						trueb = 0.039215601980686
						trueclass = "DRUID"
					elseif unit1class == 'DEMONHUNTER' then
						truer = 0.63921427726746
						trueg = 0.1882348805666
						trueb = 0.78823357820511
						trueclass = "DEMONHUNTER"
					end
				elseif E.Wrath or E.TBC or E.Classic then
					if unit1class == 'WARRIOR' then
						truer = 0.78039044141769
						trueg = 0.61176335811615
						trueb = 0.43137159943581
						trueclass = "WARRIOR"
					elseif unit1class == 'PALADIN' then
						truer = 0.96078222990036
						trueg = 0.54901838302612
						trueb = 0.72941017150879
						trueclass = "PALADIN"
					elseif unit1class == 'HUNTER' then
						truer = 0.67058676481247
						trueg = 0.8313707113266
						trueb = 0.45097941160202
						trueclass = "HUNTER"
					elseif unit1class == 'ROGUE' then
						truer = 0.99999779462814
						trueg = 0.96078222990036
						trueb = 0.41176378726959
						trueclass = "ROGUE"
					elseif unit1class == 'PRIEST' and E.db.ElvUI_EltreumUI.gradientmode.enable then --priest ruins everything gradient
						trueclass = "PRIEST"
						return
					elseif unit1class == 'PRIEST' and not E.db.ElvUI_EltreumUI.gradientmode.enable then
						truer = 0.99999779462814
						trueg = 0.99999779462814
						trueb = 0.99999779462814
						trueclass = "PRIEST"
					elseif unit1class == 'DEATHKNIGHT' then
						truer = 0.76862573623657
						trueg = 0.1215683594346
						trueb = 0.23137204349041
						trueclass = "DEATHKNIGHT"
					elseif unit1class == 'SHAMAN' and (E.Wrath or E.TBC) then
						truer = 0
						trueg = 0.4392147064209
						trueb = 0.87058633565903
						trueclass = "SHAMAN"
					elseif unit1class == 'SHAMAN' and E.Classic then
						truer = 0.96078222990036
						trueg = 0.54901838302612
						trueb = 0.72941017150879
						trueclass = "SHAMAN"
					elseif unit1class == 'MAGE' then
						truer = 0.25097984075546
						trueg = 0.78039044141769
						trueb = 0.92156660556793
						trueclass = "MAGE"
					elseif unit1class == 'WARLOCK' then
						truer = 0.52941060066223
						trueg = 0.52941060066223
						trueb = 0.92940974235535
						trueclass = "WARLOCK"
					elseif unit1class == 'DRUID' then
						truer = 0.99999779462814
						trueg = 0.49019500613213
						trueb = 0.039215601980686
						trueclass = "DRUID"
					end
				end
			elseif E.db.ElvUI_EltreumUI.darkmode then
				if E. Retail then
					if unit1class == 'WARRIOR' then
						truer = 0.58039087057114
						trueg = 0.45490095019341
						trueb = 0.32156792283058
						trueclass = "WARRIOR"
					elseif unit1class == 'PALADIN' then
						truer = 0.71764546632767
						trueg = 0.41176378726959
						trueb = 0.54509681463242
						trueclass = "PALADIN"
					elseif unit1class == 'HUNTER' then
						truer = 0.49803811311722
						trueg = 0.61960649490356
						trueb = 0.33333259820938
						trueclass = "HUNTER"
					elseif unit1class == 'ROGUE' then
						truer = 0.74901795387268
						trueg = 0.71764546632767
						trueb = 0.30588167905807
						trueclass = "ROGUE"
					elseif unit1class == 'PRIEST' then
						truer = 0.74901795387268
						trueg = 0.74901795387268
						trueb = 0.74901795387268
						trueclass = "PRIEST"
					elseif unit1class == 'DEATHKNIGHT' then
						truer = 0.57646930217743
						trueg = 0.086274318397045
						trueb = 0.16862708330154
						trueclass = "DEATHKNIGHT"
					elseif unit1class == 'SHAMAN' then
						truer = 0
						trueg = 0.32941102981567
						trueb = 0.65097898244858
						trueclass = "SHAMAN"
					elseif unit1class == 'MAGE' then
						truer = 0.18431332707405
						trueg = 0.58431243896484
						trueb = 0.69019454717636
						trueclass = "MAGE"
					elseif unit1class == 'WARLOCK' then
						truer = 0.39607757329941
						trueg = 0.39999911189079
						trueb = 0.69803768396378
						trueclass = "WARLOCK"
					elseif unit1class == 'MONK' then
						truer = 0
						trueg = 0.74901795387268
						trueb = 0.44705784320831
						trueclass = "MONK"
					elseif unit1class == 'DRUID' then
						truer = 0.74901795387268
						trueg = 0.36470508575439
						trueb = 0.027450919151306
						trueclass = "DRUID"
					elseif unit1class == 'DEMONHUNTER' then
						truer = 0.47843033075333
						trueg = 0.14117616415024
						trueb = 0.59215557575226
						trueclass = "DEMONHUNTER"
					end
				elseif E.Wrath or E.TBC or E.Classic then
					if unit1class == 'WARRIOR' then
						truer = 0.58431243896484
						trueg = 0.45882251858711
						trueb = 0.32156792283058
						trueclass = "WARRIOR"
					elseif unit1class == 'PALADIN' then
						truer = 0.72156703472137
						trueg = 0.41176378726959
						trueb = 0.54901838302612
						trueclass = "PALADIN"
					elseif unit1class == 'HUNTER' then
						truer = 0.50195968151093
						trueg = 0.62352806329727
						trueb = 0.33725416660309
						trueclass = "HUNTER"
					elseif unit1class == 'ROGUE' then
						truer = 0.74901795387268
						trueg = 0.72156703472137
						trueb = 0.30588167905807
						trueclass = "ROGUE"
					elseif unit1class == 'PRIEST' then
						truer = 0.74901795387268
						trueg = 0.74901795387268
						trueb = 0.74901795387268
						trueclass = "PRIEST"
					elseif unit1class == 'DEATHKNIGHT' then
						truer = 0.57646930217743
						trueg = 0.090195879340172
						trueb = 0.17254863679409
						trueclass = "DEMONHUNTER"
					elseif unit1class == 'SHAMAN' and (E.Wrath or E.TBC) then
						truer = 0
						trueg = 0.32941102981567
						trueb = 0.65097898244858
						trueclass = "SHAMAN"
					elseif unit1class == 'SHAMAN' and E.Classic then
						truer = 0.72156703472137
						trueg = 0.41176378726959
						trueb = 0.54901838302612
						trueclass = "SHAMAN"
					elseif unit1class == 'MAGE' then
						truer = 0.1882348805666
						trueg = 0.58431243896484
						trueb = 0.69019454717636
						trueclass = "MAGE"
					elseif unit1class == 'WARLOCK' then
						truer = 0.39607757329941
						trueg = 0.39607757329941
						trueb = 0.69803768396378
						trueclass = "WARLOCK"
					elseif unit1class == 'DRUID' then
						truer = 0.74901795387268
						trueg = 0.3686266541481
						trueb = 0.031372480094433
						trueclass = "DRUID"
					end
				end
			end

			local function ApplyGroupGradientTexture(r, g, b, button)
				button.Health:SetOrientation(E.db.ElvUI_EltreumUI.UForientation)
				if tostring(r) == tostring(truer) and tostring(g) == tostring(trueg) and tostring(b) == tostring(trueb) then
					if E.db.ElvUI_EltreumUI.gradientmode.enable and E.db.ElvUI_EltreumUI.gradientmode.enablegroupunits then
						if E.db.ElvUI_EltreumUI.lightmode then
							button.Health:SetStatusBarTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								button.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(trueclass, false, true))
							else
								button.Health:GetStatusBarTexture():SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(trueclass, false, true))
							end
						elseif E.db.ElvUI_EltreumUI.darkmode and button.Health.backdropTex then
							button.Health.backdropTex:SetTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.gradientmode.texture))
							if E.db.ElvUI_EltreumUI.gradientmode.customcolor then
								button.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColorsCustom(trueclass, false, true))
							else
								button.Health.backdropTex:SetGradientAlpha(E.db.ElvUI_EltreumUI.gradientmode.orientation, ElvUI_EltreumUI:GradientColors(trueclass, false, true))
							end
						end
					elseif not E.db.ElvUI_EltreumUI.gradientmode.enable then
						if E.db.ElvUI_EltreumUI.lightmode then
							if E.db.ElvUI_EltreumUI.ufcustomtexture.enable then
								button.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom(trueclass))
							else
								button.Health:SetStatusBarTexture(ElvUI_EltreumUI:UnitframeClassTexture(trueclass))
							end
						elseif E.db.ElvUI_EltreumUI.darkmode then
							if E.db.ElvUI_EltreumUI.ufcustomtexture.enable and button.Health.backdropTex then
								button.Health.backdropTex:SetTexture(ElvUI_EltreumUI:UnitframeClassTextureCustom(trueclass))
							end
						end
					end
				end
			end

			if headergroup ~= nil then
				for i = 1, headergroup:GetNumChildren() do
					local group = select(i, headergroup:GetChildren())
					for j = 1, group:GetNumChildren() do
						local groupbutton = select(j, group:GetChildren())
						if groupbutton and groupbutton.Health then
							if E.db.ElvUI_EltreumUI.lightmode then
								r,g,b = groupbutton.Health:GetStatusBarColor()
							elseif E.db.ElvUI_EltreumUI.darkmode and groupbutton.Health.backdropTex then
								r,g,b = groupbutton.Health.backdropTex:GetVertexColor()
							end
							ApplyGroupGradientTexture(r, g, b, groupbutton)
						end
					end
				end
			end

			if headertank ~= nil then
				for i = 1, headertank:GetNumChildren() do
					local tankbutton = select(i, headertank:GetChildren())
					if tankbutton and tankbutton.Health then
						local r1,g1,b1
						if E.db.ElvUI_EltreumUI.lightmode then
							r,g,b = tankbutton.Health:GetStatusBarColor()
						elseif E.db.ElvUI_EltreumUI.darkmode and tankbutton.Health.backdropTex then
							r,g,b = tankbutton.Health.backdropTex:GetVertexColor()
						end
						ApplyGroupGradientTexture(r, g, b, tankbutton)
					end
				end
			end

			if headerassist ~= nil then
				for i = 1, headerassist:GetNumChildren() do
					local assistbutton = select(i, headerassist:GetChildren())
					if assistbutton and assistbutton.Health then
						local r1,g1,b1
						if E.db.ElvUI_EltreumUI.lightmode then
							r,g,b = assistbutton.Health:GetStatusBarColor()
						elseif E.db.ElvUI_EltreumUI.darkmode and assistbutton.Health.backdropTex then
							r,g,b = assistbutton.Health.backdropTex:GetVertexColor()
						end
						ApplyGroupGradientTexture(r, g, b, assistbutton)
					end
				end
			end
		end

	end
end
hooksecurefunc(UF, "Style", ElvUI_EltreumUI.GradientCustomTexture) --if not hooking into this then when the target of target changes it doesnt update
hooksecurefunc(UF, "PostUpdateHealthColor", ElvUI_EltreumUI.GradientCustomTexture)

--Unitframe Backdrop Texture/Alpha
function ElvUI_EltreumUI:BackdropTexture(isTransparent, statusBar, backdropTex, adjustBackdropPoints, invertColors, reverseFill)
	if E.private.unitframe.enable and E.db.ElvUI_EltreumUI.UFmodifications then
		if backdropTex and not E.db.ElvUI_EltreumUI.ufcustomtexture.backdrophidden then
			backdropTex:SetTexture(E.LSM:Fetch("statusbar", E.db.ElvUI_EltreumUI.ufcustomtexture.backdroptexture))
			backdropTex:SetAlpha(E.db.ElvUI_EltreumUI.ufcustomtexture.backdropalpha)
			if statusBar and statusBar.backdrop and statusBar:GetName():match("HealthBar") then
				statusBar.backdrop:SetBackdropColor(0,0,0,E.db.ElvUI_EltreumUI.ufcustomtexture.backdropalpha)
			end
		end
		if E.db.ElvUI_EltreumUI.ufcustomtexture.backdrophidden then
			if E.db.ElvUI_EltreumUI.lightmode then
				if backdropTex then
					backdropTex:SetAlpha(0)
				end
			end
			if statusBar and statusBar.backdrop and statusBar:GetName():match("Health") then
				statusBar.backdrop:Hide()
			end
		end

		--darkmode/backdrop things for vertical
		if E.db.ElvUI_EltreumUI.UForientation == "VERTICAL" and statusBar:GetName():match("Health") and E.db.ElvUI_EltreumUI.darkmode then
			local orientation = "VERTICAL"
			local barTexture = statusBar:GetStatusBarTexture() -- This fixes Center Pixel offset problem (normally this has > 2 points)
			--statusBar.backdrop:Hide()
			barTexture:SetInside(nil, 0, 0) -- This also unsnaps the texture
			UF:HandleStatusBarTemplate(statusBar, statusBar:GetParent(), isTransparent)
			if isTransparent then
				--statusBar:SetStatusBarTexture(0, 0, 0, 0)
				UF:Update_StatusBar(statusBar.bg or statusBar.BG, E.media.blankTex)
				UF:SetStatusBarBackdropPoints(statusBar, barTexture, backdropTex, orientation, reverseFill)
			else
				local texture = E.LSM:Fetch('statusbar', self.db.statusbar)
				statusBar:SetStatusBarTexture(texture)
				UF:Update_StatusBar(statusBar.bg or statusBar.BG, texture)
				if adjustBackdropPoints then
					UF:SetStatusBarBackdropPoints(statusBar, barTexture, backdropTex, orientation, reverseFill)
				end
			end
		end
	end
end
hooksecurefunc(UF, 'ToggleTransparentStatusBar', ElvUI_EltreumUI.BackdropTexture)
