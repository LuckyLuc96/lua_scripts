haste_aura = 62320
-- TODO: find an aura that increases crafting speed. Only thing I can find is the cooking hat from dalaran quests - but it only applies to cooking.
-- This may be impossible without creating a new spell.
-- TODO 2: Make aura last permanent and then manually remove it (via this pluging) once player leaves city

-- "Stormwind", "Exodar", "Darnassus", "Ironforge", "Shattrath", "Dalaran"
allianceMaps = { 1519, 3557, 1657, 1537, 3703, 4395 }
-- "Orgrimmar", "Thunder Bluff", "Undercity", "Shattrath", "Dalaran"
hordeMaps = { 1637, 1638, 1497, 3703, 4395 }

function CheckMap(mapID, maps)
    for _, m in pairs(maps) do
        if m == mapID then
            return true
        else
            return false
        end
    end
end

function OnZoneChange(event, player)
    mapID = player:GetZoneId()
    isAlliance = player:IsAlliance()
    isHorde = player:IsHorde()
    playerName = player:GetName()

    if isAlliance and CheckMap(mapID, allianceMaps) then
        print(string.format("The zone %s just joined is: %s", playerName, mapID))
        player:AddAura(haste_aura, player)
    elseif isHorde and CheckMap(mapID, hordeMaps) then
        print(string.format("The zone %s just joined is: %s", playerName, mapID))
        player:AddAura(haste_aura, player)
    else
        print(string.format("The zone %s just joined is: %s", playerName, mapID))
        player:RemoveAura(haste_aura)
    end
end

RegisterPlayerEvent(27, OnZoneChange)
