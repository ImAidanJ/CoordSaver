-- Locals --

local filename = Config.FileName

-- Permission Check --

local function hasPermission(source, permission)
    if Config.UseAcePermissions then
        if IsPlayerAceAllowed and IsPlayerAceAllowed(source, permission) then
            return true
        end
    else
        return true
    end
    return false
end

-- /pos command --

RegisterNetEvent('SaveCoords')
AddEventHandler('SaveCoords', function(args)

    local playerPed = GetPlayerPed(source)
    if hasPermission(source, Config.AcePermissionString) then
        if playerPed ~= nil then
            if #args < 1 then
                return
            end

            local playerCoords = GetEntityCoords(playerPed)
            local name = args[1]
            local coordsString = string.format("%s: %.2f, %.2f, %.2f", name, playerCoords.x, playerCoords.y, playerCoords.z)

            local file = io.open(filename, "a")
            file:write(coordsString .. "\n")
            file:close()

            TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(0, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:Coords]^0 Position saved to file!"}})
        else
            TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:Coords]^0 Unable to get player position."}})
        end
    else
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:Coords]^0 You do not have permission to use this command."}})
    end

end)

-- /clearcoords command --

RegisterNetEvent('ClearCoords')
AddEventHandler('ClearCoords', function(args)

    if hasPermission(source, Config.AcePermissionString) then
        local file = io.open(filename, "w")
        file:close()

        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(0, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:Coords]^0 Coordinates file cleared!"}})
    else
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:Coords]^0 You do not have permission to use this command."}})
    end

end)

-- Credits --
-- Don't be weird.. Leave my Credits!!

print("^4[AJ:Coords]^0 CoordSaver by ImAidanJ")
print("^4[AJ:Coords]^0 Discord: https://discord.gg/daVVk9w9GU")
print("^4[AJ:Coords]^0 Version: 1.2.2")