local filename = "coordinates.txt" -- You can change this but remember to change the file name as well.

-- DO NOT TOUCH... Unless you're a smarty pants --

print(Config.ChatPrefix.. "CoordSaver by ImAidanJ")
print(Config.ChatPrefix.. "Discord: https://discord.gg/An79ZgmqBJ")
print(Config.ChatPrefix.. "Version: 1.1.1")

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

local function sendMessage(source, message)
    TriggerClientEvent('chat:addMessage', source, {
        color = { 255, 255, 255 },
        multiline = true,
        args = { Config.ChatPrefix, message }
    })
end

-- Command: /pos [Name]
RegisterCommand("pos", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(source)

    if hasPermission(source, Config.AcePermissionString) then
        if playerPed ~= nil then
            if #args < 1 then
                sendMessage(source, "Usage: /pos [Name]")
                return
            end

            local playerCoords = GetEntityCoords(playerPed)
            local name = args[1]
            local coordsString = string.format("%s: %.2f, %.2f, %.2f", name, playerCoords.x, playerCoords.y, playerCoords.z)

            local file = io.open(filename, "a")
            file:write(coordsString .. "\n")
            file:close()

            TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(0, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.ChatPrefix.. " Position saved to file!"}})

        else
            TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.ChatPrefix.. " Unable to get player position."}})
        end
    else
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.ChatPrefix.. " You do not have permission to use this command."}})
    end
end, false)

-- Command: /clearcoords
RegisterCommand("clearcoords", function(source, args, rawCommand)
    if hasPermission(source, Config.AcePermissionString) then
        local file = io.open(filename, "w")
        file:close()

        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(0, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.ChatPrefix.. " Coordinates file cleared!"}})
    else
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.ChatPrefix.. " You do not have permission to use this command."}})
    end
end, false)
