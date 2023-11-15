/datum/trait
	var/name = "Default Trait"
	var/description = "A default trait. If you see this someone fucked up."

/datum/trait/death_tolerant
	name = "death tolerant"
	description = "Dead bodies don't bother me like they do other people."

/datum/trait/child
	name = "child"
	description = "I strip corpses faster than the adults, and landmines don't bother me!"

/mob/living/proc/has_trait(var/datum/trait/this_trait)
	return istype(trait, this_trait)

/mob/living/proc/set_trait(var/datum/trait/set_trait)
	trait = set_trait

/mob/living/proc/remove_trait()
	trait = null


/datum/trait/millitary_training
	name = "veterancy"
	description = "I remember my past. The training ground itself was a labyrinth of torment, with obstacles designed to break both body and spirit—an obstacle course that promised pain with every misstep. The hum of energy weapons and the acrid smell of scorched flesh lingered as a haunting reminder of those who had faltered before. The relentless drills forged an iron discipline, but it was a discipline devoid of compassion. The recruits became masters of the art of war, but the cost was etched across their haunted expressions."
