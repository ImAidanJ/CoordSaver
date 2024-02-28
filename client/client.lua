-- Pos Command --

RegisterCommand("pos", function(source, args)
    TriggerServerEvent('SaveCoords', args[1])
end)

-- ClearCoords Command --

RegisterCommand("clearcoords", function(source, args)
    TriggerServerEvent('ClearCoords')
end)

--[[ Chat Suggestions

This don't work and I have no Idea why. I've compared it to other scripts and forums post it just wont work I don't get it!

Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/pos', 'Save Current Coords to File.', {
        { name='Name', help='Adds a Name in Coords File.'}
    })

    TriggerEvent('chat:addSuggestion', '/clearcoords', 'Clears the Coords File.')
end)


--]]