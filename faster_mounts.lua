local baseSpeed = 7.0               --Modifiable in world.conf 7.0 == 1.0 base speed, 1.1 base speed == 7.7
local toggleShapeshiftSpeeds = true --Toggle increase of travelform/ghostwolf to approx 100% move speed
local CHECK_INTERVAL = 2000
-- Movement types
local MOVE_RUN = 1
local MOVE_FLY = 6

local function UpdateSpeed(eventId, delay, repeats, player)
    if not player or not player:IsInWorld() then return end

    local playerMounted = player:IsMounted()
    local currentSpeed = math.floor(player:GetSpeed(MOVE_RUN))
    local currentFlying = math.floor(player:GetSpeed(MOVE_FLY))

    local ground1 = baseSpeed * 1.6
    local newground1 = 2.2

    local ground2 = baseSpeed * 2.0
    local newground2 = 2.5

    local flying1 = baseSpeed * 2.5
    local newflying1 = 3.4

    local flying2 = baseSpeed * 3.8
    local newflying2 = 5.5

    local flying3 = baseSpeed * 4.1
    local flyingOdd = baseSpeed * 4.0 -- Some rare few mounts increase speed to 300% instead of 310%
    local newflying3 = 6

    --player:SendBroadcastMessage(string.format("DEBUG -- Your speed is currently: Ground: %d, Flying: %d ", currentSpeed, currentFlying))

    if currentSpeed == math.floor(ground1) and playerMounted then
        player:SetSpeed(MOVE_RUN, newground1)
    elseif currentSpeed == math.floor(ground2) and playerMounted then
        player:SetSpeed(MOVE_RUN, newground2)
    elseif currentFlying == math.floor(flying1) then
        player:SetSpeed(MOVE_FLY, newflying1)
    elseif currentFlying == math.floor(flying2) then
        player:SetSpeed(MOVE_FLY, newflying2)
    elseif currentFlying == math.floor(flying3) or currentFlying == math.floor(flyingOdd) then
        player:SetSpeed(MOVE_FLY, newflying3)
    end

    if toggleShapeshiftSpeeds then
        local TRAVEL_FORM_SPELL_ID = 783
        local GHOST_WOLF_SPELL_ID = 2645
        local travelForm = player:HasAura(TRAVEL_FORM_SPELL_ID)
        local ghostWolf = player:HasAura(GHOST_WOLF_SPELL_ID)
        if travelForm or ghostWolf then
            player:SetSpeed(MOVE_RUN, 2) --increase or decrease 2nd value to change speed to your desire.
        end
        -- automatically learn relevant travel form for druids and shamans
        local druidPlayer = player:HasSpell(5176) -- Lighting Bolt rank1
        local shamanPlayer = player:HasSpell(403) -- Wrath rank1
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


local function OnLogin(event, player)
    player:SendBroadcastMessage("Mount Speed Script loaded!")
    player:RegisterEvent(UpdateSpeed, CHECK_INTERVAL, 0)
end

local function OnLogout(event, player)
    player:RemoveEvents()
end
RegisterPlayerEvent(3, OnLogin)
RegisterPlayerEvent(4, OnLogout)
