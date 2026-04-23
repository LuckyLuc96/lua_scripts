local PLAYER_EVENT_ON_LOGIN = 3
local PLAYER_EVENT_ON_LOGOUT = 4
local PLAYER_EVENT_ON_LEVEL_CHANGE = 13


--Modifiable in world.conf 7.0 == 1.0 base speed. 7.7 is ABNORMAL and means world.conf setting is 1.1x player speed.
baseSpeed = 7.7
toggleShapeshiftSpeeds = true
toggleMountLevelTen = true
toggleFasterDead = true
CHECK_INTERVAL = 2000
MOVE_RUN = 1
MOVE_FLY = 6
TRAVEL_FORM_SPELL_ID = 783
GHOST_WOLF_SPELL_ID = 2645
CRUSADER_AURA_ID = 32223
PURSUIT_JUSTICE_1 = 26022  -- 8% increase mounted pally talent
PURSUIT_JUSTICE_2 = 26023  -- 15%
DK_CRUSADER_AURA_1 = 49146 -- 10% increased mounted dk talent
DK_CRUSADER_AURA_2 = 51267 -- 20%

function CheckAura(unit)
    local hasCrusader = unit:HasAura(CRUSADER_AURA_ID)
    local pursuitJustice1 = unit:HasAura(PURSUIT_JUSTICE_1)
    local pursuitJustice2 = unit:HasAura(PURSUIT_JUSTICE_2)
    local paleHorse1 = unit:HasAura(DK_CRUSADER_AURA_1)
    local paleHorse2 = unit:HasAura(DK_CRUSADER_AURA_2)

    if hasCrusader or paleHorse2 then
        currentSpeed = currentSpeed * 0.8
        return
    elseif pursuitJustice2 then
        currentSpeed = currentSpeed * 0.85
        return
    elseif pursuitJustice1 then
        currentSpeed = currentSpeed * 0.92
    elseif paleHorse1 then
        currentSpeed = currentSpeed * 0.9
    end
    return currentSpeed
end

function UpdateSpeed(eventId, delay, repeats, player)
    if not player then return end

    local playerMounted = player:IsMounted()
    local playerDead = player:IsDead()

    currentSpeed = player:GetSpeed(MOVE_RUN)
    CheckAura(player)
    player:SendBroadcastMessage("Debugging: Your speed is: ", currentSpeed)
    local ground1 = baseSpeed * 1.6
    local newground1 = 2.2

    local ground2 = baseSpeed * 2.0
    local newground2 = 2.5

    local flying1 = baseSpeed * 2.5
    local newflying1 = 3.4

    local flying2 = baseSpeed * 3.8
    local newflying2 = 4.5

    local flying3 = baseSpeed * 4.1
    local flyingRare = baseSpeed * 4.0 -- Some rare few mounts increase speed to 300% instead of 310%
    local newflying3 = 5

    if currentSpeed == math.floor(ground1) and playerMounted then
        player:SetSpeed(MOVE_RUN, newground1)
    elseif currentSpeed == math.floor(ground2) and playerMounted then
        player:SetSpeed(MOVE_RUN, newground2)
    elseif currentSpeed == math.floor(flying1) then
        player:SetSpeed(MOVE_FLY, newflying1)
    elseif currentSpeed == math.floor(flying2) then
        player:SetSpeed(MOVE_FLY, newflying2)
    elseif currentSpeed == math.floor(flying3) or currentSpeed == math.floor(flyingRare) then
        player:SetSpeed(MOVE_FLY, newflying3)
    end

    if toggleFasterDead then
        if playerDead then
            player:SetSpeed(MOVE_RUN, newground1)
            player:SetSpeed(MOVE_FLY, newflying1)
        end
    end
end

function travelFormCheck(eventId, delay, repeats, player)
    if not player or toggleShapeshiftSpeeds then return end
    if toggleShapeshiftSpeeds then
        local travelForm = player:HasAura(TRAVEL_FORM_SPELL_ID)
        local ghostWolf = player:HasAura(GHOST_WOLF_SPELL_ID)
        if travelForm or ghostWolf then
            player:SetSpeed(MOVE_RUN, 2) --increase or decrease 2nd value to change speed to your desire.
        end
        -- automatically learn relevant travel form for druids and shamans
        local druidPlayer = player:HasSpell(5176) -- Wrath Spell
        local shamanPlayer = player:HasSpell(403) -- Lighting Bolt Spell
        if druidPlayer and not player:HasSpell(TRAVEL_FORM_SPELL_ID) then
            player:LearnSpell(TRAVEL_FORM_SPELL_ID)
            player:SendNotification("You have automatically learned Travel Form!")
        end
        if shamanPlayer and not player:HasSpell(GHOST_WOLF_SPELL_ID) then
            player:LearnSpell(GHOST_WOLF_SPELL_ID)
            player:SendNotification("You have automatically learned Ghost Wolf!")
        end
    end
end

function OnLevelChange(event, player)
    if toggleMountLevelTen then
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

function OnLogin(event, player)
    player:SendBroadcastMessage("Mount Speed Script loaded!")
    player:RegisterEvent(UpdateSpeed, CHECK_INTERVAL, 0)
    player:RegisterEvent(travelFormCheck, CHECK_INTERVAL, 0)
end

function OnLogout(event, player)
    if player then
        player:RemoveEvents()
    end
end

RegisterPlayerEvent(PLAYER_EVENT_ON_LOGIN, OnLogin)
RegisterPlayerEvent(PLAYER_EVENT_ON_LOGOUT, OnLogout)
RegisterPlayerEvent(PLAYER_EVENT_ON_LEVEL_CHANGE, OnLevelChange)