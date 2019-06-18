﻿----------------------------
----------------------------
-- Beardley's Diablo Orbs --
-- (c)2019 Kulturnilpferd -- 
----------------------------
--        Settings        --
----------------------------
scaleFactor = 1.5 -- With this value you can scale the whole UI. Menu with settings is comming soon...
----------------------------
----------------------------


local images = "Interface\\AddOns\\BeardleysDiabloOrbsClassic\\art\\"
function BDOMod_OnLoad()
	BDOMod_HealthOrb:RegisterEvent("UNIT_HEALTH")
	BDOMod_HealthOrb:RegisterEvent("UNIT_MAXHEALTH")
	--BDOMod_HealthOrb:RegisterEvent("UNIT_RAGE")
	--BDOMod_HealthOrb:RegisterEvent("UNIT_ENERGY")
	BDOMod_HealthOrb:RegisterEvent("UNIT_MANA")
	--BDOMod_HealthOrb:RegisterEvent("UNIT_RUNIC_POWER")
	--BDOMod_HealthOrb:RegisterEvent("UNIT_DISPLAYPOWER")
	BDOMod_HealthOrb:RegisterEvent("PLAYER_ENTERING_WORLD")
	BDOMod_HealthOrb:RegisterEvent("PLAYER_REGEN_DISABLED")
	BDOMod_HealthOrb:RegisterEvent("PLAYER_REGEN_ENABLED")
	BDOMod_HealthOrb:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
	BDOMod_HealthOrb:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
	BDOMod_HealthOrb:RegisterEvent("ACTIONBAR_SHOWGRID")
	BDOMod_HealthOrb:RegisterEvent("LOOT_CLOSED") -- fix for vanilla, test if needed in Classic retail
end

local function addArtworkFrame(frameName,parentFrame,file,FrameStrata,offsetX,offsetY,height,width)
	local artworkFrame = CreateFrame("Frame",frameName,parentFrame)
	artworkFrame:SetPoint("BOTTOM",offsetX,offsetY)
	artworkFrame:SetFrameStrata(FrameStrata)
	artworkFrame:SetHeight(height)
	artworkFrame:SetWidth(width)
	artworkFrame.texture = artworkFrame:CreateTexture(nil,"OVERLAY")
	artworkFrame.texture:SetTexture(file)
	artworkFrame.texture:SetAllPoints(artworkFrame)
	return artworkFrame
end

local function createArtwork()
	actionbarBackground = addArtworkFrame(nil,UIParent,images.."bar3.tga","LOW",1,-4,127,491)
	leftArtwork = addArtworkFrame(nil,UIParent,images.."leftArtwork.tga","HIGH",-325,0,200,200)
	rightArtwork = addArtworkFrame(nil,UIParent,images.."rightArtwork.tga","HIGH",325,0,200,200)
end

local function changeActionBar()
	if GetBonusBarOffset() == 0 then
		ActionButton1:Show()
		ActionButton2:Show()
		ActionButton3:Show()
		ActionButton4:Show()
		ActionButton5:Show()
		ActionButton6:Show()
		ActionButton7:Show()
		ActionButton8:Show()
		ActionButton9:Show()
		ActionButton10:Show()
		ActionButton11:Show()
		ActionButton12:Show()
	else
		ActionButton1:Hide()
		ActionButton2:Hide()
		ActionButton3:Hide()
		ActionButton4:Hide()
		ActionButton5:Hide()
		ActionButton6:Hide()
		ActionButton7:Hide()
		ActionButton8:Hide()
		ActionButton9:Hide()
		ActionButton10:Hide()
		ActionButton11:Hide()
		ActionButton12:Hide()
	end
end

local function updateHealthOrb()
	local healthPercent = (UnitHealth("player")/UnitHealthMax("player"))
	BDOMod_HealthPercentage:SetText(floor(healthPercent * 100))
	BDOMod_HealthText:SetText(UnitHealth("player").." / ".. UnitHealthMax("player"))
	BDOMod_RedOrb:SetHeight(healthPercent * 185)
	BDOMod_RedOrb:SetTexCoord(0, 1, 1-healthPercent, 1)
end

local function updateManaOrb()
	local manaPercent = (UnitPower("player")/UnitPowerMax("player"))
	BDOMod_ManaPercentage:SetText(floor(manaPercent * 100))
	BDOMod_ManaText:SetText(UnitPower("player").." / ".. UnitPowerMax("player"))
	BDOMod_BlueOrb:SetHeight(manaPercent * 185)
	BDOMod_BlueOrb:SetTexCoord(0, 1, 1-manaPercent, 1)
end

local function reconfigUI()
	MainMenuBarArtFrame.PageNumber:Hide()
	MainMenuBarArtFrame.LeftEndCap:Hide()
	MainMenuBarArtFrame.RightEndCap:Hide()
	MainMenuBarArtFrameBackground:Hide()

	BDOMod_HealthOrb:SetScale(scaleFactor*70/100)
	BDOMod_ManaOrb:SetScale(scaleFactor*70/100)

	actionbarBackground:SetScale(scaleFactor*90/100)

	leftArtwork:SetScale(scaleFactor)
	rightArtwork:SetScale(scaleFactor)	

	--Setup Action Bar
	ActionButton1:ClearAllPoints()
	ActionButton2:ClearAllPoints()
	ActionButton3:ClearAllPoints()
	ActionButton4:ClearAllPoints()
	ActionButton5:ClearAllPoints()
	ActionButton6:ClearAllPoints()
	ActionButton7:ClearAllPoints()
	ActionButton8:ClearAllPoints()
	ActionButton9:ClearAllPoints()
	ActionButton10:ClearAllPoints()
	ActionButton11:ClearAllPoints()
	ActionButton12:ClearAllPoints()
	
	ActionButton1:SetScale(scaleFactor*60/100)
	ActionButton2:SetScale(scaleFactor*60/100)
	ActionButton3:SetScale(scaleFactor*60/100)
	ActionButton4:SetScale(scaleFactor*60/100)
	ActionButton5:SetScale(scaleFactor*60/100)
	ActionButton6:SetScale(scaleFactor*60/100)
	ActionButton7:SetScale(scaleFactor*60/100)
	ActionButton8:SetScale(scaleFactor*60/100)
	ActionButton9:SetScale(scaleFactor*60/100)
	ActionButton10:SetScale(scaleFactor*60/100)
	ActionButton11:SetScale(scaleFactor*60/100)
	ActionButton12:SetScale(scaleFactor*60/100)

	ActionButton1:SetPoint("BOTTOM", UIParent, "BOTTOM",-246,29)
	ActionButton2:SetPoint("BOTTOM", UIParent, "BOTTOM",-201,29)
	ActionButton3:SetPoint("BOTTOM", UIParent, "BOTTOM",-156,29)
	ActionButton4:SetPoint("BOTTOM", UIParent, "BOTTOM",-111,29)
	ActionButton5:SetPoint("BOTTOM", UIParent, "BOTTOM",-66,29)
	ActionButton6:SetPoint("BOTTOM", UIParent, "BOTTOM",-21,29)
	ActionButton7:SetPoint("BOTTOM", UIParent, "BOTTOM",21,29)
	ActionButton8:SetPoint("BOTTOM", UIParent, "BOTTOM",66,29)
	ActionButton9:SetPoint("BOTTOM", UIParent, "BOTTOM",111,29)
	ActionButton10:SetPoint("BOTTOM", UIParent, "BOTTOM",156,29)
	ActionButton11:SetPoint("BOTTOM", UIParent, "BOTTOM",201,29)
	ActionButton12:SetPoint("BOTTOM", UIParent, "BOTTOM",246,29)

	ActionButton1.ignoreFramePositionManager = true
	ActionButton2.ignoreFramePositionManager = true
	ActionButton3.ignoreFramePositionManager = true
	ActionButton4.ignoreFramePositionManager = true
	ActionButton5.ignoreFramePositionManager = true
	ActionButton6.ignoreFramePositionManager = true
	ActionButton7.ignoreFramePositionManager = true
	ActionButton8.ignoreFramePositionManager = true
	ActionButton9.ignoreFramePositionManager = true
	ActionButton10.ignoreFramePositionManager = true
	ActionButton11.ignoreFramePositionManager = true
	ActionButton12.ignoreFramePositionManager = true

	--BonusActionButton1:ClearAllPoints()
	--BonusActionButton2:ClearAllPoints()
	--BonusActionButton3:ClearAllPoints()
	--BonusActionButton4:ClearAllPoints()
	--BonusActionButton5:ClearAllPoints()
	--BonusActionButton6:ClearAllPoints()
	--BonusActionButton7:ClearAllPoints()
	--BonusActionButton8:ClearAllPoints()
	--BonusActionButton9:ClearAllPoints()
	--BonusActionButton10:ClearAllPoints()
	--BonusActionButton11:ClearAllPoints()
	--BonusActionButton12:ClearAllPoints()

	--BonusActionButton1:SetScale(scaleFactor*60)
	--BonusActionButton2:SetScale(scaleFactor*60)
	--BonusActionButton3:SetScale(scaleFactor*60)
	--BonusActionButton4:SetScale(scaleFactor*60)
	--BonusActionButton5:SetScale(scaleFactor*60)
	--BonusActionButton6:SetScale(scaleFactor*60)
	--BonusActionButton7:SetScale(scaleFactor*60)
	--BonusActionButton8:SetScale(scaleFactor*60)
	--BonusActionButton9:SetScale(scaleFactor*60)
	--BonusActionButton10:SetScale(scaleFactor*60)
	--BonusActionButton11:SetScale(scaleFactor*60)
	--BonusActionButton12:SetScale(scaleFactor*60)	

	--BonusActionButton1:SetPoint("BOTTOM", UIParent, "BOTTOM",-246,29)
	--BonusActionButton2:SetPoint("BOTTOM", UIParent, "BOTTOM",-201,29)
	--BonusActionButton3:SetPoint("BOTTOM", UIParent, "BOTTOM",-156,29)
	--BonusActionButton4:SetPoint("BOTTOM", UIParent, "BOTTOM",-111,29)
	--BonusActionButton5:SetPoint("BOTTOM", UIParent, "BOTTOM",-66,29)
	--BonusActionButton6:SetPoint("BOTTOM", UIParent, "BOTTOM",-21,29)
	--BonusActionButton7:SetPoint("BOTTOM", UIParent, "BOTTOM",21,29)
	--BonusActionButton8:SetPoint("BOTTOM", UIParent, "BOTTOM",66,29)
	--BonusActionButton9:SetPoint("BOTTOM", UIParent, "BOTTOM",111,29)
	--BonusActionButton10:SetPoint("BOTTOM", UIParent, "BOTTOM",156,29)
	--BonusActionButton11:SetPoint("BOTTOM", UIParent, "BOTTOM",201,29)
	--BonusActionButton12:SetPoint("BOTTOM", UIParent, "BOTTOM",246,29)	

	--BonusActionButton1.ignoreFramePositionManager = true
	--BonusActionButton2.ignoreFramePositionManager = true
	--BonusActionButton3.ignoreFramePositionManager = true
	--BonusActionButton4.ignoreFramePositionManager = true
	--BonusActionButton5.ignoreFramePositionManager = true
	--BonusActionButton6.ignoreFramePositionManager = true
	--BonusActionButton7.ignoreFramePositionManager = true
	--BonusActionButton8.ignoreFramePositionManager = true
	--BonusActionButton9.ignoreFramePositionManager = true
	--BonusActionButton10.ignoreFramePositionManager = true
	--BonusActionButton11.ignoreFramePositionManager = true
	--BonusActionButton12.ignoreFramePositionManager = true

	--Setup Left Multibar
	MultiBarBottomLeftButton1:ClearAllPoints()
	MultiBarBottomLeftButton2:ClearAllPoints()
	MultiBarBottomLeftButton3:ClearAllPoints()
	MultiBarBottomLeftButton4:ClearAllPoints()
	MultiBarBottomLeftButton5:ClearAllPoints()
	MultiBarBottomLeftButton6:ClearAllPoints()
	MultiBarBottomLeftButton7:ClearAllPoints()
	MultiBarBottomLeftButton8:ClearAllPoints()
	MultiBarBottomLeftButton9:ClearAllPoints()
	MultiBarBottomLeftButton10:ClearAllPoints()
	MultiBarBottomLeftButton11:ClearAllPoints()
	MultiBarBottomLeftButton12:ClearAllPoints()

	MultiBarBottomLeftButton1:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton2:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton3:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton4:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton5:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton6:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton7:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton8:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton9:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton10:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton11:SetScale(scaleFactor*60/100)
	MultiBarBottomLeftButton12:SetScale(scaleFactor*60/100)

	MultiBarBottomLeftButton1:SetPoint("BOTTOM", UIParent, "BOTTOM",-246,75)
	MultiBarBottomLeftButton2:SetPoint("BOTTOM", UIParent, "BOTTOM",-201,75)
	MultiBarBottomLeftButton3:SetPoint("BOTTOM", UIParent, "BOTTOM",-156,75)
	MultiBarBottomLeftButton4:SetPoint("BOTTOM", UIParent, "BOTTOM",-111,75)
	MultiBarBottomLeftButton5:SetPoint("BOTTOM", UIParent, "BOTTOM",-66,75)
	MultiBarBottomLeftButton6:SetPoint("BOTTOM", UIParent, "BOTTOM",-21,75)
	MultiBarBottomLeftButton7:SetPoint("BOTTOM", UIParent, "BOTTOM",21,75)
	MultiBarBottomLeftButton8:SetPoint("BOTTOM", UIParent, "BOTTOM",66,75)
	MultiBarBottomLeftButton9:SetPoint("BOTTOM", UIParent, "BOTTOM",111,75)
	MultiBarBottomLeftButton10:SetPoint("BOTTOM", UIParent, "BOTTOM",156,75)
	MultiBarBottomLeftButton11:SetPoint("BOTTOM", UIParent, "BOTTOM",201,75)
	MultiBarBottomLeftButton12:SetPoint("BOTTOM", UIParent, "BOTTOM",246,75)

	MultiBarBottomLeftButton1.ignoreFramePositionManager = true
	MultiBarBottomLeftButton2.ignoreFramePositionManager = true
	MultiBarBottomLeftButton3.ignoreFramePositionManager = true
	MultiBarBottomLeftButton4.ignoreFramePositionManager = true
	MultiBarBottomLeftButton5.ignoreFramePositionManager = true
	MultiBarBottomLeftButton6.ignoreFramePositionManager = true
	MultiBarBottomLeftButton7.ignoreFramePositionManager = true
	MultiBarBottomLeftButton8.ignoreFramePositionManager = true
	MultiBarBottomLeftButton9.ignoreFramePositionManager = true
	MultiBarBottomLeftButton10.ignoreFramePositionManager = true
	MultiBarBottomLeftButton11.ignoreFramePositionManager = true
	MultiBarBottomLeftButton12.ignoreFramePositionManager = true

	--Setup Right Multibar
	MultiBarBottomRightButton1:ClearAllPoints()
	MultiBarBottomRightButton2:ClearAllPoints()
	MultiBarBottomRightButton3:ClearAllPoints()
	MultiBarBottomRightButton4:ClearAllPoints()
	MultiBarBottomRightButton5:ClearAllPoints()
	MultiBarBottomRightButton6:ClearAllPoints()
	MultiBarBottomRightButton7:ClearAllPoints()
	MultiBarBottomRightButton8:ClearAllPoints()
	MultiBarBottomRightButton9:ClearAllPoints()
	MultiBarBottomRightButton10:ClearAllPoints()
	MultiBarBottomRightButton11:ClearAllPoints()
	MultiBarBottomRightButton12:ClearAllPoints()

	MultiBarBottomRightButton1:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton2:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton3:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton4:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton5:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton6:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton7:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton8:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton9:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton10:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton11:SetScale(scaleFactor*60/100)
	MultiBarBottomRightButton12:SetScale(scaleFactor*60/100)

	MultiBarBottomRightButton1:SetPoint("BOTTOM", UIParent, "BOTTOM",-246,132)
	MultiBarBottomRightButton2:SetPoint("BOTTOM", UIParent, "BOTTOM",-201,132)
	MultiBarBottomRightButton3:SetPoint("BOTTOM", UIParent, "BOTTOM",-156,132)
	MultiBarBottomRightButton4:SetPoint("BOTTOM", UIParent, "BOTTOM",-111,132)
	MultiBarBottomRightButton5:SetPoint("BOTTOM", UIParent, "BOTTOM",-66,132)
	MultiBarBottomRightButton6:SetPoint("BOTTOM", UIParent, "BOTTOM",-21,132)
	MultiBarBottomRightButton7:SetPoint("BOTTOM", UIParent, "BOTTOM",21,132)
	MultiBarBottomRightButton8:SetPoint("BOTTOM", UIParent, "BOTTOM",66,132)
	MultiBarBottomRightButton9:SetPoint("BOTTOM", UIParent, "BOTTOM",111,132)
	MultiBarBottomRightButton10:SetPoint("BOTTOM", UIParent, "BOTTOM",156,132)
	MultiBarBottomRightButton11:SetPoint("BOTTOM", UIParent, "BOTTOM",201,132)
	MultiBarBottomRightButton12:SetPoint("BOTTOM", UIParent, "BOTTOM",246,132)

	MultiBarBottomRightButton1.ignoreFramePositionManager = true
	MultiBarBottomRightButton2.ignoreFramePositionManager = true
	MultiBarBottomRightButton3.ignoreFramePositionManager = true
	MultiBarBottomRightButton4.ignoreFramePositionManager = true
	MultiBarBottomRightButton5.ignoreFramePositionManager = true
	MultiBarBottomRightButton6.ignoreFramePositionManager = true
	MultiBarBottomRightButton7.ignoreFramePositionManager = true
	MultiBarBottomRightButton8.ignoreFramePositionManager = true
	MultiBarBottomRightButton9.ignoreFramePositionManager = true
	MultiBarBottomRightButton10.ignoreFramePositionManager = true
	MultiBarBottomRightButton11.ignoreFramePositionManager = true
	MultiBarBottomRightButton12.ignoreFramePositionManager = true

	MultiBarLeft:SetScale(scaleFactor*60/100)	
	MultiBarLeftButton1:ClearAllPoints()
	MultiBarLeftButton1:SetPoint("RIGHT",UIParent,"RIGHT",-45,185)

	MultiBarRight:SetScale(scaleFactor*60/100)
	MultiBarRightButton1:ClearAllPoints()
	MultiBarRightButton1:SetPoint("RIGHT",UIParent,"RIGHT",-3,185)

	CastingBarFrame:SetScale(scaleFactor*80/100)

	CastingBarFrame:ClearAllPoints()
	CastingBarFrame:SetPoint("CENTER", 0, 500)	

	--Setup Chatframes
	ChatFrame1:SetFrameStrata("HIGH")
	ChatFrame1:SetFrameLevel(9)

	ChatFrame2:SetFrameStrata("HIGH")
	ChatFrame1:SetFrameLevel(9)

	ChatFrame3:SetFrameStrata("HIGH")
	ChatFrame1:SetFrameLevel(9)

	ChatFrame4:SetFrameStrata("HIGH")
	ChatFrame1:SetFrameLevel(9)

	ChatFrame5:SetFrameStrata("HIGH")
	ChatFrame1:SetFrameLevel(9)

	ChatFrame6:SetFrameStrata("HIGH")	
	ChatFrame1:SetFrameLevel(9)

	ChatFrame7:SetFrameStrata("HIGH")
	ChatFrame1:SetFrameLevel(9)

	PetActionBarFrame:ClearAllPoints()
	PetActionBarFrame:SetPoint("BOTTOM", UIParent, "BOTTOM",-77,194)
	PetActionBarFrame:SetScale(scaleFactor*60/100)
	PetActionBarFrame:Show()
	--PetActionBarFrame.ignoreFramePositionManager = true

	--EXP Bar
	--MainMenuExpBar:ClearAllPoints()
	--MainMenuExpBar:SetScale(scaleFactor*34.4)
	--MainMenuExpBar:SetPoint("BOTTOM", UIParent, "BOTTOM",0,232)
	--MainMenuExpBar.ignoreFramePositionManager = true

	--REP Bar (Positioning doesnt work...)
	--ReputationWatchBar:ClearAllPoints()
	--ReputationWatchBar:SetPoint("BOTTOM", UIParent, "BOTTOM",0,230)
	--ReputationWatchBar:SetScale(scaleFactor*34.6)
	--ReputationWatchBar.ignoreFramePositionManager = true

	--Micro Buttons	
	CharacterMicroButton:ClearAllPoints()
	SpellbookMicroButton:ClearAllPoints()
	TalentMicroButton:ClearAllPoints()
	QuestLogMicroButton:ClearAllPoints()
	--SocialsMicroButton:ClearAllPoints()
	--WorldMapMicroButton:ClearAllPoints()
	MainMenuMicroButton:ClearAllPoints()
	HelpMicroButton:ClearAllPoints()
	MainMenuBarBackpackButton:ClearAllPoints()
	CharacterBag0Slot:ClearAllPoints()
	CharacterBag1Slot:ClearAllPoints()
	CharacterBag2Slot:ClearAllPoints()
	CharacterBag3Slot:ClearAllPoints()

	CharacterMicroButton:SetScale(scaleFactor*42/100)
	SpellbookMicroButton:SetScale(scaleFactor*42/100)
	TalentMicroButton:SetScale(scaleFactor*42/100)
	QuestLogMicroButton:SetScale(scaleFactor*42/100)
	--SocialsMicroButton:SetScale(scaleFactor*42/100)
	--WorldMapMicroButton:SetScale(scaleFactor*42/100)
	MainMenuMicroButton:SetScale(scaleFactor*42/100)
	HelpMicroButton:SetScale(scaleFactor*42/100)
	MainMenuBarBackpackButton:SetScale(scaleFactor*38/100)
	CharacterBag0Slot:SetScale(scaleFactor*38/100)
	CharacterBag1Slot:SetScale(scaleFactor*38/100)
	CharacterBag2Slot:SetScale(scaleFactor*38/100)
	CharacterBag3Slot:SetScale(scaleFactor*38/100)

	CharacterMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",-125,0)
	SpellbookMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",-100,0)
	TalentMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",-75,0)
	QuestLogMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",-50,0)
	--SocialsMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",-25,0)
	--WorldMapMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",0,0)
	MainMenuMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",25,0)
	HelpMicroButton:SetPoint("BOTTOM", UIParent, "BOTTOM",50,0)

	MainMenuBarBackpackButton:SetPoint("BOTTOM", UIParent, "BOTTOM",400,1)
	CharacterBag0Slot:SetPoint("BOTTOM", UIParent, "BOTTOM",360,1)
	CharacterBag1Slot:SetPoint("BOTTOM", UIParent, "BOTTOM",320,1)
	CharacterBag2Slot:SetPoint("BOTTOM", UIParent, "BOTTOM",280,1)
	CharacterBag3Slot:SetPoint("BOTTOM", UIParent, "BOTTOM",240,1)

	CharacterMicroButton.ignoreFramePositionManager = true
	SpellbookMicroButton.ignoreFramePositionManager = true
	TalentMicroButton.ignoreFramePositionManager = true
	QuestLogMicroButton.ignoreFramePositionManager = true
	MainMenuMicroButton.ignoreFramePositionManager = true
	MainMenuBarBackpackButton.ignoreFramePositionManager = true
	CharacterBag0Slot.ignoreFramePositionManager = true
	CharacterBag1Slot.ignoreFramePositionManager = true
	CharacterBag2Slot.ignoreFramePositionManager = true
	CharacterBag3Slot.ignoreFramePositionManager = true

	--ShapeshiftButton1:ClearAllPoints()
	--ShapeshiftButton1:SetScale(scaleFactor*48)
	--ShapeshiftButton1:SetPoint("BOTTOM", UIParent, "BOTTOM",-318,1)

	--ShapeshiftButton2:ClearAllPoints()
	--ShapeshiftButton2:SetScale(scaleFactor*48)
	--ShapeshiftButton2:SetPoint("BOTTOM", UIParent, "BOTTOM",-286,1) --62

	--ShapeshiftButton3:ClearAllPoints()
	--ShapeshiftButton3:SetScale(scaleFactor*48)
	--ShapeshiftButton3:SetPoint("BOTTOM", UIParent, "BOTTOM",-254,1)

	--ShapeshiftButton4:ClearAllPoints()
	--ShapeshiftButton4:SetScale(scaleFactor*48)
	--ShapeshiftButton4:SetPoint("BOTTOM", UIParent, "BOTTOM",-222,1)

	--ShapeshiftButton5:ClearAllPoints()
	--ShapeshiftButton5:SetScale(scaleFactor*48)
	--ShapeshiftButton5:SetPoint("BOTTOM", UIParent, "BOTTOM",-190,1)

	--ShapeshiftButton6:ClearAllPoints()
	--ShapeshiftButton6:SetScale(scaleFactor*48)
	--ShapeshiftButton6:SetPoint("BOTTOM", UIParent, "BOTTOM",-158,1)		

	--MainMenuExpBar:ClearAllPoints()
	--MainMenuExpBar:SetScale(scaleFactor*31)
	--MainMenuExpBar:SetPoint("BOTTOM", UIParent, "BOTTOM",-3,229)--249

	--ReputationWatchBar:ClearAllPoints()
	--ReputationWatchBar:SetScale(scaleFactor*31)
	--ReputationWatchBar:SetPoint("BOTTOM", UIParent, "BOTTOM",-3,215)--235

	ActionBarUpButton:ClearAllPoints()
	ActionBarUpButton:SetScale(scaleFactor*66/100)
	ActionBarUpButton:SetPoint("BOTTOM", UIParent, "BOTTOM",500,16)

	ActionBarDownButton:ClearAllPoints()
	ActionBarDownButton:SetScale(scaleFactor*66/100)
	ActionBarDownButton:SetPoint("BOTTOM", UIParent, "BOTTOM",500,-2)
end

local function setupOrbs()
	--BDOMod_RedOrb:SetVertexColor(0.85,0.2,0.2)
	--BDOMod_RedOrb:SetAlpha(0.95)
	BDOMod_RedOrb:SetVertexColor(0.0,1.0,0.0)
	BDOMod_RedOrb:SetTexCoord(0, 1, 0, 1)	
	
	BDOMod_HealthText:SetFont("Fonts\\FRIZQT__.TTF", 12)
	BDOMod_HealthPercentage:SetFont("Fonts\\FRIZQT__.TTF", 25)
	BDOMod_HealthText:SetText(UnitHealth("player").." / ".. UnitHealthMax("player"))
	BDOMod_HealthPercentage:SetText(100)

	BDOMod_ManaText:SetFont("Fonts\\FRIZQT__.TTF", 12)
	BDOMod_ManaPercentage:SetFont("Fonts\\FRIZQT__.TTF", 25)
	BDOMod_ManaText:SetText(UnitPower("player").." / ".. UnitPowerMax("player"))
	BDOMod_ManaText:SetText(100)
end

local function updatePowerType()
	local powerType = UnitPowerType("player")
	if (powerType == 0) then -- Mana
		BDOMod_BlueOrb:SetVertexColor(0.2,0.2,1.0)
		--BDOMod_BlueOrb:SetAlpha(0.95)
		BDOMod_BlueOrb:SetTexCoord(0, 1, 0, 1) 
		return
	end
	if (powerType == 1) then -- Rage
		BDOMod_BlueOrb:SetVertexColor(1.0,0.15,0.15)
		--BDOMod_BlueOrb:SetAlpha(0.95)
		BDOMod_BlueOrb:SetTexCoord(0, 1, 0, 1)
		return
	end
	if (powerType == 3) then -- Energy
		BDOMod_BlueOrb:SetVertexColor(1.0,1.0,0.0)
		--BDOMod_BlueOrb:SetAlpha(0.95)
		BDOMod_BlueOrb:SetTexCoord(0, 1, 0, 1)
		return
	end
	if (powerType == 6) then -- Runic_Power
		BDOMod_BlueOrb:SetVertexColor(0.2,0.75,1.0)
		--BDOMod_BlueOrb:SetAlpha(0.95)
		BDOMod_BlueOrb:SetTexCoord(0, 1, 0, 1)
		return
	end
end

function BDOMod_OnEvent(event)
	if (event=="PLAYER_ENTERING_WORLD") then 
		setupOrbs()
		createArtwork()
		reconfigUI()
		updatePowerType()
		updateHealthOrb()
		updateManaOrb()
		return
	end 
	if (event=="UNIT_DISPLAYPOWER") then 
		updatePowerType()
		updateHealthOrb()
		updateManaOrb()
		return
	end
	if (event=="UNIT_HEALTH") then 
		updateHealthOrb()
		return
	end
	if (event=="UNIT_MANA" or event=="UNIT_RAGE" or event=="UNIT_ENERGY" or event=="UNIT_RUNIC_POWER") then    
		updateManaOrb()
		return
	end
	if (event=="UPDATE_BONUS_ACTIONBAR" or event=="ACTIONBAR_SLOT_CHANGED" or event=="ACTIONBAR_SHOWGRID" or event=="LOOT_CLOSED") then
		changeActionBar()
		return
	end
end