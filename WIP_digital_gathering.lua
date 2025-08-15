local DigitalGathering = {
    MINING_SPELLS = { 2575, 2576, 3564, 10248, 29354, 50310 },
    HERBALISM_SPELLS = { 2366, 3570, 11993, 28695, 50300 },
    SPELL_TRACK_MINERALS = 2580,
    SPELL_TRACK_HERB = 2383
}

function DigitalGathering:new(object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

function DigitalGathering:OnCast(event, player, spell, skipCheck)
    if spell:GetEntry() == self.SPELL_TRACK_MINERALS then
        local mineral = player:GetNearObject(5, 5) -- Range of 5 yards and "type" of 5
        --player:SendBroadcastMessage(string.format("%i, %i, %i", x, y, z))
        player:CastSpell(mineral, self.MINING_SPELLS[1], true)
    end
    if spell:GetEntry() == self.SPELL_TRACK_HERB then
        --Will do the same as above for this profession. Testing the above first.
    end
end

function DigitalGathering:OnLogin(event, player)
    if not player then return end
end

RegisterPlayerEvent(5, function(...) DigitalGathering:OnCast(...) end)
RegisterPlayerEvent(3, function(...) DigitalGathering:OnLogin(...) end)
