local weaponHashes = {"dagger", "bat", "bottle", "crowbar", "flashlight", "golfclub", "hammer", "hatchet", "knuckle",
"knife", "machete", "switchblade", "nightstick", "wrench", "battleaxe", "poolcue",
"stone_hatchet", "pistol", "pistol_mk2", "combatpistol", "appistol", "stungun", "pistol50",
"snspistol", "snspistol_mk2", "heavypistol", "vintagepistol", "flaregun", "marksmanpistol",
"revolver", "revolver_mk2", "doubleaction", "raypistol", "ceramicpistol", "navyrevolver",
"microsmg", "smg", "smg_mk2", "assaultsmg", "combatpdw", "machinepistol", "minismg", "raycarbine",
"pumpshotgun", "pumpshotgun_mk2", "sawnoffshotgun", "assaultshotgun", "bullpupshotgun", "musket",
"heavyshotgun", "dbshotgun", "autoshotgun", "assaultrifle", "assaultrifle_mk2", "carbinerifle",
"carbinerifle_mk2", "advancedrifle", "specialcarbine", "specialcarbine_mk2", "bullpuprifle",
"bullpuprifle_mk2", "compactrifle", "mg", "combatmg", "combatmg_mk2", "gusenberg", "sniperrifle",
"heavysniper", "heavysniper_mk2", "marksmanrifle", "marksmanrifle_mk2", "rpg", "grenadelauncher",
"grenadelauncher_smoke", "minigun", "firework", "railgun", "hominglauncher", "compactlauncher",
"rayminigun", "grenade", "bzgas", "smokegrenade", "flare", "molotov", "stickybomb", "proxmine",
"snowball", "pipebomb", "ball", "petrolcan", "fireextinguisher", "hazardcan"} -- Add more weapons here [https://wiki.fivem.net/wiki/Weapons]


CreateThread(function()
    local ReasonFORPLDeath, Moddername, deathcause, Weapon
    while true do
        Wait(250)
        if IsEntityDead(PlayerPedId()) then
            local ModderKL = GetPedSourceOfDeath(PlayerPedId())
            local moddername2 = GetPlayerName(ModderKL)
            local deathcause = GetPeddeathcause(PlayerPedId())
            local modderid = GetPlayerFromServerId(ModderKL)
            Weaponname = nil
            if IsEntityAPed(ModderKL) and IsPedAPlayer(ModderKL) then
                Moddername = NetworkGetPlayerIndexFromPed(ModderKL)
            elseif IsEntityAVehicle(ModderKL) and IsEntityAPed(GetPedInVehicleSeat(ModderKL, -1)) and IsPedAPlayer(GetPedInVehicleSeat(ModderKL, -1)) then
                    Moddername = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(ModderKL, -1))
            end
        end
        Wait(250)

        if (Moddername == PlayerId()) then
            return
        elseif (Moddername == nil) then
            return 
        else
            for k, v in ipairs(weaponHashes) do -- [https://wiki.fivem.net/wiki/Weapons] Weapon hashes are defined above
                if deathcause ==  GetHashKey("weapon_" .. v) then
                    Weaponname = 'weapon_' .. v
                end
            end
        end
        Wait(250)
        if HasPedGotWeapon(ModderKL, GetHashKey(Weaponname)) then
            print("Weapon found")
            return TriggerServerEvent("ml:removeskidplayer") -- The drop function
        end
        Wait(250)

        Moddername = nil
        ReasonFORPLDeath = nil
        deathcause = nil
        Weaponname = nil
        while IsEntityDead(PlayerPedId()) do
            Wait(1000)
        end
    end
end)
