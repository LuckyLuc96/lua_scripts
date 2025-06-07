local baseSpeed = 7.7 --Modifiable in world.conf
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
    local flyingOdd = baseSpeed * 4.0  -- Some rare few mounts increase speed to 300% instead of 310%
    local newflying3 = 6

    --player:SendBroadcastMessage(string.format("DEBUG -- Your speed is currently: Ground: %d, Flying: %d ", currentSpeed, currentFlying))
    
    if currentSpeed == math.floor(ground1) and playerMounted then
        player:SetSpeed(1, newground1)
    elseif currentSpeed == math.floor(ground2) and playerMounted then
        player:SetSpeed(1, newground2)

    elseif currentFlying == math.floor(flying1) then
        player:SetSpeed(6, newflying1)

    elseif currentFlying == math.floor(flying2) then
        player:SetSpeed(6, newflying2)

    elseif currentFlying == math.floor(flying3) or currentFlying == math.floor(flyingOdd) then
        player:SetSpeed(6, newflying3)
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
