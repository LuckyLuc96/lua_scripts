function OnMapChange(event, player, map)
    haste_aura = 63150
    mapName = player:GetMap():GetName()
    allianceMaps = {}
    hordeMaps = {}
    isAlliance = player:IsAlliance()

    if mapName and isAlliance then
        player:SendBroadcastMessage(string.format("The map you just joined is: %s", mapName))
        player:AddAura(haste_aura, player)
    else
        player:RemoveAura(haste_aura)
    end
end

RegisterPlayerEvent(28, OnMapChange)
