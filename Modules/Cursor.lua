local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local pairs = pairs
local SetCVar = SetCVar
local IsAddOnLoaded = IsAddOnLoaded

--This module is a direct merge of CastCursor by michaelsp and as such is available under GNU GPL v3 like the original
--all credits of this module go to michaelsp

local cursorframe = CreateFrame("Frame", "EltreumCastCursor", UIParent, "UIDropDownMenuTemplate")
local UIParent = UIParent
local GetTime = GetTime
local UnitCastingInfo = UnitCastingInfo or CastingInfo
local UnitChannelInfo = UnitChannelInfo or ChannelInfo
local GetSpellCooldown = GetSpellCooldown
local GetCursorPosition = GetCursorPosition
local next, unpack, floor, cos, sin, max, min = next, unpack, floor, cos, sin, max, min
local isRetail = select(4, GetBuildInfo())>=30000

function ElvUI_EltreumUI:CastCursor()
	if E.db.ElvUI_EltreumUI.cursor.enable then
		local classcolors
		classcolors = E:ClassColor(E.myclass, true)


		local Defaults = {
			cast = {
				visible = true,
				radius = 25,
				sublayer = 1,
				thickness = 5,
				color = { classcolors.r, classcolors.g, classcolors.b, 1 },
				texture = [[Interface\addons\ElvUI_EltreumUI\Media\Textures\ring2]],
			},
			gcd = {
				visible = true,
				radius = 20,
				sublayer = 0,
				thickness = 5,
				color = { 0, 0, 0, 1 },
				texture = [[Interface\addons\ElvUI_EltreumUI\Media\Textures\ring2]],
			},
			cursor = {
				visible = true,
				radius = 15,
				sublayer = 0,
				thickness = 5,
				combat = true,
				color = { 1, 1, 1, 1 },
				texture = [[Interface\addons\ElvUI_EltreumUI\Media\Textures\ring2]],
			},
			minimapIcon = { hide = false },
		}

		--====================================================================

		local QUAD_POINTS = {
			{ 'TOPLEFT',     'TOP'    },
			{ 'TOPRIGHT',    'RIGHT'  },
			{ 'BOTTOMRIGHT', 'BOTTOM' },
			{ 'BOTTOMLEFT',  'LEFT'   },
		}

		local QUAD_COORD_FULL = {
			{ 0,0, 0,1, 1,0, 1,1 },
			{ 0,1, 1,1, 0,0, 1,0 },
			{ 1,1, 1,0, 0,1, 0,0 },
			{ 1,0, 0,0, 1,1, 0,1 },
		}

		local QUAD_COORD_FUNC = {
			function(t, r, x1, x2, y1, y2) -- Quadrant1: TOPRIGHT
				t:SetTexCoord(x1,1-y2, x1,1-y1, x2,1-y2, x2,1-y1)
				t:SetSize(x2*r, (1-y1)*r)
			end,
			function(t, r, x1, x2, y1, y2) -- Quadrant2: BOTTOMRIGHT
				t:SetTexCoord(x1,1-y1, x2,1-y1, x1,1-y2, x2,1-y2)
				t:SetSize((1-y1)*r, x2*r)
			end,
			function(t, r, x1, x2, y1, y2) -- Quadrant3: BOTTOMLEFT
				t:SetTexCoord(x2,1-y1, x2,1-y2, x1,1-y1, x1,1-y2)
				t:SetSize(x2*r, (1-y1)*r)
			end,
			function(t, r, x1, x2, y1, y2) -- Quadrant4: TOPLEFT
				t:SetTexCoord(x2,1-y2, x1,1-y2, x2,1-y1, x1,1-y1)
				t:SetSize((1-y1)*r, x2*r)
			end,
		}

		--====================================================================
		-- Utils
		--====================================================================

		function CopyDefaults(src, dst)
			if type(dst)~="table" then dst = {} end
			for k,v in pairs(src) do
				if type(v)=="table" then
					dst[k] = CopyDefaults(v,dst[k])
				elseif dst[k]==nil then
					dst[k] = v
				end
			end
			return dst
		end

		--====================================================================
		-- Root Frame
		--====================================================================

		local rootFrame = CreateFrame("Frame", nil, UIParent)
		rootFrame:SetSize(8,8)
		rootFrame:SetScript("OnUpdate", function(self)
			local x, y = GetCursorPosition()
			local scaleDivisor = UIParent:GetEffectiveScale()
			self:ClearAllPoints()
			self:SetPoint( "CENTER", UIParent, "BOTTOMLEFT", x / scaleDivisor , y / scaleDivisor )
		end )

		local ringsVisible = {}
		local function RingSetShown(self, visible)
			if visible then
				if not next(ringsVisible) then
					rootFrame:Show()
				end
				ringsVisible[self] = true
				self:Show()
			else
				ringsVisible[self] = nil
				if not next(ringsVisible) then
					rootFrame:Hide()
				end
				self:Hide()
			end
		end

		--====================================================================
		-- Shared functions
		--====================================================================

		local function OnEvent(self,event,...)
			self[event](self,event,...)
		end

		local function Start(self, d, m)
			local textures = self.textures
			local quad = min( floor( 4 * (self.reverse and m-d or d)/m ) + 1, 4)
			for i=1,4 do
				local tex = textures[i]
				if i>quad then
					tex:SetTexCoord(0,0,1,1)
					tex:Hide()
				else
					tex:SetTexCoord(unpack(QUAD_COORD_FULL[i]))
					tex:SetSize(self.radius, self.radius)
					tex:Show()
				end
			end
			self.quad = quad
			self.dur  = max(d,0)
			self.max  = m
			RingSetShown(self, true)
		end

		local function Update(self, elapsed)
			local dur = self.dur + elapsed
			if dur>=self.max then RingSetShown(self,false); return end
			self.dur = dur

			local rev    = self.reverse
			local maxdur = self.max
			local radius = self.radius
			local angle  = 360 * ( rev and maxdur-dur or dur ) / maxdur
			local qangle = angle % 90
			local quad   = floor(angle/90) + 1
			local tex    = self.textures[quad]
			local pquad  = self.quad
			if quad~=pquad then
				if pquad>0 and pquad<5 then
					local ptex = self.textures[pquad]
					if rev then
						ptex:Hide()
					else
						ptex:SetTexCoord(unpack(QUAD_COORD_FULL[pquad]))
						ptex:SetSize(radius, radius)
					end
				end
				tex:Show()
				self.quad = quad
			end

			if qangle>0 then
				local f = qangle<=45 and self.factor or 1
				QUAD_COORD_FUNC[quad]( tex, radius, 0, sin(qangle)*f, cos(qangle)*f, 1 )
			end
		end

		local function Setup(frame)
			local cfg     = frame.db
			local radius  = cfg.radius
			local r,g,b,a = unpack(cfg.color)
			frame:SetScale(1)
			frame:SetAlpha(a or 1)
			frame:SetFrameStrata( cfg.background and "BACKGROUND" or "TOOLTIP" )
			frame:ClearAllPoints()
			frame:SetPoint('CENTER', rootFrame, 'CENTER', 0, 0)
			frame:SetSize(radius*2, radius*2)
			frame.textures = frame.textures or {}
			local hide = ( not cursorframe.testmode or not cfg.visible ) and not frame.IsCursor
			for i=1,4 do
				local tex = frame.textures[i] or frame:CreateTexture(nil, "OVERLAY")
				tex:ClearAllPoints()
				tex:SetDrawLayer("OVERLAY", cfg.sublayer or 0)
				tex:SetTexture(cfg.texture or [[Interface\addons\ElvUI_EltreumUI\Media\Textures\ring1.tga]])
				tex:SetVertexColor(r, g, b)
				tex:SetTexCoord(unpack(QUAD_COORD_FULL[i]))
				tex:SetSize(radius, radius)
				tex:SetPoint(QUAD_POINTS[i][1], frame, QUAD_POINTS[i][2])
				if hide then tex:Hide() end
				frame.textures[i] = tex
			end
			frame.quad   = 0
			frame.radius = radius
			frame.factor = (radius-cfg.thickness)/radius
			frame.reverse = cfg.reverse
			if frame.IsCursor then
				if cfg.visible and cfg.combat then
					frame:RegisterEvent('PLAYER_REGEN_ENABLED')
					frame:RegisterEvent('PLAYER_REGEN_DISABLED')
					frame:SetScript("OnEvent", function(self, event) RingSetShown(self,event=='PLAYER_REGEN_DISABLED'); end)
					RingSetShown( frame, InCombatLockdown() )
				else
					frame:UnregisterAllEvents()
					frame:SetScript("OnEvent", nil)
					RingSetShown( frame, cfg.visible )
				end
			elseif not cursorframe.testmode then
				frame:SetScript("OnEvent", cfg.visible and OnEvent or nil)
				frame:SetScript("OnUpdate", Update)
				RingSetShown( frame, false )
			end
			return frame
		end

		--====================================================================
		-- Casting/Channeling Ring
		--====================================================================

		local Cast = CreateFrame("Frame", nil, rootFrame)

		Cast:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
		Cast:RegisterUnitEvent("UNIT_SPELLCAST_DELAYED", "player")
		function Cast:UNIT_SPELLCAST_START(event, unit)
			local name, _, _, start, finish, _, castID = UnitCastingInfo("player")
			if name then
				self.castID = castID
				Start(self, GetTime() - start/1000, (finish - start) / 1000 )
			else
				RingSetShown( self, false )
			end
		end
		Cast.UNIT_SPELLCAST_DELAYED = Cast.UNIT_SPELLCAST_START

		Cast:RegisterUnitEvent("UNIT_SPELLCAST_STOP", "player")
		Cast:RegisterUnitEvent("UNIT_SPELLCAST_FAILED", "player")
		Cast:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
		Cast:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", "player")
		function Cast:UNIT_SPELLCAST_STOP(event, unit, castID)
			if castID == self.castID then
				RingSetShown( self, false )
			end
		end
		Cast.UNIT_SPELLCAST_FAILED = Cast.UNIT_SPELLCAST_STOP
		Cast.UNIT_SPELLCAST_INTERRUPTED = Cast.UNIT_SPELLCAST_STOP
		Cast.UNIT_SPELLCAST_CHANNEL_STOP = Cast.UNIT_SPELLCAST_STOP

		Cast:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", "player")
		Cast:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", "player")
		function Cast:UNIT_SPELLCAST_CHANNEL_START(event, unit)
			local name, _, _, start, finish = UnitChannelInfo("player")
			if name then
				self.castID = nil
				Start(self, GetTime() - start/1000, (finish - start) / 1000 )
			else
				RingSetShown( self, false )
			end
		end
		Cast.UNIT_SPELLCAST_CHANNEL_UPDATE = Cast.UNIT_SPELLCAST_CHANNEL_START

		--====================================================================
		-- GCD Ring
		--====================================================================

		local GCD = CreateFrame("Frame", nil, rootFrame)

		GCD:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
		GCD:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
		function GCD:UNIT_SPELLCAST_START(event, unit, guid, spellID)
			local start, duration = GetSpellCooldown( isRetail and 61304 or spellID )
			if duration>0 and (isRetail or duration<=1.51) then
				Start(self, GetTime() - start, duration )
			end
		end
		GCD.UNIT_SPELLCAST_SUCCEEDED = GCD.UNIT_SPELLCAST_START

		GCD:RegisterUnitEvent("UNIT_SPELLCAST_STOP", "player")
		GCD:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
		function GCD:UNIT_SPELLCAST_STOP(event, unit, castID)
			RingSetShown( self, false )
		end
		GCD.UNIT_SPELLCAST_INTERRUPTED = GCD.UNIT_SPELLCAST_STOP

		--====================================================================
		-- Cursor Ring
		--====================================================================

		local Cursor = CreateFrame("Frame", nil, rootFrame)
		Cursor.IsCursor = true
		Cursor:Hide()

		--====================================================================
		-- Run
		--====================================================================

		cursorframe:RegisterEvent("ADDON_LOADED")
		cursorframe:SetScript("OnEvent", function(self, event, name)
			CastCursorDB = CopyDefaults(Defaults, CastCursorDB)
			self:UnregisterEvent("ADDON_LOADED")
			self:SetScript("OnEvent", nil)
			self:SetPoint("Center", UIParent, "Center")
			self:Hide()
			self.db       = CastCursorDB
			Cursor.db     = self.db.cursor
			Cast.db       = self.db.cast
			GCD.db        = self.db.gcd
			self.Start    = Start
			self.Update   = Update
			self.Setup    = Setup
			self.Defaults = Defaults
			self.rings    = { cast = Cast, gcd = GCD, cursor = Cursor }
			Setup(Cursor)
			Setup(Cast)
			Setup(GCD)
		end )
	end
end
