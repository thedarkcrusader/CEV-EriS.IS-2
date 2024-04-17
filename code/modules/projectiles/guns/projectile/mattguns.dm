//Shitty variant of the normal bolt action rifle.

// Accuracy Guide. Accuracy of -4 = Miss 1/3 shots on average. Accuracy of 0 = You never miss. Make sure weapon accuracy is never higher then -1 unless you want perfect accuracy.
// Skills ONLY effect weapon spread. If the skill of a character is below 6 they'll have a hard time hitting anything.

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty
	name = "\improper Boscolet Frontiersman"
	desc = "The stub rifle is a common sight across the galaxy, a hunting rifle firing large-bore rounds."
	icon_state = "boltaction"
	item_state = "boltaction"
	wielded_item_state = "boltaction-wielded"
	fire_sound = "brifle"
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle
	one_hand_penalty = 10
	empty_icon = "boltaction-e"
	far_fire_sound = "sniper_fire"
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.1
	fire_delay= 4.5
	force = 15


/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered
	name = "\improper Triangong 4-46"
	desc = "The stub rifle is a common sight across the galaxy, a hunting rifle firing large-bore rounds. This one is made of quality materials and has been laboured over extensively by expert hands."
	move_delay= 1.8
	one_hand_penalty = 3
	accuracy = -0
	fire_delay = 5
	armor_penetration = 10

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/bayonet
	name = "\improper Stub Rifle"
	desc = "The stub rifle is a common sight across the galaxy, a hunting rifle firing large-bore rounds. This one has a bayonet attached."
	force = 20
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/bayonet/New()
	..()
	add_bayonet()
	desc += " This one has a bayonet."

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester
	name = "\improper Lever Rifle"
	desc = "The lever action version of the Stub Rifle. Has all the same benefits and issues."
	icon_state = "leverchester"
	item_state = "leverchester"
	wielded_item_state = "leverchester-wielded"
	fire_sound = 'sound/weapons/guns/fire/la_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/la_insert.ogg'
	pumpsound = 'sound/weapons/guns/interact/la_cock.ogg'
	backsound = 'sound/weapons/guns/interact/la_back.ogg'
	forwardsound = 'sound/weapons/guns/interact/la_forward.ogg'
	empty_icon = "leverchester-e"
	fire_delay = 4
	move_delay= 2.5

//Paryying.

/obj/item/gun/projectile/shotgun/pump/boltaction/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_sword_parry(user, damage, damage_source, attacker, def_zone, attack_text))
		return 1
	return 0

//AMMO

/obj/item/ammo_casing/brifle
	desc = "An old worn out looking bullet casing."
	caliber = "763"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/brifle
	icon_state = "brifle"
	spent_icon = "brifle-casing"
	ammo_stack = /obj/item/ammo_magazine/handful/brifle_handful/two

/obj/item/projectile/bullet/rifle/a762/brifle
	fire_sound = "brifle"
	penetrating = FALSE
	damage = 50

/obj/item/projectile/bullet/rifle/kroot
	fire_sound = "brifle"
	penetrating = TRUE // fuck that shit penetrative rounds
	damage = 65
	armor_penetration = 40


/obj/item/ammo_magazine/brifle
	name = "Rifle Box"
	desc = "A box of rifle ammo"
	icon_state = "rbox"
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 20



//Shitty shotgun

/obj/item/gun/projectile/shotgun/pump/shitty
	name = "\improper WTX Frontier Special"
	desc = "A common shotgun used for hunting and law enforcement. It's cheap and reliable nature is the very model of imperial culture."
	icon_state = "winchester"
	item_state = "winchester"
	wielded_item_state = "winchester-wielded"
	str_requirement = 8
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	empty_icon = "winchester-e"
	move_delay= 2
	one_hand_penalty = 4
	accuracy = -0.2
	fire_delay= 3
	armor_penetration = 1

	ammo_type = list(
		/obj/item/ammo_casing/shotgun/pellet,
		/obj/item/ammo_casing/shotgun/beanbag)

/obj/item/gun/projectile/shotgun/pump/shitty/magrave
	name = "\improper WTX Belle Magrave"
	desc = "A rare specialty Magrave shotgun long out of production - this retired veteran has been well maintained over the years by it's previous owners."
	move_delay= 1.7
	one_hand_penalty = 3.5
	accuracy = -1.1
	fire_delay = 3.5
	armor_penetration = 2

/obj/item/gun/projectile/shotgun/pump/shitty/sawn
	name = "\improper Sawn Off WTX Frontier Special"
	desc = "A sawn off version of a common shotgun used in the trenches. It's not the best made and is prone to jamming."
	icon_state = "sawnchester"
	item_state = "sawnchester"
	wielded_item_state = "sawnchester-wielded"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	max_shells = 4
	empty_icon = "sawnchester-e"
	one_hand_penalty = 2
	fire_delay = 3
	accuracy = -0.4
	armor_penetration = 0

/obj/item/gun/projectile/shotgun/pump/shitty/sawn/smallshotty
	name = "\improper WTX Reckoning"
	desc = "Small looking shotgun that fires a powerful shot."
	icon_state = "smallshotty"
	item_state = "smallshotty"
	wielded_item_state = "smallshotty-wielded"
	empty_icon = "smallshotty-e"
	one_hand_penalty = 2.5
	armor_penetration = 2

/obj/item/gun/projectile/shotgun/pump/shitty/bayonet
	force = 20
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"

/obj/item/gun/projectile/shotgun/pump/shitty/bayonet/New()
	..()
	add_bayonet()
	desc += " This one has a bayonet."


/obj/item/gun/projectile/automatic/m22/warmonger
	name = "Mk.3 Warmonger"
	desc = "A semi automatic battle rifle. Fires faster, and more reliably than most of the shitty bolt action rifles the grunts get."
	icon_state = "autorifle"
	item_state = "autorifle"
	wielded_item_state = "autorifle-wielded"
	fire_sound = 'sound/weapons/gunshot/gunshot_arifle.ogg'
	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.5
	fire_delay = 3.5

	magazine_type = /obj/item/ammo_magazine/c45rifle/akarabiner
	allowed_magazines = /obj/item/ammo_magazine/c45rifle/akarabiner
	fire_delay = 0
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO

/obj/item/gun/projectile/automatic/m22/warmonger/fully_auto
	name = "Mk.5 Warmonger"
	desc = "A fully automatic battle rifle. Fires faster, and more reliably than the old shitty bolt action rifles from the old war."
	icon_state = "autorifle"
	item_state = "autorifle"
	wielded_item_state = "autorifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/ak_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/ak_cock.ogg'

	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

	gun_type = GUN_AUTOMATIC

/obj/item/gun/projectile/automatic/m22/warmonger/fully_auto/nemesis
	name = "Mk.1 Nemesis"
	desc = "God, it's fucking ugly, but it does at least kill. Takes Warmonger magazines."
	icon_state = "bar"
	item_state = "bar"
	wielded_item_state = "bar-wielded"
	fire_sound = 'sound/weapons/guns/fire/bar_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/bar_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/bar_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/bar_cock.ogg'

	loaded_icon = "bar"
	unwielded_loaded_icon = "bar"
	wielded_loaded_icon = "bar-wielded"
	unloaded_icon = "bar-e"
	unwielded_unloaded_icon = "bar-e"
	wielded_unloaded_icon = "bar-wielded-e"
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -1.5
	fire_delay= 2.5

/obj/item/gun/projectile/automatic/m22/warmonger/m14
	name = "M41 Eclipse"
	desc = "A semi automatic rifle. It's made out of the leftover scraps from the old war. Fires a powerful round, but only one at a time."
	icon_state = "semirifle"
	item_state = "semirifle"
	wielded_item_state = "semirifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/m14_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/fal_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/fal_magin.ogg'
	caliber = "a762"
	loaded_icon = "semirifle"
	unwielded_loaded_icon = "semirifle"
	wielded_loaded_icon = "semirifle-wielded"
	unloaded_icon = "semirifle-e"
	unwielded_unloaded_icon = "semirifle-e"
	wielded_unloaded_icon = "battlerifle-wielded-e"

	magazine_type = /obj/item/ammo_magazine/a762/m14
	allowed_magazines = /obj/item/ammo_magazine/a762/m14

/obj/item/ammo_magazine/a762/m14
	name = "M41 magazine"
	desc = "Found either in your gun, in your satchel, or on the ground empty."
	max_ammo = 20
	icon_state = "autorifle"

/obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle
	name = "Mk.1 Armageddon"
	desc = "A very powerful semi automatic rifle. Much nicer than whatever scrap those medics are using."
	icon_state = "battlerifle"
	item_state = "battlerifle"
	wielded_item_state = "battlerifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/arm_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/arm_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/arm_cock.ogg'
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.5
	fire_delay = 3.5

	magazine_type = /obj/item/ammo_magazine/a762/m14/battlerifle_mag
	allowed_magazines = list(/obj/item/ammo_magazine/a762/m14/battlerifle_mag, /obj/item/ammo_magazine/c45rifle/akarabiner)

	loaded_icon = "battlerifle"
	unwielded_loaded_icon = "battlerifle"
	wielded_loaded_icon = "battlerifle-wielded"
	unloaded_icon = "battlerifle-e"
	unwielded_unloaded_icon = "battlerifle-e"
	wielded_unloaded_icon = "battlerifle-wielded-e"

/obj/item/ammo_magazine/a762/m14/battlerifle_mag
	name = "Armageddon magazine"

/obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle/rsc
	name = "Mk.1 Armageddon"
	icon_state = "rsc"
	item_state = "rsc"
	wielded_item_state = "rsc-wielded"

	magazine_type = /obj/item/ammo_magazine/a762/rsc
	allowed_magazines = /obj/item/ammo_magazine/a762/rsc

	caliber = "763"

	loaded_icon = "rsc"
	unwielded_loaded_icon = "rsc"
	wielded_loaded_icon = "rsc-wielded"
	unloaded_icon = "rsc-e"
	unwielded_unloaded_icon = "rsc-e"
	wielded_unloaded_icon = "rsc-wielded-e"

/obj/item/ammo_magazine/a762/rsc
	icon_state = "rsc"
	name = "Armageddon clip"
	max_ammo = 5
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle

/obj/item/gun/projectile/automatic/m22/combatrifle
	name = "Mk. 2 Nightfall"
	desc = "An advanced post war rifle, this one has different fire modes and relative accuracy!"
	icon_state = "combatrifle"
	item_state ="combatrifle"
	magazine_type = /obj/item/ammo_magazine/c45rifle/combatrifle
	allowed_magazines = /obj/item/ammo_magazine/c45rifle/combatrifle
	one_hand_penalty = 5
	wielded_item_state = "combatrifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/combatrifle_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/combatrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/combatrifle_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/combatrifle_cock.ogg'
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.5
	fire_delay = 3.5

	loaded_icon = "combatrifle"
	unwielded_loaded_icon = "combatrifle"
	wielded_loaded_icon = "combatrifle-wielded"
	unloaded_icon = "combatrifle-e"
	unwielded_unloaded_icon = "combatrifle-e"
	wielded_unloaded_icon = "combatrifle-wielded-e"

	gun_type = GUN_AUTOMATIC

	w_class = ITEM_SIZE_HUGE

	//Assault rifle, burst fire degrades quicker than SMG, worse one-handing penalty, slightly increased move delay
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=2.5,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=1, fire_delay=3.5,  move_delay=0, one_hand_penalty=6, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.3, 0.6), automatic = 2)
		)

/obj/item/gun/projectile/automatic/mg08
	name = "LMG Harbinger"
	desc = "Named for the death it brings."
	//icon = 'icons/obj/gunx35.dmi'
	icon_state = "hmg"
	item_state = "hmg"
	str_requirement = 18
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 50
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/a556/mg08
	allowed_magazines = /obj/item/ammo_magazine/box/a556/mg08
	one_hand_penalty = 50
	wielded_item_state = "hmg-wielded"
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "hmg"
	unwielded_loaded_icon = "hmg"
	wielded_loaded_icon = "hmg-wielded"
	unloaded_icon = "hmg-e"
	unwielded_unloaded_icon = "hmg-e"
	wielded_unloaded_icon = "hmg-wielded-e"
	fire_delay=2.2
	burst=1
	move_delay=5
	one_hand_penalty=7
	automatic = 2
	firemodes = list()
	gun_type = GUN_LMG

/obj/item/gun/projectile/automatic/gpmg
	name = "GPMG Requiem"
	desc = "A coveted LMG. Lighter than the Harbingers of the old war, but still just as deadly!"
	icon_state = "lmg"
	item_state = "lmg"
	wielded_item_state = "lmg-wielded"
	loaded_icon = "lmg"
	unwielded_loaded_icon = "lmg"
	wielded_loaded_icon = "lmg-wielded"
	unloaded_icon = "lmg-e"
	unwielded_unloaded_icon = "lmg-e"
	wielded_unloaded_icon = "lmg-wielded-e"
	str_requirement = 16
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 50
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/a556/mg08
	allowed_magazines = /obj/item/ammo_magazine/box/a556/mg08
	one_hand_penalty = 7
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	fire_delay=2.2
	burst=1
	can_jam = FALSE
	one_hand_penalty=7
	burst_accuracy=list(0,-1,-1)
	dispersion=list(0.0, 3, 5)
	automatic = 2
	firemodes = list()
	gun_type = GUN_LMG
	move_delay=5

/obj/item/gun/projectile/automatic/machinepistol
	name = "Mk.22 Autogun"
	desc = "A mass-produced autogun local to the frontier, often used by pirates and revolutionaries."
	icon_state = "machinepistol"
	item_state = "machinepistol"
	wielded_item_state = "machinepistol-wielded"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	move_delay= 1.5
	one_hand_penalty = 4
	accuracy = -0.3
	fire_delay = 2.9
	automatic = 1

	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'

	magazine_type = /obj/item/ammo_magazine/mc9mmt/machinepistol
	allowed_magazines = /obj/item/ammo_magazine/mc9mmt/machinepistol

	loaded_icon = "machinepistol"
	unwielded_loaded_icon = "machinepistol"
	wielded_loaded_icon = "machinepistol-wielded"
	unloaded_icon = "machinepistol-e"
	unwielded_unloaded_icon = "machinepistol-e"
	wielded_unloaded_icon = "machinepistol-e"

	gun_type = GUN_SMG

/obj/item/gun/projectile/automatic/machinepistol/a80
	name = "Nachtwey A80 Autogun"
	desc = "A specialty autogun made by frontier gunsmiths - an improved version of the Mk.22 Autogun with a more stable firing platform."
	icon_state = "autorifle"
	item_state = "autorifle"
	move_delay= 1.4
	one_hand_penalty = 3
	accuracy = -0.2
	fire_delay = 2.8
	armor_penetration = 8

	wielded_item_state = "autorifle-wielded"
	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

/obj/item/gun/projectile/automatic/autogrim
	name = "Autogun pattern GRIM"
	desc = "A rugged autogun of Valhallan design, it has a moderate rate of fire and excellent stopping power."
	icon_state = "autorifle"
	item_state = "autorifle"
	caliber = "a556"
	max_shells = 35
	ammo_type = /obj/item/ammo_casing/a556
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	unloaded_icon = "auto_grim-e"
	loaded_icon = "auto_grim"
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	move_delay= 2
	one_hand_penalty = 4
	accuracy = -0.2
	fire_delay = 3
	automatic = 1

	magazine_type = /obj/item/ammo_magazine/autogrim
	allowed_magazines = /obj/item/ammo_magazine/autogrim

	gun_type = GUN_SMG

	wielded_item_state = "autorifle-wielded"
	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

/obj/item/gun/projectile/automatic/machinepistol/wooden
	name = "Mk.23 Soulburn SMG"
	desc = "A mass-produced autogun local to the frontier, often used by pirates and revolutionaries."
	icon_state = "schmeiser"
	item_state = "schmeiser"
	wielded_item_state = "schmeiser-wielded"

	loaded_icon = "schmeiser"
	unwielded_loaded_icon = "schmeiser"
	wielded_loaded_icon = "schmeiser-wielded"
	unloaded_icon = "schmeiser-e"
	unwielded_unloaded_icon = "schmeiser-e"
	wielded_unloaded_icon = "schmeiser-e"

/obj/item/gun/projectile/automatic/flamer
	name = "Mk.1 Scorcher"
	desc = "An incredibly dangerous hand-held flamethrower used often in infiltration or siege operations."
	icon_state = "flamer"
	item_state = "flamer"
	wielded_item_state = "flamer-wielded"
	caliber = "flamer"
	one_hand_penalty = 0
	str_requirement = 10
	fire_sound = 'sound/effects/fire01.ogg'
	casingsound = null//No eject sound for you.
	firemodes = list()
	automatic = 1
	fire_delay = 1
	burst=1
	magazine_type = /obj/item/ammo_magazine/flamer
	allowed_magazines = /obj/item/ammo_magazine/flamer
	can_jam = FALSE

	loaded_icon = "flamer"
	unwielded_loaded_icon = "flamer"
	wielded_loaded_icon = "flamer-wielded"
	unloaded_icon = "flamer-e"
	unwielded_unloaded_icon = "flamer-e"
	wielded_unloaded_icon = "flamer-wielded-e"

	gun_type = GUN_LMG //anyone can use this... just not anyone should.

/obj/item/gun/projectile/automatic/autoshotty
	name = "Wargrave Shotgun"
	desc = "Someone came up with the idea of making a shotgun shoot quickly, and it's dreadful."
	icon_state = "autoshotty"
	item_state = "autoshotty"
	wielded_item_state = "autoshotty"
	magazine_type = /obj/item/ammo_magazine/autoshotty
	allowed_magazines = /obj/item/ammo_magazine/autoshotty
	caliber = "shotgun"
	fire_sound = 'sound/weapons/guns/fire/autoshotty_fire.ogg'
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	reload_sound = 'sound/weapons/guns/interact/autoshotty_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/autoshotty_magout.ogg'
	cock_sound = 'sound/weapons/guns/interact/autoshotty_cock.ogg'
	slot_flags = SLOT_BACK|SLOT_S_STORE
	loaded_icon = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	burst=1
	fire_delay = 3.1
	one_hand_penalty=5
	move_delay= 2
	accuracy = -0.7
	dispersion=list(0.0, 0.8, 1.5)
	automatic = 2.4
	firemodes = list()

	gun_type = GUN_SHOTGUN

/obj/item/ammo_magazine/autoshotty
	name = "Wargrave Shotgun"
	desc = "Just looking at it makes you bloodthirsty."
	icon_state = "autoshotty"
	caliber = "shotgun"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	max_ammo = 6
	multiple_sprites = 1
	force = 8

/obj/item/gun/projectile/warfare
	name = "Villiers Pistol"
	icon_state = "handgun"
	item_state = "handgun"
	fire_sound = "gunshot"//Pistol sounds.
	desc = "A mass-produced slug pistol common in the frontier."
	magazine_type = /obj/item/ammo_magazine/c45m/warfare
	allowed_magazines = /obj/item/ammo_magazine/c45m/warfare
	caliber = ".45"
	load_method = MAGAZINE
	move_delay= 1
	one_hand_penalty = 1
	accuracy = 0
	fire_delay = 2.8
	force = 8

/obj/item/gun/projectile/warfare/update_icon()//We gotta snowflake this a bit.
	..()
	if(ammo_magazine)
		if(ammo_magazine.stored_ammo.len)
			icon_state = "[initial(icon_state)][ammo_magazine.stored_ammo.len]"
		else
			icon_state = "[initial(icon_state)]0"
	else
		icon_state = "handgun-e"

/obj/item/gun/projectile/warfare/kieji
	name = "Kieji Pistol"
	icon_state = "handgun"
	item_state = "handgun" // Need to get icons for pistols later.
	desc = "A rare slug pistol of excellent quality and design."
	move_delay = 1
	one_hand_penalty = 0.7
	accuracy = -0.1
	fire_delay = 2.5
	armor_penetration = 10

/obj/item/ammo_magazine/c45m/warfare
	name = "Reckoning magazine (.45)"
	icon_state = "handgunmag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

// Stubber //





// Eris shit begins here//
/obj/item/ammo_casing/auto35
    desc = ".35 Auto Bullet Casing"
    caliber = ".35"
    projectile_type = /obj/item/projectile/bullet/pistol/auto35
    icon_state = "r-casing"  // Replace with the appropriate icon state
    ammo_stack = /obj/item/ammo_magazine/auto35

/obj/item/projectile/bullet/pistol/auto35
    fire_sound = 'sound/weapons/guns/fire/pistol1.ogg' // Replace with the appropriate fire sound
    penetrating = FALSE
    damage = 30

/obj/item/ammo_magazine/auto35
    name = ".35 Auto Magazine"
    desc = "A magazine for .35 Auto pistols."
    icon_state = "colt-mag_7"  // Replace with the appropriate magazine icon state
    caliber = ".35"
    ammo_type = /obj/item/ammo_casing/auto35
    matter = list(DEFAULT_WALL_MATERIAL = 1260)
    max_ammo = 10
    mag_type = MAGAZINE



/obj/item/ammo_magazine/heavymag
    name = ".40 magnum magazine "
    desc = "A magazine for .40 magnum  pistols."
    icon_state = "colt-mag_7"  // Replace with the appropriate magazine icon state
    caliber = ".40"
    ammo_type = /obj/item/ammo_casing/heavymag
    matter = list(DEFAULT_WALL_MATERIAL = 1260)
    max_ammo = 10
    mag_type = MAGAZINE

/obj/item/ammo_casing/heavymag
    desc = ".40 magnum Bullet Casing"
    caliber = ".40"
    projectile_type = /obj/item/projectile/bullet/pistol/strong
    icon_state = "r-casing"
    ammo_stack = /obj/item/ammo_magazine/heavymag


//paco//
/obj/item/gun/projectile/pistol/paco
	name = "FS HG .35 Auto \"Paco\""
	desc = "A modern and reliable sidearm for the soldier in the field. Commonly issued as a sidearm to Ironhammer Operatives. Uses standard .35 and high capacity magazines."
	icon_state = "paco"
	icon = 'icons/paco.dmi'
	caliber = ".35"
	w_class = ITEM_SIZE_NORMAL
	magazine_type = /obj/item/ammo_magazine/auto35
	allowed_magazines = /obj/item/ammo_magazine/auto35


/obj/item/gun/projectile/pistol/paco/update_icon()
    ..()
    icon_state = "paco"
    if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
        icon_state = "paco_slide"

//Giskard/
/obj/item/gun/projectile/pistol/giskard
	name = "FS HG .35 Auto \"Giskard\""
	desc = "A popular  Frozen Star brand pocket pistol chambered for the ubiquitous .35 auto round. Uses standard capacity magazines."
	icon_state = "giskard"
	item_state = "giskard"
	icon = 'icons/giskard.dmi'
	caliber = ".35"
	magazine_type = /obj/item/ammo_magazine/auto35
	allowed_magazines = /obj/item/ammo_magazine/auto35


/obj/item/gun/projectile/pistol/giskard/update_icon()
    ..()
    icon_state = "giskard"
    if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
        icon_state = "giskard_slide"

//Olivaw/
/obj/item/gun/projectile/pistol/olivaw
	name = "FS HG .35 Auto \"Olivaw\""
	desc = "A popular  Frozen Star machine pistol. This one has a two-round burst-fire mode and is chambered for .35 auto. It can use normal and high capacity magazines.s. the hood rats got to this one it gots a switch on it"
	icon_state = "olivawcivil"
	icon = 'icons/olivawcivil.dmi'
	caliber = ".35"
	w_class = ITEM_SIZE_NORMAL
	magazine_type = /obj/item/ammo_magazine/auto35
	allowed_magazines = /obj/item/ammo_magazine/auto35
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=2, fire_delay=null, move_delay=4,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0), automatic = 0),
		list(mode_name="automatic",   	 burst=1, fire_delay=0,  move_delay=0, one_hand_penalty=2, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1), automatic = 2)
		//list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=4,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)


/obj/item/gun/projectile/pistol/olivaw/update_icon()
    ..()
    icon_state = "olivawcivil"
    if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
        icon_state = "olivawcivil_empty"


/obj/item/gun/projectile/pistol/colt
	name = "FS HG .35 Auto \"colt\""
	desc = "A cheap knock-off of a Colt M1911. Uses standard .35 and high capacity magazines."
	icon_state = "colt"
	icon = 'icons/colt.dmi'
	caliber = ".35"
	armor_penetration = 14
	w_class = ITEM_SIZE_NORMAL
	magazine_type = /obj/item/ammo_magazine/auto35
	allowed_magazines = /obj/item/ammo_magazine/auto35



/obj/item/gun/projectile/pistol/colt/update_icon()
    ..()
    icon_state = "colt"
    if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
        icon_state = "colt_slide"



/obj/item/gun/projectile/pistol/avasarala
	name = "FS HG .40 Magnum \"avasarala\""
	desc = "An obvious replica of an old Earth Desert Eagle. Robust and straight, this is a gun for a leader, not just an officer."
	icon_state = "avasarala"
	icon = 'icons/avasarala.dmi'
	caliber = ".40"
	armor_penetration = 14
	w_class = ITEM_SIZE_NORMAL
	magazine_type = /obj/item/ammo_magazine/heavymag
	allowed_magazines = /obj/item/ammo_magazine/heavymag



/obj/item/gun/projectile/pistol/avasarala/update_icon()
    ..()
    icon_state = "avasarala"
    if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
        icon_state = "avasarala_slide"



