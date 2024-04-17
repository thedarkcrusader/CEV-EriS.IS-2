
////////////////
//IRONHAMMER//////
//////////////////
/datum/job/ih
	title = "IHDATUM" // Ironhammer PMC's  Military jarheads this is there corpo sec wing so prettymuch suped up law enforcement On average they need to be stronger then most crew
	supervisors = "The Lieutenant  and your Sergeant."
	total_positions = 0
	spawn_positions = 0
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/ig //will need to be replaced eventually - wel
	selection_color = "#4a3381"
	department_flag = SEC
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 8
	ranged_skill = 10
	medical_skill = 3
	engineering_skill = 3
	surgery_skill = 1
	open_when_dead = TRUE
	create_record = 1
	announced = FALSE
	can_be_in_squad = FALSE
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_armory)

/datum/job/ih/equip(var/mob/living/carbon/human/H)
    var/current_name = H.real_name
    ..()
    H.fully_replace_character_name("Operative [current_name]")
    H.add_stats(rand(12,17), rand(10,16), rand(8,12))
    H.set_trait(new/datum/trait/death_tolerant())
    H.set_trait(new/datum/trait/millitary_training())





/datum/job/ih/Lieutenant
	title = "Ironhammer Lieutenant"
	supervisors = "Your Lamia and your WIts"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#4a3381"
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_HIGH
	outfit_type = /decl/hierarchy/outfit/job/ironhammer/lt
	can_be_in_squad = FALSE
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 11
	ranged_skill = 11
	medical_skill = 2
	engineering_skill = 3
	surgery_skill = 1
	open_when_dead = FALSE
	department_flag = COM|SEC
	latejoin_at_spawnpoints = TRUE

	announced = TRUE

/datum/job/ih/Lieutenant/equip(var/mob/living/carbon/human/H)
    var/current_name = H.real_name
    ..()
    H.fully_replace_character_name("Lieutenant [current_name]")
    H.add_stats(17, 14, 15, 10)
    H.set_trait(new/datum/trait/death_tolerant())
    H.set_trait(new/datum/trait/millitary_training())



/datum/job/ih/sergeant
	title = "Gunnery Sergeant"
	department = "Security"
	department_flag = SEC

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Ironhammer Lieutetnant"
	selection_color = "#4a3381"
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/ironhammer/sergeant
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 6
	melee_skill = 10
	ranged_skill = 11
	medical_skill = 4
	engineering_skill = 4
	surgery_skill = 2


/datum/job/ih/sergeant/equip(var/mob/living/carbon/human/H)
    var/current_name = H.real_name
    ..()
    H.fully_replace_character_name("Sergeant [current_name]")
    H.add_stats(rand(12,17), rand(10,16), rand(8,12))
    H.set_trait(new/datum/trait/death_tolerant())
    H.set_trait(new/datum/trait/millitary_training())

/datum/job/ih/inspector
	title = "Ironhammer Inspector"
	department = "Security"
	department_flag = SEC

	total_positions = 2
	spawn_positions = 2
	supervisors = "The Lieutetnant and Sergeant"
	selection_color = "#4a3381"
//	alt_titles = list("Forensic Technician" = /decl/hierarchy/outfit/job/security/detective/forensic)
	economic_modifier = 5
	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels)
	minimal_access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/ironhammer/inspector

/datum/job/ih/inspector/equip(var/mob/living/carbon/human/H)
    var/current_name = H.real_name
    ..()
    H.fully_replace_character_name("Inspector [current_name]")
    H.add_stats(rand(12,17), rand(10,16), rand(8,12))
    H.set_trait(new/datum/trait/death_tolerant())
    H.set_trait(new/datum/trait/millitary_training())

/datum/job/ih/operative
	title = "Ironhammer Operative"
	department = "Security"
	department_flag = SEC

	total_positions = 10
	spawn_positions = 10
	supervisors = "The Lieutetnant and Sergeant"
	selection_color = "#4a3381"
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 4
	shotgun_skill = 6
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 10
	ranged_skill = 8
	medical_skill = 2
	engineering_skill = 2
	surgery_skill = 1
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	outfit_type = /decl/hierarchy/outfit/job/ironhammer/operative
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels,)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,

			            )

/datum/job/ih/operative/equip(var/mob/living/carbon/human/H)
    var/current_name = H.real_name
    ..()
    H.fully_replace_character_name("Operative [current_name]")
    H.add_stats(rand(12,17), rand(10,16), rand(8,12))
    H.set_trait(new/datum/trait/death_tolerant())
    H.set_trait(new/datum/trait/millitary_training())

/decl/hierarchy/outfit/job/ironhammer
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/goggles/ironhammer
	mask = /obj/item/clothing/mask/balaclava
	uniform = /obj/item/clothing/under/rank/ih
	gloves = /obj/item/clothing/gloves/security/ironhammer
	shoes = /obj/item/clothing/shoes/jackboots/ironhammer
	backpack_contents = list(/obj/item/handcuffs = 1,/obj/item/gun/projectile/automatic/pepperspray)
	head = /obj/item/clothing/head/helmet/bulletproof/ironhammer_full
	belt = /obj/item/gun/projectile/automatic/pepperspray
	back = /obj/item/storage/backpack/satchel/warfare

//Lieutenant
/decl/hierarchy/outfit/job/ironhammer/lt
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/goggles/ironhammer
	gloves = /obj/item/clothing/gloves/security/ironhammer
	shoes = /obj/item/clothing/shoes/jackboots/ironhammer
	backpack_contents = list(/obj/item/handcuffs = 1)

//Sergeant/
/decl/hierarchy/outfit/job/ironhammer/sergeant
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/goggles/ironhammer
	gloves = /obj/item/clothing/gloves/security/ironhammer
	shoes = /obj/item/clothing/shoes/jackboots/ironhammer
	backpack_contents = list(/obj/item/handcuffs = 1)

//Inspector/
/decl/hierarchy/outfit/job/ironhammer/inspector
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/goggles/ironhammer
	mask = /obj/item/clothing/mask/balaclava
	uniform = /obj/item/clothing/under/rank/ih
	gloves = /obj/item/clothing/gloves/security/ironhammer
	shoes = /obj/item/clothing/shoes/jackboots/ironhammer
	backpack_contents = list(/obj/item/handcuffs = 1,/obj/item/gun/projectile/automatic/pepperspray)
	head = /obj/item/clothing/head/helmet/bulletproof/ironhammer_full
	belt = /obj/item/gun/projectile/automatic/pepperspray
	back = /obj/item/storage/backpack/satchel/warfare
//Operative/

/decl/hierarchy/outfit/job/ironhammer/operative
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/goggles/ironhammer
	gloves = /obj/item/clothing/gloves/security/ironhammer
	uniform = /obj/item/clothing/under/rank/ih/inspector
	shoes = /obj/item/clothing/shoes/jackboots/ironhammer
	backpack_contents = list(/obj/item/handcuffs = 1)
	head = /obj/item/clothing/head/fedora
	belt = /obj/item/storage/belt/security/tactical/ironhammer
//spawns/
/obj/effect/landmark/start/ih/inspector
	name = "Inspector"

/obj/effect/landmark/start/ih/Lieutenant
	name = "Lieutenant"

/obj/effect/landmark/start/ih/sergeant
	name = "Sergeant"

/obj/effect/landmark/start/ih/operative
	name = "operative"

/obj/item/clothing/under/rank/ih
	name = "Ironhammer Operative's jumpsuit"
	desc = "The standard issue uniform of Ironhammer grunts all over the sector this one seams like its in the  newer I.E.i. design"
	icon_state = "ironhammer"
	item_state = "ironhammer"
	worn_state = "ironhammer"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/ih/inspector
	name = "inspector's suit"
	desc = "Fancy dress shirt, slacks and tie. The fancy civilian clothes of an Ironhammer Inspector."
	icon_state = "inspector"
	item_state = "inspector"
	worn_state = "inspector"
	siemens_coefficient = 0.8

/obj/item/clothing/shoes/jackboots/ironhammer/ironhammer
	icon_state = "jackboots_ironhammer"

/obj/item/clothing/gloves/security/ironhammer
	name = "operator's gloves"
	icon_state = "security_ironhammer"
	item_state = "security_ironhammer"


/obj/item/storage/belt/security/tactical/ironhammer
	name = "ironhammer tactical belt"
	icon_state = "tactical_ironhammer"


/obj/item/clothing/mask/gas/syndicate/ironhammer
	name = "Ironhammer gasmask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "IHSgasmask"

/obj/item/clothing/glasses/sunglasses/sechud/goggles/ironhammer //now just a more "military" set of HUDglasses for the Torch
	name = "Ironhammer HUD goggles"
	desc = "Flash-resistant goggles with an inbuilt heads-up display."
	icon_state = "ihgoogles"
	item_state = "ihgoogles"



/obj/item/clothing/head/helmet/bulletproof/ironhammer_full
	name = "Operator ballistic helmet"
	desc = "Standard-issue Ironhammer ballistic helmet with a basic HUD included, This variant appears to have been sourced from surplus prison stockpiles "
	armor = list(melee = 35, bullet = 40, laser = 30, energy = 5, bomb = 30, bio = 5, rad = 5)
	icon_state = "ironhammer_full"
	item_state = "ironhammer_full"
	siemens_coefficient = 0.8

/obj/item/clothing/suit/armor/bulletproof/ironhammer
	name = "full bulletproof suit"
	desc = "A vest with hand and arm-guards attached that excels in safeguarding the wearer against high-velocity solid projectiles. Notably, this particular suit appears to have been repurposed from surplus prison stockpiles."
	icon = 'icons/mob/onmob/suit.dmi'
	icon_state = "bulletproof_ironhammer"
	item_state = "bulletproof_ironhammer"
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/suit.dmi')
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 55, laser = 30, energy = 25, bomb = 30, bio = 20, rad = 20)
	starting_accessories = null



////////////////
//GUILD////// /
//////////////////

/datum/job/guildies
	title = "GUILDATUM"
	department_flag = SUP
	social_class = SOCIAL_CLASS_MED
	total_positions = 0
	spawn_positions = 0
	supervisors = "The Guild Merchant, And Money"
	selection_color = "#011c77"
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	economic_modifier = 5
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	outfit_type = /decl/hierarchy/outfit/job/captain
	melee_skill = 5
	ranged_skill = 5
	engineering_skill = 3
	open_when_dead = TRUE
	create_record = 1
	announced = FALSE
	can_be_in_squad = FALSE

	equip(var/mob/living/carbon/human/H)
		H.add_stats(rand(12,17), rand(10,16), rand(8,12), rand(10,12))






/datum/job/guildies/guild_tech
	title = "Guild Technician"
	department_flag = SUP
	social_class = SOCIAL_CLASS_MED
	total_positions = 5
	spawn_positions = 5
	supervisors = "The Guild Merchant"
	selection_color = "#011c77"
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	economic_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/captain

	equip(var/mob/living/carbon/human/H)
		H.add_stats(rand(12,17), rand(10,16), rand(8,12), rand(10,12))



/datum/job/guildies/merchant
	title = "Guild Merchant"
	department_flag = COM|SUP
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Call Of Profit"
	selection_color = "#011c77"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	economic_modifier = 20
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/captain
	open_when_dead = FALSE
	create_record = 1
	announced = TRUE
	can_be_in_squad = FALSE
	latejoin_at_spawnpoints = TRUE

	equip(var/mob/living/carbon/human/H)
		H.add_stats(rand(5,7), rand(10,12), rand(4,6), rand(17,22))