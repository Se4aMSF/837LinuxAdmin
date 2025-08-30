-- 837LinuxAdmin - Simple Admin Addon for WoW 8.3.7
-- Based on MoveAnything architecture
-- Author: Se4aMSF

local _G = _G
local CreateFrame = CreateFrame
local UIParent = UIParent
local print = print
local pairs = pairs
local strsub = string.sub
local string = string

-- Main addon object
local LinuxAdmin = {}
LinuxAdmin.frame = nil

-- Default settings
local defaults = {
    gmMode = false
}

-- Saved variables
LinuxAdminDB = LinuxAdminDB or defaults

-- Initialize function
function LinuxAdmin:Initialize()
  print("|cFF00E639LinuxAdmin|r: Initializing...")
  
     -- Create main frame (without BackdropTemplate for WoW 8.3.7 compatibility)
   self.frame = CreateFrame("Frame", "LinuxAdminMainFrame", UIParent)
   self.frame:SetSize(300, 200)
   self.frame:SetPoint("CENTER")
  -- Create beautiful background texture
  local bgTexture = self.frame:CreateTexture(nil, "BACKGROUND")
  bgTexture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
  bgTexture:SetAllPoints()
  
     -- Set background color with transparency
   self.frame:SetBackdropColor(0.05, 0.05, 0.1, 0.9)  -- Темно-синий с прозрачностью
   -- Add a beautiful border
   self.frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)  -- Спокойная серая рамка
    
      -- Make frame movable
  self.frame:SetMovable(true)
  self.frame:EnableMouse(true)
  self.frame:RegisterForDrag("LeftButton")
  self.frame:SetScript("OnDragStart", self.frame.StartMoving)
  self.frame:SetScript("OnDragStop", self.frame.StopMovingOrSizing)
  
  print("|cFF00E639LinuxAdmin|r: Step 6: Creating title...")
  -- Create title
  local title = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -10)
    title:SetText("|cFF00E639LinuxAdmin|r")
    
  -- Create title background for better visibility
  local titleBg = self.frame:CreateTexture(nil, "BACKGROUND")
  titleBg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
  titleBg:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 0, 0)
  titleBg:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", 0, 0)
  titleBg:SetHeight(40)
  
     -- Декоративные элементы заголовка убраны (были кислотные квадратики)
     
   -- Create close button
   local closeButton = CreateFrame("Button", nil, self.frame, "UIPanelButtonTemplate")
   closeButton:SetSize(28, 28)
   closeButton:SetPoint("TOPRIGHT", -8, -8)
       closeButton:SetText("X")
   closeButton:SetNormalFontObject("GameFontNormalLarge")
   closeButton:SetHighlightFontObject("GameFontHighlightLarge")
   closeButton:SetScript("OnClick", function() self.frame:Hide() end)
     
   -- Create GM Mode checkbox
   local gmCheckbox = CreateFrame("CheckButton", "LinuxAdminGMCheckbox", self.frame, "UICheckButtonTemplate")
     gmCheckbox:SetSize(24, 24)
     gmCheckbox:SetPoint("CENTER", 0, 0)
    
      -- Create checkbox text
  local checkboxText = gmCheckbox:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  checkboxText:SetPoint("LEFT", gmCheckbox, "RIGHT", 8, 0)
  checkboxText:SetText("|cFF00E639GM Mode|r")
  
  -- Add description text
  local checkboxDesc = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  checkboxDesc:SetPoint("TOP", checkboxText, "BOTTOM", 0, -2)
  checkboxDesc:SetText("|cFFB0B0B0Включить/выключить режим Game Master|r")
    
    -- Set initial state
    gmCheckbox:SetChecked(LinuxAdminDB.gmMode)
    
         -- Handle checkbox changes
     gmCheckbox:SetScript("OnClick", function(checkbox)
         local isChecked = checkbox:GetChecked()
         LinuxAdminDB.gmMode = isChecked
         
         if isChecked then
             print("|cFF00E639LinuxAdmin|r: GM Mode enabled - sending .gm on")
             SendChatMessage(".gm on", "SAY")
         else
             print("|cFF00E639LinuxAdmin|r: GM Mode disabled - sending .gm off")
             SendChatMessage(".gm off", "SAY")
         end
     end)
    
      -- Create info text with better styling
  local infoText = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  infoText:SetPoint("BOTTOM", 0, 25)
  infoText:SetText("|cFF00E639* Галочка управляет командами .gm on/off|r")
  
  -- Create additional info text
  local infoText2 = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  infoText2:SetPoint("BOTTOM", 0, 8)
  infoText2:SetText("|cFF00E639* Команды: /linuxadmin или /la|r")
  
  -- Add version info
  local versionText = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  versionText:SetPoint("BOTTOM", 0, -5)
  versionText:SetText("|cFF888888Версия 8.3.7|r")
  
     -- Create minimap icon
   self:CreateMinimapIcon()
   
   -- Create item linkifier
   self:CreateItemLinkifier()
   
   -- Hide frame initially
   self.frame:Hide()
     
   print("|cFF00E639LinuxAdmin|r: Initialization complete!")
end

-- Create minimap icon function
function LinuxAdmin:CreateMinimapIcon()
  print("|cFF00E639LinuxAdmin|r: Creating minimap icon...")
  
  -- Create minimap button
  local minimapButton = CreateFrame("Button", "LinuxAdminMinimapButton", Minimap)
  minimapButton:SetSize(32, 32)
  minimapButton:SetFrameStrata("MEDIUM")
  
  -- Set icon texture - используем иконку шестеренки (подходит для админ-панели)
  minimapButton:SetNormalTexture("Interface\\Icons\\INV_Misc_Gear_01")
  minimapButton:SetPushedTexture("Interface\\Icons\\INV_Misc_Gear_01")
  minimapButton:SetHighlightTexture("Interface\\Icons\\INV_Misc_Gear_01")
  
  -- Position on minimap
  minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
  
  -- Make it movable around minimap
  minimapButton:RegisterForDrag("LeftButton")
  minimapButton:SetScript("OnDragStart", function(self)
    self:StartMoving()
  end)
  minimapButton:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
  end)
  
  -- Click handler - toggle main window
  minimapButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
      LinuxAdmin:Toggle()
    end
  end)
  
  -- Tooltip
  minimapButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("|cFF00E639LinuxAdmin|r")
    GameTooltip:AddLine("ЛКМ - открыть/закрыть окно", 1, 1, 1)
    GameTooltip:Show()
  end)
  
  minimapButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
  end)
  
     self.minimapButton = minimapButton
end

-- Item linkifier function - добавляет кнопку "Add" к линкованным предметам
function LinuxAdmin:CreateItemLinkifier()
  print("|cFF00E639LinuxAdmin|r: Creating item linkifier...")
  
        -- Hook chat frames to add "Add" buttons to item links
   for i = 1, 10 do
     local chatFrame = _G["ChatFrame" .. i]
     if chatFrame and not chatFrame.linuxAdminHooked then
       -- Hook AddMessage to intercept messages
       local originalAddMessage = chatFrame.AddMessage
       chatFrame.AddMessage = function(self, text, r, g, b, id, ...)
         -- Process text to add "Add" buttons to item links
         text = self:ProcessItemLinks(text)
         -- Call original function
         originalAddMessage(self, text, r, g, b, id, ...)
       end
       
                                             -- Add ProcessItemLinks method to chat frame
        chatFrame.ProcessItemLinks = function(self, text)
          -- Find item links and add "Add" buttons
          text = string.gsub(text, "|cff([0-9a-fA-F]+)|Hitem:([0-9]+):[^|]*|h%[([^%]]+)%]|h|r", 
            function(color, itemId, itemName)
              -- Создаем кликабельную кнопку [Add] рядом с предметом
              local addButton = "|cFF00E639|Hlinuxadditem:" .. itemId .. "|h[Add]|h|r"
              return "|cff" .. color .. "|Hitem:" .. itemId .. ":0:0:0:0:0:0:0|h[" .. itemName .. "]|h|r " .. addButton
            end)
          
          return text
        end
       
       chatFrame.linuxAdminHooked = true
     end
   end
  
           -- Hook SetItemRef для обработки кликов на [Add] и Shift+ЛКМ на заклинания
    if not self.originalSetItemRef then
      self.originalSetItemRef = SetItemRef
      SetItemRef = function(link, text, button)
        
        -- Проверяем, кликнули ли на нашу кнопку [Add]
        if link and strsub(link, 1, 13) == "linuxadditem:" then
          local itemId = strsub(link, 14)
          
          -- Отправляем команду .additem для получения предмета в сумку
          SendChatMessage(".additem " .. itemId, "SAY")
         
         -- ВАЖНО: НЕ вызываем оригинальную функцию для наших ссылок
         return
       end
       
       -- Проверяем Shift+ЛКМ на заклинания
       if link and strsub(link, 1, 5) == "spell" and IsShiftKeyDown() then
         local spellId = strsub(link, 7)
         -- Убираем все лишние символы после ID
         spellId = string.match(spellId, "([0-9]+)")
         if spellId then
           print("|cFF00E639LinuxAdmin|r: Shift+ЛКМ на заклинании - изучаю ID: " .. spellId)
           SendChatMessage(".learn " .. spellId, "SAY")
           return
         end
       end
       
       -- Call original function for normal links
       if LinuxAdmin.originalSetItemRef then
         LinuxAdmin.originalSetItemRef(link, text, button)
       end
     end
   end
  
  
end

-- Toggle function
 function LinuxAdmin:Toggle()
   if self.frame and self.frame:IsShown() then
     self.frame:Hide()
   else
     if self.frame then
       self.frame:Show()
     end
   end
 end

-- Slash command handler
 local function HandleSlashCommand(msg)
   if msg == "toggle" or msg == "" then
     LinuxAdmin:Toggle()
  elseif msg == "gm" then
        local checkbox = _G["LinuxAdminGMCheckbox"]
        if checkbox then
            if checkbox:GetChecked() then
                checkbox:SetChecked(false)
                checkbox:GetScript("OnClick")(checkbox)
            else
                checkbox:SetChecked(true)
                checkbox:GetScript("OnClick")(checkbox)
            end
        end
           elseif msg == "testlink" then
          -- Send a test item link to chat
          SendChatMessage("Test item: |cff1eff00|Hitem:6948:0:0:0:0:0:0:0|h[Hearthstone]|h|r", "SAY")
          -- Send a test spell link to chat
          SendChatMessage("Test spell: |cff1eff00|Hspell:129932|h[Зеленый ездовой тигр Шадо-Пан]|h|r", "SAY")
           elseif msg == "testadd" then
          -- Test sending .additem command directly
          SendChatMessage(".additem 6948", "SAY")
          
          -- Тестируем команду .gm для сравнения (которая работает)
          SendChatMessage(".gm on", "SAY")
          
          -- Тестируем еще раз .additem
          SendChatMessage(".additem 6948", "SAY")
          
          -- Тестируем хук SetItemRef напрямую
          SetItemRef("linuxadditem:6948", "Test", "LeftButton")
                   elseif msg == "additem" then
          local itemId = msg:match("additem (%d+)")
          if itemId then
              SendChatMessage(".additem " .. itemId, "SAY")
          else
              print("|cFF00E639LinuxAdmin|r: Usage: /linuxadmin additem <ID>")
              print("|cFF00E639LinuxAdmin|r: Example: /linuxadmin additem 6948")
          end
      elseif msg == "learn" then
          local spellId = msg:match("learn (%d+)")
          if spellId then
              SendChatMessage(".learn " .. spellId, "SAY")
          else
              print("|cFF00E639LinuxAdmin|r: Usage: /linuxadmin learn <SpellID>")
              print("|cFF00E639LinuxAdmin|r: Example: /linuxadmin learn 129932")
          end
    else
                 print("|cFF00E639LinuxAdmin|r: Available commands:")
         print("  /linuxadmin or /la - toggle window")
         print("  /linuxadmin gm - toggle GM mode")
         print("  /linuxadmin testlink - test item and spell linkifier")
         print("  /linuxadmin testadd - test .additem command directly")
         print("  /linuxadmin additem <ID> - add specific item to bag")
         print("  /linuxadmin learn <SpellID> - learn specific spell")
    end
end

-- Register slash commands
SLASH_LINUXADMIN1 = "/linuxadmin"
SLASH_LINUXADMIN2 = "/la"
SlashCmdList["LINUXADMIN"] = HandleSlashCommand

-- Test command for debugging
SLASH_TEST1 = "/testlinux"
SlashCmdList["TEST"] = function(msg)
  print("|cFF00E639LinuxAdmin|r: TEST COMMAND WORKING! Message: " .. tostring(msg))
end



-- Event handler
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "837LinuxAdmin" then
        print("|cFF00E639LinuxAdmin|r: Addon loaded successfully!")
    elseif event == "PLAYER_LOGIN" then
        print("|cFF00E639LinuxAdmin|r: PLAYER_LOGIN event received, calling Initialize...")
        local success, err = pcall(function() LinuxAdmin:Initialize() end)
        if success then
            print("|cFF00E639LinuxAdmin|r: Initialize completed successfully!")
            print("|cFF00E639LinuxAdmin|r: Welcome! Use /linuxadmin or /la to open the interface.")
        else
            print("|cFF00E639LinuxAdmin|r: ERROR in Initialize: " .. tostring(err))
        end
    end
end)
