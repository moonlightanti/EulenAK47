RegisterServerEvent("dropak47modder")
AddEventHandler("dropak47modder", function()
    local src = source
    DropModder(src, ' ')
end)

DropModder = function(id, args) 
    DropPlayer(id, "You have been dropped for using the ak47 cheat")
end
