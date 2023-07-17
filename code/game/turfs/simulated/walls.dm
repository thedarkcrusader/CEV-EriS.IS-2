/turf/simulated/wall
	name = "wall"
	desc = "A huge chunk of metal used to seperate rooms."
	icon = 'icons/turf/wall.dmi'
	icon_state = "metal0"
	plane = WALL_PLANE
	opacity = 1
	density = 1
	blocks_air = 1
	var/walltype = "metal"
	thermal_conductivity = WALL_HEAT_TRANSFER_COEFFICIENT
	heat_capacity = 312500 //a little over 5 cm thick , 312500 for 1 m by 2.5 m by 0.25 m plasteel wall
	can_smooth = TRUE
	var/mineral = "metal"
	var/damage = 0
	var/damage_overlay = 0
	var/global/damage_overlays[16]
	var/active
	var/can_open = 0
	var/integrity = 650
	var/material/material
	var/material/reinf_material
	var/last_state
	var/construction_stage
	var/hitsound = 'sound/weapons/Genhit.ogg'
	var/floor_type = /turf/simulated/floor/plating //turf it leaves after destruction
	var/list/wall_connections = list("0", "0", "0", "0")


	/*
		If set, these vars will be used instead of the icon base taken from the material.
		These should be set at authortime
		Currently, they can only be set at authortime, on specially coded wall variants

		In future we should add some way to create walls of specific styles. Possibly during the construction process
	*/
	var/icon_base_override = ""
	var/icon_base_reinf_override = ""
	var/base_color_override = ""
	var/reinf_color_override = ""

	//These will be set from the set_material function. It just caches which base we're going to use, to simplify icon updating logic.
	//These should not be set at compiletime, they will be overwritten
	var/icon_base = ""
	var/icon_base_reinf = ""
	var/base_color = ""
	var/reinf_color = ""


/turf/simulated/wall/New(var/newloc, materialtype, rmaterialtype)
	..(newloc)
	icon_state = "blank"
	relativewall_neighbours()
	START_PROCESSING(SSslowprocess, src)
	generate_splines()

	icon_state = "blank"
	if(!materialtype)
		materialtype = MATERIAL_STEEL
	material = get_material_by_name(materialtype)
	if(!isnull(rmaterialtype))
		reinf_material = get_material_by_name(rmaterialtype)
	update_material(FALSE) //We call update material with update set to false, so it won't update connections or icon yet
	..(newloc)

/turf/simulated/wall/Destroy()
	STOP_PROCESSING(SSslowprocess, src)
	dismantle_wall(null,null,1)
	. = ..()

// Walls always hide the stuff below them.
/turf/simulated/wall/levelupdate()
	for(var/obj/O in src)
		O.hide(1)

/turf/simulated/wall/protects_atom(var/atom/A)
	var/obj/O = A
	return (istype(O) && O.hides_under_flooring()) || ..()


/turf/simulated/wall/proc/return_material(material_type, times)
	if(!material_type||!times)
		return
	var/obj/structure/girder/newgirder = null
	switch(material_type)
		if("metal")
			newgirder = new /obj/structure/girder/reinforced(src)
			for(var/i=1,i<times,i++)
				new /obj/item/stack/material/steel(src)
		if("reinforced_m")
			newgirder = new /obj/structure/girder/reinforced(src)
			newgirder.reinforce_girder()
			new /obj/item/stack/material/plasteel(src)
			for(var/i=1,i<times,i++)
				new /obj/item/stack/material/steel(src)

	if(newgirder)
		transfer_fingerprints_to(newgirder)

/turf/simulated/wall/proc/is_reinf()
	if(walltype == "rwall")
		return 1
	return 0

/turf/simulated/wall/bullet_act(var/obj/item/projectile/Proj)
	var/p_x = Proj.p_x + pick(0,0,0,0,0,-1,1) // really ugly way of coding "sometimes offset Proj.p_x!"
	var/p_y = Proj.p_y + pick(0,0,0,0,0,-1,1)
	var/decaltype = 1 // 1 - scorch, 2 - bullet
	var/proj_damage = Proj.get_structure_damage()

	if(is_reinf())
		if(Proj.damage_type == BURN)
			proj_damage /= 10
		else if(Proj.damage_type == BRUTE)
			proj_damage /= 8

	//cap the amount of damage, so that things like emitters can't destroy walls in one hit.
	var/damage = min(proj_damage, 100)

	var/obj/effect/overlay/bmark/BM = new(src)

	BM.pixel_x = p_x
	BM.pixel_y = p_y

	//new /obj/effect/overlay/temp/bullet_impact(src)//, p_x, p_y)

	if(decaltype == 1)
		// Energy weapons are hot. they scorch!

		// offset correction
		BM.pixel_x--
		BM.pixel_y--

		new /obj/effect/overlay/temp/bullet_impact(src, BM.pixel_x, BM.pixel_y)

		if(Proj.damage >= 20 || istype(Proj, /obj/item/projectile/beam/practice))
			BM.icon_state = "dent"//"scorch"
			BM.set_dir(pick(NORTH,SOUTH,EAST,WEST)) // random scorch design
		else
			BM.icon_state = "scorch"//"light_scorch"
	else

		// Bullets are hard. They make dents!
		BM.icon_state = "dent"


	take_damage(damage)

	return

/turf/simulated/wall/hitby(AM as mob|obj, var/speed=THROWFORCE_SPEED_DIVISOR)
	..()
	if(ismob(AM))
		return

	var/tforce = AM:throwforce * (speed/THROWFORCE_SPEED_DIVISOR)
	if (tforce < 15)
		return

	take_damage(tforce)

/turf/simulated/wall/proc/clear_plants()
	for(var/obj/effect/overlay/wallrot/WR in src)
		qdel(WR)
	for(var/obj/effect/vine/plant in range(src, 1))
		if(!plant.floor) //shrooms drop to the floor
			plant.floor = 1
			plant.update_icon()
			plant.pixel_x = 0
			plant.pixel_y = 0
		plant.update_neighbors()

/turf/simulated/wall/proc/clear_bulletholes()
	for(var/obj/effect/overlay/bmark/BM in src)
		qdel(BM)

/turf/simulated/wall/ChangeTurf(var/newtype)
	clear_plants()
	clear_bulletholes()
	return ..(newtype)

//Appearance
/turf/simulated/wall/examine(mob/user)
	. = ..(user)

	if(!damage)
		to_chat(user, "<span class='notice'>It looks fully intact.</span>")
	else
		var/dam = damage/150
		if(is_reinf())
			dam = damage/400
		if(dam <= 0.3)
			to_chat(user, "<span class='warning'>It looks slightly damaged.</span>")
		else if(dam <= 0.6)
			to_chat(user, "<span class='warning'>It looks moderately damaged.</span>")
		else
			to_chat(user, "<span class='danger'>It looks heavily damaged.</span>")

	if(locate(/obj/effect/overlay/wallrot) in src)
		to_chat(user, "<span class='warning'>There is fungus growing on [src].</span>")

//Damage

/turf/simulated/wall/melt()

	if(!can_melt())
		return

	src.ChangeTurf(/turf/simulated/floor/plating)

	var/turf/simulated/floor/F = src
	if(!F)
		return
	F.burn_tile()
	F.icon_state = "wall_thermite"
	visible_message("<span class='danger'>\The [src] spontaneously combusts!.</span>") //!!OH SHIT!!
	return

/turf/simulated/wall/proc/take_damage(dam)
	if(dam)
		damage = max(0, damage + dam)
		update_damage()
	return


/turf/simulated/wall/proc/update_damage()
	var/cap = integrity
	if(is_reinf())
		cap += 130

	if(locate(/obj/effect/overlay/wallrot) in src)
		cap = cap / 10

	if(damage >= cap)
		dismantle_wall()
	else
		update_icon()

	return


/turf/simulated/wall/adjacent_fire_act(turf/simulated/floor/adj_turf, datum/gas_mixture/adj_air, adj_temp, adj_volume)
	if(adj_temp > 1200)
		take_damage(log(RAND_F(0.9, 1.1) * (adj_temp - 1200)))

	return ..()

/turf/simulated/wall/proc/dismantle_wall(var/devastated, var/explode, var/no_product)

	playsound(src, 'sound/items/Welder.ogg', 100, 1)
	return_material(mineral, rand(1,2))
	for(var/obj/O in src.contents) //Eject contents!
		if(istype(O,/obj/structure/sign/poster))
			var/obj/structure/sign/poster/P = O
			P.roll_and_drop(src)
		else
			O.forceMove(src)

	clear_plants()
	clear_bulletholes()

	ChangeTurf(floor_type)

/turf/simulated/wall/ex_act(severity)
	switch(severity)
		if(1.0)
			src.ChangeTurf(get_base_turf(src.z))
			return
		if(2.0)
			if(prob(75))
				take_damage(rand(150, 250))
			else
				dismantle_wall(1,1)
		if(3.0)
			take_damage(rand(0, 250))
		else
	return

// Wall-rot effect, a nasty fungus that destroys walls.
/turf/simulated/wall/proc/rot()
	if(locate(/obj/effect/overlay/wallrot) in src)
		return
	var/number_rots = rand(2,3)
	for(var/i=0, i<number_rots, i++)
		new/obj/effect/overlay/wallrot(src)

/turf/simulated/wall/proc/can_melt()
	if(is_reinf())
		return 0
	return 1

/turf/simulated/wall/proc/thermitemelt(mob/user as mob)
	if(!can_melt())
		return
	var/obj/effect/overlay/O = new/obj/effect/overlay( src )
	O.SetName("Thermite")
	O.desc = "Looks hot."
	O.icon = 'icons/effects/fire.dmi'
	O.icon_state = "2"
	O.anchored = 1
	O.set_density(1)
	O.plane = LIGHTING_PLANE
	O.layer = FIRE_LAYER

	src.ChangeTurf(/turf/simulated/floor/plating)

	var/turf/simulated/floor/F = src
	F.burn_tile()
	F.icon_state = "wall_thermite"
	to_chat(user, "<span class='warning'>The thermite starts melting through the wall.</span>")

	spawn(100)
		if(O)
			qdel(O)
	return

/*/turf/simulated/wall/proc/radiate()
	var/total_radiation = material.radioactivity + (reinf_material ? reinf_material.radioactivity / 2 : 0)
	if(!total_radiation)
		return

	radiation_repository.radiate(src, total_radiation)
	return total_radiation
*/
/turf/simulated/wall/proc/burn(temperature)
	new /obj/structure/girder(src)
	src.ChangeTurf(/turf/simulated/floor)
	for(var/turf/simulated/wall/W in range(3,src))
		W.burn((temperature/4))
	for(var/obj/machinery/door/airlock/phoron/D in range(3,src))
		D.ignite(temperature/4)






/*
	Low walls are a roughly waist-height wall object which goes under full tile windows.

	They share some properties with walls -
		They are tough
		They block movement

	However they differ from walls in a few important respects:
		They do not block vision
		They do not restrict gas flow


	Hence they are more like tables, and they share some useful qualities with tables
		Crawling animals can move over them
		Objects can be placed ontop of them


	Certain table qualities do not apply however:
		They have no "underneath" space, nothing can be placed under them, creatures can't crawl under them
*/
/obj/structure/low_wall
	density = 1
	opacity = 0
	anchored = 1
	layer = LOW_WALL_LAYER
	icon = 'icons/obj/structures/low_wall.dmi'
	icon_state = "metal"
	var/connected = TRUE
	var/wall_color = PLASTEEL_COLOUR
	var/roundstart = FALSE
	var/list/connections = list("0", "0", "0", "0")
	var/list/wall_connections = list("0", "0", "0", "0")

	var/construction_stage

	var/maxhealth = 600
	var/health = 600

	var/hitsound = 'sound/weapons/Genhit.ogg'
//	climbable = TRUE

/obj/structure/low_wall/Destroy()
	for (var/obj/structure/window/W in loc)
		if (!QDELETED(W))
			W.shatter()


	connected = FALSE
	update_connections(1) //Updating connections with false connected will make nearby walls ignore this one
	for(var/obj/structure/table/T in orange(src, 1))
		T.update_icon()
	. = ..()

/obj/structure/low_wall/Initialize()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/low_wall/LateInitialize(var/list/args)
	// One low wall per turf.
	for(var/obj/structure/low_wall/T in loc)
		if(T != src)
			// There's another wall here that's not us, get rid of it
			qdel(T)
			return

	//if (args)
	//	update_connections(0)
	//else
	//
	update_connections(1)
	update_icon()



/obj/structure/low_wall/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)

	if(istype(mover,/obj/item/projectile))
		return (check_cover(mover,target))


	//Its debateable whether its correct to use layer in a logic check like this.
	//The main intent is to prevent creatures from walking under the wall in hide mode, there is no "under" the wall.
	//This is necessary because low walls can't be placed below the hide layer due to shutters
	if(istype(mover) && mover.checkpass(PASS_FLAG_TABLE) && mover.layer > layer)
		return 1
	if(locate(/obj/structure/low_wall) in get_turf(mover))
		return 1
	return ..()




//Low walls can be climbed over, but only if nothing ontop is blocking them
//This is needed to stop people glitching through the window and using them as external airlocks
/obj/structure/low_wall/can_climb(var/mob/living/user, post_climb_check=0)
	for(var/obj/structure/window/W in loc)
		if (!W.CanPass(user, loc))
			return FALSE

	return ..()


//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/structure/low_wall/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	cover = get_step(loc, get_dir(from, loc))
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1
	if (get_turf(P.original) == cover)
		var/chance = 20
		if (ismob(P.original))
			var/mob/M = P.original
			if (M.lying)
				chance += 20				//Lying down lets you catch less bullets
		if(prob(chance))
			health -= P.damage/2
			if (health > 0)
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
				return 0
			else
				visible_message(SPAN_WARNING("[src] breaks down!"))
				qdel(src)
				return 1
	return 1


//Icon procs.mostly copied from tables
/obj/structure/low_wall/update_icon()
	overlays.Cut()

	var/image/I

	//Make the wall overlays
	for(var/i = 1 to 4)
		I = image(icon, "[icon_state]_[connections[i]]", dir = 1<<(i-1))
		I.color = wall_color
		overlays += I


	for (var/obj/structure/window/W in loc)
		if (W.is_fulltile())
			W.update_icon()




	for(var/i = 1 to 4)
		I = image(icon, "[icon_state]_over_[wall_connections[i]]", dir = 1<<(i-1))
		I.color = wall_color
		I.layer = ABOVE_WINDOW_LAYER
		overlays += I






//Now this is a bit complex so read carefully
/*
	We link up with other low walls around us, just like any wall, window, table or carpet links up with its own kind
	However we also link up with normal, full sized walls, and the rules for linking with those are different
	Rather than looking in a 1 range, we link up with walls that meet the following conditions
		1. They are within 1 range of us
		2a. They are cardinally adjacent to us
			-OR-
		2b. They are cardinally adjacent to a low wall which is cardinally adjacent to us
			-OR-
		2c. They are adjacent to two other walls that we are also connected to

	This means that if, for example, we're in an I shaped configuration,
		with empty spaces to the left and right, and fullsize walls in the row above and below
		we will only link with the two walls directly above and below us.
		and we will NOT link with the four walls diagonal to us

		However, if those empty spaces to the sides were filled with other low walls,
		then we would link with all of the high walls around us

*/
//Copied from table.dm, used below
#define CORNER_NONE 0
#define CORNER_COUNTERCLOCKWISE 1
#define CORNER_DIAGONAL 2
#define CORNER_CLOCKWISE 4

//These tell what each position means in the four-element connections list
#define CORNER_NORTHWEST 1
#define CORNER_SOUTHEAST 2
#define CORNER_NORTHEAST 3
#define CORNER_SOUTHWEST 4
/obj/structure/low_wall/proc/update_connections(propagate=0, var/debug = 0)

	//If we are not connected, this will make nearby walls forget us and disconnect from us
	if(!connected)
		connections = list("0", "0", "0", "0")

		if(propagate)
			for(var/obj/structure/low_wall/T in oview(src, 1))
				T.update_connections()

			for(var/turf/simulated/wall/T in trange(1, src) - src)
				T.update_connections()
		return

	//A list of directions to nearby low walls
	var/list/connection_dirs = list()

	//A list of fullsize walls that we're considering connecting to.
	var/list/turf/wall_candidates = list()

	//A list of fullsize walls we will definitely connect to, based on the rules above
	var/list/wall_dirs = list()

	for(var/obj/structure/low_wall/T in orange(src, 1))
		if (!T.connected)
			continue

		var/T_dir = get_dir(src, T)
		connection_dirs |= T_dir
		if (debug)	world << "Connected to a low wall, [direction_to_text(T_dir)]"


		if(propagate)
			spawn(0)
				T.update_connections()
				T.update_icon()

		//If this low wall is in a cardinal direction to us,
		//then we will grab full walls that are cardinal to IT
		//These walls all meet condition 2b
		if (T_dir in cardinal)
			for (var/d in cardinal)
				var/turf/t = get_step(T, d)
				if (istype(t, /turf/simulated/wall))
					if (debug)	world << "Wall added to candidates, Fromus: [direction_to_text(T_dir)] Fromthat: [direction_to_text(get_dir(T, t))]"
					wall_candidates |= t

	//We'll use this list in a moment to store diagonal tiles that might be candidates for rule 2C
	var/list/deferred_diagonals = list()

	//We'll use this to store any direct cardinal high walls we detect in the next step
	var/list/connected_cardinals = list()

	//Now we loop through all the full walls near us. Everything here automatically meets condition 1
	for(var/turf/simulated/wall/T in trange(1, src) - src)
		var/T_dir = get_dir(src, T)

		//If this wall is cardinal to us, it meets condition 2a and passes
		if (T_dir in cardinal)
			connected_cardinals += T_dir
			connection_dirs 	|= T_dir
			wall_dirs 			|= T_dir
			if (debug)
				world << "Connected to a high wall, [direction_to_text(T_dir)]"
				world << "Because it's cardinal to us"
		//Alternatively if it's in the wall candidates list compiled above, then it meets condition 2b and passes
		else if (T in wall_candidates)
			connection_dirs 	|= T_dir
			wall_dirs 			|= T_dir
			if (debug)
				world << "Connected to a high wall, [direction_to_text(T_dir)]"
				world << "Because it was a wall candidate. Len: [wall_candidates.len]"
				for (var/turf/F in wall_candidates)
					world << "[F] [F.x], [F.y]"

		//If neither of the above are true, it still has a chance to meet condition 2c
		else
			if (debug)	world << "Deferred a diagonal wall, [direction_to_text(T_dir)]"
			deferred_diagonals |= T_dir

		if(propagate)
			spawn(0)
				T.update_connections()
				T.update_icon()

	//Last chance to connect
	//Now we will dump cpnnected_cardinals list into a bitfield to make the next section simpler
	var/wall_dirs_bitfield = 0
	for (var/d in connected_cardinals)
		wall_dirs_bitfield |= d

	for (var/d in deferred_diagonals)
	/*
		Deferred diagonals list now contains the directions of all fullsize walls which are:
		1. Within 1 tile of this wall
		2. At a diagonal to this wall
		3. Not at a cardinal to any adjacent low wall

		There is still a possibility to have a connection to these walls under condition 2c,
		That is, if it is adjacent to two other fullsize walls which are already confirmed connections

	*/
		//Since we have everything in a bitfield, we can compare the diagonals against it.
		//If both of its cardinals are here, the diagonal will be too
		if ((wall_dirs_bitfield & d) == d)
			if (debug)	world << "Connected to a diagonal wall, [direction_to_text(d)] [d], Bitfield [wall_dirs_bitfield]"
			wall_dirs |= (d)
			connection_dirs |= d

	connections = dirs_to_corner_states(connection_dirs)
	wall_connections = dirs_to_corner_states(wall_dirs)


	/*
		Extra last bonus chance to connect.
		Here we will "upgrade" the wall connections in a few specific cases where the overall connections are better
	*/
	for (var/i = 1;i<=4;i++)
		var/a = text2num(wall_connections[i])
		var/b = text2num(connections[i])

		//First of all, if we have a single vertical high wall connection, but a cross of total connections
		//Then we will upgrade the high wall connections to a cross too. this prevents some bugginess
		if ((((i in list(CORNER_NORTHWEST, CORNER_SOUTHEAST)) && a == CORNER_CLOCKWISE) \
		|| ((i in list(CORNER_NORTHEAST, CORNER_SOUTHWEST)) && a == CORNER_COUNTERCLOCKWISE)) \
		&& b in list(5,7))
			//What a mess, all that determines whether a corner connects to only vertical.
			//If its in the northwest or southeast corner, and its only connection is clockwise, then that connection is either up or down
			//Ditto with the other check
			//The last one is checking if b == a cross or block connection
			wall_connections[i] = connections[i]

		//Secondly, if we have a cross of two high walls, but a block of total connections,
		//We upgrade wall connections to a block too.
		//This basically means treating a diagonal low wall like a high wall
		else if (a == 5 && b == 7)
			wall_connections[i] = connections[i]


#undef CORNER_NORTHWEST
#undef CORNER_SOUTHEAST
#undef CORNER_NORTHEAST
#undef CORNER_SOUTHWEST

#undef CORNER_NONE
#undef CORNER_COUNTERCLOCKWISE
#undef CORNER_DIAGONAL
#undef CORNER_CLOCKWISE

