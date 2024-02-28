-- Pos Command --

RegisterCommand("pos", function(source, args)
    TriggerServerEvent('SaveCoords', args[1])
    TriggerEvent('chat:addSuggestion', '/pos', 'Save Current Coords to File.', {{ name='Name', help='Adds a Name in Coords File.'}})
end)

-- ClearCoords Command --

RegisterCommand("clearcoords", function(source, args)
    TriggerServerEvent('ClearCoords')
    TriggerEvent('chat:addSuggestion', '/clearcoords', 'Clears the Coords File.', {})
end)