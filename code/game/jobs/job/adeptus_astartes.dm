//  Astartes Envoy

/datum/job/envoy
	title = "Astartes Envoy"
	total_positions = 1
	spawn_positions = 1
	head_position = 0
	supervisors = "The Rogue Trader and your Chapter Master"
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/envoy //will need to be replaced eventually - wel
	selection_color = "#344FAA"
	department_flag = SEC|COM
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 6
	melee_skill = 13
	ranged_skill = 13
	medical_skill = 5
	engineering_skill = 4
	surgery_skill = 1
	req_admin_notify = 1
	open_when_dead = 0
	latejoin_at_spawnpoints = 1
	announced = 0
	species_role = "Astartes"


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Brother [current_name]")
		H.add_stats(30, rand(25,30), rand(25,30), rand(20,30)) //genuinely no idea what to make their stats
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Space Marine, hired to guard the Rogue Trader and further the goals of the Imperium. You are a beacon of Mankind's greatness, your behavior should reflect this always. Guardsmen revere you and will defer to your judgement, make sure it is sound.</font></b></span>")
		H.gender = MALE
		H.bladder = 0 //should make jimmy space marines not have to shit/piss
		H.bowels = 0
		H.adjustStaminaLoss(-INFINITY) //astardes have basically infinite fight in them
		H.health = 330
		H.maxHealth = 330

/decl/hierarchy/outfit/job/envoy //will eventually code this to randomize to different chapters
	name = OUTFIT_JOB_NAME("Astartes Envoy")
	uniform = /obj/item/clothing/under/color/black
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = null
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	shoes = null
	backpack_contents = null //for now
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


/datum/job/envoy/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

