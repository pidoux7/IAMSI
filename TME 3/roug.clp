;;; IAMSI 2020 : séance TME 3
;;; famille.clp

(defrule my_init
	 (initial-fact)
=>
	(watch facts)
	(watch rules)

	(assert (taches_rouges patient))
	(assert (peu_boutons patient))
	(assert (forte_fievre patient))
	(assert (sensation_froid patient))
	(assert (yeux_douleur patient))
	(assert (amygdales_rouge patient))
	(assert (peau_pele patient))
	(assert (peau_seche patient))	
	
)

(defrule eruption_cut
	 (or (peu_boutons ?patient)
	 (beaucoup_boutons ?patient))
	 
=>
	(assert (eruption_cut ?patient))
)

(defrule exantheme
	 (or (eruption_cut ?patient)
	 (taches_rouges ?patient))
	 
=>
	(assert (exantheme ?patient))
)

(defrule etat_febrile
	 (or (forte_fievre ?patient)
	 (sensation_froid ?patient))
	 
=>
	(assert (etat_febrile ?patient))
)

(defrule signe_suspect
	 (amygdales_rouge ?patient)
	 (taches_rouges ?patient)
	 (peau_pele ?patient)
	 
=>
	(assert (signe_suspect ?patient))
)

(defrule rougeole
	 (or (and (etat_febrile ?patient)
	 (yeux_douleur ?patient)
	 (exantheme ?patient))
	 (and (signe_suspect ?patient)
	 (forte_fievre ?patient)))
	 
=>
	(assert (rougeole ?patient))
)

(defrule pas_rougeole
	 (peu_fievre ?patient)
	 (peu_boutons ?patient)
	 ?x <- (rougeole ?patient)
=>
	(retract ?x)
	(assert (varicelle_rubeole ?patient))
)

(defrule douleur
	 (or (yeux_douleur ?patient)
	 (dos_douloureux ?patient))
	 
=>
	(assert (douleur ?patient))
)

(defrule grippe
	 (etat_febrile ?patient)
	 (dos_douleur ?patient)
	 
=>
	(assert (grippe ?patient))
)

(defrule varicelle
	 (fortes_demangeaisons ?patient)
	 (pustules ?patient)
	 (varicelle_rubeole ?patient)
	 
=>
	(assert (varicelle ?patient))
)

(defrule rubeole
	 (peau_seche ?patient)
	 (inflammation_ganglions ?patient)
	 (not (pustule ?patient))
	 (not (sensation_froid ?patient))
	 (varicelle_rubeole ?patient)
	 
=>
	(assert (rubeole ?patient))
)
