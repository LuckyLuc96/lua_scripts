-- Update this variable GuildName to be the name of your starter guild. This is case sensitive!
GuildName = "test"
Rank = 0

local function ON_FIRST_LOGIN(event, player)
    local guild = GetGuildByName(GuildName)
    if guild then
        guild:AddMember(player, Rank)
    else
        print("auto_guild.lua warning: The guild " .. GuildName .. " not found!")
    end
end

RegisterPlayerEvent(30, ON_FIRST_LOGIN)
