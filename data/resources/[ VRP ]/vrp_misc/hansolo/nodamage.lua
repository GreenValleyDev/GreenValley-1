local MeeleWeapons = {
    ["WEAPON_NIGHTSTICK"] = 2.4, 
    ["WEAPON_GOLFCLUB"] = 2.4,   
    ["WEAPON_FLASHLIGHT"] = 2.4,     	
    ["WEAPON_DAGGER"] = 2.4,     
    ["WEAPON_BAT"] = 2.4,     
    ["WEAPON_BOTTLE"] = 2.4,    
    ["WEAPON_CROWBAR"] = 2.4,     
    ["WEAPON_HAMMER"] = 2.4,    
    ["WEAPON_HATCHET"] = 2.4,     
    ["WEAPON_KNUCKLE"] = 2.4,     
    ["WEAPON_KNIFE"] = 2.4,     
    ["WEAPON_MACHETE"] = 2.4,     
    ["WEAPON_SWITCHBLADE"] = 2.4,     
    ["WEAPON_WRENCH"] = 2.4,    
    ["WEAPON_BATTLEAXE"] = 2.4,     
    ["WEAPON_POOLCUE"] = 2.4,    
    ["WEAPON_STONE_HATCHET"] = 2.4,     
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

		for weapon, modifier in pairs(MeeleWeapons) do
			if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(weapon) then
				SetPlayerMeleeWeaponDamageModifier(PlayerId(), v)
			end
		end
    end
end)
-- ARMAS DE FOGO
Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.1)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL"), 0.9) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 0.9) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"),0.9) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_APPISTOL"), 0.9)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNSPISTOL"), 0.9) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_VINTAGEPISTOL"), 0.9) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_REVOLVER"), 0.9) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MUSKET"), 0.8)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MICROSMG"), 2.4) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 2.1) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTSMG"), 2.4) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPDW"), 2.1)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 2.4) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GUSENBERG"), 2.1) 
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE"), 2.4)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 2.1)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SPECIALCARBINE"), 2.1)  
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNIPERRIFLE"), 2.5)	
	Wait(0)
    end
end)