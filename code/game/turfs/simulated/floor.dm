/turf/simulated/floor
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"

	// Damage to flooring.
	var/broken
	var/burnt

	// Plating data.
	var/base_name = "plating"
	var/base_desc = "The naked hull."
	var/base_icon = 'icons/turf/flooring/plating.dmi'
	var/base_icon_state = "plating"
	var/base_color = COLOR_WHITE

	// Flooring data.
	var/flooring_override
	var/initial_flooring
	var/decl/flooring/flooring
	var/mineral = DEFAULT_WALL_MATERIAL

	thermal_conductivity = 0.040
	heat_capacity = 10000
	var/lava = 0

/turf/simulated/floor/is_plating()
	return !flooring

/turf/simulated/floor/protects_atom(var/atom/A)
	return (A.level <= 1 && !is_plating()) || ..()

/turf/simulated/floor/New(var/newloc, var/floortype)
	..(newloc)
	if(!floortype && initial_flooring)
		floortype = initial_flooring
	if(floortype)
		set_flooring(get_flooring_data(floortype))
	generate_splines()

/turf/simulated/floor/proc/set_flooring(var/decl/flooring/newflooring)
	make_plating(defer_icon_update = 1)
	flooring = newflooring
	update_icon(1)
	levelupdate()

//This proc will set floor_type to null and the update_icon() proc will then change the icon_state of the turf
//This proc auto corrects the grass tiles' siding.
/turf/simulated/floor/proc/make_plating(var/place_product, var/defer_icon_update)

	overlays.Cut()

	SetName(base_name)
	desc = base_desc
	icon = base_icon
	icon_state = base_icon_state
	color = base_color
	plane = PLATING_PLANE
	layer = PLATING_LAYER

	if(flooring)
		flooring.on_remove()
		if(flooring.build_type && place_product)
			new flooring.build_type(src)
		flooring = null

	set_light(0)
	broken = null
	burnt = null
	flooring_override = null
	levelupdate()

	if(!defer_icon_update)
		update_icon(1)

/turf/simulated/floor/levelupdate()
	for(var/obj/O in src)
		O.hide(O.hides_under_flooring() && src.flooring)

	if(flooring)
		plane = TURF_PLANE
	else
		plane = PLATING_PLANE
		layer = PLATING_LAYER

/turf/simulated/floor/Crossed(var/atom/A)
	..()
	if(istype(A, /obj/item/projectile/flamer))
		for(var/mob/M in src)
			if(ishuman(M))
				return
		new /obj/flamer_fire(src, 12, 10, "red", 1)



/turf/simulated/floor/Crossed(var/atom/A)
	..()
	if(istype(A, /obj/item/projectile/pepperspray))
		for(var/mob/M in src)
			if(ishuman(M))
				return
		new /obj/pepper_spray_cloud(src, 12, 10, "red", 1)
