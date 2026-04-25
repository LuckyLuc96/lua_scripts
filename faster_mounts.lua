-- Script settings
--Modifiable in worldserver.conf 7.0 == 1.0 base character movement speed.
-- 7.7 is what I prefer and means that player speed is set to 1.1 in the worldserver.conf.
baseSpeed = 7.7
toggleShapeshiftSpeeds = true
toggleMountLevelTen = true
toggleFasterDead = true

--ENUM GLOBALS
CHECK_INTERVAL = 2000 -- Miliseconds to recheck player speed
MOVE_RUN = 1
MOVE_FLY = 6
TRAVEL_FORM_SPELL_ID = 783
GHOST_WOLF_SPELL_ID = 2645
CRUSADER_AURA_ID = 32223
PURSUIT_JUSTICE_1 = 26022  -- 8% increase mounted pally talent
PURSUIT_JUSTICE_2 = 26023  -- 15%
DK_CRUSADER_AURA_1 = 49146 -- 10% increased mounted dk talent
DK_CRUSADER_AURA_2 = 51267 -- 20%
PLAYER_EVENT_ON_LOGIN = 3
PLAYER_EVENT_ON_LOGOUT = 4
PLAYER_EVENT_ON_LEVEL_CHANGE = 13
function CheckAura(unit) -- Will essentially tell lua to subtract the added speed of various auras to normalize and apply the "correct" speeds in the logic. Auras should still apply ingame.
    local hasCrusader = unit:HasAura(CRUSADER_AURA_ID)
    local pursuitJustice1 = unit:HasAura(PURSUIT_JUSTICE_1)
    local pursuitJustice2 = unit:HasAura(PURSUIT_JUSTICE_2)
    local paleHorse1 = unit:HasAura(DK_CRUSADER_AURA_1)
    local paleHorse2 = unit:HasAura(DK_CRUSADER_AURA_2)

    if hasCrusader or paleHorse2 then
        currentSpeed = currentSpeed * 0.8
    elseif pursuitJustice2 then
        currentSpeed = currentSpeed * 0.85
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
    local isFlying = player:IsFlying()

    currentSpeed = player:GetSpeed(MOVE_RUN)

    CheckAura(player)

    local SPEED_MAP = {
        {old = baseSpeed * 1.6, new = 2.2, moveType = MOVE_RUN},  -- Ground Mount 1
        {old = baseSpeed * 2.0, new = 2.5, moveType = MOVE_RUN},  -- Ground Mount 2
        {old = baseSpeed * 2.2, new = 3.4, moveType = MOVE_FLY},  -- Flying Mount 1
        {old = baseSpeed * 2.5, new = 4.3, moveType = MOVE_FLY},  -- Flying Mount 2
        {old = baseSpeed * 4.1, new = 5.0, moveType = MOVE_FLY},  -- Flying Mount 3
        {old = baseSpeed * 4.0, new = 5.0, moveType = MOVE_FLY},  -- Flying Mount oddball
    }                                                               -- Some mounts have a 300% speed instead of 310%


    local function ApplyMap(player, currentSpeed, map)
        for _, entry in ipairs(map) do
            --print(currentSpeed)
            --print(string.format("%f - %f = %f", currentSpeed, entry.old, (currentSpeed - entry.old)))
            secretFormuler = math.abs(currentSpeed - entry.old)
            if secretFormuler < 0.5 then
                player:SetSpeed(entry.moveType, entry.new, true)
                return true
            end
        end
        return false
    end

    if playerMounted or isFlying then
        ApplyMap(player, currentSpeed, SPEED_MAP)
    end

    if toggleFasterDead then
        if playerDead then
            player:SetSpeed(MOVE_RUN, 2.2, true) -- Hard values here represent 2.2x speed and 3.4x speed
            player:SetSpeed(MOVE_FLY, 3.4, true)
        end
    end
end

function travelFormCheck(eventId, delay, repeats, player)
    if not player or not toggleShapeshiftSpeeds then return end

    local travelForm = player:HasAura(TRAVEL_FORM_SPELL_ID)
    local ghostWolf = player:HasAura(GHOST_WOLF_SPELL_ID)
    if travelForm or ghostWolf then
        player:SetSpeed(MOVE_RUN, 2, true) --increase or decrease 2nd value to change speed to your desire.
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
    if player then
        player:SendBroadcastMessage("Mount Speed Script loaded!")
        player:RegisterEvent(UpdateSpeed, CHECK_INTERVAL, 0)
        player:RegisterEvent(travelFormCheck, CHECK_INTERVAL, 0)
    end
end

function OnLogout(event, player)
    if player then
        player:RemoveEvents()
    end
end

RegisterPlayerEvent(PLAYER_EVENT_ON_LOGIN, OnLogin)
RegisterPlayerEvent(PLAYER_EVENT_ON_LOGOUT, OnLogout)
RegisterPlayerEvent(PLAYER_EVENT_ON_LEVEL_CHANGE, OnLevelChange)

if baseSpeed == 7 then
    print("faster_mounts.lua is on and assuming a character speed value of x1.0.")
elseif baseSpeed == 7.7 then
    print("faster_mounts.lua is on and assuming a character speed value of x1.1.")
else
    print("Please modify the variable named baseSpeed at the top of the faster_mounts.lua file to align with your server's default character speed, which is defined in worldserver.conf.\n7.0 is for a character speed of 1x and 7.7 is for a character speed of 1.1x")
end