local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))

-- Eltreum UI Profile DB
P.ElvUI_EltreumUI = {

	dev = false,

	nameplatepower = {
		autoadjustposition = false,
		modeleffect = false,
		sizex = 131.8,
		sizey = 6,
		posy = 16,
		texture = "Eltreum-Elvui-Norm",
		font = "Kimberley",
		fontsize = 10,
		r = 0,
		g = 0,
		b = 0,
	},

	chat = {
		enable = false,
		leftmouseover = false,
		rightmouseover = false,
		leftfader = false,
		rightfader = false,
		leftcombathide = false,
		rightcombathide = false,
		invertclick = false,
		colorsysmsg = false,
		rollsound = false,
		looticons = false,
		itemlevels = false,
	},

	cvars = {
		nameplateOtherBottomInset = 0.02,
		nameplateOtherTopInset = 0.1,
		cameraFOV = 90,
		cameraDistanceMaxZoomFactor = 2.6,
		nameplateTargetRadialPosition = 1,
		--for retail
		showInGameNavigation = 1,
		--for tbc/classic
		clampTargetNameplateToScreen = 1,
		autohidenpcname = false,
	},

	skins = {
		enable = false,
		widertransmog = false,
		expandedstable = false,
		characterpanelscale = 1,
		classiconsoncharacterpanel = false,
		classiconsblizz = false,
		classiconsreleaf = false,
		classicarmory = false,
		classicarmoryautostats = false,
		ilvls = false,
		ilvlsinspect = true,
		sockets = false,
		socketsinspect = false,
		ilvlanchor = "CENTER",
		ilvlfontsize = 16,
		ilvlfontweight = "THICKOUTLINE",
		expandarmorybg = false,
		itemquality = false,
		armorybgtype = "CLASS",
		armoryvignette = true,
		armoryvignettealpha = 1,
		expandarmorybgalpha = 0.3,
		expandarmorycrest = false,
		statcolors = false,
		bossemote = false,
		quests = false,
		queststatusbartexture = "Asphyxia-Norm",
		questswowhead = false,
		professions = false,
		zones = false,
		shadows = false,
		meetinghorn = false,
		hideABkeypress = false,
	},

	shadows = {
		raid = true,
		aura = false,
		ufaura = false,
		actionbars = false,
		nameplates = false, --healthbars
		npauras = false,
		npportraits = false,
		nppower = false,
		npcastbar = false,
	},

	tbctalents = {
		enable = false,
	},

	dynamicdatatext = {
		enable = false,
	},

	nameplatelevel = {
		enable = false,
	},

	cursor = {
		enable = false,
		ring = 'Interface\\addons\\ElvUI_EltreumUI\\Media\\Textures\\Cursor\\ring3.tga',
		size = '-1',
		cooldown = false,
		cooldownsound = false,
		cooldownfile = "! - Metal Gear Solid",
		petcooldown = false,
		fixlag = 1,
		combat = true,
	},

	cursorcast = {
		radius = 25,
		sublayer = 1,
		thickness = 5,
		classcolor = true,
		r = 0.27,
		g = 0.50,
		b = 0.70,
		a = 1,
	},

	cursorgcd = {
		radius = 20,
		sublayer = 0,
		thickness = 5,
		classcolor = false,
		r = 1,
		g = 1,
		b = 1,
		a = 1,
	},

	cursorcursor = {
		radius = 15,
		sublayer = 0,
		thickness = 5,
		combat = true,
		classcolor = false,
		r = 0.5,
		g = 0.5,
		b = 0.5,
		a = 1,
	},

	nameplateOptions = {
		ClassColorGlow = false,
		ClassBorderNameplate = false,
		nameplatetexture = false,
		classbarautohide = false,
		targetclasstexture = false,
		enableHealthHeight = false,
		outofcombatHeight = 4,
		incombatHeight = 14,
		useelvuinpheight = false,
		targetmodel = false,
		CamDistanceScale = 2,
		ViewTranslationx = 0,
		ViewTranslationy = 0,
		Rotation = 0,
		modelalpha = 0.5,
		desaturation = 0,
		paused = false,
		restedoverlap = false,
		hideSwipe = false,
	},

	stealthOptions = {
		stealtheffect = false,
	},

	glow = {
		enable = false,
		enablepet = false,
		enabletotem = false,
		blizzard = false,
		pixel = false,
		autocast = false,
		totemtypecolor = true,
		totem1 = true,
		totem2 = true,
		totem3 = true,
		totem4 = true,
		colorclass = true,
		colorclasspet = true,
		colorclassnp = true,
		numberdebuff = 4,
		numberpixel = 9,
		frequencypixel = 1,
		lengthpixel = 3,
		thicknesspixel = 5,
		pixelxOffset = 5,
		pixelyOffset = 5,
		borderpixel = false,
		numberauto = 8,
		frequencyauto = 0.8,
		autoscale = 2,
		autoxOffset = 5,
		autoyOffset = 5,
		frequencyblizz = 0.5,
	},

	glowcustomcolor = {
		r = 0.27,
		g = 0.50,
		b = 0.70,
	},

	glowcustomcolorpet = {
		r = 0.27,
		g = 0.50,
		b = 0.70,
	},

	glowcustomcolornp = {
		r = 0.27,
		g = 0.50,
		b = 0.70,
	},

	glowtotem1customcolor = {
		r = 0.78,
		g = 0.43,
		b = 0.30,
	},

	glowtotem2customcolor = {
		r = 0.43,
		g = 0.65,
		b = 0.33,
	},

	glowtotem3customcolor = {
		r = 0.39,
		g = 0.68,
		b = 0.80,
	},

	glowtotem4customcolor = {
		r = 0.62,
		g = 0.38,
		b = 0.94,
	},

	partyraiddeath = {
		enable = false,
		bgdisable = false,
		playerdeathsound = "bruh",
	},

	friendlynameplatetoggle = {
		disablefriendly = false,
		friendlynames = false,
		hidefriendly = false,
	},

	afkmusic = {
		enable = false,
		racial = true,
		playerclass = false,
	},

	fonts = {
		playerfont = "Kimberley"
	},

	waypointetasetting = {
		enable = false,
		autopin = false,
		limitmaxdistance = false,
		distance = 700,
		textcolorR = 1,
		textcolorG = 1,
		textcolorB = 1,
	},

	waytext = {
		enable = false,
	},

	widenameplate = {
		enable = false,
		npglow = false,
	},

	questsettings = {
		enable = false,
		rogueopen = false,
		arena = false,
		combatenable = false,
		autoaccept = false,
		acceptdaily = false,
		autoacceptinvert = false,
		questitems = false,
		questitemsbar1 = false,
		questitemsize = 36,
		questitemsfade = false,
	},

	loottext = {
		enable = false,
		honor = true,
		currency = true,
		pet = true,
		scale = 0.65,
		strata = "BACKGROUND",
		xOffset = 0,
		yOffset = 200,
		fontsetting = true,
		fontsettingdmg = false,
		combatindicator = false,
	},

	borders = {
		borders = false,
		texture = "Eltreum-Border-1",
		borderautoadjust = false,

		classcolor = true,

		auraborder = true,
		aurasizex = 53,
		aurasizey = 53,

		chatborder = true,
		leftchatborderx = 432,
		leftchatbordery = 224,
		rightchatborderx = 432,
		rightchatbordery = 224,

		petsizex = 192,
		petsizey = 66,

		partyborders = true,
		partysizex = 222,
		partysizey = 98,

		raidborders = true,
		raidsizey = 65,
		raidsizex = 140,

		raid40borders = true,
		raid40sizey = 63,
		raid40sizex = 140,

		playertargetsize = 20,
		playertargetcastsize = 20,
		petsize = 20,
		groupsize = 14,
		focussize = 20,
		bosssize = 20,
		minimapsize = 15,
		chatsize = 13,
		aurasize = 13,
		baredgesize = 13,

		powerbarborder = false,
		powerbarsize = 4,
		xpowerbar = 138.8,
		ypowerbar = 12,

		minimapborder = false,
		minimapsizex = 226,
		minimapsizey = 247,

		petborder = false,

		playerborder = false,
		xplayer = 302,
		yplayer = 75,

		playercastborder = false,
		xplayercast = 272,
		yplayercast = 58,

		targetborder = false,
		xtarget = 302.8,
		ytarget = 75,

		targetcastborder = false,
		xcasttarget = 272,
		ycasttarget = 58,

		targettargetborder = false,
		xtargettarget = 132.8,
		ytargettarget = 75,

		focusborder = true,
		xfocus = 224,
		yfocus = 72,

		focuscastborder = true,
		xcastfocus = 365,
		ycastfocus = 62,

		bossborder = true,
		xboss = 250,
		yboss = 87,

		bar1borders = true,
		bar1xborder = 65,
		bar1yborder = 56,

		bar2borders = true,
		bar2xborder = 56,
		bar2yborder = 50,

		bar3borders = true,
		bar3xborder = 56,
		bar3yborder = 50,

		bar4borders = true,
		bar4xborder = 56,
		bar4yborder = 50,

		bar5borders = true,
		bar5xborder = 56,
		bar5yborder = 50,

		bar6borders = false,
		bar6xborder = 52,
		bar6yborder = 44,

		bar7borders = false,
		bar7xborder = 52,
		bar7yborder = 44,

		bar8borders = false,
		bar8xborder = 52,
		bar8yborder = 44,

		bar9borders = false,
		bar9xborder = 52,
		bar9yborder = 44,

		bar10borders = false,
		bar10xborder = 52,
		bar10yborder = 44,

		totembar = false,
		totemxborder = 51,
		totemyborder = 51,
		totemedgesize = 13,

		stanceborders = false,
		stancexborder = 49,
		stanceyborder = 42,
		stanceedgesize = 13,

		petactionborders = false,
		petactionxborder = 49,
		petactionyborder = 44,
		petactionedgesize = 13,
	},

	bordercolors = {
		r = 0.27,
		g = 0.50,
		b = 0.70,
		a = 1,
	},

	UFmodifications = true,
	UForientation = "HORIZONTAL",
	lightmode = false,
	uftextureversion = "V1",
	nptextureversion = "V1",
	darkmode = true,
	--modetexture = false,
	darkpowercolor = false,
	greybackground = false,

	gradientmode = {
		enable = false,

		orientation = "HORIZONTAL",
		texture = "Eltreum-Blank",
		customcolor = false,

		classcolorplayercastbar = false,
		classcolortargetcastbar = false,

		gradientXP = false,

		enableplayer = true,
		enabletarget = true,
		enabletargettarget = true,
		enabletargettargettarget = true,
		enablefocus = true,
		enableboss = true,
		enablearena = true,
		enablegroupunits = true,

		--extra for new function
		enablepet = true,
		enablearena1 = true,
		enablearena2 = true,
		enablearena3 = true,
		enablearena4 = true,
		enablearena5 = true,
		enableboss1 = true,
		enableboss2 = true,
		enableboss3 = true,
		enableboss4 = true,
		enableboss5 = true,
		enableboss6 = true,
		enableboss7 = true,
		enableboss8 = true,

		enableplayercastbar = false,
		enableplayercastbarnoninterruptible = false,
		enableplayercastbarinterrupted = false,

		playercastbarR1 = 0,
		playercastbarR2 = 0.67,
		playercastbarG1 = 0.6,
		playercastbarG2 = 0.94,
		playercastbarB1 = 1,
		playercastbarB2 = 1,

		playercastbarR1noninterruptible = 1,
		playercastbarR2noninterruptible = 1,
		playercastbarB1noninterruptible = 0,
		playercastbarB2noninterruptible = 0,
		playercastbarG1noninterruptible = 0,
		playercastbarG2noninterruptible = 0.19607843137255,

		playercastbarR1noninterruptiblecustom = 1,
		playercastbarR2noninterruptiblecustom = 1,
		playercastbarB1noninterruptiblecustom = 0,
		playercastbarB2noninterruptiblecustom = 0.29019607843137,
		playercastbarG1noninterruptiblecustom = 0.34901960784314,
		playercastbarG2noninterruptiblecustom = 0,

		playercastbarR1interrupted = 0.6,
		playercastbarR2interrupted = 0.2,
		playercastbarB1interrupted = 0.6,
		playercastbarB2interrupted = 0.2,
		playercastbarG1interrupted = 0.6,
		playercastbarG2interrupted = 0.2,

		playercastbarR1interruptedcustom = 0.6,
		playercastbarR2interruptedcustom = 0.2,
		playercastbarB1interruptedcustom = 0.6,
		playercastbarB2interruptedcustom = 0.2,
		playercastbarG1interruptedcustom = 0.6,
		playercastbarG2interruptedcustom = 0.2,

		enabletargetcastbar = false,
		enabletargetcastbarnoninterruptible = false,
		enabletargetcastbarinterrupted = false,

		targetcastbarR1 = 0,
		targetcastbarR2 = 0.67,
		targetcastbarG1 = 0.6,
		targetcastbarG2 = 0.94,
		targetcastbarB1 = 1,
		targetcastbarB2 = 1,

		targetcastbarR1custom = 0,
		targetcastbarR2custom = 0.67,
		targetcastbarG1custom = 0.6,
		targetcastbarG2custom = 0.94,
		targetcastbarB1custom = 1,
		targetcastbarB2custom = 1,

		targetcastbarR1noninterruptible = 1,
		targetcastbarR2noninterruptible = 1,
		targetcastbarB1noninterruptible = 0,
		targetcastbarB2noninterruptible = 0,
		targetcastbarG1noninterruptible = 0,
		targetcastbarG2noninterruptible = 0.19607843137255,

		targetcastbarR1noninterruptiblecustom = 1,
		targetcastbarR2noninterruptiblecustom = 1,
		targetcastbarB1noninterruptiblecustom = 0,
		targetcastbarB2noninterruptiblecustom = 0.29019607843137,
		targetcastbarG1noninterruptiblecustom = 0.34901960784314,
		targetcastbarG2noninterruptiblecustom = 0,

		targetcastbarR1interrupted = 0.6,
		targetcastbarR2interrupted = 0.2,
		targetcastbarB1interrupted = 0.6,
		targetcastbarB2interrupted = 0.2,
		targetcastbarG1interrupted = 0.6,
		targetcastbarG2interrupted = 0.2,

		targetcastbarR1interruptedcustom = 0.6,
		targetcastbarR2interruptedcustom = 0.2,
		targetcastbarB1interruptedcustom = 0.6,
		targetcastbarB2interruptedcustom = 0.2,
		targetcastbarG1interruptedcustom = 0.6,
		targetcastbarG2interruptedcustom = 0.2,

		druidcustomcolorR1 = 1,
		druidcustomcolorR2 = 1,
		druidcustomcolorG1 = 0.23921568627451,
		druidcustomcolorG2 = 0.48627450980392,
		druidcustomcolorB1 = 0.007843137254902,
		druidcustomcolorB2 = 0.03921568627451,

		--[[huntercustomcolorR1 = 0.45490196078431,
		huntercustomcolorR2 = 0.43921568627451,
		huntercustomcolorG1 = 0.59607843137255,
		huntercustomcolorG2 = 0.87843137254902,
		huntercustomcolorB1 = 0.25490196078431,
		huntercustomcolorB2 = 0,]]

		huntercustomcolorR1 = 0.40392156862745,
		huntercustomcolorR2 = 0.67058823529412,
		huntercustomcolorG1 = 0.53725490196078,
		huntercustomcolorG2 = 0.92941176470588,
		huntercustomcolorB1 = 0.22352941176471,
		huntercustomcolorB2 = 0.30980392156863,

		paladincustomcolorR1 = 1,
		paladincustomcolorR2 = 0.95686274509804,
		paladincustomcolorG1 = 0.26666666666667,
		paladincustomcolorG2 = 0.54901960784314,
		paladincustomcolorB1 = 0.53725490196078,
		paladincustomcolorB2 = 0.72941176470588,

		magecustomcolorR1 = 0,
		magecustomcolorR2 = 0.49019607843137,
		magecustomcolorG1 = 0.33333333333333,
		magecustomcolorG2 = 0.87058823529412,
		magecustomcolorB1 = 0.53725490196078,
		magecustomcolorB2 = 1,

		roguecustomcolorR1 = 1,
		roguecustomcolorR2 = 1,
		roguecustomcolorG1 = 0.68627450980392,
		roguecustomcolorG2 = 0.83137254901961,
		roguecustomcolorB1 = 0,
		roguecustomcolorB2 = 0.25490196078431,

		priestcustomcolorR1 = 0.3568627450980392,
		priestcustomcolorR2 = 0.98823529411765,
		priestcustomcolorG1 = 0.3568627450980392,
		priestcustomcolorG2 = 0.98823529411765,
		priestcustomcolorB1 = 0.3568627450980392,
		priestcustomcolorB2 = 0.98823529411765,

		deathknightcustomcolorR1 = 0.49803921568627,
		deathknightcustomcolorR2 = 1,
		deathknightcustomcolorG1 = 0.074509803921569,
		deathknightcustomcolorG2= 0.1843137254902,
		deathknightcustomcolorB1 = 0.14901960784314,
		deathknightcustomcolorB2 = 0.23921568627451,

		demonhuntercustomcolorR1 = 0.36470588235294,
		demonhuntercustomcolorR2 = 0.74509803921569,
		demonhuntercustomcolorG1 = 0.13725490196078,
		demonhuntercustomcolorG2 = 0.1921568627451,
		demonhuntercustomcolorB1 = 0.57254901960784,
		demonhuntercustomcolorB2 = 1,

		shamancustomcolorR1 = 0,
		shamancustomcolorR2 = 0,
		shamancustomcolorG1 = 0.25882352941176,
		shamancustomcolorG2 = 0.43921568627451,
		shamancustomcolorB1 = 0.50980392156863,
		shamancustomcolorB2 = 0.87058823529412,

		warlockcustomcolorR1 = 0.26274509803922,
		warlockcustomcolorR2 = 0.66274509803922,
		warlockcustomcolorG1 = 0.26666666666667,
		warlockcustomcolorG2 = 0.3921568627451,
		warlockcustomcolorB1 = 0.46666666666667,
		warlockcustomcolorB2 = 0.7843137254902,

		warriorcustomcolorR1 = 0.42745098039216,
		warriorcustomcolorR2 = 0.56470588235294,
		warriorcustomcolorG1 = 0.13725490196078,
		warriorcustomcolorG2 = 0.43137254901961,
		warriorcustomcolorB1 = 0.090196078431373,
		warriorcustomcolorB2 = 0.24705882352941,

		--[[
		monkcustomcolorR1 = 0,
		monkcustomcolorR2 = 0,
		monkcustomcolorG1 = 0.77254901960784,
		monkcustomcolorG2 = 0.76078431372549,
		monkcustomcolorB1 = 0.45882352941176,
		monkcustomcolorB2 = 0.24313725490196,]]

		monkcustomcolorR1 = 0.015686274509804,
		monkcustomcolorR2 = 0,
		monkcustomcolorG1 = 0.6078431372549,
		monkcustomcolorG2 = 1,
		monkcustomcolorB1 = 0.36862745098039,
		monkcustomcolorB2 = 0.58823529411765,

		npcfriendlyR1 = 0.30980392156863,
		npcfriendlyR2 = 0.34117647058824,
		npcfriendlyG1 = 0.85098039215686,
		npcfriendlyG2 = 0.62745098039216,
		npcfriendlyB1 = 0.2,
		npcfriendlyB2 = 0.4078431372549,

		npcneutralR1 = 0.8156862745098,
		npcneutralG1 = 1,
		npcneutralB1 = 0,
		npcneutralR2 = 1,
		npcneutralG2 = 0.85882352941176,
		npcneutralB2 = 0.2078431372549,

		npcunfriendlyR1 = 0.84313725490196,
		npcunfriendlyG1 = 0.30196078431373,
		npcunfriendlyB1 = 0,
		npcunfriendlyR2 = 0.83137254901961,
		npcunfriendlyG2 = 0.45882352941176,
		npcunfriendlyB2 = 0,

		npchostileR1 = 1,
		npchostileR2 = 1,
		npchostileG1 = 0.090196078431373,
		npchostileG2 = 0,
		npchostileB1 = 0,
		npchostileB2 = 0.54901960784314,

		--threat stuff for np
		npenable = false,
		nporientation = "VERTICAL",
		npcustomcolor = false,

		goodthreatR1 = 0.27843075990677,
		goodthreatR2 = 0.95294117647059,
		goodthreatG1 = 1,
		goodthreatG2 = 0.99999779462814,
		goodthreatB1 = 0,
		goodthreatB2 = 0,

		badthreatR1 = 1,
		badthreatR2 = 0.82352941176471,
		badthreatG1 = 0.17647058823529,
		badthreatG2 = 0,
		badthreatB1 = 0.17647058823529,
		badthreatB2 = 0.34901960784314,

		goodthreattransitionR1 = 1,
		goodthreattransitionR2 = 1,
		goodthreattransitionG1 = 0.99607843137255,
		goodthreattransitionG2 = 0.73333333333333,
		goodthreattransitionB1 = 0.2,
		goodthreattransitionB2 = 0,

		badthreattransitionR1 = 1,
		badthreattransitionR2 = 1,
		badthreattransitionG1 = 0.3921568627451,
		badthreattransitionG2 = 0.9843137254902,
		badthreattransitionB1 = 0.2,
		badthreattransitionB2 = 0,

		offtankR1 = 0.72941176470588,
		offtankR2 = 0.34117647058824,
		offtankG1 = 0.2,
		offtankG2 = 0,
		offtankB1 = 1,
		offtankB2 = 1,

		badthreattransitionofftankR1 = 0.70980392156863,
		badthreattransitionofftankG1 = 0.43137254901961,
		badthreattransitionofftankB1 = 0.27058823529412,
		badthreattransitionofftankR2 = 0.90196078431373,
		badthreattransitionofftankG2 = 0.15294117647059,
		badthreattransitionofftankB2 = 0,

		goodthreattransitionofftankR1 = 0.30980392156863,
		goodthreattransitionofftankR2 = 0,
		goodthreattransitionofftankG1 = 0.45098039215686,
		goodthreattransitionofftankG2 = 1,
		goodthreattransitionofftankB1 = 0.63137254901961,
		goodthreattransitionofftankB2 = 0.70980392156863,

		tappedR1 = 1,
		tappedG1 = 1,
		tappedB1 = 1,
		tappedR2 = 0,
		tappedG2 = 0,
		tappedB2 = 0,
	},

	ufcustomtexture = {
		enable = false,
		classdetect = false,
		castbartexture = "Eltreum-Blank",
		backdroptexture = "Eltreum-Blank",
		backdropalpha = 1,
		backdrophidden = false,
		targettexture = "Eltreum-Blank",
		playertexture = "Eltreum-Blank",
		targettargettexture = "Eltreum-Blank",

		targettargettargettexture = "Eltreum-Blank",

		focustexture = "Eltreum-Blank",
		deathknighttexture = "Eltreum-Class-DeathKnight",
		demonhuntertexture = "Eltreum-Class-DemonHunter",
		druidtexture = "Eltreum-Class-Druid",
		huntertexture = "Eltreum-Class-Hunter",
		magetexture = "Eltreum-Class-Mage",
		monktexture = "Eltreum-Class-Monk",
		paladintexture = "Eltreum-Class-Paladin",
		priesttexture = "Eltreum-Class-Priest",
		roguetexture = "Eltreum-Class-Rogue",
		shamantexture = "Eltreum-Class-Shaman",
		warlocktexture = "Eltreum-Class-Warlock",
		warriortexture = "Eltreum-Class-Warrior",
		npcfriendly = "Eltreum-Class-Hunter",
		npcneutral = "Eltreum-Class-Rogue",
		npcunfriendly = "Eltreum-Class-Druid",
		npchostile = "Eltreum-Class-DeathKnight",
		tappedtexture = "Eltreum-Tapped",
	},

	sparkcustomcolor ={
		enable = false,
		texture = 'Eltreum-Blank',
		--texture = 'Eltreum-Fade',
		r = 0.80,
		g = 0.80,
		b = 0.10,
		a = 1,
		--width = 20,
		width = 3,
	},

	models = {
		castbar = false,
		unitframe = false,
		ufalpha = 0.3,
		ufalphadark = 0.3,
		ufdesaturation = 0,
		modeltype = "CLASS",
		custommodel = 165575,
		custommodelclassic = "spells/arcanebreath.m2",
	},

	--[[
	media = {
		font = false,
		border = false,
		statusbar = false,
		texture = false,
		sound = false,
	},]]

	blizzframes = {
		errorframe = true,
		errorframefontsize = 14,
		hideerrorframe = false,
		raidbossframe = true,
		raidbossframefontsize = 14,
	},

	otherstuff ={
		eltruismroleicons = false,
		alternativegroups = false,
		gamemenu = false,
		afklogo = true,
		mailsoundenable = false,
		mailsound = "Interface-10",
		worldtextscale = 1,
		arenabuffs = false,
		bgunitframes = false,
		arenaunitframes = false,
		portraitfix = true,
		fastloot = false,
		fastlootfilter = false,
		fastlootquality = '0',
		lootwishlistwarning = false,
		lootwishlistfilter = false,
		lootwishlistscreenshot = false,
		lootwishlistsoundenable = false,
		lootwishlistsound = "Warcraft 3 - Rokhan Be Happy",
		lootautoclose = false,
		screenshot = false,
		hidetalkinghead = false,
		blizzcombattext = false,
		blizzcombatmana = false,
		mapcombathide = false,
		dynamicxpbar = false,
		delete = false,
		playerdeath = false,
		playerdeathgta = false,
		playerdeathcustom = false,
		playerdeathcustomtext = "YOU DIED",
		mpluskeys = false,
		bres = false,
		--floatingrep = false,
	},

	instances = {
		enable = false,
		fontsize = 12,
		r = 0.90,
		g = 0.72,
		b = 0,
		DungeonNormal = "N.Dungeon",
		DungeonHeroic = "H.Dungeon",
		Raid = "Raid",
		MythicRaid = "Mythic.Raid",
		RaidHeroic = "Heroic.Raid",
		RaidLFR = "LFR",
		DungeonMythic = "Mythic 0",
		DungeonMythicPlus = "Mythic+",
		DungeonTimewalker = "TW.Dungeon",
		RaidTimewalker = "TW.Raid",
		guild = "Guild",
	}
}
