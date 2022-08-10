local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local NP = E:GetModule('NamePlates')
local _G = _G
local hooksecurefunc = _G.hooksecurefunc

--gradient nameplates
local function GradientNameplates(unit, status)
	print(unit.colorTapping)
	if type(status) == "number" then
		print(unit.isTank,unit.offTank,status)
	end
	if E.db.ElvUI_EltreumUI.gradientmode.npenable then
		if unit and unit.Health then
			local _, className = UnitClass(unit.unit)
			local name, realm = UnitName(unit.unit)
			local player = UnitIsPlayer(unit.unit)
			local reaction =  UnitReaction(unit.unit, "player")
			local targettype
			if reaction ~= nil and reaction >= 5 then
				targettype = "NPCFRIENDLY"
			elseif reaction ~= nil and reaction == 4 then
				targettype = "NPCNEUTRAL"
			elseif reaction ~= nil and reaction == 3 then
				targettype = "NPCUNFRIENDLY"
			elseif reaction ~= nil and reaction <= 2 then
				targettype = "NPCHOSTILE"
			end
			if className and player then
				if E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor then
					unit.Health:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.nporientation, ElvUI_EltreumUI:GradientColorsCustom(className))
				else
					unit.Health:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.nporientation, ElvUI_EltreumUI:GradientColors(className))
				end
			elseif reaction ~= nil then
				if UnitIsTapDenied(unit.unit) then
					return
				elseif E.db.ElvUI_EltreumUI.gradientmode.npcustomcolor then
					unit.Health:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.nporientation, ElvUI_EltreumUI:GradientColorsCustom(targettype, false, false))
				else
					unit.Health:GetStatusBarTexture():SetGradient(E.db.ElvUI_EltreumUI.gradientmode.nporientation, ElvUI_EltreumUI:GradientColors(targettype, false, false))
				end
			end
		end
	end
end
hooksecurefunc(NP, "Health_UpdateColor", GradientNameplates)


local function Threat(unit, _, status) --(unit,nameplate,status)
	if status ~= nil and type(status) == "number" then
		GradientNameplates(unit, status)
	end
	if E.db.ElvUI_EltreumUI.gradientmode.npenable then
		if unit and unit.Health then
			print("---------------------")
			--print(unit.isTank,unit.offTank,status, unit.colors.badTransition, status,status2,status3,status4)
			if status ~= nil and status == 3 then
				print("3")
			elseif status ~= nil and status == 2 then
				print("2")
			elseif status ~= nil and status == 1 then
				print("1")
			elseif status ~= nil and status == 0 then
				print("0")
			end
		end
	end
end
hooksecurefunc(NP, "ThreatIndicator_PostUpdate", Threat)
