/datum/map/eris
	allowed_jobs = list(
	/datum/job/captain,
	/datum/job/ih/operative,
	/datum/job/acolyte,
	/datum/job/inquisitor,
	/datum/job/ig/commissar,
	/datum/job/ig/sergeant,
	/datum/job/ig/guardsman,
	/datum/job/cmo,
	/datum/job/doctor,
	//datum/job/Paramedic,
	/datum/job/chemist,
	/datum/job/geneticist,
	/datum/job/magos,
	/datum/job/engineer,
	/datum/job/hop,
	/datum/job/chef,
	/datum/job/chaplain,
	/datum/job/janitor,
	/datum/job/bartender,
	/datum/job/mining,
	/datum/job/cargo_tech,
	/datum/job/qm,
	/datum/job/administrator,
	/datum/job/enforcer,
	/datum/job/innkeeper,
	/datum/job/hydro,
	/datum/job/undertaker,
	/datum/job/penitent,
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
