function OnMapChange(event, player)
    haste_aura = 32693
    isRested = player:IsRested()
    if isRested then
        player:AddAura(haste_aura, player)
    else
        player:RemoveAura(haste_aura)
    end
    
end

RegisterPlayerEvent(28, OnMapChange)
