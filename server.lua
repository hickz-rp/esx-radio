ESX.RegisterUsableItem("radio", function(source, item)
    TriggerClientEvent("radio:use", source)
end)

ESX.RegisterServerCallback("radio:server:GetItem", function(source, cb, item, isDead)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local RadioItem = xPlayer.getInventoryItem(item).count
        if RadioItem > 0 and not isDead then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('radio:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        return config[xPlayer.job.name]
    end)
end
