-- Script settings
--Modifiable in worldserver.conf 7.0 == 1.0 base character movement speed.
-- 7.7 is what I prefer and means that player speed is set to 1.1 in the worldserver.conf.
baseSpeed = 7.0
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
        {old = baseSpeed * 2.5, new = 4.2, moveType = MOVE_FLY},  -- Flying Mount 2
        {old = baseSpeed * 4.1, new = 5.0, moveType = MOVE_FLY},  -- Flying Mount 3
        {old = baseSpeed * 4.0, new = 5.0, moveType = MOVE_FLY},  -- Flying Mount oddball
    }                                                               -- Some mounts have a 300% speed instead of 310%

    if playerMounted or isFlying then
        for _, entry in ipairs(SPEED_MAP) do
            secretFormuler = math.abs(currentSpeed - entry.old)
            if secretFormuler < 0.3 then
                player:SetSpeed(entry.moveType, entry.new, true)
            end
        end
    end

    if toggleFasterDead and playerDead then
        player:SetSpeed(MOVE_RUN, 2.2, true) -- Hard values here represent 2.2x speed and 3.4x speed
        player:SetSpeed(MOVE_FLY, 3.4, true)
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

    local MOUNT_MAP = {
        {race = 1, name = "Human", mount = 6648, mname = "Chestnut Mare"},
        {race = 2, name = "Orc", mount = 6654, mname = "Brown Wolf"},
        {race = 3, name = "Dwarf", mount = 6899, mname = "Brown Ram"},
        {race = 4, name = "Night Elf", mount = 8394, mname = "Striped Frostsaber"},
        {race = 5, name = "Undead", mount = 17464, mname = "Brown Skeletal Horse"},
        {race = 6, name = "Tauren", mount = 18990, mname = "Brown Kodo"},
        {race = 7, name = "Gnome", mount = 17453, mname = "Green Mechanostrider"},
        {race = 8, name = "Troll", mount = 17453, mname = "Violet Raptor"},
        {race = 10, name = "Blood Elf", mount = 10799, mname = "Purple Hawkstrider"},
        {race = 11, name = "Draenei", mount = 35018, mname = "Brown Elkk"},
    }
    local achievement_Level_Ten = 6
    if toggleMountLevelTen and player:HasAchieved(achievement_Level_Ten) then
        local race = player:GetRace()
        for _, entry in ipairs(MOUNT_MAP) do
            if entry.race == race then
                player:LearnSpell(entry.mount)
            end
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