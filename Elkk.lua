local rooster = 66122
local elkk = 35712

local function OnSpellCast(event, player, spell, skipCheck)
    if spell:GetEntry() == elkk then
        player:RemoveAura(elkk)
        player:CastSpell(player, rooster, true)
    end
end

RegisterPlayerEvent(5, OnSpellCast)

