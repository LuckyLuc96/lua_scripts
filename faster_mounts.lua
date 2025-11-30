local MountSpeedModifier = {
    --Modifiable in world.conf 7.0 == 1.0 base speed. 7.7 is ABNORMAL and means world.conf setting is 1.1x player speed.
    baseSpeed = 7.0,
    toggleShapeshiftSpeeds = true,
    toggleMountLevelTen = true,
    toggleFasterDead = true,
    CHECK_INTERVAL = 2000,

    MOVE_RUN = 1,
    MOVE_FLY = 6,
    TRAVEL_FORM_SPELL_ID = 783,
    GHOST_WOLF_SPELL_ID = 2645,
    CRUSADER_AURA_ID = 32223,
    PURSUIT_JUSTICE_1 = 26022,  -- 8% increase mounted pally talent
    PURSUIT_JUSTICE_2 = 26023,  -- 15%
    DK_CRUSADER_AURA_1 = 49146, -- 10% increased mounted dk talent
    DK_CRUSADER_AURA_2 = 51267, -- 20%
}

function MountSpeedModifier:new(object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    object.playerSpeeds = {}
    return object
end

function MountSpeedModifier:CheckAura(unit)
    local hasCrusader = unit:HasAura(self.CRUSADER_AURA_ID)
    local pursuitJustice1 = unit:HasAura(self.PURSUIT_JUSTICE_1)
    local pursuitJustice2 = unit:HasAura(self.PURSUIT_JUSTICE_2)
    local paleHorse1 = unit:HasAura(self.DK_CRUSADER_AURA_1)
    local paleHorse2 = unit:HasAura(self.DK_CRUSADER_AURA_2)

    if hasCrusader or paleHorse2 then
        self.currentSpeed = self.currentSpeed * 0.8
        return
    elseif pursuitJustice2 then
        self.currentSpeed = self.currentSpeed * 0.85
        return
    elseif pursuitJustice1 then
        self.currentSpeed = self.currentSpeed * 0.92
    elseif paleHorse1 then
        self.currentSpeed = self.currentSpeed * 0.9
    end
end

function MountSpeedModifier:UpdateSpeed(eventId, delay, repeats, player)
    if not player then return end
    local guid = player:GetGUID()
    self.playerSpeeds[guid] = player:GetSpeed(self.MOVE_RUN)
    self:CheckAura(player)

    local playerMounted = player:IsMounted()
    local playerDead = player:IsDead()

    self.currentSpeed = player:GetSpeed(self.MOVE_RUN)
    self.CheckAura(player)
    player:SendBroadcastMessage(string.format("DEBUG -- Your speed is currently: Ground: %d, Flying: %d ",
        self.currentSpeed))
    local ground1 = self.baseSpeed * 1.6
    local newground1 = 2.2

    local ground2 = self.baseSpeed * 2.0
    local newground2 = 2.5

    local flying1 = self.baseSpeed * 2.5
    local newflying1 = 3.4

    local flying2 = self.baseSpeed * 3.8
    local newflying2 = 4.5

    local flying3 = self.baseSpeed * 4.1
    local flyingRare = self.baseSpeed * 4.0 -- Some rare few mounts increase speed to 300% instead of 310%
    local newflying3 = 5

    if self.currentSpeed == math.floor(ground1) and playerMounted then
        player:SetSpeed(self.MOVE_RUN, newground1)
    elseif self.currentSpeed == math.floor(ground2) and playerMounted then
        player:SetSpeed(self.MOVE_RUN, newground2)
    elseif self.currentSpeed == math.floor(flying1) then
        player:SetSpeed(self.MOVE_FLY, newflying1)
    elseif self.currentSpeed == math.floor(flying2) then
        player:SetSpeed(self.MOVE_FLY, newflying2)
    elseif self.currentSpeed == math.floor(flying3) or self.currentSpeed == math.floor(flyingRare) then
        player:SetSpeed(self.MOVE_FLY, newflying3)
    end

    if self.toggleFasterDead then
        if playerDead then
            player:SetSpeed(self.MOVE_RUN, newground1)
            player:SetSpeed(self.MOVE_FLY, newflying1)
        end
    end
end

function MountSpeedModifier:travelFormCheck(eventId, delay, repeats, player)
    if not player or self.toggleShapeshiftSpeeds then return end
    if self.toggleShapeshiftSpeeds then
        local travelForm = player:HasAura(self.TRAVEL_FORM_SPELL_ID)
        local ghostWolf = player:HasAura(self.GHOST_WOLF_SPELL_ID)
        if travelForm or ghostWolf then
            player:SetSpeed(self.MOVE_RUN, 2) --increase or decrease 2nd value to change speed to your desire.
        end
        -- automatically learn relevant travel form for druids and shamans
        local druidPlayer = player:HasSpell(5176) -- Wrath Spell
        local shamanPlayer = player:HasSpell(403) -- Lighting Bolt Spell
        if druidPlayer and not player:HasSpell(self.TRAVEL_FORM_SPELL_ID) then
            player:LearnSpell(self.TRAVEL_FORM_SPELL_ID)
            player:SendNotification("You have automatically learned Travel Form!")
        end
        if shamanPlayer and not player:HasSpell(self.GHOST_WOLF_SPELL_ID) then
            player:LearnSpell(self.GHOST_WOLF_SPELL_ID)
            player:SendNotification("You have automatically learned Ghost Wolf!")
        end
    end
end

function MountSpeedModifier:OnLevelChange(event, player)
    if self.toggleMountLevelTen then
        local race = player:GetRace()          -- See https://wowpedia.fandom.com/wiki/RaceId
        local levelTen = player:HasAchieved(6) --Achievement ID - Level 10
        if race == 1 and levelTen then
            player:LearnSpell(6648)            --Chestnut Mare
        elseif race == 2 and levelTen then
            player:LearnSpell(6654)            --Brown Wolf
        elseif race == 3 and levelTen then
            player:LearnSpell(6899)            --Brown Ram
        elseif race == 4 and levelTen then
            player:LearnSpell(8394)            --Striped Frostsaber
        elseif race == 5 and levelTen then
            player:LearnSpell(17464)           --Brown Skeletal Horse
        elseif race == 6 and levelTen then
            player:LearnSpell(18990)           --Brown Kodo
        elseif race == 7 and levelTen then
            player:LearnSpell(17453)           --Green Mechanostrider
        elseif race == 8 and levelTen then
            player:LearnSpell(10799)           --Violet Raptor
        elseif race == 10 and levelTen then
            player:LearnSpell(35018)           --Purple Hawkstrider
        elseif race == 11 and levelTen then
            player:LearnSpell(34406)           --Brown Elkk
        end
    end
end

function MountSpeedModifier:OnLogin(event, player)
    player:SendBroadcastMessage(string.format("Test Message"))
    if not player then return end
    player:SendBroadcastMessage("Mount Speed Script loaded!")
    player:RegisterEvent(self.UpdateSpeed, self.CHECK_INTERVAL, 0)
    player:RegisterEvent(self.travelFormCheck, self.CHECK_INTERVAL, 0)
end

function MountSpeedModifier:OnLogout(event, player)
    if player then
        player:RemoveEvents()
    end
end

RegisterPlayerEvent(3, MountSpeedModifier:OnLogin(event, player))
RegisterPlayerEvent(4, MountSpeedModifier:OnLogout(event, player))
RegisterPlayerEvent(13, MountSpeedModifier:OnLevelChange(event, player, oldLevel))
