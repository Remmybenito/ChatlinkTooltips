--create interface options menu
local panel = CreateFrame("Frame")
panel.name = "Slidyboy"
InterfaceOptions_AddCategory(panel)

local title = panel:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
title:SetPoint("TOP")
title:SetText("Slidyboy")

local YAxisSlider = CreateFrame("Slider", "YAxisSlider", panel, "OptionsSliderTemplate");
local XAxisSlider = CreateFrame("Slider", "XAxisSlider", panel, "OptionsSliderTemplate");


--create the y-axis slider
YAxisSlider:SetPoint("CENTER",panel,"CENTER")
YAxisSlider:SetWidth(300)
YAxisSlider:SetHeight(20)

--save screenheight to variable for range on our slider
local screenheight = GetScreenHeight()
local screenwidth = GetScreenWidth()


YAxisSlider:SetMinMaxValues(-screenheight/2,screenheight/2) --negative screenheight for -y
YAxisSlider:SetValue(screenheight/2)
YAxisSlider:SetValueStep(screenheight/100)
YAxisSlider:SetObeyStepOnDrag(true)

--create x-axis slider
XAxisSlider:SetPoint("CENTER",panel,0,-40)
XAxisSlider:SetWidth(300)
XAxisSlider:SetHeight(20)
--
XAxisSlider:SetMinMaxValues(112,screenwidth/2) --112 causes the targ/player frame to touch
XAxisSlider:SetValue(screenwidth/2)
XAxisSlider:SetValueStep(screenwidth/100)
XAxisSlider:SetObeyStepOnDrag(true)

YAxisSlider:SetScript("OnValueChanged", function()
    local y = YAxisSlider:GetValue()
    _, _, _, xOfs, yOfs = PlayerFrame:GetPoint()
    _, _, _, TxOfs, TyOfs = TargetFrame:GetPoint()
    PlayerFrame:ClearAllPoints()
    PlayerFrame:SetPoint("CENTER", xOfs, y)
    PlayerFrame:SetUserPlaced(true)
    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("CENTER", TxOfs, y)
end)

--add x axis 
XAxisSlider:SetScript("OnValueChanged", function()
    local x = XAxisSlider:GetValue()
    _, _, _, xOfs, yOfs = PlayerFrame:GetPoint()
    _, _, _, TxOfs, TyOfs = TargetFrame:GetPoint()
    PlayerFrame:ClearAllPoints()
    PlayerFrame:SetPoint("CENTER", -x, yOfs)
    PlayerFrame:SetUserPlaced(true)
    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("CENTER", x, TyOfs)
end)

PlayerFrame:SetClampedToScreen(true)
TargetFrame:SetClampedToScreen(true)


